"""Standalone schema, provenance, invariant, and puzzle-solver cross-check.

This validates a freshly generated region artifact but does not itself replay
the Silicon-IR probe. `verify_submission.py` performs regeneration before invoking
this checker.
"""

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path


N = 11
CELL_COUNT = N * N
KEY_TAIL_BITS = 8
LETTERS = 'ABCDEFGHIJK'
SCHEMA = 'starbattle.regions.v1'
SELECTION_ASSUMPTIONS = [
    '121 enabled samples map row-major to an 11x11 grid',
    'intended regions are four-neighbor connected',
    'the intended region-counter partition appears as eleven disjoint '
    'zero-baseline one-hot final-state supports',
    'region counters are distinct from the literal-column counter bank',
]


class CrosscheckError(RuntimeError):
    """A malformed artifact or failed puzzle invariant."""


def _require(condition, message):
    if not condition:
        raise CrosscheckError(message)


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


def _require_keys(value, expected, label):
    _require(isinstance(value, dict), '%s must be an object' % label)
    actual = set(value)
    expected = set(expected)
    _require(actual == expected, '%s keys differ: missing=%s extra=%s' % (
        label, sorted(expected - actual), sorted(actual - expected)))


def _sha256(path):
    try:
        return hashlib.sha256(Path(path).read_bytes()).hexdigest()
    except OSError as exc:
        raise CrosscheckError('cannot hash %s: %s' % (path, exc)) from exc


def _validate_file_record(record, label):
    _require_keys(record, {'path', 'sha256'}, label)
    path = record['path']
    digest = record['sha256']
    _require(isinstance(path, str) and path, '%s path is malformed' % label)
    _require(isinstance(digest, str) and re.fullmatch(r'[0-9a-f]{64}', digest),
             '%s SHA-256 is malformed' % label)
    _require(_sha256(path) == digest, '%s SHA-256 does not match %s' % (label, path))


def _support_exact_covers(candidates):
    containing = [[] for _cell in range(CELL_COUNT)]
    for index, cells in enumerate(candidates):
        for cell in cells:
            containing[cell].append(index)
    found = set()

    def search(covered, chosen):
        if len(covered) == CELL_COUNT:
            if len(chosen) == N:
                found.add(tuple(sorted(chosen)))
            return
        if len(chosen) >= N:
            return
        uncovered = set(range(CELL_COUNT)) - covered
        pivot = min(uncovered, key=lambda cell: sum(
            not covered.intersection(candidates[index])
            for index in containing[cell]))
        for index in containing[pivot]:
            cells = candidates[index]
            if not covered.intersection(cells):
                search(covered.union(cells), chosen + (index,))

    search(frozenset(), ())
    return [tuple(candidates[index] for index in cover) for cover in sorted(found)]


def _validate_provenance(provenance, regions):
    _require_keys(provenance,
                  {'exact_cover', 'key', 'method', 'models', 'netlist', 'probe',
                   'selection', 'silicon_ir'}, 'provenance')
    _require(provenance['method'] ==
             'one-hot-final-state-support + connected exact cover',
             'unexpected recovery method')

    _validate_file_record(provenance['models'], 'model provenance')
    _validate_file_record(provenance['netlist'], 'netlist provenance')
    _require_keys(provenance['key'], {'path', 'sha256'}, 'key provenance')

    silicon = provenance['silicon_ir']
    _require_keys(silicon,
                  {'model_sha256', 'path', 'profile', 'sha256', 'source_sha256'},
                  'Silicon IR provenance')
    _require(silicon['profile'] == 'IND-1', 'unexpected Silicon IR profile')
    _require(silicon['model_sha256'] == provenance['models']['sha256'],
             'Silicon IR model hash does not match model provenance')
    _require(silicon['source_sha256'] == provenance['netlist']['sha256'],
             'Silicon IR source hash does not match netlist provenance')
    _require(_sha256(silicon['path']) == silicon['sha256'],
             'Silicon IR SHA-256 does not match its file')

    selection = provenance['selection']
    _require_keys(selection,
                  {'assumptions', 'criterion', 'key_consulted_during_selection'},
                  'cover selection')
    _require(selection['assumptions'] == SELECTION_ASSUMPTIONS,
             'cover-selection assumptions differ')
    _require(selection['criterion'] == 'sole_non_column_connected_cover',
             'unexpected cover-selection criterion')
    _require(selection['key_consulted_during_selection'] is False,
             'cover selection consulted the canonical key')

    probe = provenance['probe']
    _require_keys(probe, {
        'active_state_count', 'active_state_support_sha256',
        'active_state_supports', 'baseline_final_state', 'cycles',
        'initial_state', 'input_schedule', 'one_hot_streams', 'state_count', 'state_ids',
        'tail_cycles', 'zero_baseline_streams',
    }, 'probe provenance')
    supports = probe['active_state_supports']
    _require(isinstance(supports, list), 'active state supports must be a list')
    _require(probe['active_state_count'] == len(supports),
             'active state count does not match support records')
    _require(probe['one_hot_streams'] == CELL_COUNT and
             probe['zero_baseline_streams'] == 1,
             'probe stream counts are unexpected')
    _require(probe['cycles'] == CELL_COUNT + probe['tail_cycles'],
             'probe cycle count is inconsistent')
    _require(probe['initial_state'] == 'async_value if present, otherwise 0',
             'probe initial-state assumption is unexpected')
    _require(probe['input_schedule'] == {
        'I': 'all-zero baseline plus 121 one-hot streams',
        'enable': '1 for 121 samples, then 0 for 20 tail cycles',
        'rst_n': 'held at 1 after synthesized initial state',
        'undriven_61217': 'held at 0',
    }, 'probe input schedule is unexpected')
    state_ids = probe['state_ids']
    _require(isinstance(state_ids, list) and
             all(type(state_id) is int for state_id in state_ids) and
             state_ids == sorted(set(state_ids)), 'probe state IDs are malformed')
    _require(probe['state_count'] == len(state_ids),
             'probe state count does not match state IDs')
    _require(isinstance(probe['baseline_final_state'], str) and
             re.fullmatch(r'[01]{%d}' % len(state_ids),
                          probe['baseline_final_state']) is not None,
             'baseline final state is malformed')

    normalized_supports = []
    state_ids_by_cells = {}
    seen_state_ids = set()
    for item in supports:
        _require_keys(item, {'cells', 'connected', 'state_id'}, 'support record')
        cells = item['cells']
        state_id = item['state_id']
        _require(type(state_id) is int and state_id in state_ids and
                 state_id not in seen_state_ids, 'support state ID is invalid')
        _require(isinstance(cells, list) and cells == sorted(set(cells)) and
                 all(type(cell) is int and 0 <= cell < CELL_COUNT for cell in cells),
                 'support cell list is malformed')
        _require(item['connected'] is _connected(cells),
                 'reported support connectivity is incorrect')
        seen_state_ids.add(state_id)
        cell_tuple = tuple(cells)
        state_ids_by_cells.setdefault(cell_tuple, []).append(state_id)
        normalized_supports.append({'cells': cells, 'state_id': state_id})
    _require(len(seen_state_ids) == len(supports), 'support state IDs are duplicated')
    digest_payload = json.dumps(normalized_supports, separators=(',', ':'),
                                sort_keys=True).encode('ascii')
    _require(hashlib.sha256(digest_payload).hexdigest() ==
             probe['active_state_support_sha256'], 'support digest does not match')

    connected_candidates = sorted(
        (cells for cells in state_ids_by_cells if _connected(cells)),
        key=lambda cells: (cells[0], len(cells), cells))
    exact_covers = _support_exact_covers(connected_candidates)
    columns = tuple(tuple(row * N + column for row in range(N))
                    for column in range(N))
    selected = tuple(tuple(region['cells']) for region in regions)
    normalized_covers = {tuple(sorted(cover)) for cover in exact_covers}
    _require(normalized_covers == {tuple(sorted(columns)), tuple(sorted(selected))},
             'recorded supports do not yield exactly the column and selected covers')

    exact = provenance['exact_cover']
    _require_keys(exact, {
        'candidate_count', 'connected_unique_support_count',
        'literal_column_cover_count', 'literal_column_source_state_ids_by_column',
        'non_column_cover_count',
    }, 'exact-cover provenance')
    _require(exact['candidate_count'] == len(exact_covers) == 2,
             'exact-cover count does not match recorded supports')
    _require(exact['connected_unique_support_count'] == len(connected_candidates),
             'connected-support count does not match recorded supports')
    _require(exact['literal_column_cover_count'] == 1 and
             exact['non_column_cover_count'] == 1,
             'cover classification counts are incorrect')
    expected_column_ids = [sorted(state_ids_by_cells[cells]) for cells in columns]
    _require(exact['literal_column_source_state_ids_by_column'] ==
             expected_column_ids, 'column source-state IDs do not match supports')
    for region in regions:
        cells = tuple(region['cells'])
        _require(region['source_state_ids'] == sorted(state_ids_by_cells[cells]),
                 'region source-state IDs do not match recorded supports')
    return provenance


def _load_json(path):
    def reject_duplicates(pairs):
        result = {}
        for key, value in pairs:
            if key in result:
                raise CrosscheckError('duplicate JSON key: %s' % key)
            result[key] = value
        return result

    try:
        payload = Path(path).read_text(encoding='utf-8')
        value = json.loads(payload, object_pairs_hook=reject_duplicates)
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise CrosscheckError('cannot load region artifact: %s' % exc) from exc
    _require(isinstance(value, dict), 'region artifact must be a JSON object')
    return value


def _load_key(path):
    try:
        payload = Path(path).read_bytes()
    except OSError as exc:
        raise CrosscheckError('cannot load key: %s' % exc) from exc
    body = payload[:-1] if payload.endswith(b'\n') else payload
    try:
        text = body.decode('ascii')
    except UnicodeDecodeError as exc:
        raise CrosscheckError('key is not ASCII') from exc
    expected_length = CELL_COUNT + KEY_TAIL_BITS
    _require(re.fullmatch(r'[01]{%d}' % expected_length, text) is not None,
             'key must contain exactly %d binary digits and at most one final LF' %
             expected_length)
    _require(text[CELL_COUNT:] == '0' * KEY_TAIL_BITS,
             'key protocol tail must be exactly eight zero bits')
    return {
        'bits': text[:CELL_COUNT],
        'payload_sha256': hashlib.sha256(payload).hexdigest(),
    }


def _validate_artifact(value):
    _require_keys(value, {'grid_rows', 'grid_size', 'n_regions', 'provenance',
                          'region_letters', 'regions', 'schema', 'validation'},
                  'region artifact')
    _require(value.get('schema') == SCHEMA, 'unsupported region artifact schema')
    _require(type(value.get('grid_size')) is int and value['grid_size'] == N,
             'grid_size must be 11')
    _require(type(value.get('n_regions')) is int and value['n_regions'] == N,
             'n_regions must be 11')
    _require(value.get('region_letters') == LETTERS,
             'region_letters must be ABCDEFGHIJK')

    rows = value.get('grid_rows')
    _require(isinstance(rows, list) and len(rows) == N,
             'grid_rows must contain exactly 11 rows')
    for row in rows:
        _require(isinstance(row, str) and len(row) == N,
                 'each grid row must contain exactly 11 letters')
        _require(not set(row) - set(LETTERS), 'grid contains an unknown region letter')

    regions = value.get('regions')
    _require(isinstance(regions, list) and len(regions) == N,
             'regions must contain exactly 11 entries')
    ids = [region.get('id') if isinstance(region, dict) else None
           for region in regions]
    _require(all(type(region_id) is int for region_id in ids) and
             ids == list(range(N)),
             'region IDs must be exactly the integers 0 through 10')

    owner = {}
    for region_id, region in enumerate(regions):
        _require_keys(region,
                      {'cells', 'id', 'letter', 'source_state_ids', 'star_cells'},
                      'region %d' % region_id)
        _require(region.get('letter') == LETTERS[region_id],
                 'region letter does not match its ID')
        cells = region.get('cells')
        _require(isinstance(cells, list) and cells,
                 'each region must have a non-empty cell list')
        _require(all(type(cell) is int and 0 <= cell < CELL_COUNT for cell in cells),
                 'region cell is not an in-range integer')
        _require(cells == sorted(set(cells)),
                 'region cells must be sorted and contain no duplicates')
        _require(_connected(cells), 'region %d is not four-neighbor connected' %
                 region_id)
        state_ids = region.get('source_state_ids')
        _require(isinstance(state_ids, list) and state_ids and
                 all(type(state_id) is int for state_id in state_ids) and
                 state_ids == sorted(set(state_ids)),
                 'region source_state_ids are malformed')
        for cell in cells:
            _require(cell not in owner, 'cell %d occurs in multiple regions' % cell)
            owner[cell] = region_id

    _require(set(owner) == set(range(CELL_COUNT)),
             'regions do not partition all 121 cells exactly once')
    expected_rows = [''.join(LETTERS[owner[row * N + column]]
                             for column in range(N))
                     for row in range(N)]
    _require(rows == expected_rows, 'grid_rows do not exactly match region cells')

    provenance = _validate_provenance(value.get('provenance'), regions)
    validation = value.get('validation')
    _require_keys(validation, {
        'all_four_neighbor_connected', 'covers_121_once',
        'exactly_11_region_ids', 'key', 'literal_column_cover_count',
        'selected_cover_is_sole_non_column_cover',
    }, 'validation record')
    _require(validation.get('all_four_neighbor_connected') is True,
             'validation record does not assert connectivity')
    _require(validation.get('covers_121_once') is True,
             'validation record does not assert exact coverage')
    _require(validation.get('exactly_11_region_ids') is True,
             'validation record does not assert exact region IDs')
    _require(validation.get('literal_column_cover_count') == 1,
             'validation record does not assert one column cover')
    _require(validation.get('selected_cover_is_sole_non_column_cover') is True,
             'validation record does not assert sole non-column selection')
    return rows, regions, owner, validation, provenance


def _validate_key(key_info, regions, validation, provenance, key_path):
    key = key_info['bits']
    key_record = provenance['key']
    _require(key_record['path'] == Path(key_path).as_posix(),
             'key path does not match artifact provenance')
    _require(key_record['sha256'] == key_info['payload_sha256'],
             'key SHA-256 does not match artifact provenance')
    stars = {cell for cell, bit in enumerate(key) if bit == '1'}
    _require(len(stars) == 2 * N, 'key must contain exactly 22 stars')
    row_counts = [sum(row * N + column in stars for column in range(N))
                  for row in range(N)]
    column_counts = [sum(row * N + column in stars for row in range(N))
                     for column in range(N)]
    _require(row_counts == [2] * N, 'key must have exactly two stars per row')
    _require(column_counts == [2] * N,
             'key must have exactly two stars per column')

    region_counts = []
    for region_id, region in enumerate(regions):
        star_cells = sorted(cell for cell in region['cells'] if cell in stars)
        reported_stars = region.get('star_cells')
        _require(isinstance(reported_stars, list) and
                 all(type(cell) is int for cell in reported_stars) and
                 reported_stars == star_cells,
                 'region %d star_cells do not match the canonical key' % region_id)
        region_counts.append(len(star_cells))
    _require(region_counts == [2] * N,
             'key must have exactly two stars per region')

    for cell in stars:
        row, column = divmod(cell, N)
        for drow in (-1, 0, 1):
            for dcolumn in (-1, 0, 1):
                if drow == 0 and dcolumn == 0:
                    continue
                other_row = row + drow
                other_column = column + dcolumn
                if 0 <= other_row < N and 0 <= other_column < N:
                    _require(other_row * N + other_column not in stars,
                             'key contains touching stars')

    expected_record = {
        'column_counts': column_counts,
        'file_bits': CELL_COUNT + KEY_TAIL_BITS,
        'no_touching': True,
        'region_counts': region_counts,
        'row_counts': row_counts,
        'shift_bits': CELL_COUNT,
        'star_count': len(stars),
        'tail_all_zero': True,
        'tail_bits': KEY_TAIL_BITS,
        'two_stars_per_region': True,
    }
    _require(validation.get('key') == expected_record,
             'key validation record does not match independently checked facts')
    return frozenset(stars), region_counts


def solve(regions_grid, max_solutions=None):
    """regions_grid[r][c] -> region id. Returns list of solutions
    (each a frozenset of (r,c) tuples). If max_solutions is given,
    stops after finding that many."""
    reg = [[regions_grid[r][c] for c in range(N)] for r in range(N)]
    col_count = [0] * N
    reg_count = [0] * N
    solutions = []

    def rec(r, row_choice, acc):
        if max_solutions is not None and len(solutions) >= max_solutions:
            return
        if len(row_choice) == 2:
            if r + 1 == N:
                if all(c == 2 for c in col_count) and \
                        all(v == 2 for v in reg_count):
                    solutions.append(frozenset(acc))
                return
            rec(r + 1, [], acc)
            return
        c0 = row_choice[-1][1] + 1 if row_choice else 0
        for c in range(c0, N):
            if col_count[c] >= 2:
                continue
            rid = reg[r][c]
            if reg_count[rid] >= 2:
                continue
            # no-touch vs previously placed rows
            ok = True
            for pr, pc in acc:
                if abs(pr - r) <= 1 and abs(pc - c) <= 1:
                    ok = False
                    break
            if not ok:
                continue
            col_count[c] += 1
            reg_count[rid] += 1
            row_choice.append((r, c))
            rec(r, row_choice, acc | {(r, c)})
            row_choice.pop()
            col_count[c] -= 1
            reg_count[rid] -= 1

    rec(0, [], set())
    return solutions


def main(argv=None):
    parser = argparse.ArgumentParser(
        description='Independently validate the recovered Star Battle regions.')
    parser.add_argument('--regions', default='work/regions.json')
    parser.add_argument('--key', default='work/solution_bits.txt')
    args = parser.parse_args(argv)

    try:
        artifact = _load_json(args.regions)
        _rows, regions, owner, validation, provenance = _validate_artifact(artifact)
        key = _load_key(args.key)
        key_cells, region_counts = _validate_key(
            key, regions, validation, provenance, args.key)
        regions_grid = [[owner[row * N + column] for column in range(N)]
                        for row in range(N)]
        solutions = solve(regions_grid, max_solutions=2)
        _require(len(solutions) == 1,
                 'independent solver found %s solutions, expected exactly one' %
                 ('at least 2' if len(solutions) == 2 else len(solutions)))
        solved_cells = frozenset(row * N + column
                                 for row, column in solutions[0])
        _require(solved_cells == key_cells,
                 'unique solution does not match the canonical key')
    except (CrosscheckError, KeyError, TypeError, ValueError) as exc:
        print('M10: FAIL - %s' % exc, file=sys.stderr)
        return 1

    print('M10: artifact PASS - 121 cells, 11 connected regions')
    print('M10: key PASS - 121 shift bits + 8 zero tail bits')
    print('M10: key stars per region: %s' % region_counts)
    print('M10: independent solver found exactly 1 solution')
    print('M10: unique solution matches the canonical key')
    print('M10: PASS')
    return 0


if __name__ == '__main__':
    sys.exit(main())
