
import os
import random
import sys

_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _REPO not in sys.path:
    sys.path.insert(0, _REPO)

from lift.core import Op, ParseError, parse_attrs, parse_mlir, print_mlir
from lift.design import load_design, load_model_manifest
from lift.eval_silicon import SiliconInterpreter
from lift.eval_sky130 import Sky130Interpreter
from lift.translation import validate_translation
from lift.verify import verify_module


SKY_PATH = 'work/puzzle_sky130.mlir'
SILICON_PATH = 'work/puzzle_silicon.mlir'


def _load(path):
    with open(path, encoding='utf-8') as handle:
        return handle.read()


def _expect_parse_error(text, label):
    try:
        parse_mlir(text, source=label)
    except ParseError as exc:
        assert exc.code == 'E_PARSE_INCOMPLETE'
        return
    raise AssertionError('%s did not fail parsing' % label)


def main():
    manifest = load_model_manifest()
    design = load_design('work/netlist.json', manifest)
    modules = {}

    for path, layer in ((SKY_PATH, 'sky130'), (SILICON_PATH, 'silicon')):
        text = _load(path)
        first = parse_mlir(text, source=path)
        printed = print_mlir(first)
        second = parse_mlir(printed, source=path + ':reprinted')
        assert first == second
        assert printed == print_mlir(second)
        verify_module(first, layer, manifest)
        modules[layer] = first
        operations = sum(isinstance(item, Op)
                         for item in first.funcs['step'].body)
        print('%-30s ops=%d roundtrip=verified' % (path, operations))

    sky_ops = [item for item in modules['sky130'].funcs['step'].body
               if isinstance(item, Op)]
    sky_cells = [item for item in sky_ops if item.name == 'sky130.cell']
    assert len(sky_cells) == len(design.cells)
    assert {parse_attrs(item.attrs_raw)['inst'] for item in sky_cells} == {
            cell.id for cell in design.cells}

    silicon_ops = [item for item in modules['silicon'].funcs['step'].body
                   if isinstance(item, Op)]
    assert sum(item.name == 'silicon.dff' for item in silicon_ops) == \
        len(design.state_order)
    print('structure: one SKY130 op per %d cells, %d canonical DFFs' %
          (len(design.cells), len(design.state_order)))

    source = Sky130Interpreter(modules['sky130'], manifest)
    target = SiliconInterpreter(modules['silicon'])
    rng = random.Random(20260823)
    state = {cell_id: rng.randrange(2) for cell_id in source.state_ids}
    for _step in range(100):
        inputs = {name: rng.randrange(2) for name in source.data_inputs}
        source_result = source.evaluate(inputs, state)
        target_result = target.evaluate(inputs, state)
        assert source_result == target_result
        state = source_result[1]
    print('interpreters: 100 deterministic transition samples agree')

    proof = validate_translation(SKY_PATH, SILICON_PATH)
    assert proof['result'] == 'unsat'
    assert proof['results'] == len(design.state_order) + len(design.outputs)
    print('translation: UNSAT, %d variables, %d compared results' %
          (proof['variables'], proof['results']))

    valid = _load(SKY_PATH)
    _expect_parse_error(valid + '\ntrailing garbage\n', 'trailing-text')
    _expect_parse_error(valid.replace('%input_clk: i1', '%input_clk i1', 1),
                        'malformed-argument')
    _expect_parse_error(valid.replace('(%input_clk)', '(input_clk)', 1),
                        'bare-operand')
    _expect_parse_error(valid.rsplit('}', 1)[0], 'unterminated-module')
    print('parser: incomplete and malformed inputs fail closed')
    print('ALL STRICT ROUNDTRIP TESTS PASS')
    return 0


if __name__ == '__main__':
    sys.exit(main())
