"""Fail-closed downstream puzzle gate, separate from the `IND-1` compiler gate."""

import argparse
import hashlib
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

_REPO = Path(__file__).resolve().parents[2]
if str(_REPO) not in sys.path:
    sys.path.insert(0, str(_REPO))

from work.verification.verify_lowering import run as run_ind1_gate
from work.verification.verify_key_uniqueness import check as check_key_uniqueness
from work.verification.recover_regions import RecoveryError, _serialized, recover
from work.tests.test_region_recovery import main as run_region_tests


def _sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def _atomic_json(path, value):
    destination = Path(path)
    destination.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary = tempfile.mkstemp(
        prefix='.puzzle-evidence-', suffix='.json', dir=str(destination.parent))
    try:
        with os.fdopen(descriptor, 'w', encoding='utf-8', newline='\n') as handle:
            json.dump(value, handle, indent=2, sort_keys=True)
            handle.write('\n')
        os.replace(temporary, destination)
    except Exception:
        try:
            os.remove(temporary)
        except OSError:
            pass
        raise


def _run_crosscheck(regions_path, key_path):
    command = [sys.executable, '-B', 'work/verification/verify_starbattle.py',
               '--regions', regions_path, '--key', key_path]
    result = subprocess.run(command, cwd=_REPO, capture_output=True, text=True)
    if result.returncode != 0:
        raise RecoveryError('standalone Star Battle cross-check failed: %s' %
                            (result.stderr.strip() or result.stdout.strip()))
    return result.stdout.strip().splitlines()


def _require_binding(actual, expected, label):
    if actual != expected:
        raise RecoveryError('%s does not match the IND-1 prerequisite' % label)


def run(output='work/puzzle_evidence.json',
        ind1_output='work/ind1_evidence.json',
        regions_output='work/regions.json'):
    if os.path.exists(output):
        os.remove(output)

    ind1 = run_ind1_gate(ind1_output)
    if ind1['claims']['result'] != 'pass':
        raise RecoveryError('IND-1 prerequisite did not pass')
    key_uniqueness = check_key_uniqueness()
    key_fixture_sha256 = _sha256('work/solution_bits.txt')
    _require_binding(key_uniqueness['key_fixture_sha256'], key_fixture_sha256,
                     'key-uniqueness fixture hash')
    _require_binding(key_uniqueness['artifacts']['model_manifest_sha256'],
                     ind1['artifacts']['model_manifest']['sha256'],
                     'key-uniqueness model hash')
    _require_binding(key_uniqueness['artifacts']['netlist_sha256'],
                     ind1['artifacts']['netlist']['sha256'],
                     'key-uniqueness netlist hash')
    _require_binding(key_uniqueness['artifacts']['sky130_ir_sha256'],
                     ind1['artifacts']['sky130_ir']['sha256'],
                     'key-uniqueness SKY130 IR hash')
    if run_region_tests() != 0:
        raise RecoveryError('region-recovery sensitivity tests failed')

    with tempfile.TemporaryDirectory(prefix='puzzle-regions-') as directory:
        regenerated_path = os.path.join(directory, 'regions.json')
        artifact, recovery = recover(
            'work/puzzle_silicon.mlir', 'work/netlist.json',
            'models/cells.json', 'work/solution_bits.txt')
        provenance = artifact['provenance']
        _require_binding(provenance['models']['sha256'],
                         ind1['artifacts']['model_manifest']['sha256'],
                         'region model hash')
        _require_binding(provenance['netlist']['sha256'],
                         ind1['artifacts']['netlist']['sha256'],
                         'region netlist hash')
        _require_binding(provenance['silicon_ir']['sha256'],
                         ind1['artifacts']['silicon_ir']['sha256'],
                         'region Silicon IR hash')
        regenerated = _serialized(artifact)
        Path(regenerated_path).write_bytes(regenerated)
        checked_in = Path(regions_output).read_bytes()
        if regenerated != checked_in:
            raise RecoveryError(
                '%s is stale; regenerate it with '
                'work/verification/recover_regions.py' %
                regions_output)
        crosscheck_lines = _run_crosscheck(
            regenerated_path, 'work/solution_bits.txt')
        _require_binding(_sha256('work/solution_bits.txt'), key_fixture_sha256,
                         'post-crosscheck key fixture hash')

    cover_info = artifact['provenance']['exact_cover']
    evidence = {
        'artifacts': {
            'ind1_evidence': {
                'path': ind1_output,
                'sha256': _sha256(ind1_output),
            },
            'regions': {
                'path': regions_output,
                'sha256': _sha256(regions_output),
            },
            'solution_fixture': {
                'path': 'work/solution_bits.txt',
                'sha256': key_fixture_sha256,
            },
        },
        'claims': {
            'circuit_key_uniqueness':
                'unique_under_recorded_IND-1_source_harness',
            'compiler_prerequisite': 'IND-1_pass',
            'gds_extraction': 'not_claimed',
            'puzzle_solution_count': 1,
            'region_interpretation':
                'selected_non_column_cover_under_recorded_interpretation_assumptions',
            'result': 'pass',
        },
        'crosscheck': {
            'artifact_sha256': _sha256(regions_output),
            'command_template':
                'python -B work/verification/verify_starbattle.py '
                '--regions <fresh-temporary-regions.json> '
                '--key work/solution_bits.txt',
            'result': 'pass',
            'summary': crosscheck_lines,
        },
        'ind1_binding': {
            'model_manifest_sha256': provenance['models']['sha256'],
            'netlist_sha256': provenance['netlist']['sha256'],
            'result': 'pass',
            'silicon_ir_sha256': provenance['silicon_ir']['sha256'],
        },
        'key_uniqueness': key_uniqueness,
        'recovery': {
            'active_state_count': len(recovery['active']),
            'assumptions': artifact['provenance']['selection']['assumptions'],
            'connected_exact_cover_count': cover_info['candidate_count'],
            'connected_unique_support_count':
                cover_info['connected_unique_support_count'],
            'key_consulted_during_selection': False,
            'literal_column_cover_count':
                cover_info['literal_column_cover_count'],
            'non_column_cover_count': cover_info['non_column_cover_count'],
            'one_hot_streams': 121,
        },
        'schema': 'asic-puzzle.puzzle-evidence.v1',
    }
    _atomic_json(output, evidence)
    return evidence


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', default='work/puzzle_evidence.json')
    parser.add_argument('--ind1-output', default='work/ind1_evidence.json')
    parser.add_argument('--regions-output', default='work/regions.json')
    args = parser.parse_args(argv)
    evidence = run(args.output, args.ind1_output, args.regions_output)
    print('PUZZLE PASS: %s' % args.output)
    print('key uniqueness: SAT canonical model, blocking clause %s' %
          evidence['key_uniqueness']['blocking_result'].upper())
    print('regions: %d supports, %d covers, 1 selected non-column cover' % (
        evidence['recovery']['connected_unique_support_count'],
        evidence['recovery']['connected_exact_cover_count']))
    print('Star Battle solutions: %d' %
          evidence['claims']['puzzle_solution_count'])
    return 0


if __name__ == '__main__':
    sys.exit(main())
