
import itertools
import json
import os
import random
import sys
import tempfile

_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _REPO not in sys.path:
    sys.path.insert(0, _REPO)

from lift.design import load_model_manifest
from lift.eval_silicon import SiliconInterpreter
from lift.eval_sky130 import Sky130Interpreter
from lift.translation import validate_translation
from work.pipeline.compile_ir import compile_netlist


def _generated(seed, manifest):
    rng = random.Random(seed)
    cells = [
        {'id': 1, 'cell': 'clkbuf_1', 'conns': {'A': 1, 'X': 10}},
        {'id': 2, 'cell': 'conb_1', 'conns': {'HI': 11, 'LO': 12}},
    ]
    available = [2, 3, 4, 5, 11, 12]
    models = ('and2', 'or2', 'xor2', 'nand2', 'nor2', 'mux2',
              'a21o', 'o21a', 'inv', 'buf')
    next_net = 20
    next_cell = 10
    for _index in range(10):
        model = manifest.models[rng.choice(models)]
        connections = {pin: rng.choice(available) for pin in model.inputs}
        for pin in model.outputs:
            connections[pin] = next_net
            available.append(next_net)
            next_net += 1
        cells.append({'id': next_cell, 'cell': model.name + '_1',
                      'conns': connections})
        next_cell += 1

    state_ids = []
    for model_name in ('dfrtp', 'dfstp', 'dfxtp'):
        model = manifest.models[model_name]
        connections = {'D': rng.choice(available), 'CLK': 10, 'Q': next_net}
        if model.async_pin is not None:
            connections[model.async_pin] = 5
        cells.append({'id': next_cell, 'cell': model_name + '_1',
                      'conns': connections})
        state_ids.append(next_cell)
        available.append(next_net)
        next_net += 1
        next_cell += 1

    result_net = next_net
    cells.append({'id': next_cell, 'cell': 'xor2_1',
                  'conns': {'A': available[-1], 'B': available[-2],
                            'X': result_net}})
    return {
        'schema': 'silicon-lift.netlist.v1',
        'module': 'generated_%d' % seed,
        'profile': 'IND-1',
        'clock': {'port': 'clock', 'edge': 'posedge'},
        'inputs': {'clock': 1, 'data-a': 2, 'data_b': 3,
                   'select': 4, 'reset_n': 5},
        'outputs': {'result': result_net, 'state_alias': available[-1],
                    'constant_one': 11},
        'consts': {},
        'cells': cells,
    }


def main():
    manifest = load_model_manifest()
    checked = 0
    with tempfile.TemporaryDirectory(prefix='ind1-micro-') as directory:
        for seed in range(10):
            netlist_path = os.path.join(directory, 'micro_%d.json' % seed)
            sky_path = os.path.join(directory, 'micro_%d_sky.mlir' % seed)
            target_path = os.path.join(directory, 'micro_%d_silicon.mlir' % seed)
            with open(netlist_path, 'w', encoding='utf-8', newline='\n') as handle:
                json.dump(_generated(seed, manifest), handle, sort_keys=True)
            _design, sky, target = compile_netlist(
                netlist_path, 'models/cells.json', sky_path, target_path)
            proof = validate_translation(sky_path, target_path)
            assert proof['result'] == 'unsat'
            source_eval = Sky130Interpreter(sky, manifest)
            target_eval = SiliconInterpreter(target)
            names = source_eval.data_inputs
            dimensions = len(names) + len(source_eval.state_ids)
            for vector in itertools.product((0, 1), repeat=dimensions):
                inputs = dict(zip(names, vector[:len(names)]))
                state = dict(zip(source_eval.state_ids, vector[len(names):]))
                assert source_eval.evaluate(inputs, state) == \
                    target_eval.evaluate(inputs, state)
                checked += 1

        duplicate_sky = os.path.join(directory, 'duplicate_sky.mlir')
        duplicate_target = os.path.join(directory, 'duplicate_target.mlir')
        compile_netlist(netlist_path, 'models/cells.json',
                        duplicate_sky, duplicate_target)
        with open(sky_path, 'rb') as first, open(duplicate_sky, 'rb') as second:
            assert first.read() == second.read()
        with open(target_path, 'rb') as first, \
                open(duplicate_target, 'rb') as second:
            assert first.read() == second.read()

    print('micro-netlists: 10 generated designs, %d exhaustive transitions' %
          checked)
    print('ALL GENERATED MICRO-NETLIST TESTS PASS')
    return 0


if __name__ == '__main__':
    sys.exit(main())
