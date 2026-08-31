"""Check key uniqueness in the current SKY130 `IND-1` transition model."""

import argparse
import hashlib
import re
import sys
from pathlib import Path

import z3

_REPO = Path(__file__).resolve().parents[2]
if str(_REPO) not in sys.path:
    sys.path.insert(0, str(_REPO))

from lift.core import parse_attrs, parse_mlir
from lift.design import DesignError, load_design, load_model_manifest
from lift.translation import _source_relation
from lift.verify import verify_module


SHIFT_CYCLES = 121
VERDICT_EDGES = 1
KEY_TAIL_BITS = 8


def _items(text):
    return text.split('|') if text else []


def _load_key(path):
    payload = Path(path).read_bytes()
    body = payload[:-1] if payload.endswith(b'\n') else payload
    try:
        text = body.decode('ascii')
    except UnicodeDecodeError as exc:
        raise DesignError('E_SCHEMA', 'key is not ASCII') from exc
    expected = SHIFT_CYCLES + KEY_TAIL_BITS
    if re.fullmatch(r'[01]{%d}' % expected, text) is None:
        raise DesignError('E_SCHEMA', 'key fixture has the wrong shape',
                          expected_bits=expected)
    if text[SHIFT_CYCLES:] != '0' * KEY_TAIL_BITS:
        raise DesignError('E_SCHEMA', 'key fixture tail is not all zero')
    return text[:SHIFT_CYCLES], hashlib.sha256(payload).hexdigest()


def _initial_state(design, manifest):
    state = {}
    for cell_id in design.state_order:
        model = manifest.models[design.cell_map[cell_id].model]
        state[cell_id] = z3.BoolVal(bool(
            model.async_value if model.async_value is not None else 0))
    return state


def check(sky130_path='work/puzzle_sky130.mlir',
          netlist_path='work/netlist.json', models_path='models/cells.json',
          key_path='work/solution_bits.txt'):
    manifest = load_model_manifest(models_path)
    design = load_design(netlist_path, manifest)
    with open(sky130_path, encoding='utf-8') as handle:
        module = parse_mlir(handle.read(), source=sky130_path)
    metadata = verify_module(module, 'sky130', manifest)
    if metadata['source_sha256'] != design.source_sha256:
        raise DesignError('E_METADATA', 'source IR does not match netlist')

    input_names = _items(metadata['input_names'])
    input_args = _items(metadata['input_args'])
    state_ids = [int(value) for value in _items(metadata['state_ids'])]
    state_args = _items(metadata['state_args'])
    output_names = _items(metadata['output_names'])
    if state_ids != list(design.state_order):
        raise DesignError('E_RETURN_MAP', 'source IR state order differs from netlist')
    if set(input_names) != {'I', 'clk', 'enable', 'rst_n', 'undriven_61217'}:
        raise DesignError('E_METADATA', 'unexpected puzzle input contract')
    if 'success' not in output_names:
        raise DesignError('E_RETURN_MAP', 'source IR has no success output')

    key_bits = [z3.Bool('key_%03d' % index) for index in range(SHIFT_CYCLES)]
    current = _initial_state(design, manifest)

    def evaluate(cycle, state):
        inputs = {
            'I': key_bits[cycle] if cycle < SHIFT_CYCLES else z3.BoolVal(False),
            'clk': z3.BoolVal(True),
            'enable': z3.BoolVal(cycle < SHIFT_CYCLES),
            'rst_n': z3.BoolVal(True),
            'undriven_61217': z3.BoolVal(False),
        }
        symbols = {argument: inputs[name]
                   for name, argument in zip(input_names, input_args)}
        symbols.update({argument: state[cell_id]
                        for cell_id, argument in zip(state_ids, state_args)})
        result = _source_relation(module, manifest, symbols)
        next_state = dict(zip(state_ids, result[:len(state_ids)]))
        outputs = dict(zip(output_names, result[len(state_ids):]))
        return outputs, next_state

    for cycle in range(SHIFT_CYCLES + VERDICT_EDGES):
        _outputs, current = evaluate(cycle, current)
    outputs, _ignored_next = evaluate(
        SHIFT_CYCLES + VERDICT_EDGES, current)
    success = z3.simplify(outputs['success'])

    canonical, fixture_sha256 = _load_key(key_path)
    solver = z3.Solver()
    solver.add(success)
    first = solver.check()
    if first != z3.sat:
        raise DesignError('E_TRANSLATION_MISMATCH',
                          'current source model has no accepted key',
                          solver_result=str(first))
    model = solver.model()
    solved = ''.join('1' if z3.is_true(model.eval(bit, model_completion=True))
                     else '0' for bit in key_bits)
    if solved != canonical:
        raise DesignError('E_TRANSLATION_MISMATCH',
                          'current source model found a different accepted key',
                          solved_sha256=hashlib.sha256(solved.encode('ascii')).hexdigest())

    solver.add(z3.Or([bit != z3.BoolVal(value == '1')
                      for bit, value in zip(key_bits, solved)]))
    blocked = solver.check()
    if blocked != z3.unsat:
        raise DesignError('E_TRANSLATION_MISMATCH',
                          'current source model admits another accepted key',
                          solver_result=str(blocked))

    return {
        'artifacts': {
            'model_manifest_sha256': manifest.sha256,
            'netlist_sha256': design.source_sha256,
            'sky130_ir_sha256':
                hashlib.sha256(Path(sky130_path).read_bytes()).hexdigest(),
        },
        'blocking_result': 'unsat',
        'formula_sha256': hashlib.sha256(success.sexpr().encode('utf-8')).hexdigest(),
        'harness': {
            'clock_at_active_edge': 1,
            'enable': '1 for 121 shift edges, then 0',
            'initial_state': 'async_value if present, otherwise 0',
            'post_shift_I': 0,
            'success_observation': 'pre-edge after one disabled verdict edge',
            'rst_n': 1,
            'shift_cycles': SHIFT_CYCLES,
            'undriven_61217': 0,
            'verdict_edges': VERDICT_EDGES,
        },
        'key_fixture_sha256': fixture_sha256,
        'model_result': 'sat_canonical_key',
        'result': 'unique',
        'solver': 'z3-%s' % z3.get_version_string(),
        'symbolic_key_bits': len(key_bits),
    }


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--sky130', default='work/puzzle_sky130.mlir')
    parser.add_argument('--netlist', default='work/netlist.json')
    parser.add_argument('--models', default='models/cells.json')
    parser.add_argument('--key', default='work/solution_bits.txt')
    args = parser.parse_args(argv)
    result = check(args.sky130, args.netlist, args.models, args.key)
    print('KEY: SAT model matches canonical 121-bit key')
    print('KEY: blocking clause %s' % result['blocking_result'].upper())
    print('KEY: UNIQUE under the recorded current-source harness')
    return 0


if __name__ == '__main__':
    sys.exit(main())
