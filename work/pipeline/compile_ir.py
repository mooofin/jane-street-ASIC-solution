"""Compile a strict `IND-1` netlist through the serialized SKY130 boundary."""

import argparse
import os
import sys
import tempfile

_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _REPO not in sys.path:
    sys.path.insert(0, _REPO)

from lift.compiler import emit_sky130_module, lower_sky130_module
from lift.core import parse_mlir, print_mlir
from lift.design import load_design, load_model_manifest
from lift.verify import verify_module


def _atomic_write(path, text):
    parent = os.path.dirname(os.path.abspath(path))
    os.makedirs(parent, exist_ok=True)
    fd, temp_path = tempfile.mkstemp(prefix='.silicon-lift-', suffix='.tmp',
                                     dir=parent, text=True)
    try:
        with os.fdopen(fd, 'w', encoding='utf-8', newline='\n') as handle:
            handle.write(text)
        os.replace(temp_path, path)
    except Exception:
        try:
            os.remove(temp_path)
        except OSError:
            pass
        raise


def compile_netlist(netlist_path, models_path, sky_path, silicon_path):
    manifest = load_model_manifest(models_path)
    design = load_design(netlist_path, manifest)

    sky_module = emit_sky130_module(design, manifest)
    sky_text = print_mlir(sky_module)
    reparsed_sky = parse_mlir(sky_text, source=sky_path)
    verify_module(reparsed_sky, 'sky130', manifest)

    silicon_module = lower_sky130_module(reparsed_sky, manifest)
    silicon_text = print_mlir(silicon_module)
    reparsed_silicon = parse_mlir(silicon_text, source=silicon_path)
    verify_module(reparsed_silicon, 'silicon', manifest)

    _atomic_write(sky_path, sky_text)
    _atomic_write(silicon_path, silicon_text)
    return design, reparsed_sky, reparsed_silicon


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--netlist', default='work/netlist.json')
    parser.add_argument('--models', default='models/cells.json')
    parser.add_argument('--sky130', default='work/puzzle_sky130.mlir')
    parser.add_argument('--silicon', default='work/puzzle_silicon.mlir')
    args = parser.parse_args(argv)
    design, sky, silicon = compile_netlist(
        args.netlist, args.models, args.sky130, args.silicon)
    sky_ops = len(sky.funcs['step'].body) - 1
    silicon_ops = len(silicon.funcs['step'].body) - 1
    print('validated netlist: %d cells, %d state bits' %
          (len(design.cells), len(design.state_order)))
    print('wrote %s: %d body items' % (args.sky130, sky_ops))
    print('wrote %s: %d body items' % (args.silicon, silicon_ops))
    return 0


if __name__ == '__main__':
    sys.exit(main())
