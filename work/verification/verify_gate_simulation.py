"""Official SKY130 whole-design oracle for the strict `IND-1` pipeline."""

import argparse
import hashlib
import json
import os
import random
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

_REPO = Path(__file__).resolve().parents[2]
if str(_REPO) not in sys.path:
    sys.path.insert(0, str(_REPO))

from lift.design import (DesignError, base_name, load_design,
                         load_model_manifest, sanitize)
from lift.eval_sky130 import Sky130Interpreter
from work.pipeline.compile_ir import compile_netlist


IVERILOG = os.environ.get('IVERILOG', r'C:\iverilog\bin\iverilog.exe')
VVP = os.environ.get('VVP', r'C:\iverilog\bin\vvp.exe')
MODELS_ROOT = _REPO / 'refs' / 'sky130_models' / 'models'


def _tool(path, name):
    if not Path(path).is_file():
        raise DesignError('E_TOOL_MISSING', '%s executable is missing' % name,
                          path=path)
    return str(Path(path).resolve())


def _vnet(net):
    return 'n%d' % net


def _port(name):
    return 'p_%s' % sanitize(name)


def _sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def _stage_official_sources(directory, manifest, model_names):
    root = Path(directory) / 'official'
    staged_models = root / 'models'
    shutil.copytree(MODELS_ROOT, staged_models)
    staged = []
    consumed = {}
    for name in sorted(model_names):
        model = manifest.models[name]
        source = _REPO / model.source_path
        destination = root / 'cells' / name / source.name
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, destination)
        staged.append(str(destination))
        consumed[model.source_path] = _sha256(source)
    for source in sorted(MODELS_ROOT.rglob('*.v')):
        relative = source.relative_to(_REPO).as_posix()
        consumed[relative] = _sha256(source)
    license_path = _REPO / 'refs' / 'sky130_models' / 'LICENSE'
    consumed[license_path.relative_to(_REPO).as_posix()] = _sha256(license_path)
    return staged, consumed


def _emit_design_verilog(design, manifest, path):
    ports = [_port(name) for name, _net in design.inputs]
    ports.extend(('po_bus', 'q_bus'))
    lines = ['module dut(%s);' % ', '.join(ports)]
    for name, _net in design.inputs:
        lines.append('  input %s;' % _port(name))
    lines.append('  output [%d:0] po_bus;' % (len(design.outputs) - 1))
    lines.append('  output [%d:0] q_bus;' % (len(design.state_order) - 1))

    nets = set(net for _name, net in design.inputs + design.outputs)
    for cell in design.cells:
        nets.update(cell.connection_map.values())
    nets.update(net for net, _value in design.constants)
    for net in sorted(nets):
        lines.append('  wire %s;' % _vnet(net))
    for name, net in design.inputs:
        lines.append('  assign %s = %s;' % (_vnet(net), _port(name)))
    for net, value in design.constants:
        lines.append("  assign %s = 1'b%d;" % (_vnet(net), value))

    state_nets = {}
    for cell in design.cells:
        model = manifest.models[cell.model]
        connections = ', '.join(
            '.%s(%s)' % (pin, _vnet(cell.connection_map[pin]))
            for pin in model.pins)
        lines.append('  sky130_fd_sc_hd__%s cell_%d (%s);' %
                     (model.name, cell.id, connections))
        if model.kind == 'ff':
            state_nets[cell.id] = cell.connection_map[model.outputs[0]]
    for index, (_name, net) in enumerate(design.outputs):
        lines.append('  assign po_bus[%d] = %s;' % (index, _vnet(net)))
    for index, cell_id in enumerate(design.state_order):
        lines.append('  assign q_bus[%d] = %s;' %
                     (index, _vnet(state_nets[cell_id])))
    lines.append('endmodule')
    Path(path).write_text('\n'.join(lines) + '\n', encoding='ascii')
    return state_nets


def _emit_testbench(design, state_nets, path, frames):
    data_inputs = [(name, net) for name, net in design.inputs
                   if name != design.clock_port]
    data_width = len(data_inputs)
    state_width = len(design.state_order)
    total_width = data_width + state_width
    lines = [
        '`timescale 1ps/1ps',
        'module tb;',
        '  reg clk;',
        '  reg [%d:0] data_bits;' % (data_width - 1),
        '  reg [%d:0] forced_state;' % (state_width - 1),
        '  reg [%d:0] samples [0:%d];' % (total_width - 1, frames - 1),
        '  wire [%d:0] po_bus;' % (len(design.outputs) - 1),
        '  wire [%d:0] q_bus;' % (state_width - 1),
    ]
    connections = []
    data_index = {name: index for index, (name, _net) in enumerate(data_inputs)}
    for name, _net in design.inputs:
        signal = 'clk' if name == design.clock_port else \
            'data_bits[%d]' % data_index[name]
        connections.append('.%s(%s)' % (_port(name), signal))
    connections.extend(('.po_bus(po_bus)', '.q_bus(q_bus)'))
    lines.append('  dut u_dut(%s);' % ', '.join(connections))
    lines.append('  task force_current_state; begin')
    for index, cell_id in enumerate(design.state_order):
        lines.append('    force u_dut.%s = forced_state[%d];' %
                     (_vnet(state_nets[cell_id]), index))
    lines.extend(('  end endtask', '  task release_current_state; begin'))
    for cell_id in design.state_order:
        lines.append('    release u_dut.%s;' % _vnet(state_nets[cell_id]))
    lines.extend([
        '  end endtask',
        '  integer frame;',
        '  reg [1023:0] stimulus_file;',
        '  initial begin',
        '    if (!$value$plusargs("STIM=%s", stimulus_file)) $fatal(1, "missing STIM");',
        '    $readmemb(stimulus_file, samples);',
        '    clk = 0;',
        '    for (frame = 0; frame < %d; frame = frame + 1) begin' % frames,
        '      data_bits = samples[frame][%d:0];' % (data_width - 1),
        '      forced_state = samples[frame][%d:%d];' %
        (total_width - 1, data_width),
        '      force_current_state();',
        '      #4999;',
        '      $display("PRE %0d %b", frame, po_bus);',
        '      #1 clk = 1;',
        '      #1 release_current_state();',
        '      #1 $display("POST %0d %b", frame, q_bus);',
        '      #4998 clk = 0;',
        '    end',
        '    $finish;',
        '  end',
        'endmodule',
    ])
    Path(path).write_text('\n'.join(lines) + '\n', encoding='ascii')
    return [name for name, _net in data_inputs]


def _parse_vector(text, width, subject):
    value = text.strip().lower().replace('_', '')
    if len(value) != width or any(bit not in '01xz' for bit in value):
        raise DesignError('E_ORACLE_INCOMPLETE', 'malformed Icarus vector',
                          subject=subject, value=value, width=width)
    return list(reversed(value))


def _parse_samples(stdout, frames, output_width, state_width):
    samples = {}
    for line in stdout.splitlines():
        match = re.fullmatch(r'(PRE|POST) ([0-9]+) ([01xXzZ_]+)', line.strip())
        if match is None:
            continue
        phase, frame_text, vector = match.groups()
        frame = int(frame_text)
        key = (phase, frame)
        if key in samples:
            raise DesignError('E_ORACLE_INCOMPLETE', 'duplicate Icarus sample',
                              phase=phase, frame=frame)
        width = output_width if phase == 'PRE' else state_width
        samples[key] = _parse_vector(vector, width, '%s:%d' % (phase, frame))
    expected = {(phase, frame) for phase in ('PRE', 'POST')
                for frame in range(frames)}
    if set(samples) != expected:
        missing = sorted(expected - set(samples))
        raise DesignError('E_ORACLE_INCOMPLETE', 'Icarus samples are incomplete',
                          missing=str(missing[:10]))
    return samples


def run_gate(netlist_path='work/netlist.json', models_path='models/cells.json',
             streams=4, frames=32, seed=42):
    iverilog = _tool(IVERILOG, 'iverilog')
    vvp = _tool(VVP, 'vvp')
    manifest = load_model_manifest(models_path)
    design = load_design(netlist_path, manifest)
    rng = random.Random(seed)

    with tempfile.TemporaryDirectory(prefix='ind1-icarus-') as directory:
        sky_path = os.path.join(directory, 'source.mlir')
        silicon_path = os.path.join(directory, 'target.mlir')
        _design, source_module, _target = compile_netlist(
            netlist_path, models_path, sky_path, silicon_path)
        interpreter = Sky130Interpreter(source_module, manifest)
        design_path = os.path.join(directory, 'design.v')
        testbench_path = os.path.join(directory, 'tb.v')
        executable_path = os.path.join(directory, 'oracle.vvp')
        state_nets = _emit_design_verilog(design, manifest, design_path)
        data_names = _emit_testbench(design, state_nets, testbench_path, frames)
        used_models = {cell.model for cell in design.cells}
        official_files, consumed = _stage_official_sources(
            directory, manifest, used_models)
        include_args = []
        for parent in sorted({str(Path(path).parent) for path in official_files}):
            include_args.extend(('-I', parent))
        command = ([iverilog, '-g2012', '-o', executable_path,
                    '-DUNIT_DELAY='] + include_args +
                   [testbench_path, design_path] + official_files)
        compiled = subprocess.run(command, cwd=directory, capture_output=True,
                                  text=True)
        if compiled.returncode != 0:
            raise DesignError('E_ORACLE_INCOMPLETE', 'Icarus compilation failed',
                              stderr=compiled.stderr[-4000:])

        checked = 0
        for stream in range(streams):
            vectors = []
            expected = []
            for _frame in range(frames):
                inputs = {name: rng.randrange(2) for name in data_names}
                state = {cell_id: rng.randrange(2)
                         for cell_id in design.state_order}
                outputs, next_state = interpreter.evaluate(inputs, state)
                bits = ([inputs[name] for name in data_names] +
                        [state[cell_id] for cell_id in design.state_order])
                vectors.append(''.join(str(bit) for bit in reversed(bits)))
                expected.append((outputs, next_state))
            stimulus_path = os.path.join(directory, 'stimulus_%d.mem' % stream)
            Path(stimulus_path).write_text('\n'.join(vectors) + '\n',
                                           encoding='ascii')
            executed = subprocess.run(
                [vvp, executable_path, '+STIM=%s' % stimulus_path],
                cwd=directory, capture_output=True, text=True)
            if executed.returncode != 0:
                raise DesignError('E_ORACLE_INCOMPLETE', 'Icarus execution failed',
                                  stream=stream, stderr=executed.stderr[-4000:])
            samples = _parse_samples(executed.stdout, frames,
                                     len(design.outputs), len(design.state_order))
            for frame in range(frames):
                outputs, next_state = expected[frame]
                expected_po = [str(outputs[name]) for name, _net in design.outputs]
                expected_q = [str(next_state[cell_id])
                              for cell_id in design.state_order]
                actual_po = samples[('PRE', frame)]
                actual_q = samples[('POST', frame)]
                if actual_po != expected_po or actual_q != expected_q:
                    raise DesignError(
                        'E_TRANSLATION_MISMATCH',
                        'official whole-design oracle mismatch', stream=stream,
                        frame=frame, expected_po=''.join(expected_po),
                        actual_po=''.join(actual_po),
                        expected_q=''.join(expected_q), actual_q=''.join(actual_q))
                checked += len(expected_po) + len(expected_q)

    normalized_command = [argument.replace(directory, '<temp>')
                          for argument in command]
    return {
        'command': normalized_command,
        'frames': frames,
        'samples': checked,
        'seed': seed,
        'source_hashes': consumed,
        'streams': streams,
        'result': 'pass',
    }


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--netlist', default='work/netlist.json')
    parser.add_argument('--models', default='models/cells.json')
    parser.add_argument('--streams', type=int, default=4)
    parser.add_argument('--frames', type=int, default=32)
    parser.add_argument('--seed', type=int, default=42)
    args = parser.parse_args(argv)
    report = run_gate(args.netlist, args.models, args.streams,
                      args.frames, args.seed)
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == '__main__':
    sys.exit(main())
