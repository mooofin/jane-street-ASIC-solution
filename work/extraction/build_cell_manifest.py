"""Build the pinned, provenance-carrying SKY130 model manifest."""

import argparse
import hashlib
import json
import os
import sys
from pathlib import Path

_REPO = Path(__file__).resolve().parents[2]
if str(_REPO) not in sys.path:
    sys.path.insert(0, str(_REPO))

from work.verification.parse_official_models import load_all


SCHEMA = 'silicon-lift.models.v1'
LIBRARY_COMMIT = 'ac7fb61f06e6470b94e8afdf7c25268f62fbd7b1'


def _source_info(base):
    relative = Path('refs') / 'sky130_models' / 'cells' / \
        ('sky130_fd_sc_hd__%s.functional.v' % base)
    return {
        'path': relative.as_posix(),
        'sha256': hashlib.sha256((_REPO / relative).read_bytes()).hexdigest(),
    }


def build(output='models/cells.json'):
    parsed = load_all()
    models = {}
    for base in sorted(parsed):
        kind = parsed[base]
        if isinstance(kind, tuple):
            tag = kind[0]
            if tag == 'FF':
                inputs = {
                    'dfrtp': ['D', 'CLK', 'RESET_B'],
                    'dfstp': ['D', 'CLK', 'SET_B'],
                    'dfxtp': ['D', 'CLK'],
                }[base]
                async_meta = {
                    'dfrtp': {'pin': 'RESET_B', 'active': 0, 'value': 0},
                    'dfstp': {'pin': 'SET_B', 'active': 0, 'value': 1},
                    'dfxtp': None,
                }[base]
                models[base] = {
                    'kind': 'ff',
                    'ports': {'inputs': inputs, 'outputs': ['Q'], 'power': []},
                    'clock': {'pin': 'CLK', 'edge': 'posedge'},
                    'async': async_meta,
                    'source': _source_info(base),
                }
            else:
                outputs = list(kind[1])
                models[base] = {
                    'kind': 'const',
                    'ports': {'inputs': [], 'outputs': outputs, 'power': []},
                    'values': {pin: int(kind[1][pin]) for pin in outputs},
                    'source': _source_info(base),
                }
            continue
        models[base] = {
            'kind': 'comb',
            'ports': {
                'inputs': list(kind.ins),
                'outputs': list(kind.outs),
                'power': [],
            },
            'gates': [[primitive, output_wire, list(inputs)]
                      for primitive, output_wire, inputs in kind.order],
            'source': _source_info(base),
        }

    payload = {
        'schema': SCHEMA,
        'library': {
            'name': 'sky130_fd_sc_hd',
            'commit': LIBRARY_COMMIT,
            'license': 'Apache-2.0',
        },
        'models': models,
    }
    destination = Path(output)
    destination.parent.mkdir(parents=True, exist_ok=True)
    with destination.open('w', encoding='utf-8', newline='\n') as handle:
        json.dump(payload, handle, indent=1)
    return payload


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', default='models/cells.json')
    args = parser.parse_args(argv)
    payload = build(args.output)
    counts = {}
    for model in payload['models'].values():
        counts[model['kind']] = counts.get(model['kind'], 0) + 1
    print('wrote %s: %d models' % (args.output, len(payload['models'])))
    print('kinds:', counts)
    return 0


if __name__ == '__main__':
    sys.exit(main())
