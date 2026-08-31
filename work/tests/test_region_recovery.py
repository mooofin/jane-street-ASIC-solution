"""Sensitivity and determinism checks for the downstream region client."""

import copy
import sys
from pathlib import Path

_REPO = Path(__file__).resolve().parents[2]
if str(_REPO) not in sys.path:
    sys.path.insert(0, str(_REPO))

from work.verification import verify_starbattle as crosscheck
from work.verification import recover_regions as recovery


SILICON_PATH = 'work/puzzle_silicon.mlir'
NETLIST_PATH = 'work/netlist.json'
MODELS_PATH = 'models/cells.json'
KEY_PATH = 'work/solution_bits.txt'


def _expect(error_type, action, label):
    try:
        action()
    except error_type:
        return
    raise AssertionError('%s: mutation was accepted' % label)


def main():
    first = recovery.recover_partition(SILICON_PATH, NETLIST_PATH, MODELS_PATH)
    second = recovery.recover_partition(SILICON_PATH, NETLIST_PATH, MODELS_PATH)
    assert len(first['covers']) == 2
    assert len(first['connected_supports']) == 35
    assert first['cover'] == second['cover']
    assert first['active'] == second['active']
    print('region recovery: keyless partition probe is deterministic')

    _expect(recovery.RecoveryError,
            lambda: recovery._select_region_cover([first['positional_cover']]),
            'missing-non-column-cover')
    _expect(recovery.RecoveryError,
            lambda: recovery._select_region_cover([first['cover']]),
            'missing-column-cover')
    _expect(recovery.RecoveryError,
            lambda: recovery._select_region_cover(
                [first['positional_cover'], first['cover'], first['cover']]),
            'ambiguous-non-column-cover')
    print('region recovery: 3 cover-selection mutations rejected')

    artifact, _details = recovery.recover(
        SILICON_PATH, NETLIST_PATH, MODELS_PATH, KEY_PATH)
    rows, regions, _owner, validation, provenance = \
        crosscheck._validate_artifact(artifact)
    assert len(rows) == 11
    key_info = crosscheck._load_key(KEY_PATH)
    crosscheck._validate_key(
        key_info, regions, validation, provenance, KEY_PATH)

    def rejected(label, mutate):
        value = copy.deepcopy(artifact)
        mutate(value)
        _expect(crosscheck.CrosscheckError,
                lambda: crosscheck._validate_artifact(value), label)

    rejected('missing-provenance', lambda value: value.pop('provenance'))
    rejected('forged-netlist-hash', lambda value: value['provenance']['netlist']
             .update(sha256='0' * 64))
    rejected('forged-source-state', lambda value: value['regions'][0]
             ['source_state_ids'].__setitem__(0, 999999))
    rejected('key-used-for-selection', lambda value: value['provenance']['selection']
             .update(key_consulted_during_selection=True))
    rejected('forged-support-connectivity', lambda value: value['provenance']['probe']
             ['active_state_supports'][0].update(connected=False))
    rejected('forged-cover-count', lambda value: value['provenance']['exact_cover']
             .update(candidate_count=1))
    rejected('unknown-region-field', lambda value: value['regions'][0]
             .update(unexpected=True))
    rejected('changed-region-cell', lambda value: value['regions'][0]['cells'].pop())
    print('region cross-check: 8 schema/provenance mutations rejected')

    literal_columns = [[column for column in range(11)] for _row in range(11)]
    assert len(crosscheck.solve(literal_columns, max_solutions=2)) == 2
    impossible = [[0 for _column in range(11)] for _row in range(11)]
    assert crosscheck.solve(impossible, max_solutions=2) == []
    print('region solver: multiple-solution and zero-solution controls detected')
    print('ALL REGION-RECOVERY TESTS PASS')
    return 0


if __name__ == '__main__':
    sys.exit(main())
