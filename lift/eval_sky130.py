# holy lowerer-independent binary evaluator 

from lift.core import Op, ReturnOp, parse_attrs
from lift.design import DesignError
from lift.verify import verify_module


def _items(text):
    return text.split('|') if text else []


def _binary(value, subject):
    if type(value) not in (bool, int) or value not in (0, 1, False, True):
        raise DesignError('E_UNSUPPORTED_VALUE', 'value is not binary',
                          subject=subject, value=value)
    return int(value)


def _primitive(name, values):
    if name == 'buf':
        return values[0]
    if name == 'not':
        return 1 - values[0]
    if name == 'and':
        return int(all(values))
    if name == 'nand':
        return 1 - int(all(values))
    if name == 'or':
        return int(any(values))
    if name == 'nor':
        return 1 - int(any(values))
    if name == 'xor':
        return sum(values) & 1
    if name == 'xnor':
        return 1 - (sum(values) & 1)
    if name == 'udp_mux':
        return values[1] if values[2] else values[0]
    raise DesignError('E_OP_UNKNOWN', 'unknown source primitive', primitive=name)


class Sky130Interpreter:
    """Evaluate source cell operations without using lowering semantics."""

    def __init__(self, module, manifest):
        self.metadata = verify_module(module, 'sky130', manifest)
        self.func = module.funcs['step']
        self.manifest = manifest
        self.input_names = _items(self.metadata['input_names'])
        self.input_args = _items(self.metadata['input_args'])
        self.state_ids = [int(value) for value in
                          _items(self.metadata['state_ids'])]
        self.state_args = _items(self.metadata['state_args'])
        self.output_names = _items(self.metadata['output_names'])
        self.clock_port = self.metadata['clock_port']
        self.data_inputs = [name for name in self.input_names
                            if name != self.clock_port]
        self.operations = []
        self.return_values = None
        for item in self.func.body[1:]:
            if isinstance(item, ReturnOp):
                self.return_values = tuple(item.operands)
                continue
            attrs = parse_attrs(item.attrs_raw)
            model = (None if item.name == 'sky130.const' else
                     manifest.models[attrs['model']])
            self.operations.append((item.name, tuple(item.operands),
                                    tuple(item.results), attrs, model))

    def evaluate(self, inputs, state):
        if set(inputs) != set(self.data_inputs):
            raise DesignError('E_METADATA', 'source input mapping is incomplete',
                              expected='|'.join(self.data_inputs),
                              got='|'.join(sorted(inputs)))
        if set(state) != set(self.state_ids):
            raise DesignError('E_METADATA', 'source state mapping is incomplete',
                              expected='|'.join(map(str, self.state_ids)),
                              got='|'.join(map(str, sorted(state))))

        env = {}
        for name, arg in zip(self.input_names, self.input_args):
            env[arg] = (1 if name == self.clock_port else
                        _binary(inputs[name], 'input:%s' % name))
        for cell_id, arg in zip(self.state_ids, self.state_args):
            env[arg] = _binary(state[cell_id], 'state:%d' % cell_id)

        for name, item_operands, item_results, attrs, model in self.operations:
            if name == 'sky130.const':
                env[item_results[0]] = attrs['value']
                continue

            operands = [env[value] for value in item_operands]
            pins = dict(zip(model.inputs, operands[:len(model.inputs)]))
            if model.kind == 'const':
                values = model.value_map
            elif model.kind == 'ff':
                value = pins['D']
                if model.async_pin is not None and \
                        pins[model.async_pin] == model.async_active:
                    value = model.async_value
                values = {model.outputs[0]: value}
            else:
                wires = dict(pins)
                for gate in model.gates:
                    wires[gate.output] = _primitive(
                        gate.primitive, [wires[name] for name in gate.inputs])
                values = {pin: wires[pin] for pin in model.outputs}
            for pin, result in zip(model.outputs, item_results):
                env[result] = values[pin]

        if self.return_values is None:
            raise DesignError('E_RETURN_MAP', 'source function did not return')
        returned = [env[value] for value in self.return_values]
        count = len(self.state_ids)
        next_state = dict(zip(self.state_ids, returned[:count]))
        outputs = dict(zip(self.output_names, returned[count:]))
        return outputs, next_state
