# really bad binary evaluator for our IR 

from lift.core import ReturnOp, parse_attrs
from lift.design import DesignError


class SiliconInterpreter:
    # without loading SKY130 model DAGs

    def __init__(self, module):
        if module.order != ['step']:
            raise DesignError('E_METADATA', 'target evaluator requires @step')
        self.func = module.funcs['step']
        if not self.func.body or self.func.body[0].name != 'silicon.meta':
            raise DesignError('E_METADATA', 'target metadata is missing')
        meta = parse_attrs(self.func.body[0].attrs_raw)
        self.input_names = meta['input_names'].split('|') if meta['input_names'] else []
        self.input_args = meta['input_args'].split('|') if meta['input_args'] else []
        self.state_ids = ([int(item) for item in meta['state_ids'].split('|')]
                          if meta['state_ids'] else [])
        self.state_args = meta['state_args'].split('|') if meta['state_args'] else []
        self.output_names = meta['output_names'].split('|') if meta['output_names'] else []
        self.clock_port = meta['clock_port']
        self.data_inputs = [item for item in self.input_names
                            if item != self.clock_port]
        self.operations = []
        self.return_values = None
        for operation in self.func.body[1:]:
            if isinstance(operation, ReturnOp):
                self.return_values = tuple(operation.operands)
            else:
                self.operations.append((
                    operation.name, tuple(operation.operands),
                    operation.results[0], parse_attrs(operation.attrs_raw)))

    def evaluate(self, inputs, state):
        if sorted(inputs) != sorted(self.data_inputs):
            raise DesignError('E_METADATA', 'target input keys do not match IR')
        if sorted(state) != sorted(self.state_ids):
            raise DesignError('E_METADATA', 'target state keys do not match IR')

        values = {}
        for port, argument in zip(self.input_names, self.input_args):
            bit = 1 if port == self.clock_port else inputs[port]
            if type(bit) not in (bool, int) or bit not in (0, 1, False, True):
                raise DesignError('E_UNSUPPORTED_VALUE', 'target input is not binary',
                                  input=port, value=bit)
            values[argument] = int(bit)
        for cell_id, argument in zip(self.state_ids, self.state_args):
            bit = state[cell_id]
            if type(bit) not in (bool, int) or bit not in (0, 1, False, True):
                raise DesignError('E_UNSUPPORTED_VALUE', 'target state is not binary',
                                  state=cell_id, value=bit)
            values[argument] = int(bit)

        for name, operands, result_name, attrs in self.operations:
            args = [values[value] for value in operands]
            if name == 'silicon.const':
                result = attrs['value']
            elif name == 'silicon.not':
                result = args[0] ^ 1
            elif name == 'silicon.and':
                result = args[0] & args[1]
            elif name == 'silicon.or':
                result = args[0] | args[1]
            elif name == 'silicon.xor':
                result = args[0] ^ args[1]
            elif name == 'silicon.mux':
                result = args[1] if args[0] else args[2]
            elif name == 'silicon.dff':
                result = args[0]
                if 'async_pin' in attrs and args[2] == attrs['async_active']:
                    result = attrs['async_value']
            else:
                raise DesignError('E_OP_UNKNOWN', 'target evaluator found unknown op',
                                  op=name)
            values[result_name] = int(result)

        if self.return_values is None:
            raise DesignError('E_RETURN_MAP', 'target function did not return')
        result_vector = [values[name] for name in self.return_values]
        width = len(self.state_ids)
        outputs = dict(zip(self.output_names, result_vector[width:]))
        next_state = dict(zip(self.state_ids, result_vector[:width]))
        return outputs, next_state
