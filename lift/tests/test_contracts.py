

import copy
import json
import os
import sys
import tempfile

_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _REPO not in sys.path:
    sys.path.insert(0, _REPO)

from lift.design import DesignError, load_design, load_model_manifest


def _expect(code, action, label):
    try:
        action()
    except DesignError as exc:
        if exc.code != code:
            raise AssertionError('%s: got %s, expected %s: %s' %
                                 (label, exc.code, code, exc))
        return
    raise AssertionError('%s: expected %s' % (label, code))


def _dump(path, value):
    with open(path, 'w', encoding='utf-8', newline='\n') as handle:
        json.dump(value, handle)


def main():
    manifest = load_model_manifest()
    with open('work/netlist.json', encoding='utf-8') as handle:
        netlist = json.load(handle)
    with open('models/cells.json', encoding='utf-8') as handle:
        models = json.load(handle)

    with tempfile.TemporaryDirectory(prefix='ind1-contracts-') as directory:
        netlist_path = os.path.join(directory, 'netlist.json')

        def netlist_case(label, code, mutate):
            value = copy.deepcopy(netlist)
            mutate(value)
            _dump(netlist_path, value)
            _expect(code, lambda: load_design(netlist_path, manifest), label)

        netlist_case('missing-key', 'E_SCHEMA', lambda value: value.pop('clock'))
        netlist_case('unknown-key', 'E_SCHEMA',
                     lambda value: value.__setitem__('surprise', 1))
        netlist_case('duplicate-cell', 'E_DUP_CELL',
                     lambda value: value['cells'][1].__setitem__(
                         'id', value['cells'][0]['id']))
        netlist_case('unknown-cell', 'E_UNKNOWN_CELL',
                     lambda value: value['cells'][0].__setitem__(
                         'cell', 'not_a_registered_cell_1'))

        def add_unknown_pin(value):
            value['cells'][0]['conns']['BAD'] = 999999999
        netlist_case('unknown-pin', 'E_UNKNOWN_PIN', add_unknown_pin)

        def remove_pin(value):
            value['cells'][0]['conns'].pop(next(iter(value['cells'][0]['conns'])))
        netlist_case('missing-pin', 'E_MISSING_PIN', remove_pin)

        def make_undriven(value):
            for cell in value['cells']:
                model = manifest.models[cell['cell'].rsplit('_', 1)[0]]
                if model.inputs:
                    cell['conns'][model.inputs[0]] = 999999999
                    return
        netlist_case('undriven-net', 'E_UNDRIVEN', make_undriven)

        def make_multidriver(value):
            first = value['cells'][0]
            second = value['cells'][1]
            first_model = manifest.models[first['cell'].rsplit('_', 1)[0]]
            second_model = manifest.models[second['cell'].rsplit('_', 1)[0]]
            second['conns'][second_model.outputs[0]] = \
                first['conns'][first_model.outputs[0]]
        netlist_case('multiple-driver', 'E_MULTI_DRIVER', make_multidriver)

        def make_loop(value):
            for cell in value['cells']:
                model = manifest.models[cell['cell'].rsplit('_', 1)[0]]
                if model.kind == 'comb' and model.name != 'clkbuf':
                    cell['conns'][model.inputs[0]] = cell['conns'][model.outputs[0]]
                    return
        netlist_case('comb-loop', 'E_COMB_LOOP', make_loop)
        netlist_case('bad-clock', 'E_UNSUPPORTED_CLOCK',
                     lambda value: value['clock'].__setitem__('edge', 'negedge'))
        netlist_case('name-collision', 'E_NAME_COLLISION',
                     lambda value: value['inputs'].__setitem__('rst-n', 999999998))
        netlist_case('negative-net', 'E_SCHEMA',
                     lambda value: value['inputs'].__setitem__('clk', -1))

        with open(netlist_path, 'w', encoding='utf-8') as handle:
            handle.write('{"schema":"one","schema":"two"}')
        _expect('E_SCHEMA', lambda: load_design(netlist_path, manifest),
                'duplicate-json-key')

        model_path = os.path.join(directory, 'models.json')

        def model_case(label, mutate):
            value = copy.deepcopy(models)
            mutate(value)
            _dump(model_path, value)
            _expect('E_MODEL_SCHEMA',
                    lambda: load_model_manifest(model_path, verify_hashes=False),
                    label)

        model_case('model-unknown-key',
                   lambda value: value.__setitem__('surprise', 1))
        first_name = next(iter(models['models']))
        model_case('model-missing-port',
                   lambda value: value['models'][first_name]['ports'].pop('power'))
        model_case('model-entry-unknown-key',
                   lambda value: value['models'][first_name].__setitem__('extra', 1))

        def wrong_ff_order(value):
            value['models']['dfxtp']['ports']['inputs'] = ['CLK', 'D']
        model_case('model-ff-input-order', wrong_ff_order)

        def unknown_primitive(value):
            for entry in value['models'].values():
                if entry['kind'] == 'comb':
                    entry['gates'][0][0] = 'mystery'
                    return
        model_case('model-unknown-primitive', unknown_primitive)

        with open(model_path, 'w', encoding='utf-8') as handle:
            handle.write('{"schema":"one","schema":"two"}')
        _expect('E_MODEL_SCHEMA',
                lambda: load_model_manifest(model_path, verify_hashes=False),
                'model-duplicate-json-key')

    print('contracts: 19 malformed schema/connectivity fixtures rejected')
    print('ALL STRICT CONTRACT TESTS PASS')
    return 0


if __name__ == '__main__':
    sys.exit(main())
