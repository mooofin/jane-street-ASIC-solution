#SKY130 emission and the code for the `IND-1` lowering pass
from __future__ import annotations

from dataclasses import replace

from lift.core import Func, Module, Op, ReturnOp, format_attrs, parse_attrs
from lift.design import DesignError, sanitize


def _sig(operands, results):
    lhs = ', '.join(['i1'] * operands)
    rhs = ', '.join(['i1'] * results)
    return '(%s) -> %s' % (lhs, ('(%s)' % rhs) if results != 1 else 'i1')


def _meta_attrs(design, manifest, layer):
    input_names = [name for name, _ in design.inputs]
    input_args = ['input_%s' % sanitize(name) for name in input_names]
    state_ids = [str(cell_id) for cell_id in design.state_order]
    output_names = [name for name, _ in design.outputs]
    return {
        'clock_edge': design.clock_edge,
        'clock_port': design.clock_port,
        'input_args': '|'.join(input_args),
        'input_names': '|'.join(input_names),
        'layer': layer,
        'model_sha256': manifest.sha256,
        'module': design.module,
        'observation': 'pre_edge',
        'output_values': '',
        'output_names': '|'.join(output_names),
        'profile': design.profile,
        'source_sha256': design.source_sha256,
        'state_args': '|'.join('state_%s' % item for item in state_ids),
        'state_ids': '|'.join(state_ids),
    }


def _op(name, operands, results, attrs=None):
    return Op(name=name, operands=list(operands),
              attrs_raw=format_attrs(attrs or {}),
              sig=_sig(len(operands), len(results)), results=list(results))


def emit_sky130_module(design, manifest):
    #one operation per cell and one for the metadata . 
    args = []
    net_value = {}
    for port_name, net in design.inputs:
        arg = 'input_%s' % sanitize(port_name)
        args.append(('%' + arg, 'i1'))
        net_value[net] = arg
    cells = design.cell_map
    for cell_id in design.state_order:
        arg = 'state_%d' % cell_id
        args.append(('%' + arg, 'i1'))
        cell = cells[cell_id]
        model = manifest.models[cell.model]
        net_value[cell.connection_map[model.outputs[0]]] = arg

    body = [_op('sky130.meta', (), (), _meta_attrs(
        design, manifest, 'sky130'))]
    for net, value in design.constants:
        result = 'const_%d' % net
        body.append(_op('sky130.const', (), (result,),
                        {'net': net, 'value': value}))
        net_value[net] = result

    const_cells = [cell for cell in design.cells
                   if manifest.models[cell.model].kind == 'const']
    ordered_cells = (const_cells +
                     [cells[cell_id] for cell_id in design.comb_order] +
                     [cells[cell_id] for cell_id in design.state_order])
    emitted = set()
    next_values = {}
    for cell in ordered_cells:
        if cell.id in emitted:
            raise DesignError('E_DUP_CELL', 'cell emitted twice', cell=cell.id)
        emitted.add(cell.id)
        model = manifest.models[cell.model]
        conns = cell.connection_map
        operands = []
        for pin in model.inputs:
            net = conns[pin]
            if net not in net_value:
                raise DesignError('E_SSA_UNDEFINED',
                                  'cell input has no emitted value',
                                  cell=cell.id, pin=pin, net=net)
            operands.append(net_value[net])
        if model.kind == 'ff':
            operands.append('state_%d' % cell.id)
            results = ['next_%d' % cell.id]
            next_values[cell.id] = results[0]
        else:
            results = ['net_%d' % conns[pin] for pin in model.outputs]
            for pin, result in zip(model.outputs, results):
                net_value[conns[pin]] = result
        attrs = {
            'input_pins': '|'.join(model.inputs),
            'inst': cell.id,
            'model': model.name,
            'output_pins': '|'.join(model.outputs),
            'source_cell': cell.source_name,
        }
        if model.kind == 'ff':
            attrs['state_pin'] = model.outputs[0]
        body.append(_op('sky130.cell', operands, results, attrs))

    if emitted != set(cells):
        missing = sorted(set(cells) - emitted)
        raise DesignError('E_METADATA', 'not every cell was emitted',
                          cells=','.join(map(str, missing)))

    returns = [next_values[cell_id] for cell_id in design.state_order]
    for output_name, net in design.outputs:
        if net not in net_value:
            raise DesignError('E_RETURN_MAP', 'output has no emitted value',
                              output=output_name, net=net)
        returns.append(net_value[net])
    metadata = parse_attrs(body[0].attrs_raw)
    metadata['output_values'] = '|'.join(returns[len(design.state_order):])
    body[0].attrs_raw = format_attrs(metadata)
    body.append(ReturnOp(operands=returns,
                         types_raw=', '.join(['i1'] * len(returns))))
    func = Func(name='step', args=args,
                ret_types=['i1'] * len(returns), body=body)
    return Module(funcs={'step': func}, order=['step'])


def _lower_primitive(body, primitive, inputs, inst, serial):
    #lower the primitive to a sequence of operations and then get back the SSA values :) 
    
    attrs = {'inst': inst, 'source_primitive': primitive}

    def emit(name, operands):
        result = 'i%d_%d' % (inst, serial[0])
        serial[0] += 1
        body.append(_op(name, operands, (result,), attrs))
        return result

    if primitive == 'buf':
        return inputs[0]
    if primitive == 'not':
        return emit('silicon.not', inputs)
    if primitive == 'udp_mux':
        return emit('silicon.mux', (inputs[2], inputs[1], inputs[0]))
    base = {
        'and': 'silicon.and', 'nand': 'silicon.and',
        'or': 'silicon.or', 'nor': 'silicon.or',
        'xor': 'silicon.xor', 'xnor': 'silicon.xor',
    }[primitive]
    current = inputs[0]
    for other in inputs[1:]:
        current = emit(base, (current, other))
    if primitive in ('nand', 'nor', 'xnor'):
        current = emit('silicon.not', (current,))
    return current


def lower_sky130_module(source, manifest):
    #Lower reparsed,  verified SKY130 IR to Silicon IR
    from lift.verify import verify_module

    metadata = verify_module(source, 'sky130', manifest)
    source_func = source.funcs['step']
    target_func = Func(name='step', args=list(source_func.args),
                       ret_types=list(source_func.ret_types), body=[])
    body = target_func.body
    value_map = {name.lstrip('%'): name.lstrip('%')
                 for name, _type in source_func.args}
    target_meta = dict(metadata)
    target_meta['layer'] = 'silicon'
    body.append(_op('silicon.meta', (), (), target_meta))
    serials = {}

    for item in source_func.body[1:]:
        if isinstance(item, ReturnOp):
            try:
                mapped = [value_map[value] for value in item.operands]
            except KeyError as exc:
                raise DesignError('E_SSA_UNDEFINED',
                                  'return value was not lowered',
                                  value=str(exc)) from exc
            body.append(ReturnOp(operands=mapped,
                                 types_raw=item.types_raw, loc=item.loc))
            state_count = (len(metadata['state_ids'].split('|'))
                           if metadata['state_ids'] else 0)
            target_meta['output_values'] = '|'.join(mapped[state_count:])
            body[0].attrs_raw = format_attrs(target_meta)
            continue
        attrs = parse_attrs(item.attrs_raw)
        if item.name == 'sky130.const':
            result = item.results[0]
            body.append(_op('silicon.const', (), (result,), attrs))
            value_map[result] = result
            continue
        if item.name != 'sky130.cell':
            raise DesignError('E_OP_UNKNOWN', 'lowerer received unknown op',
                              op=item.name, line=item.loc)
        model = manifest.models[attrs['model']]
        inst = attrs['inst']
        mapped_operands = [value_map[value] for value in item.operands]
        if model.kind == 'const':
            for pin, source_result in zip(model.outputs, item.results):
                target_result = source_result
                body.append(_op('silicon.const', (), (target_result,), {
                    'inst': inst,
                    'source_pin': pin,
                    'value': model.value_map[pin],
                }))
                value_map[source_result] = target_result
            continue
        if model.kind == 'ff':
            attrs_out = {
                'clock_edge': model.clock_edge,
                'clock_pin': model.clock_pin,
                'data_pin': 'D',
                'inst': inst,
                'state_pin': model.outputs[0],
            }
            if model.async_pin is not None:
                attrs_out.update({
                    'async_active': model.async_active,
                    'async_pin': model.async_pin,
                    'async_value': model.async_value,
                })
            target_result = 'next_%d' % inst
            body.append(_op('silicon.dff', mapped_operands,
                            (target_result,), attrs_out))
            value_map[item.results[0]] = target_result
            continue

        wire = {pin: value for pin, value in
                zip(model.inputs, mapped_operands)}
        serial = serials.setdefault(inst, [0])
        for gate in model.gates:
            inputs = [wire[name] for name in gate.inputs]
            wire[gate.output] = _lower_primitive(
                body, gate.primitive, inputs, inst, serial)
        for pin, source_result in zip(model.outputs, item.results):
            value_map[source_result] = wire[pin]

    target = Module(funcs={'step': target_func}, order=['step'])
    verify_module(target, 'silicon', manifest)
    return target
