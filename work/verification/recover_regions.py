"""Recover region candidates from current verified project-local Silicon IR.

The hardware probe yields a literal-column cover and one non-column connected
cover. Selecting the latter as the Star Battle regions uses the explicit
assumption that region counters are distinct from the already identified
column-counter bank. The canonical key is read only after that selection.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
import tempfile
from pathlib import Path


_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _REPO not in sys.path:
    sys.path.insert(0, _REPO)

from lift.core import parse_mlir
from lift.design import DesignError, load_design, load_model_manifest, sha256_file
from lift.eval_silicon import SiliconInterpreter
from lift.verify import verify_module


N = 11
CELL_COUNT = N * N
PROBE_TAIL_CYCLES = 20
KEY_TAIL_BITS = 8
REGION_LETTERS = 'ABCDEFGHIJK'
SCHEMA = 'starbattle.regions.v1'
EXPECTED_DATA_INPUTS = {'I', 'enable', 'rst_n', 'undriven_61217'}
SELECTION_ASSUMPTIONS = [
    '121 enabled samples map row-major to an 11x11 grid',
    'intended regions are four-neighbor connected',
    'the intended region-counter partition appears as eleven disjoint '
    'zero-baseline one-hot final-state supports',
    'region counters are distinct from the literal-column counter bank',
]


class RecoveryError(RuntimeError):
    """A fail-closed region-recovery diagnostic."""


def _fail(message):
    raise RecoveryError(message)


def _normalized_path(path):
    return Path(path).as_posix()


def _neighbors(cell):
    row, column = divmod(cell, N)
    for drow, dcolumn in ((-1, 0), (1, 0), (0, -1), (0, 1)):
        other_row = row + drow
        other_column = column + dcolumn
        if 0 <= other_row < N and 0 <= other_column < N:
            yield other_row * N + other_column


def _connected(cells):
    cells = set(cells)
    if not cells:
        return False
    seen = {min(cells)}
    stack = list(seen)
    while stack:
        for other in _neighbors(stack.pop()):
            if other in cells and other not in seen:
                seen.add(other)
                stack.append(other)
    return seen == cells


def _initial_state(design, manifest):
    state = {}
    for cell_id in design.state_order:
        model = manifest.models[design.cell_map[cell_id].model]
        state[cell_id] = model.async_value if model.async_value is not None else 0
    return state


def _run_stream(interpreter, initial_state, hot_cell):
    state = dict(initial_state)
    for cycle in range(CELL_COUNT + PROBE_TAIL_CYCLES):
        inputs = {name: 0 for name in interpreter.data_inputs}
        inputs.update({
            'I': int(hot_cell is not None and cycle == hot_cell),
            'enable': int(cycle < CELL_COUNT),
            'rst_n': 1,
        })
        _outputs, state = interpreter.evaluate(inputs, state)
    return tuple(state[cell_id] for cell_id in interpreter.state_ids)


def _active_supports(interpreter, initial_state):
    baseline = _run_stream(interpreter, initial_state, None)
    supports = [[] for _cell_id in interpreter.state_ids]
    for cell in range(CELL_COUNT):
        final_state = _run_stream(interpreter, initial_state, cell)
        for index, (value, base_value) in enumerate(zip(final_state, baseline)):
            if value ^ base_value:
                supports[index].append(cell)
    active = []
    for state_id, cells in zip(interpreter.state_ids, supports):
        if cells:
            active.append({'state_id': state_id, 'cells': tuple(cells)})
    return baseline, active


def _unique_connected_supports(active):
    state_ids_by_cells = {}
    for item in active:
        state_ids_by_cells.setdefault(item['cells'], []).append(item['state_id'])
    result = []
    for cells, state_ids in state_ids_by_cells.items():
        if not _connected(cells):
            continue
        result.append({
            'cells': cells,
            'mask': sum(1 << cell for cell in cells),
            'state_ids': tuple(sorted(state_ids)),
        })
    result.sort(key=lambda item: (item['cells'][0], len(item['cells']),
                                  item['cells'], item['state_ids']))
    return result


def _exact_covers(candidates):
    all_cells = (1 << CELL_COUNT) - 1
    containing = [[] for _cell in range(CELL_COUNT)]
    for index, candidate in enumerate(candidates):
        for cell in candidate['cells']:
            containing[cell].append(index)

    found = set()

    def search(covered, chosen):
        if covered == all_cells:
            if len(chosen) == N:
                canonical = tuple(sorted(
                    chosen,
                    key=lambda index: candidates[index]['cells'][0]))
                found.add(canonical)
            return
        if len(chosen) >= N:
            return

        slots = N - len(chosen)
        remaining_cells = CELL_COUNT - covered.bit_count()
        compatible_sizes = sorted(
            (len(candidate['cells']) for candidate in candidates
             if not candidate['mask'] & covered),
            reverse=True)
        if len(compatible_sizes) < slots or \
                sum(compatible_sizes[:slots]) < remaining_cells:
            return

        uncovered = [cell for cell in range(CELL_COUNT)
                     if not (covered >> cell) & 1]
        pivot = min(
            uncovered,
            key=lambda cell: sum(
                not (candidates[index]['mask'] & covered)
                for index in containing[cell]),
        )
        for index in containing[pivot]:
            mask = candidates[index]['mask']
            if not mask & covered:
                search(covered | mask, chosen + (index,))

    search(0, ())
    return [tuple(candidates[index] for index in cover)
            for cover in sorted(found)]


def _literal_columns():
    return tuple(tuple(row * N + column for row in range(N))
                 for column in range(N))


def _is_literal_column_cover(cover):
    return tuple(candidate['cells'] for candidate in cover) == _literal_columns()


def _select_region_cover(covers):
    positional = [cover for cover in covers if _is_literal_column_cover(cover)]
    non_column = [cover for cover in covers if not _is_literal_column_cover(cover)]
    if len(positional) != 1:
        _fail('expected exactly one literal-column cover, found %d' %
              len(positional))
    if len(non_column) != 1:
        _fail('expected exactly one non-column cover, found %d' %
              len(non_column))
    return positional[0], non_column[0]


def _grid_rows(cover):
    owner = {}
    for region_id, candidate in enumerate(cover):
        for cell in candidate['cells']:
            owner[cell] = region_id
    if set(owner) != set(range(CELL_COUNT)):
        _fail('candidate cover does not contain each grid cell exactly once')
    return [''.join(REGION_LETTERS[owner[row * N + column]]
                    for column in range(N))
            for row in range(N)]


def _support_digest(active):
    value = [{'cells': list(item['cells']), 'state_id': item['state_id']}
             for item in active]
    payload = json.dumps(value, separators=(',', ':'), sort_keys=True).encode('ascii')
    return hashlib.sha256(payload).hexdigest()


def recover_partition(silicon_path, netlist_path, models_path):
    manifest = load_model_manifest(models_path)
    design = load_design(netlist_path, manifest)
    with open(silicon_path, encoding='utf-8') as handle:
        module = parse_mlir(handle.read(), source=silicon_path)
    metadata = verify_module(module, 'silicon', manifest)
    interpreter = SiliconInterpreter(module)

    if metadata['source_sha256'] != design.source_sha256:
        _fail('Silicon IR source hash does not match the current netlist')
    if metadata['module'] != design.module:
        _fail('Silicon IR module does not match the current netlist')
    if tuple(interpreter.state_ids) != design.state_order:
        _fail('Silicon IR state order does not match the current netlist')
    if set(interpreter.data_inputs) != EXPECTED_DATA_INPUTS:
        _fail('unexpected puzzle data-input contract: %s' %
              ','.join(sorted(interpreter.data_inputs)))

    initial_state = _initial_state(design, manifest)
    baseline, active = _active_supports(interpreter, initial_state)
    connected_supports = _unique_connected_supports(active)
    covers = _exact_covers(connected_supports)
    positional, selected = _select_region_cover(covers)

    return {
        'active': active,
        'baseline': baseline,
        'connected_supports': connected_supports,
        'cover': selected,
        'covers': covers,
        'design': design,
        'interpreter': interpreter,
        'manifest': manifest,
        'metadata': metadata,
        'positional_cover': positional,
    }


def _load_key(path):
    payload = Path(path).read_bytes()
    body = payload[:-1] if payload.endswith(b'\n') else payload
    try:
        text = body.decode('ascii')
    except UnicodeDecodeError as exc:
        _fail('key is not ASCII: %s' % exc)
    expected_length = CELL_COUNT + KEY_TAIL_BITS
    if not re.fullmatch(r'[01]{%d}' % expected_length, text):
        _fail('key must contain exactly %d binary digits and at most one final LF' %
              expected_length)
    key = text[:CELL_COUNT]
    tail = text[CELL_COUNT:]
    if tail != '0' * KEY_TAIL_BITS:
        _fail('key protocol tail must be exactly %d zero bits' % KEY_TAIL_BITS)
    return {
        'bits': key,
        'payload_sha256': hashlib.sha256(payload).hexdigest(),
        'tail': tail,
    }


def _validate_key(key, cover):
    stars = {cell for cell, bit in enumerate(key) if bit == '1'}
    row_counts = [sum(row * N + column in stars for column in range(N))
                  for row in range(N)]
    column_counts = [sum(row * N + column in stars for row in range(N))
                     for column in range(N)]
    region_counts = [sum(cell in stars for cell in candidate['cells'])
                     for candidate in cover]
    touching = []
    for cell in sorted(stars):
        row, column = divmod(cell, N)
        for drow in (-1, 0, 1):
            for dcolumn in (-1, 0, 1):
                if drow == 0 and dcolumn == 0:
                    continue
                other_row = row + drow
                other_column = column + dcolumn
                other = other_row * N + other_column
                if 0 <= other_row < N and 0 <= other_column < N and \
                        other in stars and cell < other:
                    touching.append([cell, other])

    if len(stars) != 2 * N:
        _fail('canonical key has %d stars, expected %d' % (len(stars), 2 * N))
    if row_counts != [2] * N:
        _fail('canonical key does not have exactly two stars in every row')
    if column_counts != [2] * N:
        _fail('canonical key does not have exactly two stars in every column')
    if region_counts != [2] * N:
        _fail('canonical key does not have exactly two stars in every region')
    if touching:
        _fail('canonical key contains touching stars')
    return {
        'column_counts': column_counts,
        'no_touching': True,
        'region_counts': region_counts,
        'row_counts': row_counts,
        'star_cells': sorted(stars),
        'star_count': len(stars),
    }


def _build_artifact(recovery, key_info, key_validation, paths):
    cover = recovery['cover']
    grid_rows = _grid_rows(cover)
    stars = set(key_validation['star_cells'])
    regions = []
    for region_id, candidate in enumerate(cover):
        regions.append({
            'cells': list(candidate['cells']),
            'id': region_id,
            'letter': REGION_LETTERS[region_id],
            'source_state_ids': list(candidate['state_ids']),
            'star_cells': [cell for cell in candidate['cells'] if cell in stars],
        })

    active = recovery['active']
    connected_support_cells = {item['cells']
                               for item in recovery['connected_supports']}
    active_report = [{
        'cells': list(item['cells']),
        'connected': item['cells'] in connected_support_cells,
        'state_id': item['state_id'],
    } for item in active]
    positional = recovery['positional_cover']
    metadata = recovery['metadata']
    design = recovery['design']
    manifest = recovery['manifest']
    interpreter = recovery['interpreter']

    return {
        'grid_rows': grid_rows,
        'grid_size': N,
        'n_regions': N,
        'provenance': {
            'exact_cover': {
                'candidate_count': len(recovery['covers']),
                'connected_unique_support_count':
                    len(recovery['connected_supports']),
                'literal_column_cover_count': 1,
                'literal_column_source_state_ids_by_column':
                    [list(candidate['state_ids']) for candidate in positional],
                'non_column_cover_count': 1,
            },
            'key': {
                'path': _normalized_path(paths['key']),
                'sha256': key_info['payload_sha256'],
            },
            'method': 'one-hot-final-state-support + connected exact cover',
            'models': {
                'path': _normalized_path(paths['models']),
                'sha256': manifest.sha256,
            },
            'netlist': {
                'path': _normalized_path(paths['netlist']),
                'sha256': design.source_sha256,
            },
            'probe': {
                'active_state_count': len(active),
                'active_state_support_sha256': _support_digest(active),
                'active_state_supports': active_report,
                'baseline_final_state': ''.join(map(str, recovery['baseline'])),
                'cycles': CELL_COUNT + PROBE_TAIL_CYCLES,
                'initial_state': 'async_value if present, otherwise 0',
                'input_schedule': {
                    'I': 'all-zero baseline plus 121 one-hot streams',
                    'enable': '1 for 121 samples, then 0 for 20 tail cycles',
                    'rst_n': 'held at 1 after synthesized initial state',
                    'undriven_61217': 'held at 0',
                },
                'one_hot_streams': CELL_COUNT,
                'state_count': len(interpreter.state_ids),
                'state_ids': list(interpreter.state_ids),
                'tail_cycles': PROBE_TAIL_CYCLES,
                'zero_baseline_streams': 1,
            },
            'silicon_ir': {
                'model_sha256': metadata['model_sha256'],
                'path': _normalized_path(paths['silicon']),
                'profile': metadata['profile'],
                'sha256': sha256_file(paths['silicon']),
                'source_sha256': metadata['source_sha256'],
            },
            'selection': {
                'assumptions': SELECTION_ASSUMPTIONS,
                'criterion': 'sole_non_column_connected_cover',
                'key_consulted_during_selection': False,
            },
        },
        'region_letters': REGION_LETTERS,
        'regions': regions,
        'schema': SCHEMA,
        'validation': {
            'all_four_neighbor_connected':
                all(_connected(candidate['cells']) for candidate in cover),
            'covers_121_once': sorted(
                cell for candidate in cover for cell in candidate['cells']) ==
                list(range(CELL_COUNT)),
            'exactly_11_region_ids': True,
            'key': {
                'column_counts': key_validation['column_counts'],
                'file_bits': CELL_COUNT + KEY_TAIL_BITS,
                'no_touching': key_validation['no_touching'],
                'region_counts': key_validation['region_counts'],
                'row_counts': key_validation['row_counts'],
                'shift_bits': CELL_COUNT,
                'star_count': key_validation['star_count'],
                'tail_all_zero': key_info['tail'] == '0' * KEY_TAIL_BITS,
                'tail_bits': KEY_TAIL_BITS,
                'two_stars_per_region': key_validation['region_counts'] == [2] * N,
            },
            'literal_column_cover_count': 1,
            'selected_cover_is_sole_non_column_cover': True,
        },
    }


def _serialized(value):
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) +
            '\n').encode('ascii')


def _write_output(path, payload):
    destination = Path(path)
    destination.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary = tempfile.mkstemp(
        prefix='.recover-regions-', suffix='.json', dir=str(destination.parent))
    try:
        with os.fdopen(descriptor, 'wb') as handle:
            handle.write(payload)
        os.replace(temporary, destination)
    except Exception:
        try:
            os.remove(temporary)
        except OSError:
            pass
        raise


def recover(silicon_path, netlist_path, models_path, key_path):
    recovery = recover_partition(silicon_path, netlist_path, models_path)
    # The key is deliberately opened only after assumption-scoped cover selection.
    key_info = _load_key(key_path)
    key_validation = _validate_key(key_info['bits'], recovery['cover'])
    artifact = _build_artifact(
        recovery, key_info, key_validation,
        {'key': key_path, 'models': models_path, 'netlist': netlist_path,
         'silicon': silicon_path})
    return artifact, recovery


def main(argv=None):
    parser = argparse.ArgumentParser(
        description='Recover 11x11 region candidates from verified Silicon IR.')
    parser.add_argument('--silicon', default='work/puzzle_silicon.mlir')
    parser.add_argument('--netlist', default='work/netlist.json')
    parser.add_argument('--models', default='models/cells.json')
    parser.add_argument('--key', default='work/solution_bits.txt')
    parser.add_argument('--output', default='work/regions.json')
    args = parser.parse_args(argv)

    try:
        artifact, recovery = recover(
            args.silicon, args.netlist, args.models, args.key)
        payload = _serialized(artifact)
        _write_output(args.output, payload)
    except (DesignError, OSError, RecoveryError, ValueError) as exc:
        print('RECOVER: FAIL - %s' % exc, file=sys.stderr)
        return 1

    print('RECOVER: verified Silicon/netlist binding: %s' %
          recovery['metadata']['source_sha256'])
    print('RECOVER: active states=%d connected unique supports=%d' %
          (len(recovery['active']), len(recovery['connected_supports'])))
    print('RECOVER: connected 11-set covers=%d literal-columns=1 non-column=1' %
          len(recovery['covers']))
    print('RECOVER: key validation PASS - 22 stars, two per region')
    print('RECOVER: wrote %s (%s)' %
          (args.output, hashlib.sha256(payload).hexdigest()))
    return 0


if __name__ == '__main__':
    sys.exit(main())
