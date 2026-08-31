"""Puzzle protocol regression over both serialized `IND-1` layers."""

import argparse
import os
import sys

_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _REPO not in sys.path:
    sys.path.insert(0, _REPO)

from lift.core import parse_mlir
from lift.design import load_design, load_model_manifest
from lift.eval_silicon import SiliconInterpreter
from lift.eval_sky130 import Sky130Interpreter
from lift.verify import verify_module


def _module(path):
    with open(path, encoding='utf-8') as handle:
        return parse_mlir(handle.read(), source=path)


def _initial_state(design, manifest):
    """Explicit puzzle-harness initialization, not compiler semantics."""
    state = {}
    for cell_id in design.state_order:
        model = manifest.models[design.cell_map[cell_id].model]
        state[cell_id] = model.async_value if model.async_value is not None else 0
    return state


def run_protocol(bits, tail_cycles=20):
    manifest = load_model_manifest()
    design = load_design('work/netlist.json', manifest)
    source_module = _module('work/puzzle_sky130.mlir')
    target_module = _module('work/puzzle_silicon.mlir')
    verify_module(source_module, 'sky130', manifest)
    verify_module(target_module, 'silicon', manifest)
    source = Sky130Interpreter(source_module, manifest)
    target = SiliconInterpreter(target_module)
    if source.data_inputs != target.data_inputs:
        raise AssertionError('source/target input contracts differ')

    state = _initial_state(design, manifest)
    timeline = []
    frames = list(bits) + ['0'] * tail_cycles
    for cycle, bit in enumerate(frames):
        inputs = {name: 0 for name in source.data_inputs}
        inputs.update({
            'I': int(bit),
            'enable': int(cycle < 121),
            'rst_n': 1,
        })
        source_result = source.evaluate(inputs, state)
        target_result = target.evaluate(inputs, state)
        if source_result != target_result:
            raise AssertionError('serialized layers disagree at cycle %d' % cycle)
        outputs, state = source_result
        byte = sum(outputs['O[%d]' % index] << index for index in range(8))
        timeline.append((cycle, byte, outputs['success']))
    return timeline


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--key', default='work/solution_bits.txt')
    parser.add_argument('--tail-cycles', type=int, default=20)
    args = parser.parse_args(argv)
    with open(args.key, encoding='ascii') as handle:
        bits = handle.read().strip()
    if not bits or set(bits) - {'0', '1'}:
        raise ValueError('key must contain only binary digits')
    timeline = run_protocol(bits, args.tail_cycles)
    started = False
    message = []
    for _cycle, byte, success in timeline:
        started |= bool(success)
        if started and 32 <= byte < 127:
            message.append(chr(byte))
    decoded = ''.join(message)
    print('protocol frames:', len(timeline))
    print('success seen:', any(item[2] for item in timeline))
    print('decoded message: %r' % decoded)
    if 'TWO STARS' not in decoded:
        raise AssertionError('puzzle regression did not decode expected message')
    return 0


if __name__ == '__main__':
    sys.exit(main())
