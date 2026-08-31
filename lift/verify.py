

from __future__ import annotations

import re

from lift.core import Op, ReturnOp, parse_attrs, parse_signature
from lift.design import DesignError, PROFILE, base_name


_META_KEYS = {
    'clock_edge', 'clock_port', 'input_args', 'input_names', 'layer',
    'model_sha256', 'module', 'observation', 'output_names', 'output_values',
    'profile', 'source_sha256', 'state_args', 'state_ids',
}
_SKY_CELL_KEYS = {
    'input_pins', 'inst', 'model', 'output_pins', 'source_cell',
}
_SKY_FF_KEYS = _SKY_CELL_KEYS | {'state_pin'}
_SILICON_DFF_KEYS = {
    'clock_edge', 'clock_pin', 'data_pin', 'inst', 'state_pin',
}
_SILICON_DFF_ASYNC_KEYS = _SILICON_DFF_KEYS | {
    'async_active', 'async_pin', 'async_value',
}


def _fail(code, message, **context):
    raise DesignError(code, message, **context)


def _items(text):
    return text.split('|') if text else []


def _require_attr_keys(attrs, expected, op, line):
    actual = set(attrs)
    if actual != expected:
        _fail('E_METADATA' if op.endswith('.meta') else 'E_OP_SIGNATURE',
              'operation attributes do not match schema', op=op, line=line,
              missing=','.join(sorted(expected - actual)),
              unknown=','.join(sorted(actual - expected)))


def _verify_generic(module):
    if module.order != ['step'] or set(module.funcs) != {'step'}:
        _fail('E_METADATA', 'IND-1 module must contain exactly @step')
    func = module.funcs['step']
    arg_names = [name.lstrip('%') for name, _type in func.args]
    if len(set(arg_names)) != len(arg_names):
        _fail('E_SSA_DUP', 'function arguments contain duplicate names')
    if any(type_ != 'i1' for _name, type_ in func.args):
        _fail('E_OP_SIGNATURE', 'IND-1 arguments must be i1')
    if any(type_ != 'i1' for type_ in func.ret_types):
        _fail('E_OP_SIGNATURE', 'IND-1 results must be i1')
    if not func.body or not isinstance(func.body[0], Op):
        _fail('E_METADATA', 'function must start with a metadata operation')
    returns = [item for item in func.body if isinstance(item, ReturnOp)]
    if len(returns) != 1 or func.body[-1] is not returns[0]:
        _fail('E_RETURN_MAP', 'function must end with exactly one return')

    defined = set(arg_names)
    for item in func.body:
        if isinstance(item, ReturnOp):
            missing = [value for value in item.operands if value not in defined]
            if missing:
                _fail('E_SSA_UNDEFINED', 'return uses undefined values',
                      line=item.loc, values=','.join(missing))
            return_types = [part.strip() for part in item.types_raw.split(',')
                            if part.strip()]
            if return_types != func.ret_types:
                _fail('E_RETURN_MAP', 'return types do not match function results',
                      line=item.loc)
            if len(item.operands) != len(func.ret_types):
                _fail('E_RETURN_MAP', 'return arity does not match function',
                      line=item.loc, got=len(item.operands),
                      expected=len(func.ret_types))
            continue
        try:
            operand_types, result_types = parse_signature(item.sig)
            parse_attrs(item.attrs_raw)
        except ValueError as exc:
            _fail('E_OP_SIGNATURE', str(exc), op=item.name, line=item.loc)
        if len(operand_types) != len(item.operands) or \
                len(result_types) != len(item.results):
            _fail('E_OP_SIGNATURE', 'signature arity does not match operation',
                  op=item.name, line=item.loc)
        if any(type_ != 'i1' for type_ in operand_types + result_types):
            _fail('E_OP_SIGNATURE', 'IND-1 operation types must be i1',
                  op=item.name, line=item.loc)
        missing = [value for value in item.operands if value not in defined]
        if missing:
            _fail('E_SSA_UNDEFINED', 'operation uses undefined values',
                  op=item.name, line=item.loc, values=','.join(missing))
        duplicate = [value for value in item.results if value in defined]
        if duplicate or len(set(item.results)) != len(item.results):
            _fail('E_SSA_DUP', 'operation redefines an SSA value',
                  op=item.name, line=item.loc,
                  values=','.join(duplicate or item.results))
        defined.update(item.results)
    return func, returns[0]


def _verify_metadata(func, expected_layer, manifest):
    meta = func.body[0]
    if meta.name != '%s.meta' % expected_layer or meta.operands or meta.results:
        _fail('E_METADATA', 'first operation is not the required metadata op',
              expected='%s.meta' % expected_layer)
    attrs = parse_attrs(meta.attrs_raw)
    _require_attr_keys(attrs, _META_KEYS, meta.name, meta.loc)
    if attrs['layer'] != expected_layer or attrs['profile'] != PROFILE:
        _fail('E_METADATA', 'metadata layer/profile mismatch',
              layer=attrs['layer'], profile=attrs['profile'])
    if attrs['model_sha256'] != manifest.sha256:
        _fail('E_MODEL_HASH', 'IR model hash does not match manifest',
              ir=attrs['model_sha256'], manifest=manifest.sha256)
    for key in ('model_sha256', 'source_sha256'):
        if not re.fullmatch(r'[0-9a-f]{64}', attrs[key]):
            _fail('E_METADATA', 'metadata hash is malformed', field=key)
    if attrs['clock_edge'] != 'posedge' or attrs['observation'] != 'pre_edge':
        _fail('E_METADATA', 'unsupported clock/observation profile')
    if not attrs['module'] or '|' in attrs['module']:
        _fail('E_METADATA', 'metadata module name is invalid')

    input_names = _items(attrs['input_names'])
    input_args = _items(attrs['input_args'])
    state_ids = _items(attrs['state_ids'])
    state_args = _items(attrs['state_args'])
    output_names = _items(attrs['output_names'])
    output_values = _items(attrs['output_values'])
    if any(not value for values in (input_names, input_args, state_ids,
                                     state_args, output_names, output_values)
           for value in values):
        _fail('E_METADATA', 'metadata lists contain empty values')
    if len(input_names) != len(input_args) or len(state_ids) != len(state_args):
        _fail('E_METADATA', 'metadata parallel lists have different lengths')
    if len(set(input_names)) != len(input_names) or \
            len(set(input_args)) != len(input_args) or \
            len(set(state_ids)) != len(state_ids) or \
            len(set(output_names)) != len(output_names):
        _fail('E_METADATA', 'metadata lists contain duplicates')
    if not all(re.fullmatch(r'[0-9]+', value) for value in state_ids):
        _fail('E_METADATA', 'state IDs must be non-negative integers')
    if attrs['clock_port'] not in input_names:
        _fail('E_METADATA', 'clock port is not an input')
    arg_names = [name.lstrip('%') for name, _type in func.args]
    if arg_names != input_args + state_args:
        _fail('E_METADATA', 'function argument order does not match metadata')
    if len(func.ret_types) != len(state_ids) + len(output_names):
        _fail('E_RETURN_MAP', 'function result count does not match metadata')
    return_op = func.body[-1]
    if len(output_values) != len(output_names) or \
            return_op.operands[len(state_ids):] != output_values:
        _fail('E_RETURN_MAP', 'primary-output return map is invalid')
    return attrs, [int(value) for value in state_ids], output_names


def _verify_sky(func, return_op, metadata, state_ids, manifest):
    instances = set()
    ff_results = {}
    clock_arg = _items(metadata['input_args'])[
        _items(metadata['input_names']).index(metadata['clock_port'])]
    clock_values = {clock_arg}
    for item in func.body[1:-1]:
        attrs = parse_attrs(item.attrs_raw)
        if item.name == 'sky130.const':
            _require_attr_keys(attrs, {'net', 'value'}, item.name, item.loc)
            if item.operands or len(item.results) != 1 or \
                    type(attrs['net']) is not int or attrs['value'] not in (0, 1):
                _fail('E_OP_SIGNATURE', 'invalid sky130.const', line=item.loc)
            continue
        if item.name != 'sky130.cell':
            _fail('E_OP_UNKNOWN', 'unknown SKY130 operation', op=item.name,
                  line=item.loc)
        model_name = attrs.get('model')
        model = manifest.models.get(model_name)
        if model is None:
            _fail('E_UNKNOWN_CELL', 'SKY130 op references unknown model',
                  model=model_name, line=item.loc)
        expected_keys = _SKY_FF_KEYS if model.kind == 'ff' else _SKY_CELL_KEYS
        _require_attr_keys(attrs, expected_keys, item.name, item.loc)
        inst = attrs['inst']
        if type(inst) is not int or inst in instances:
            _fail('E_DUP_CELL', 'SKY130 instance ID is invalid or duplicated',
                  inst=inst, line=item.loc)
        instances.add(inst)
        if base_name(attrs['source_cell']) != model.name:
            _fail('E_METADATA', 'source cell does not match model', inst=inst)
        if _items(attrs['input_pins']) != list(model.inputs) or \
                _items(attrs['output_pins']) != list(model.outputs):
            _fail('E_OP_SIGNATURE', 'SKY130 pin metadata does not match model',
                  inst=inst)
        expected_operands = len(model.inputs) + (1 if model.kind == 'ff' else 0)
        if len(item.operands) != expected_operands or \
                len(item.results) != len(model.outputs):
            _fail('E_OP_SIGNATURE', 'SKY130 operation arity does not match model',
                  inst=inst)
        if model.kind == 'ff':
            if attrs['state_pin'] != model.outputs[0] or inst not in state_ids:
                _fail('E_METADATA', 'FF state metadata is inconsistent', inst=inst)
            state_arg = _items(metadata['state_args'])[state_ids.index(inst)]
            if item.operands[-1] != state_arg:
                _fail('E_METADATA', 'FF current-state operand is inconsistent',
                      inst=inst)
            clock_index = model.inputs.index(model.clock_pin)
            if item.operands[clock_index] not in clock_values:
                _fail('E_UNSUPPORTED_CLOCK', 'FF clock is not the declared clock',
                      inst=inst, value=item.operands[clock_index])
            ff_results[inst] = item.results[0]
        elif model.name == 'clkbuf' and item.operands[0] in clock_values:
            clock_values.update(item.results)
    if set(ff_results) != set(state_ids):
        _fail('E_METADATA', 'SKY130 FF instances do not match state metadata')
    expected_state_returns = [ff_results[inst] for inst in state_ids]
    if return_op.operands[:len(state_ids)] != expected_state_returns:
        _fail('E_RETURN_MAP', 'SKY130 next-state return order is invalid')


def _verify_silicon(func, return_op, metadata, state_ids):
    ff_results = {}
    clock_arg = _items(metadata['input_args'])[
        _items(metadata['input_names']).index(metadata['clock_port'])]
    for item in func.body[1:-1]:
        attrs = parse_attrs(item.attrs_raw)
        if item.name == 'silicon.const':
            allowed = ({'net', 'value'} if 'net' in attrs else
                       {'inst', 'source_pin', 'value'})
            _require_attr_keys(attrs, allowed, item.name, item.loc)
            if item.operands or len(item.results) != 1 or attrs['value'] not in (0, 1):
                _fail('E_OP_SIGNATURE', 'invalid silicon.const', line=item.loc)
            if ('net' in attrs and type(attrs['net']) is not int) or \
                    ('inst' in attrs and (type(attrs['inst']) is not int or
                                          not attrs['source_pin'])):
                _fail('E_OP_SIGNATURE', 'invalid silicon.const provenance',
                      line=item.loc)
            continue
        if item.name in ('silicon.not', 'silicon.and', 'silicon.or',
                         'silicon.xor', 'silicon.mux'):
            _require_attr_keys(attrs, {'inst', 'source_primitive'},
                               item.name, item.loc)
            expected = {'silicon.not': 1, 'silicon.and': 2,
                        'silicon.or': 2, 'silicon.xor': 2,
                        'silicon.mux': 3}[item.name]
            if len(item.operands) != expected or len(item.results) != 1:
                _fail('E_OP_SIGNATURE', 'Silicon primitive arity mismatch',
                      op=item.name, line=item.loc)
            if type(attrs['inst']) is not int or not attrs['source_primitive']:
                _fail('E_OP_SIGNATURE', 'Silicon primitive provenance is invalid',
                      op=item.name, line=item.loc)
            continue
        if item.name != 'silicon.dff':
            _fail('E_OP_UNKNOWN', 'unknown Silicon operation', op=item.name,
                  line=item.loc)
        expected_keys = (_SILICON_DFF_ASYNC_KEYS if 'async_pin' in attrs
                         else _SILICON_DFF_KEYS)
        _require_attr_keys(attrs, expected_keys, item.name, item.loc)
        inst = attrs['inst']
        if type(inst) is not int or inst in ff_results or inst not in state_ids:
            _fail('E_METADATA', 'Silicon FF instance is invalid', inst=inst)
        expected_operands = 4 if 'async_pin' in attrs else 3
        if len(item.operands) != expected_operands or len(item.results) != 1:
            _fail('E_OP_SIGNATURE', 'Silicon FF arity mismatch', inst=inst)
        if attrs['clock_edge'] != 'posedge' or attrs['clock_pin'] != 'CLK' or \
                attrs['data_pin'] != 'D' or attrs['state_pin'] != 'Q':
            _fail('E_METADATA', 'Silicon FF metadata is unsupported', inst=inst)
        if item.operands[1] != clock_arg:
            _fail('E_UNSUPPORTED_CLOCK', 'Silicon FF clock is not canonical',
                  inst=inst, value=item.operands[1])
        state_arg = _items(metadata['state_args'])[state_ids.index(inst)]
        if item.operands[-1] != state_arg:
            _fail('E_METADATA', 'Silicon FF current-state operand is inconsistent',
                  inst=inst)
        if 'async_pin' in attrs and (attrs['async_active'] not in (0, 1) or
                                      attrs['async_value'] not in (0, 1)):
            _fail('E_METADATA', 'Silicon async metadata is invalid', inst=inst)
        ff_results[inst] = item.results[0]
    if set(ff_results) != set(state_ids):
        _fail('E_METADATA', 'Silicon FF instances do not match state metadata')
    expected_state_returns = [ff_results[inst] for inst in state_ids]
    if return_op.operands[:len(state_ids)] != expected_state_returns:
        _fail('E_RETURN_MAP', 'Silicon next-state return order is invalid')


def verify_module(module, layer, manifest):
    """Verify a complete module and return its parsed metadata."""
    if layer not in ('sky130', 'silicon'):
        raise ValueError('unknown verification layer: %s' % layer)
    func, return_op = _verify_generic(module)
    metadata, state_ids, _outputs = _verify_metadata(func, layer, manifest)
    if layer == 'sky130':
        _verify_sky(func, return_op, metadata, state_ids, manifest)
    else:
        _verify_silicon(func, return_op, metadata, state_ids)
    return metadata
