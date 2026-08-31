#Strict `IND-1` netlist and SKY130 model 

from __future__ import annotations

import hashlib
import json
import re
from dataclasses import dataclass
from pathlib import Path


PROFILE = 'IND-1'
NETLIST_SCHEMA = 'silicon-lift.netlist.v1'
MODEL_SCHEMA = 'silicon-lift.models.v1'
_PRIM_ARITY = {
    'and': (2, None),
    'or': (2, None),
    'nand': (2, None),
    'nor': (2, None),
    'xor': (2, None),
    'xnor': (2, None),
    'not': (1, 1),
    'buf': (1, 1),
    'udp_mux': (3, 3),
}


class DesignError(ValueError):
    #A stable fail

    def __init__(self, code, message, **context):
        self.code = code
        self.severity = 'error'
        self.message = message
        self.context = context
        details = ' '.join('%s=%r' % item for item in sorted(context.items()))
        super().__init__('%s: %s%s' %
                         (code, message, (' (' + details + ')') if details else ''))

    def as_dict(self):
        return {'code': self.code, 'context': dict(self.context),
                'message': self.message, 'severity': self.severity}


def _fail(code, message, **context):
    raise DesignError(code, message, **context)


def sha256_bytes(data):
    return hashlib.sha256(data).hexdigest()


def sha256_file(path):
    return sha256_bytes(Path(path).read_bytes())


def base_name(cell_name):
    if not isinstance(cell_name, str) or not cell_name:
        _fail('E_SCHEMA', 'cell name must be a non-empty string')
    return re.sub(r'_[0-9]+$', '', cell_name)


def sanitize(name):
    value = re.sub(r'[^A-Za-z0-9_]', '_', name)
    if not value or value[0].isdigit():
        value = 'v_' + value
    return value


@dataclass(frozen=True)
class Gate:
    primitive: str
    output: str
    inputs: tuple[str, ...]


@dataclass(frozen=True)
class CellModel:
    name: str
    kind: str
    inputs: tuple[str, ...]
    outputs: tuple[str, ...]
    power: tuple[str, ...]
    gates: tuple[Gate, ...] = ()
    values: tuple[tuple[str, int], ...] = ()
    clock_pin: str | None = None
    clock_edge: str | None = None
    async_pin: str | None = None
    async_active: int | None = None
    async_value: int | None = None
    source_path: str = ''
    source_sha256: str = ''

    @property
    def pins(self):
        return self.inputs + self.outputs + self.power

    @property
    def value_map(self):
        return dict(self.values)


@dataclass(frozen=True)
class ModelManifest:
    path: str
    sha256: str
    library: str
    library_commit: str
    models: dict[str, CellModel]


@dataclass(frozen=True)
class CellInstance:
    id: int
    source_name: str
    model: str
    conns: tuple[tuple[str, int], ...]

    @property
    def connection_map(self):
        return dict(self.conns)


@dataclass(frozen=True)
class Design:
    path: str
    source_sha256: str
    module: str
    profile: str
    inputs: tuple[tuple[str, int], ...]
    outputs: tuple[tuple[str, int], ...]
    constants: tuple[tuple[int, int], ...]
    clock_port: str
    clock_edge: str
    cells: tuple[CellInstance, ...]
    comb_order: tuple[int, ...]
    state_order: tuple[int, ...]

    @property
    def input_map(self):
        return dict(self.inputs)

    @property
    def output_map(self):
        return dict(self.outputs)

    @property
    def constant_map(self):
        return dict(self.constants)

    @property
    def cell_map(self):
        return {cell.id: cell for cell in self.cells}


def _require_keys(raw, keys, code, subject):
    if not isinstance(raw, dict):
        _fail(code, '%s must be an object' % subject)
    missing = set(keys) - set(raw)
    if missing:
        _fail(code, '%s is missing required keys' % subject,
              missing=','.join(sorted(missing)))


def _require_exact_keys(raw, keys, code, subject):
    expected = set(keys)
    _require_keys(raw, expected, code, subject)
    unknown = set(raw) - expected
    if unknown:
        _fail(code, '%s has unknown keys' % subject,
              unknown=','.join(sorted(unknown)))


def _load_json(payload, code):
    def reject_duplicates(pairs):
        result = {}
        for key, value in pairs:
            if key in result:
                _fail(code, 'JSON object contains a duplicate key', key=key)
            result[key] = value
        return result

    return json.loads(payload, object_pairs_hook=reject_duplicates)


def _port_tuple(raw, key, model_name):
    value = raw.get(key)
    if not isinstance(value, list) or not all(
            isinstance(item, str) and item and '|' not in item for item in value):
        _fail('E_MODEL_SCHEMA', 'model port list is invalid',
              model=model_name, port_class=key)
    if len(set(value)) != len(value):
        _fail('E_MODEL_SCHEMA', 'model port list has duplicates',
              model=model_name, port_class=key)
    return tuple(value)


def load_model_manifest(path='models/cells.json', verify_hashes=True):
    manifest_path = Path(path)
    try:
        payload = manifest_path.read_bytes()
        raw = _load_json(payload, 'E_MODEL_SCHEMA')
    except (OSError, json.JSONDecodeError) as exc:
        _fail('E_MODEL_SCHEMA', 'cannot load model manifest',
              path=str(manifest_path), error=str(exc))
    _require_exact_keys(raw, ('schema', 'library', 'models'),
                        'E_MODEL_SCHEMA', 'model manifest')
    if raw['schema'] != MODEL_SCHEMA:
        _fail('E_MODEL_SCHEMA', 'unsupported model schema',
              got=raw['schema'], expected=MODEL_SCHEMA)
    library = raw['library']
    _require_exact_keys(library, ('name', 'commit', 'license'),
                        'E_MODEL_SCHEMA', 'library')
    if not isinstance(library['name'], str) or not library['name'] or \
            not isinstance(library['commit'], str) or \
            not re.fullmatch(r'[0-9a-f]{40}', library['commit']) or \
            library['license'] != 'Apache-2.0':
        _fail('E_MODEL_SCHEMA', 'library provenance is invalid')
    if not isinstance(raw['models'], dict) or not raw['models']:
        _fail('E_MODEL_SCHEMA', 'model table must be a non-empty object')

    repo_root = manifest_path.resolve().parent.parent
    models = {}
    for name in sorted(raw['models']):
        if not isinstance(name, str) or not name:
            _fail('E_MODEL_SCHEMA', 'model name must be a non-empty string')
        entry = raw['models'][name]
        if not isinstance(entry, dict):
            _fail('E_MODEL_SCHEMA', 'model entry must be an object', model=name)
        _require_keys(entry, ('kind', 'ports', 'source'),
                      'E_MODEL_SCHEMA', 'model %s' % name)
        ports = entry['ports']
        if not isinstance(ports, dict):
            _fail('E_MODEL_SCHEMA', 'ports must be an object', model=name)
        _require_exact_keys(ports, ('inputs', 'outputs', 'power'),
                            'E_MODEL_SCHEMA', 'ports for %s' % name)
        inputs = _port_tuple(ports, 'inputs', name)
        outputs = _port_tuple(ports, 'outputs', name)
        power = _port_tuple(ports, 'power', name)
        all_ports = inputs + outputs + power
        if len(set(all_ports)) != len(all_ports):
            _fail('E_MODEL_SCHEMA', 'model port classes overlap', model=name)
        if not outputs:
            _fail('E_MODEL_SCHEMA', 'model has no outputs', model=name)

        source = entry['source']
        _require_exact_keys(source, ('path', 'sha256'),
                            'E_MODEL_SCHEMA', 'model source %s' % name)
        source_path = source['path']
        source_hash = source['sha256']
        if not isinstance(source_path, str) or not source_path or \
                not isinstance(source_hash, str) or not re.fullmatch(
                    r'[0-9a-f]{64}', source_hash):
            _fail('E_MODEL_SCHEMA', 'invalid model source provenance', model=name)
        if verify_hashes:
            resolved = repo_root / source_path
            if not resolved.is_file():
                _fail('E_MODEL_HASH', 'model source is missing',
                      model=name, path=str(resolved))
            actual = sha256_file(resolved)
            if actual != source_hash:
                _fail('E_MODEL_HASH', 'model source hash mismatch',
                      model=name, expected=source_hash, actual=actual)

        kind = entry['kind']
        gates = ()
        values = ()
        clock_pin = clock_edge = async_pin = None
        async_active = async_value = None
        if kind == 'comb':
            _require_exact_keys(entry, ('kind', 'ports', 'source', 'gates'),
                                'E_MODEL_SCHEMA', 'model %s' % name)
            raw_gates = entry.get('gates')
            if not isinstance(raw_gates, list) or not raw_gates:
                _fail('E_MODEL_SCHEMA', 'comb model has no gate DAG', model=name)
            available = set(inputs)
            driven_wires = set()
            parsed_gates = []
            for index, gate in enumerate(raw_gates):
                if not (isinstance(gate, list) and len(gate) == 3 and
                        isinstance(gate[0], str) and isinstance(gate[1], str)
                        and gate[1]
                        and isinstance(gate[2], list)):
                    _fail('E_MODEL_SCHEMA', 'malformed primitive gate',
                          model=name, gate=index)
                primitive, output, gate_inputs = gate
                if primitive not in _PRIM_ARITY:
                    _fail('E_MODEL_SCHEMA', 'unknown primitive',
                          model=name, primitive=primitive)
                if output in driven_wires or output in inputs:
                    _fail('E_MODEL_SCHEMA', 'primitive wire has multiple drivers',
                          model=name, wire=output)
                if not all(isinstance(item, str) for item in gate_inputs):
                    _fail('E_MODEL_SCHEMA', 'primitive inputs must be names',
                          model=name, gate=index)
                low, high = _PRIM_ARITY[primitive]
                if len(gate_inputs) < low or (high is not None and
                                               len(gate_inputs) > high):
                    _fail('E_MODEL_SCHEMA', 'primitive arity mismatch',
                          model=name, primitive=primitive,
                          arity=len(gate_inputs))
                missing = set(gate_inputs) - available
                if missing:
                    _fail('E_MODEL_SCHEMA', 'primitive uses unresolved wire',
                          model=name, gate=index,
                          missing=','.join(sorted(missing)))
                driven_wires.add(output)
                available.add(output)
                parsed_gates.append(Gate(primitive, output,
                                         tuple(gate_inputs)))
            missing_outputs = set(outputs) - available
            if missing_outputs:
                _fail('E_MODEL_SCHEMA', 'comb outputs are not driven',
                      model=name, missing=','.join(sorted(missing_outputs)))
            used_inputs = {wire for gate in parsed_gates for wire in gate.inputs}
            unused_inputs = set(inputs) - used_inputs
            if unused_inputs:
                _fail('E_MODEL_SCHEMA', 'comb model has unused required inputs',
                      model=name, unused=','.join(sorted(unused_inputs)))
            gates = tuple(parsed_gates)
        elif kind == 'const':
            _require_exact_keys(entry, ('kind', 'ports', 'source', 'values'),
                                'E_MODEL_SCHEMA', 'model %s' % name)
            raw_values = entry.get('values')
            if not isinstance(raw_values, dict) or set(raw_values) != set(outputs):
                _fail('E_MODEL_SCHEMA', 'constant outputs do not match ports',
                      model=name)
            for pin, value in raw_values.items():
                if type(value) is not int or value not in (0, 1):
                    _fail('E_MODEL_SCHEMA', 'constant value must be 0 or 1',
                          model=name, pin=pin)
            values = tuple((pin, raw_values[pin]) for pin in outputs)
            if inputs:
                _fail('E_MODEL_SCHEMA', 'constant model cannot have inputs',
                      model=name)
        elif kind == 'ff':
            allowed = {'kind', 'ports', 'source', 'clock'}
            if 'async' in entry:
                allowed.add('async')
            _require_exact_keys(entry, allowed, 'E_MODEL_SCHEMA',
                                'model %s' % name)
            clock = entry.get('clock')
            if not isinstance(clock, dict):
                _fail('E_MODEL_SCHEMA', 'FF model has no clock metadata',
                      model=name)
            _require_exact_keys(clock, ('pin', 'edge'), 'E_MODEL_SCHEMA',
                                'FF clock %s' % name)
            clock_pin, clock_edge = clock['pin'], clock['edge']
            if clock_pin != 'CLK' or clock_edge != 'posedge':
                _fail('E_MODEL_SCHEMA', 'unsupported FF clock metadata',
                      model=name, pin=clock_pin, edge=clock_edge)
            async_meta = entry.get('async')
            if async_meta is not None:
                if not isinstance(async_meta, dict):
                    _fail('E_MODEL_SCHEMA', 'FF async metadata must be an object',
                          model=name)
                _require_exact_keys(async_meta, ('pin', 'active', 'value'),
                                    'E_MODEL_SCHEMA', 'FF async %s' % name)
                async_pin = async_meta['pin']
                async_active = async_meta['active']
                async_value = async_meta['value']
                if async_pin not in inputs or type(async_active) is not int \
                        or async_active not in (0, 1) \
                        or type(async_value) is not int \
                        or async_value not in (0, 1):
                    _fail('E_MODEL_SCHEMA', 'invalid FF async metadata',
                          model=name)
            if set(outputs) != {'Q'} or 'D' not in inputs:
                _fail('E_MODEL_SCHEMA', 'unsupported FF port schema', model=name)
            expected_inputs = (('D', 'CLK', async_pin) if async_pin is not None
                               else ('D', 'CLK'))
            if inputs != expected_inputs:
                _fail('E_MODEL_SCHEMA', 'unsupported FF input order', model=name,
                      expected='|'.join(expected_inputs), got='|'.join(inputs))
        else:
            _fail('E_MODEL_SCHEMA', 'unknown model kind', model=name, kind=kind)

        models[name] = CellModel(
            name=name, kind=kind, inputs=inputs, outputs=outputs, power=power,
            gates=gates, values=values, clock_pin=clock_pin,
            clock_edge=clock_edge, async_pin=async_pin,
            async_active=async_active, async_value=async_value,
            source_path=source_path, source_sha256=source_hash)

    return ModelManifest(
        path=str(manifest_path), sha256=sha256_bytes(payload),
        library=library['name'], library_commit=library['commit'],
        models=models)


def _parse_port_map(raw, key):
    value = raw.get(key)
    if not isinstance(value, dict):
        _fail('E_SCHEMA', '%s must be an object' % key)
    result = []
    for name, net in value.items():
        if not isinstance(name, str) or not name or '|' in name:
            _fail('E_SCHEMA', 'port name must be a non-empty string', field=key)
        if type(net) is not int or net < 0:
            _fail('E_SCHEMA', 'port net must be a non-negative integer', field=key,
                  port=name)
        result.append((name, net))
    if len({name for name, _ in result}) != len(result):
        _fail('E_DUP_PORT', 'duplicate port name', field=key)
    return tuple(result)


def _trace_clock(net, root_net, drivers, cells, manifest, seen=None):
    if net == root_net:
        return
    seen = set() if seen is None else seen
    if net in seen:
        _fail('E_UNSUPPORTED_CLOCK', 'clock path contains a cycle', net=net)
    seen.add(net)
    driver = drivers.get(net)
    if driver is None or driver[0] != 'cell':
        _fail('E_UNSUPPORTED_CLOCK', 'FF clock is not driven by clock input',
              net=net)
    cell = cells[driver[1]]
    model = manifest.models[cell.model]
    if model.name != 'clkbuf' or len(model.inputs) != 1 or len(model.outputs) != 1:
        _fail('E_UNSUPPORTED_CLOCK', 'clock path contains unsupported logic',
              net=net, cell=cell.id, model=model.name)
    _trace_clock(cell.connection_map[model.inputs[0]], root_net, drivers,
                 cells, manifest, seen)


def load_design(path, manifest):
    design_path = Path(path)
    try:
        payload = design_path.read_bytes()
        raw = _load_json(payload, 'E_SCHEMA')
    except (OSError, json.JSONDecodeError) as exc:
        _fail('E_SCHEMA', 'cannot load netlist', path=str(design_path),
              error=str(exc))
    _require_exact_keys(raw, ('schema', 'module', 'profile', 'inputs', 'outputs',
                              'consts', 'clock', 'cells'),
                        'E_SCHEMA', 'netlist')
    if raw['schema'] != NETLIST_SCHEMA or raw['profile'] != PROFILE:
        _fail('E_SCHEMA', 'unsupported netlist schema/profile',
              schema=raw['schema'], profile=raw['profile'])
    if not isinstance(raw['module'], str) or not raw['module'] or \
            '|' in raw['module']:
        _fail('E_SCHEMA', 'module name must be a non-empty string')

    inputs = _parse_port_map(raw, 'inputs')
    outputs = _parse_port_map(raw, 'outputs')
    input_names = {name for name, _ in inputs}
    output_names = {name for name, _ in outputs}
    if input_names & output_names:
        _fail('E_DUP_PORT', 'input and output names overlap',
              names=','.join(sorted(input_names & output_names)))
    sanitized = {}
    for name in sorted(input_names):
        value = sanitize(name)
        if value in sanitized:
            _fail('E_NAME_COLLISION', 'input names sanitize identically',
                  first=sanitized[value], second=name, sanitized=value)
        sanitized[value] = name
    input_nets = [net for _, net in inputs]
    if len(set(input_nets)) != len(input_nets):
        _fail('E_SCHEMA', 'multiple input ports share one electrical net')

    raw_consts = raw['consts']
    if not isinstance(raw_consts, dict):
        _fail('E_SCHEMA', 'consts must be an object')
    constants = {}
    for net_text, value in raw_consts.items():
        if not isinstance(net_text, str) or not re.fullmatch(
                r'0|[1-9][0-9]*', net_text):
            _fail('E_SCHEMA', 'constant net ID must be an integer string',
                  net=net_text)
        net = int(net_text)
        if type(value) is not int or value not in (0, 1):
            _fail('E_UNSUPPORTED_VALUE', 'constant must be binary', net=net)
        constants[net] = value

    if not isinstance(raw['cells'], list):
        _fail('E_SCHEMA', 'cells must be an array')
    parsed_cells = []
    ids = set()
    for index, entry in enumerate(raw['cells']):
        if not isinstance(entry, dict):
            _fail('E_SCHEMA', 'cell entry must be an object', index=index)
        _require_exact_keys(entry, ('id', 'cell', 'conns'), 'E_SCHEMA',
                            'cell entry')
        cell_id = entry['id']
        if type(cell_id) is not int or cell_id < 0:
            _fail('E_SCHEMA', 'cell ID must be a non-negative integer',
                  index=index)
        if cell_id in ids:
            _fail('E_DUP_CELL', 'duplicate cell ID', cell=cell_id)
        ids.add(cell_id)
        model_name = base_name(entry['cell'])
        model = manifest.models.get(model_name)
        if model is None:
            _fail('E_UNKNOWN_CELL', 'cell model is not registered',
                  cell=cell_id, model=model_name)
        if not isinstance(entry['conns'], dict):
            _fail('E_SCHEMA', 'cell connections must be an object', cell=cell_id)
        conns = {}
        for pin, net in entry['conns'].items():
            if not isinstance(pin, str) or not pin or \
                    type(net) is not int or net < 0:
                _fail('E_SCHEMA', 'cell connection is malformed', cell=cell_id)
            conns[pin] = net
        expected = set(model.pins)
        actual = set(conns)
        unknown = actual - expected
        missing = expected - actual
        if unknown:
            _fail('E_UNKNOWN_PIN', 'cell has unknown pins', cell=cell_id,
                  pins=','.join(sorted(unknown)))
        if missing:
            _fail('E_MISSING_PIN', 'cell is missing required pins', cell=cell_id,
                  pins=','.join(sorted(missing)))
        parsed_cells.append(CellInstance(
            id=cell_id, source_name=entry['cell'], model=model_name,
            conns=tuple((pin, conns[pin]) for pin in model.pins)))
    parsed_cells.sort(key=lambda cell: cell.id)
    cells = {cell.id: cell for cell in parsed_cells}

    drivers = {}

    def add_driver(net, driver):
        previous = drivers.get(net)
        if previous is not None:
            _fail('E_MULTI_DRIVER', 'net has multiple drivers', net=net,
                  first='%s:%s' % previous, second='%s:%s' % driver)
        drivers[net] = driver

    for name, net in inputs:
        add_driver(net, ('input', name))
    cell_const_values = {}
    for cell in parsed_cells:
        model = manifest.models[cell.model]
        conns = cell.connection_map
        for pin in model.outputs:
            net = conns[pin]
            add_driver(net, ('cell', cell.id))
            if model.kind == 'const':
                cell_const_values[net] = model.value_map[pin]
    independent_constants = {}
    for net, value in constants.items():
        if net in cell_const_values:
            if cell_const_values[net] != value:
                _fail('E_MULTI_DRIVER', 'constant annotation disagrees with tie cell',
                      net=net, annotated=value, cell_value=cell_const_values[net])
            continue
        add_driver(net, ('const', value))
        independent_constants[net] = value

    consumed = set(net for _, net in outputs)
    for cell in parsed_cells:
        model = manifest.models[cell.model]
        conns = cell.connection_map
        consumed.update(conns[pin] for pin in model.inputs)
    for net in sorted(consumed):
        if net not in drivers:
            _fail('E_UNDRIVEN', 'consumed net has no driver', net=net)

    available = set(net for _, net in inputs) | set(independent_constants)
    for cell in parsed_cells:
        model = manifest.models[cell.model]
        if model.kind in ('ff', 'const'):
            available.update(cell.connection_map[pin] for pin in model.outputs)
    pending = [cell for cell in parsed_cells
               if manifest.models[cell.model].kind == 'comb']
    comb_order = []
    while pending:
        progress = []
        rest = []
        for cell in pending:
            model = manifest.models[cell.model]
            conns = cell.connection_map
            if all(conns[pin] in available for pin in model.inputs):
                progress.append(cell)
                available.update(conns[pin] for pin in model.outputs)
            else:
                rest.append(cell)
        if not progress:
            _fail('E_COMB_LOOP', 'combinational dependency graph is cyclic',
                  cells=','.join(str(cell.id) for cell in rest[:20]))
        comb_order.extend(cell.id for cell in progress)
        pending = rest

    clock = raw['clock']
    if not isinstance(clock, dict):
        _fail('E_SCHEMA', 'clock must be an object')
    _require_exact_keys(clock, ('port', 'edge'), 'E_SCHEMA', 'clock')
    clock_port, clock_edge = clock['port'], clock['edge']
    if clock_port not in input_names or clock_edge != 'posedge':
        _fail('E_UNSUPPORTED_CLOCK', 'IND-1 requires a positive-edge input clock',
              port=clock_port, edge=clock_edge)
    root_clock = dict(inputs)[clock_port]
    state_order = []
    for cell in parsed_cells:
        model = manifest.models[cell.model]
        if model.kind != 'ff':
            continue
        state_order.append(cell.id)
        _trace_clock(cell.connection_map[model.clock_pin], root_clock,
                     drivers, cells, manifest)

    return Design(
        path=str(design_path), source_sha256=sha256_bytes(payload),
        module=raw['module'], profile=raw['profile'], inputs=inputs,
        outputs=outputs,
        constants=tuple(sorted(independent_constants.items())),
        clock_port=clock_port, clock_edge=clock_edge,
        cells=tuple(parsed_cells), comb_order=tuple(comb_order),
        state_order=tuple(state_order))


def upgrade_legacy_netlist(raw, *, module, input_names, output_names,
                           clock_port, extra_inputs=None):
    """Explicitly adapt an extraction-era `io` netlist to the strict schema."""
    if not isinstance(raw, dict) or 'cells' not in raw or 'consts' not in raw:
        _fail('E_SCHEMA', 'legacy netlist is malformed')
    io = raw.get('io')
    if not isinstance(io, dict):
        _fail('E_SCHEMA', 'legacy adapter requires an io mapping')
    extra_inputs = extra_inputs or {}
    missing = (set(input_names) | set(output_names)) - set(io)
    if missing:
        _fail('E_SCHEMA', 'legacy port classification names are missing',
              missing=','.join(sorted(missing)))
    inputs = {name: int(io[name]) for name in input_names}
    for name, net in extra_inputs.items():
        if name in inputs:
            _fail('E_DUP_PORT', 'extra input duplicates a classified input',
                  port=name)
        inputs[name] = int(net)
    return {
        'schema': NETLIST_SCHEMA,
        'module': module,
        'profile': PROFILE,
        'clock': {'port': clock_port, 'edge': 'posedge'},
        'inputs': inputs,
        'outputs': {name: int(io[name]) for name in output_names},
        'consts': {str(net): int(value)
                   for net, value in raw['consts'].items()},
        'cells': raw['cells'],
    }
