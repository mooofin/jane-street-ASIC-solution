"""Run the warm-up design through the strict independent pipeline."""

import json
import os
import random
import sys

_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _REPO not in sys.path:
    sys.path.insert(0, _REPO)

from lift.design import load_design, load_model_manifest
from lift.eval_silicon import SiliconInterpreter
from lift.eval_sky130 import Sky130Interpreter
from lift.translation import validate_translation
from work.extraction.build_warmup_netlist import build
from work.pipeline.compile_ir import compile_netlist
from work.verification.verify_gate_simulation import run_gate


def run():
    netlist_path = 'work/warmup_strict_netlist.json'
    sky_path = 'work/warmup_sky130.mlir'
    silicon_path = 'work/warmup_silicon.mlir'
    build(output=netlist_path)
    design, source_module, target_module = compile_netlist(
        netlist_path, 'models/cells.json', sky_path, silicon_path)
    manifest = load_model_manifest()
    load_design(netlist_path, manifest)
    proof = validate_translation(sky_path, silicon_path)
    source = Sky130Interpreter(source_module, manifest)
    target = SiliconInterpreter(target_module)

    state_zero = {cell_id: 0 for cell_id in source.state_ids}
    rng = random.Random(20260823)
    pairs = {(a, 496 - a) for a in range(256) if 0 <= 496 - a < 256}
    pairs.update((rng.randrange(256), rng.randrange(256)) for _ in range(1024))
    errors = 0
    asserted = 0
    for pair_index, (a, b) in enumerate(sorted(pairs)):
        state = dict(state_zero)
        for bit in range(7, -1, -1):
            inputs = {
                'A': (a >> bit) & 1,
                'B': (b >> bit) & 1,
                'en': 1,
                'rst_n': 1,
            }
            target_result = target.evaluate(inputs, state)
            if pair_index < 16:
                source_result = source.evaluate(inputs, state)
                if source_result != target_result:
                    raise AssertionError('warm-up interpreters disagree')
            state = target_result[1]
        outputs, _next = target.evaluate(
            {'A': 0, 'B': 0, 'en': 0, 'rst_n': 1}, state)
        expected = int(a + b == 496)
        if outputs['S'] != expected:
            errors += 1
        asserted += outputs['S']
    if errors:
        raise AssertionError('warm-up behavioral mismatches: %d' % errors)

    oracle = run_gate(netlist_path, streams=2, frames=8, seed=7)
    report = {
        'cells': len(design.cells),
        'icarus': {key: oracle[key] for key in
                    ('command', 'frames', 'result', 'samples', 'seed', 'streams')},
        'result': 'pass',
        'sat': proof,
        'state_bits': len(design.state_order),
        'tested_input_pairs': len(pairs),
        'true_input_pairs': asserted,
    }
    return report


def main():
    print(json.dumps(run(), sort_keys=True))
    return 0


if __name__ == '__main__':
    sys.exit(main())
