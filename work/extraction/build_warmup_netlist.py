"""Adapt the retained warm-up extraction into the strict `IND-1` schema."""

import argparse
import json
import os
import sys
from pathlib import Path

_REPO = Path(__file__).resolve().parents[2]
if str(_REPO) not in sys.path:
    sys.path.insert(0, str(_REPO))

from lift.design import upgrade_legacy_netlist


def build(source='work/warmup_netlist.json',
          output='work/warmup_strict_netlist.json'):
    with open(source, encoding='utf-8') as handle:
        legacy = json.load(handle)
    strict = upgrade_legacy_netlist(
        legacy, module='warmup', input_names=('A', 'B', 'clk', 'en', 'rst_n'),
        output_names=('S',), clock_port='clk')
    with Path(output).open('w', encoding='utf-8', newline='\n') as handle:
        handle.write(json.dumps(strict, indent=1) + '\n')
    return strict


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--source', default='work/warmup_netlist.json')
    parser.add_argument('--output', default='work/warmup_strict_netlist.json')
    args = parser.parse_args(argv)
    strict = build(args.source, args.output)
    print('wrote %s: %d cells' % (args.output, len(strict['cells'])))
    return 0


if __name__ == '__main__':
    sys.exit(main())
