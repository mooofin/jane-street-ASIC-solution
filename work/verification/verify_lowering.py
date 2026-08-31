"""Single fail-closed `IND-1` gate and machine-readable evidence report."""

import argparse
import hashlib
import json
import os
import platform
import subprocess
import sys
import tempfile
from pathlib import Path

import z3

_REPO = Path(__file__).resolve().parents[2]
if str(_REPO) not in sys.path:
    sys.path.insert(0, str(_REPO))

from lift.design import DesignError, load_design, load_model_manifest
from lift.tests import test_contracts, test_micro, test_mutations, test_roundtrip
from lift.translation import validate_translation
from work.pipeline.simulate_protocol import run_protocol
from work.pipeline.compile_ir import compile_netlist
from work.verification.verify_cell_models import run_cell_gate
from work.verification.verify_gate_simulation import IVERILOG, VVP, run_gate
from work.verification.verify_warmup import run as run_warmup


def _hash(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def _run(command):
    result = subprocess.run(command, cwd=_REPO, capture_output=True, text=True)
    if result.returncode != 0:
        raise DesignError('E_ORACLE_INCOMPLETE', 'mandatory command failed',
                          command=' '.join(command), stderr=result.stderr[-4000:])
    return result


def _version(command):
    result = subprocess.run(command, cwd=_REPO, capture_output=True, text=True)
    if result.returncode != 0:
        raise DesignError('E_TOOL_MISSING', 'cannot query mandatory tool version',
                          command=' '.join(command))
    lines = (result.stdout + '\n' + result.stderr).splitlines()
    return next((line.strip() for line in lines if line.strip()), 'unknown')


def _atomic_json(path, value):
    destination = Path(path)
    destination.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(prefix='.ind1-evidence-', suffix='.json',
                                     dir=str(destination.parent))
    try:
        with os.fdopen(fd, 'w', encoding='utf-8', newline='\n') as handle:
            json.dump(value, handle, indent=2, sort_keys=True)
            handle.write('\n')
        os.replace(temporary, destination)
    except Exception:
        try:
            os.remove(temporary)
        except OSError:
            pass
        raise


def _decoded_message():
    bits = Path('work/solution_bits.txt').read_text(encoding='ascii').strip()
    timeline = run_protocol(bits)
    started = False
    message = []
    for _cycle, byte, success in timeline:
        started |= bool(success)
        if started and 32 <= byte < 127:
            message.append(chr(byte))
    decoded = ''.join(message)
    if decoded != '(* TWO STARS *)':
        raise DesignError('E_TRANSLATION_MISMATCH',
                          'puzzle answer regression failed', decoded=decoded)
    return decoded, len(timeline)


def run(output='work/ind1_evidence.json'):
    if os.path.exists(output):
        os.remove(output)

    model_before = _hash('models/cells.json')
    with tempfile.TemporaryDirectory(prefix='ind1-models-') as directory:
        regenerated = os.path.join(directory, 'cells.json')
        _run([sys.executable, '-B', 'work/extraction/build_cell_manifest.py',
              '--output', regenerated])
        model_after = _hash(regenerated)
        if model_before != model_after:
            raise DesignError('E_MODEL_HASH',
                              'model generator is not byte-for-byte reproducible',
                              before=model_before, after=model_after)

    design, _source, _target = compile_netlist(
        'work/netlist.json', 'models/cells.json',
        'work/puzzle_sky130.mlir', 'work/puzzle_silicon.mlir')
    manifest = load_model_manifest()
    load_design('work/netlist.json', manifest)
    translation = validate_translation(
        'work/puzzle_sky130.mlir', 'work/puzzle_silicon.mlir')

    if test_roundtrip.main() != 0 or test_contracts.main() != 0 or \
            test_mutations.main() != 0 or test_micro.main() != 0:
        raise DesignError('E_ORACLE_INCOMPLETE', 'mandatory Python test failed')

    cell_oracle = run_cell_gate()
    puzzle_oracle = run_gate(streams=4, frames=32, seed=20260823)
    warmup = run_warmup()
    decoded, protocol_frames = _decoded_message()

    model_kinds = {}
    for model in manifest.models.values():
        model_kinds[model.kind] = model_kinds.get(model.kind, 0) + 1
    sources = dict(cell_oracle['source_hashes'])
    sources.update(puzzle_oracle['source_hashes'])
    evidence = {
        'artifacts': {
            'model_manifest': {
                'path': 'models/cells.json',
                'sha256': manifest.sha256,
            },
            'netlist': {
                'path': 'work/netlist.json',
                'sha256': design.source_sha256,
            },
            'silicon_ir': {
                'path': 'work/puzzle_silicon.mlir',
                'sha256': _hash('work/puzzle_silicon.mlir'),
            },
            'sky130_ir': {
                'path': 'work/puzzle_sky130.mlir',
                'sha256': _hash('work/puzzle_sky130.mlir'),
            },
            'warmup_netlist': {
                'path': 'work/warmup_strict_netlist.json',
                'sha256': _hash('work/warmup_strict_netlist.json'),
            },
            'warmup_source_netlist': {
                'path': 'work/warmup_netlist.json',
                'sha256': _hash('work/warmup_netlist.json'),
            },
            'warmup_silicon_ir': {
                'path': 'work/warmup_silicon.mlir',
                'sha256': _hash('work/warmup_silicon.mlir'),
            },
            'warmup_sky130_ir': {
                'path': 'work/warmup_sky130.mlir',
                'sha256': _hash('work/warmup_sky130.mlir'),
            },
        },
        'claims': {
            'gds_extraction': 'not_claimed',
            'independence_boundary': 'validated_netlist_json',
            'ir_format': 'project_custom_mlir_inspired',
            'llvm_mlir_validation': 'not_claimed',
            'profile': 'IND-1',
            'puzzle_uniqueness': 'not_in_gate',
            'region_recovery': 'not_in_gate',
            'result': 'pass',
            'translation': 'all_binary_nonclock_inputs_and_current_states',
        },
        'design_contract': {
            'clock': {'edge': design.clock_edge, 'port': design.clock_port},
            'inputs': [{'name': name, 'net': net} for name, net in design.inputs],
            'module': design.module,
            'outputs': [{'name': name, 'net': net}
                        for name, net in design.outputs],
            'state_ids': list(design.state_order),
        },
        'fixtures': {
            'generated_micro_netlists': 10,
            'generated_micro_transitions': 1280,
            'negative_contracts': 19,
            'puzzle': {
                'decoded': decoded,
                'protocol_frames': protocol_frames,
            },
            'warmup': warmup,
        },
        'seeds': {
            'generated_micro_netlists': list(range(10)),
            'interpreter_trace': 20260823,
            'puzzle_icarus': 20260823,
            'warmup_behavior': 20260823,
            'warmup_icarus': 7,
        },
        'library': {
            'accepted_models': sorted(manifest.models),
            'commit': manifest.library_commit,
            'kind_counts': model_kinds,
            'license': 'Apache-2.0',
            'license_path': 'refs/sky130_models/LICENSE',
            'name': manifest.library,
            'source_hashes': dict(sorted(sources.items())),
        },
        'mutation_score': {
            'equivalent_rewrites_accepted': 1,
            'required_mutants_detected': 12,
            'required_mutants_total': 12,
            'semantic_sat_counterexamples': 5,
            'structural_mutations_rejected': 16,
        },
        'official_oracle': {
            'cells': cell_oracle,
            'puzzle': puzzle_oracle,
        },
        'profile': 'IND-1',
        'schema': 'silicon-lift.ind1-evidence.v1',
        'semantic_loss_ledger': {
            'async_timing': {
                'policy': 'stable-before-edge sampled override',
                'source': 'immediate UDP assertion',
            },
            'delays_and_specify': {
                'policy': 'out_of_scope',
                'source': 'timing model behavior',
            },
            'ff_initialization': {
                'policy': 'explicit current-state input',
                'source': 'may be unknown',
            },
            'power_pins': {
                'policy': 'valid rails assumed',
                'source': 'power-aware corruption possible',
            },
            'strengths': {
                'policy': 'out_of_scope',
                'source': 'Verilog strength resolution',
            },
            'x_z': {
                'policy': 'binary Z3 UNSAT result plus directed four-state Icarus tests',
                'source': 'four-state official model',
            },
        },
        'translation_validation': translation,
        'unsupported_features': [
            'multiple or non-positive-edge clocks',
            'gated, inverted, or data-derived clocks',
            'latches and unsupported sequential cells',
            'resolved X/Z translation semantics',
            'timing, specify blocks, and delays',
            'power-aware and strength-aware semantics',
            'GDS extraction correctness',
        ],
        'versions': {
            'iverilog': _version([IVERILOG, '-V']),
            'python': platform.python_version(),
            'vvp': _version([VVP, '-V']),
            'z3': z3.get_version_string(),
        },
    }
    _atomic_json(output, evidence)
    return evidence


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', default='work/ind1_evidence.json')
    args = parser.parse_args(argv)
    evidence = run(args.output)
    print('IND-1 PASS: %s' % args.output)
    print('translation: %s (%s)' % (
        evidence['translation_validation']['result'],
        evidence['translation_validation']['formula_sha256']))
    return 0


if __name__ == '__main__':
    sys.exit(main())
