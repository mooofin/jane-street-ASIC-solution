#z3 emiter 

import hashlib

import z3

from lift.core import ReturnOp, parse_attrs, parse_mlir
from lift.design import DesignError, load_model_manifest
from lift.verify import verify_module


def _list(value):
    return value.split('|') if value else []


def _source_primitive(name, args):
    if name == 'buf':
        return args[0]
    if name == 'not':
        return z3.Not(args[0])
    if name in ('and', 'nand'):
        value = z3.And(*args)
        return z3.Not(value) if name == 'nand' else value
    if name in ('or', 'nor'):
        value = z3.Or(*args)
        return z3.Not(value) if name == 'nor' else value
    if name in ('xor', 'xnor'):
        value = args[0]
        for other in args[1:]:
            value = z3.Xor(value, other)
        return z3.Not(value) if name == 'xnor' else value
    if name == 'udp_mux':
        return z3.If(args[2], args[1], args[0])
    raise DesignError('E_OP_UNKNOWN', 'validator found unknown source primitive',
                      primitive=name)


def _source_relation(module, manifest, symbols):
    function = module.funcs['step']
    values = dict(symbols)
    result = None
    for operation in function.body[1:]:
        if isinstance(operation, ReturnOp):
            result = [values[name] for name in operation.operands]
            break
        attrs = parse_attrs(operation.attrs_raw)
        if operation.name == 'sky130.const':
            values[operation.results[0]] = z3.BoolVal(bool(attrs['value']))
            continue
        model = manifest.models[attrs['model']]
        operands = [values[name] for name in operation.operands]
        pins = dict(zip(model.inputs, operands[:len(model.inputs)]))
        if model.kind == 'const':
            outputs = {pin: z3.BoolVal(bool(value))
                       for pin, value in model.values}
        elif model.kind == 'ff':
            q_next = pins['D']
            if model.async_pin is not None:
                asserted = (pins[model.async_pin] if model.async_active else
                            z3.Not(pins[model.async_pin]))
                q_next = z3.If(asserted, z3.BoolVal(bool(model.async_value)),
                               q_next)
            outputs = {model.outputs[0]: q_next}
        else:
            wires = dict(pins)
            for gate in model.gates:
                wires[gate.output] = _source_primitive(
                    gate.primitive, [wires[name] for name in gate.inputs])
            outputs = {pin: wires[pin] for pin in model.outputs}
        for pin, name in zip(model.outputs, operation.results):
            values[name] = outputs[pin]
    if result is None:
        raise DesignError('E_RETURN_MAP', 'source relation has no return')
    return result


def _target_relation(module, symbols):
    function = module.funcs['step']
    values = dict(symbols)
    returned = None
    for operation in function.body[1:]:
        if isinstance(operation, ReturnOp):
            returned = [values[name] for name in operation.operands]
            break
        attrs = parse_attrs(operation.attrs_raw)
        operands = [values[name] for name in operation.operands]
        if operation.name == 'silicon.const':
            value = z3.BoolVal(bool(attrs['value']))
        elif operation.name == 'silicon.not':
            value = z3.Not(operands[0])
        elif operation.name == 'silicon.and':
            value = z3.And(operands[0], operands[1])
        elif operation.name == 'silicon.or':
            value = z3.Or(operands[0], operands[1])
        elif operation.name == 'silicon.xor':
            value = z3.Xor(operands[0], operands[1])
        elif operation.name == 'silicon.mux':
            value = z3.If(operands[0], operands[1], operands[2])
        elif operation.name == 'silicon.dff':
            value = operands[0]
            if 'async_pin' in attrs:
                asserted = (operands[2] if attrs['async_active'] else
                            z3.Not(operands[2]))
                value = z3.If(asserted,
                              z3.BoolVal(bool(attrs['async_value'])), value)
        else:
            raise DesignError('E_OP_UNKNOWN', 'validator found unknown target op',
                              op=operation.name)
        values[operation.results[0]] = value
    if returned is None:
        raise DesignError('E_RETURN_MAP', 'target relation has no return')
    return returned


def validate_translation(sky130_path, silicon_path,
                         models_path='models/cells.json'):
    """Check all-input/all-state one-step equivalence with a Z3 miter."""
    manifest = load_model_manifest(models_path)
    try:
        with open(sky130_path, encoding='utf-8') as handle:
            source = parse_mlir(handle.read(), source=sky130_path)
        with open(silicon_path, encoding='utf-8') as handle:
            target = parse_mlir(handle.read(), source=silicon_path)
    except OSError as exc:
        raise DesignError('E_SCHEMA', 'cannot load translation artifact',
                          error=str(exc)) from exc

    source_meta = verify_module(source, 'sky130', manifest)
    target_meta = verify_module(target, 'silicon', manifest)
    ignored = {'layer', 'output_values'}
    for key in sorted(set(source_meta) - ignored):
        if source_meta[key] != target_meta.get(key):
            raise DesignError('E_TRANSLATION_MISMATCH',
                              'source and target contracts differ', field=key)

    input_names = _list(source_meta['input_names'])
    input_args = _list(source_meta['input_args'])
    state_ids = _list(source_meta['state_ids'])
    state_args = _list(source_meta['state_args'])
    symbols = {}
    public = {}
    for port, argument in zip(input_names, input_args):
        if port == source_meta['clock_port']:
            symbols[argument] = z3.BoolVal(True)
        else:
            symbol = z3.Bool('input_%s' % argument)
            symbols[argument] = symbol
            public['input:%s' % port] = symbol
    for cell_id, argument in zip(state_ids, state_args):
        symbol = z3.Bool('state_%s' % cell_id)
        symbols[argument] = symbol
        public['state:%s' % cell_id] = symbol

    source_results = _source_relation(source, manifest, symbols)
    target_results = _target_relation(target, symbols)
    if len(source_results) != len(target_results):
        raise DesignError('E_TRANSLATION_MISMATCH',
                          'source and target result widths differ')
    differences = [left != right for left, right in
                   zip(source_results, target_results)]
    solver = z3.Solver()
    solver.add(z3.Or(*differences))
    formula = solver.sexpr().encode('utf-8')
    formula_hash = hashlib.sha256(formula).hexdigest()
    status = solver.check()
    if status == z3.sat:
        model = solver.model()
        counterexample = ','.join(
            '%s=%d' % (name, int(z3.is_true(model.eval(symbol,
                                                       model_completion=True))))
            for name, symbol in sorted(public.items()))
        raise DesignError('E_TRANSLATION_MISMATCH',
                          'SAT found a source/target counterexample',
                          counterexample=counterexample,
                          formula_sha256=formula_hash)
    if status != z3.unsat:
        raise DesignError('E_ORACLE_INCOMPLETE',
                          'translation solver returned unknown',
                          reason=solver.reason_unknown())
    return {
        'formula_sha256': formula_hash,
        'result': 'unsat',
        'solver': 'z3-%s' % z3.get_version_string(),
        'variables': len(public),
        'results': len(source_results),
    }
