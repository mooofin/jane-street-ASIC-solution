
import copy
import os
import sys
import tempfile

_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _REPO not in sys.path:
    sys.path.insert(0, _REPO)

from lift.core import Op, ReturnOp, format_attrs, parse_attrs, parse_mlir, print_mlir
from lift.design import DesignError, load_model_manifest
from lift.translation import validate_translation
from lift.verify import verify_module


SKY_PATH = 'work/puzzle_sky130.mlir'
TARGET_PATH = 'work/puzzle_silicon.mlir'


def _read_module(path):
    with open(path, encoding='utf-8') as handle:
        return parse_mlir(handle.read(), source=path)


def _expect(code, action, label):
    try:
        action()
    except DesignError as exc:
        if exc.code != code:
            raise AssertionError('%s: got %s, expected %s: %s' %
                                 (label, exc.code, code, exc))
        return
    raise AssertionError('%s: mutation was accepted' % label)


def _live_operations(module):
    function = module.funcs['step']
    live = set(function.body[-1].operands)
    operations = []
    for operation in reversed(function.body[1:-1]):
        if set(operation.results) & live:
            operations.append(operation)
            live.update(operation.operands)
    operations.reverse()
    return operations


def _attrs(operation, **updates):
    values = parse_attrs(operation.attrs_raw)
    values.update(updates)
    operation.attrs_raw = format_attrs(values)


def _first(module, predicate, *, live=False):
    operations = (_live_operations(module) if live else
                  [item for item in module.funcs['step'].body
                   if isinstance(item, Op)])
    return next(item for item in operations if predicate(item))


def main():
    manifest = load_model_manifest()
    source = _read_module(SKY_PATH)
    target = _read_module(TARGET_PATH)

    def rejected_source(label, code, mutate):
        module = copy.deepcopy(source)
        mutate(module)
        _expect(code, lambda: verify_module(module, 'sky130', manifest), label)

    def rejected_target(label, code, mutate):
        module = copy.deepcopy(target)
        mutate(module)
        _expect(code, lambda: verify_module(module, 'silicon', manifest), label)

    def remove_metadata_key(module):
        metadata = module.funcs['step'].body[0]
        values = parse_attrs(metadata.attrs_raw)
        values.pop('output_names')
        metadata.attrs_raw = format_attrs(values)
    rejected_target('missing-metadata', 'E_METADATA', remove_metadata_key)

    def duplicate_ssa(module):
        operation = _first(module, lambda item: bool(item.results), live=True)
        operation.results[0] = module.funcs['step'].args[0][0].lstrip('%')
    rejected_target('duplicate-ssa', 'E_SSA_DUP', duplicate_ssa)

    def undefined_ssa(module):
        operation = _first(module, lambda item: bool(item.operands), live=True)
        operation.operands[0] = 'not_defined'
    rejected_target('undefined-ssa', 'E_SSA_UNDEFINED', undefined_ssa)

    def bad_signature(module):
        operation = _first(module, lambda item: bool(item.operands), live=True)
        operation.sig = '() -> i1'
    rejected_target('bad-signature', 'E_OP_SIGNATURE', bad_signature)

    def unknown_op(module):
        operation = _first(module, lambda item: item.name.startswith('silicon.'),
                           live=True)
        operation.name = 'silicon.mystery'
    rejected_target('unknown-operation', 'E_OP_UNKNOWN', unknown_op)

    def reorder_state(module):
        returned = module.funcs['step'].body[-1]
        returned.operands[0], returned.operands[1] = \
            returned.operands[1], returned.operands[0]
    rejected_target('state-result-order', 'E_RETURN_MAP', reorder_state)

    def reorder_outputs(module):
        metadata = parse_attrs(module.funcs['step'].body[0].attrs_raw)
        offset = len(metadata['state_ids'].split('|'))
        returned = module.funcs['step'].body[-1]
        right = next(index for index in range(offset + 1, len(returned.operands))
                     if returned.operands[index] != returned.operands[offset])
        returned.operands[offset], returned.operands[right] = \
            returned.operands[right], returned.operands[offset]
    rejected_target('primary-output-order', 'E_RETURN_MAP', reorder_outputs)

    def remove_connection(module):
        operation = _first(module, lambda item: bool(item.operands), live=True)
        operation.operands.pop()
    rejected_target('removed-connection', 'E_OP_SIGNATURE', remove_connection)

    def drop_operation(module):
        operation = _first(module, lambda item: bool(item.results), live=True)
        module.funcs['step'].body.remove(operation)
    rejected_target('dropped-operation', 'E_SSA_UNDEFINED', drop_operation)

    def unsupported_clock(module):
        metadata = parse_attrs(module.funcs['step'].body[0].attrs_raw)
        clock_index = metadata['input_names'].split('|').index(
            metadata['clock_port'])
        replacement = next(value for index, value in enumerate(
            metadata['input_args'].split('|')) if index != clock_index)
        operation = _first(module, lambda item: item.name == 'silicon.dff')
        operation.operands[1] = replacement
    rejected_target('unsupported-clock-source', 'E_UNSUPPORTED_CLOCK',
                    unsupported_clock)

    def wrong_edge(module):
        operation = _first(module, lambda item: item.name == 'silicon.dff')
        _attrs(operation, clock_edge='negedge')
    rejected_target('wrong-clock-edge', 'E_METADATA', wrong_edge)

    def wrong_target_state(module):
        operation = _first(module, lambda item: item.name == 'silicon.dff')
        metadata = parse_attrs(module.funcs['step'].body[0].attrs_raw)
        operation.operands[-1] = metadata['state_args'].split('|')[1]
    rejected_target('wrong-target-current-state', 'E_METADATA',
                    wrong_target_state)

    def unknown_model(module):
        operation = _first(module, lambda item: item.name == 'sky130.cell')
        _attrs(operation, model='missing_model')
    rejected_source('unknown-source-model', 'E_UNKNOWN_CELL', unknown_model)

    def wrong_pin_order(module):
        operation = _first(
            module, lambda item: item.name == 'sky130.cell' and
            len(parse_attrs(item.attrs_raw)['input_pins'].split('|')) > 1)
        values = parse_attrs(operation.attrs_raw)
        pins = values['input_pins'].split('|')
        pins[0], pins[1] = pins[1], pins[0]
        values['input_pins'] = '|'.join(pins)
        operation.attrs_raw = format_attrs(values)
    rejected_source('source-pin-order', 'E_OP_SIGNATURE', wrong_pin_order)

    def duplicate_instance(module):
        cells = [item for item in module.funcs['step'].body
                 if isinstance(item, Op) and item.name == 'sky130.cell']
        _attrs(cells[1], inst=parse_attrs(cells[0].attrs_raw)['inst'])
    rejected_source('duplicate-source-instance', 'E_DUP_CELL', duplicate_instance)

    def wrong_source_state(module):
        operation = _first(
            module, lambda item: item.name == 'sky130.cell' and
            'state_pin' in parse_attrs(item.attrs_raw))
        metadata = parse_attrs(module.funcs['step'].body[0].attrs_raw)
        operation.operands[-1] = metadata['state_args'].split('|')[1]
    rejected_source('wrong-source-current-state', 'E_METADATA',
                    wrong_source_state)
    print('verifier: 16 malformed IR mutations rejected')

    with tempfile.TemporaryDirectory(prefix='ind1-mutations-') as directory:
        mutant_path = os.path.join(directory, 'mutant.mlir')

        def semantic_mutant(label, mutate):
            module = copy.deepcopy(target)
            mutate(module)
            verify_module(module, 'silicon', manifest)
            with open(mutant_path, 'w', encoding='utf-8', newline='\n') as handle:
                handle.write(print_mlir(module))
            _expect('E_TRANSLATION_MISMATCH',
                    lambda: validate_translation(SKY_PATH, mutant_path), label)

        def swap_mux(module):
            operation = _first(module, lambda item: item.name == 'silicon.mux',
                               live=True)
            operation.operands[1], operation.operands[2] = \
                operation.operands[2], operation.operands[1]
        semantic_mutant('swapped-mux-arms', swap_mux)

        def invert_async(module):
            operation = _first(module, lambda item: item.name == 'silicon.dff'
                               and 'async_pin' in parse_attrs(item.attrs_raw))
            values = parse_attrs(operation.attrs_raw)
            values['async_active'] ^= 1
            operation.attrs_raw = format_attrs(values)
        semantic_mutant('inverted-async-level', invert_async)

        def change_async_value(module):
            operation = _first(module, lambda item: item.name == 'silicon.dff'
                               and 'async_pin' in parse_attrs(item.attrs_raw))
            values = parse_attrs(operation.attrs_raw)
            values['async_value'] ^= 1
            operation.attrs_raw = format_attrs(values)
        semantic_mutant('changed-async-value', change_async_value)

        def substitute_gate(module):
            operation = _first(module, lambda item: item.name == 'silicon.and',
                               live=True)
            operation.name = 'silicon.or'
        semantic_mutant('substituted-gate-opcode', substitute_gate)

        def flip_constant(module):
            operation = _first(module, lambda item: item.name == 'silicon.const',
                               live=True)
            values = parse_attrs(operation.attrs_raw)
            values['value'] ^= 1
            operation.attrs_raw = format_attrs(values)
        semantic_mutant('flipped-constant', flip_constant)
        print('miter: 5 semantic mutations produced SAT counterexamples')

        equivalent = copy.deepcopy(target)
        operation = _first(equivalent,
                           lambda item: item.name in ('silicon.and', 'silicon.or',
                                                      'silicon.xor'), live=True)
        function = equivalent.funcs['step']
        position = function.body.index(operation) + 1
        source_value = operation.results[0]
        attrs = format_attrs({'inst': -1, 'source_primitive': 'double_not'})
        first = Op('silicon.not', [source_value], attrs, '(i1) -> i1',
                   ['equiv_not_1'])
        second = Op('silicon.not', ['equiv_not_1'], attrs, '(i1) -> i1',
                    ['equiv_not_2'])
        function.body[position:position] = [first, second]
        for item in function.body[position + 2:]:
            item.operands = ['equiv_not_2' if value == source_value else value
                             for value in item.operands]
        metadata = parse_attrs(function.body[0].attrs_raw)
        metadata['output_values'] = '|'.join(
            'equiv_not_2' if value == source_value else value
            for value in metadata['output_values'].split('|'))
        function.body[0].attrs_raw = format_attrs(metadata)
        verify_module(equivalent, 'silicon', manifest)
        with open(mutant_path, 'w', encoding='utf-8', newline='\n') as handle:
            handle.write(print_mlir(equivalent))
        proof = validate_translation(SKY_PATH, mutant_path)
        assert proof['result'] == 'unsat'
        print('miter: equivalent double-negation rewrite remains UNSAT')

    print('ALL MUTATION TESTS PASS')
    return 0


if __name__ == '__main__':
    sys.exit(main())
