"""Exhaustive combinational and directed sequential official-model gates."""

import argparse
import json
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

_REPO = Path(__file__).resolve().parents[2]
if str(_REPO) not in sys.path:
    sys.path.insert(0, str(_REPO))

from lift.design import DesignError, load_model_manifest
from work.verification.verify_gate_simulation import (
    IVERILOG, VVP, _stage_official_sources, _tool)


def _signal(model, pin):
    return '%s_%s' % (model, pin.lower())


def _bus(model):
    return '%s_outputs' % model


def _emit_cell_testbench(manifest, path):
    lines = ['`timescale 1ps/1ps', 'module tb;']
    tested = [model for model in manifest.models.values()
              if model.kind in ('comb', 'const')]
    for model in tested:
        if model.inputs:
            lines.append('  reg [%d:0] %s_inputs;' %
                         (len(model.inputs) - 1, model.name))
        lines.append('  wire [%d:0] %s;' %
                     (len(model.outputs) - 1, _bus(model.name)))
        connections = []
        for index, pin in enumerate(model.inputs):
            connections.append('.%s(%s_inputs[%d])' %
                               (pin, model.name, index))
        for index, pin in enumerate(model.outputs):
            connections.append('.%s(%s[%d])' %
                               (pin, _bus(model.name), index))
        lines.append('  sky130_fd_sc_hd__%s u_%s(%s);' %
                     (model.name, model.name, ', '.join(connections)))

    lines.extend([
        '  reg four_a0, four_a1, four_s;',
        '  wire four_x;',
        '  sky130_fd_sc_hd__mux2 u_four(.A0(four_a0), .A1(four_a1), .S(four_s), .X(four_x));',
        '  reg x_d, x_clk;',
        '  wire x_q;',
        '  sky130_fd_sc_hd__dfxtp u_x(.D(x_d), .CLK(x_clk), .Q(x_q));',
        '  reg r_d, r_clk, r_reset_b;',
        '  wire r_q;',
        '  sky130_fd_sc_hd__dfrtp u_r(.D(r_d), .CLK(r_clk), .RESET_B(r_reset_b), .Q(r_q));',
        '  reg s_d, s_clk, s_set_b;',
        '  wire s_q;',
        '  sky130_fd_sc_hd__dfstp u_s(.D(s_d), .CLK(s_clk), .SET_B(s_set_b), .Q(s_q));',
        '  initial begin',
    ])
    for model in tested:
        width = len(model.inputs)
        if model.kind == 'const':
            lines.append('    #1 $display("CELL %s 0 %%b", %s);' %
                         (model.name, _bus(model.name)))
            continue
        for vector in range(1 << width):
            lines.append("    %s_inputs = %d'd%d; #1 "
                         "$display(\"CELL %s %d %%b\", %s);" %
                         (model.name, width, vector, model.name, vector,
                          _bus(model.name)))

    four_cases = [
        ('equal_zero_unknown_select', '0', '0', 'x', '0'),
        ('equal_one_unknown_select', '1', '1', 'x', '1'),
        ('different_unknown_select', '0', '1', 'x', 'x'),
        ('selected_zero_other_z', '0', 'z', '0', '0'),
        ('selected_one_other_z', 'z', '1', '1', '1'),
        ('selected_zero_from_a1', 'z', '0', '1', '0'),
        ('selected_one_from_a0', '1', 'z', '0', '1'),
        ('different_z_select', '0', '1', 'z', 'x'),
    ]
    for label, a0, a1, select, _expected in four_cases:
        lines.append("    four_a0 = 1'b%s; four_a1 = 1'b%s; four_s = 1'b%s; "
                     "#1 $display(\"FOUR %s %%b\", four_x);" %
                     (a0, a1, select, label))

    lines.extend([
        "    x_d = 1'b0; x_clk = 1'b0; #1 $display(\"FF x_initial %b\", x_q);",
        "    x_d = 1'b1; #1 $display(\"FF x_data_hold %b\", x_q);",
        "    x_clk = 1'b1; #1 $display(\"FF x_rise_capture %b\", x_q);",
        "    x_d = 1'b0; #1 $display(\"FF x_high_hold %b\", x_q);",
        "    x_clk = 1'b0; #1 $display(\"FF x_fall_hold %b\", x_q);",
        "    x_d = 1'b1; x_clk = 1'bx; #1 $display(\"FF x_ambiguous_hold %b\", x_q);",
        "    x_clk = 1'b0; x_d = 1'b0; #1; x_clk = 1'bx; #1 $display(\"FF x_ambiguous_unknown %b\", x_q);",
        "    x_clk = 1'b0; #1; x_clk = 1'b1; #1 $display(\"FF x_recover_capture %b\", x_q);",
        "    r_d = 1'b1; r_clk = 1'b0; r_reset_b = 1'b1; #1 $display(\"FF r_initial %b\", r_q);",
        "    r_reset_b = 1'b0; #1 $display(\"FF r_assert %b\", r_q);",
        "    r_reset_b = 1'b1; #1 $display(\"FF r_release_hold %b\", r_q);",
        "    r_clk = 1'b1; #1 $display(\"FF r_capture %b\", r_q);",
        "    r_clk = 1'b0; r_reset_b = 1'bx; #1 $display(\"FF r_unknown_control %b\", r_q);",
        "    r_reset_b = 1'b0; #1 $display(\"FF r_recover_reset %b\", r_q);",
        "    s_d = 1'b0; s_clk = 1'b0; s_set_b = 1'b1; #1 $display(\"FF s_initial %b\", s_q);",
        "    s_set_b = 1'b0; #1 $display(\"FF s_assert %b\", s_q);",
        "    s_set_b = 1'b1; #1 $display(\"FF s_release_hold %b\", s_q);",
        "    s_clk = 1'b1; #1 $display(\"FF s_capture %b\", s_q);",
        "    s_clk = 1'b0; s_set_b = 1'bx; #1 $display(\"FF s_unknown_control %b\", s_q);",
        "    s_set_b = 1'b0; #1 $display(\"FF s_recover_set %b\", s_q);",
        '    $finish;',
        '  end',
        'endmodule',
    ])
    Path(path).write_text('\n'.join(lines) + '\n', encoding='ascii')
    return tested, {case[0]: case[4] for case in four_cases}


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
    raise AssertionError(name)


def _evaluate(model, vector):
    if model.kind == 'const':
        return [str(model.value_map[pin]) for pin in model.outputs]
    wires = {pin: (vector >> index) & 1
             for index, pin in enumerate(model.inputs)}
    for gate in model.gates:
        wires[gate.output] = _primitive(
            gate.primitive, [wires[name] for name in gate.inputs])
    return [str(wires[pin]) for pin in model.outputs]


def run_cell_gate(models_path='models/cells.json'):
    iverilog = _tool(IVERILOG, 'iverilog')
    vvp = _tool(VVP, 'vvp')
    manifest = load_model_manifest(models_path)
    with tempfile.TemporaryDirectory(prefix='ind1-cells-') as directory:
        testbench_path = os.path.join(directory, 'cells_tb.v')
        executable_path = os.path.join(directory, 'cells.vvp')
        tested, four_expected = _emit_cell_testbench(manifest, testbench_path)
        official_files, consumed = _stage_official_sources(
            directory, manifest, set(manifest.models))
        includes = []
        for parent in sorted({str(Path(path).parent) for path in official_files}):
            includes.extend(('-I', parent))
        command = ([iverilog, '-g2012', '-o', executable_path,
                    '-DUNIT_DELAY='] + includes +
                   [testbench_path] + official_files)
        compiled = subprocess.run(command, cwd=directory, capture_output=True,
                                  text=True)
        if compiled.returncode != 0:
            raise DesignError('E_ORACLE_INCOMPLETE', 'cell oracle compilation failed',
                              stderr=compiled.stderr[-4000:])
        executed = subprocess.run([vvp, executable_path], cwd=directory,
                                  capture_output=True, text=True)
        if executed.returncode != 0:
            raise DesignError('E_ORACLE_INCOMPLETE', 'cell oracle execution failed',
                              stderr=executed.stderr[-4000:])

    cell_samples = {}
    four_samples = {}
    ff_samples = {}
    for line in executed.stdout.splitlines():
        match = re.fullmatch(r'CELL (\w+) ([0-9]+) ([01xXzZ]+)', line.strip())
        if match:
            name, vector, output = match.groups()
            key = (name, int(vector))
            if key in cell_samples:
                raise DesignError('E_ORACLE_INCOMPLETE', 'duplicate cell sample',
                                  cell=name, vector=vector)
            cell_samples[key] = list(reversed(output.lower()))
            continue
        match = re.fullmatch(r'FOUR (\w+) ([01xXzZ])', line.strip())
        if match:
            four_samples[match.group(1)] = match.group(2).lower()
            continue
        match = re.fullmatch(r'FF (\w+) ([01xXzZ])', line.strip())
        if match:
            ff_samples[match.group(1)] = match.group(2).lower()

    binary_checks = 0
    expected_keys = set()
    for model in tested:
        vectors = [0] if model.kind == 'const' else range(1 << len(model.inputs))
        for vector in vectors:
            key = (model.name, vector)
            expected_keys.add(key)
            actual = cell_samples.get(key)
            expected = _evaluate(model, vector)
            if actual != expected:
                raise DesignError('E_TRANSLATION_MISMATCH',
                                  'official cell truth-table mismatch',
                                  cell=model.name, vector=vector,
                                  expected=''.join(expected),
                                  actual=''.join(actual or []))
            binary_checks += len(expected)
    if set(cell_samples) != expected_keys:
        raise DesignError('E_ORACLE_INCOMPLETE', 'cell samples are incomplete')
    if four_samples != four_expected:
        raise DesignError('E_TRANSLATION_MISMATCH',
                          'four-state mux samples differ',
                          expected=str(four_expected), actual=str(four_samples))

    ff_expected = {
        'x_initial': 'x', 'x_data_hold': 'x', 'x_rise_capture': '1',
        'x_high_hold': '1', 'x_fall_hold': '1', 'x_ambiguous_hold': '1',
        'x_ambiguous_unknown': 'x', 'x_recover_capture': '0',
        'r_initial': 'x', 'r_assert': '0', 'r_release_hold': '0',
        'r_capture': '1', 'r_unknown_control': 'x', 'r_recover_reset': '0',
        's_initial': 'x', 's_assert': '1', 's_release_hold': '1',
        's_capture': '0', 's_unknown_control': 'x', 's_recover_set': '1',
    }
    if ff_samples != ff_expected:
        raise DesignError('E_TRANSLATION_MISMATCH', 'FF directed samples differ',
                          expected=str(ff_expected), actual=str(ff_samples))
    normalized_command = [argument.replace(directory, '<temp>')
                          for argument in command]
    return {
        'binary_bits_checked': binary_checks,
        'cells_checked': len(tested),
        'command': normalized_command,
        'ff_samples': len(ff_samples),
        'four_state_samples': len(four_samples),
        'result': 'pass',
        'source_hashes': consumed,
    }


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--models', default='models/cells.json')
    args = parser.parse_args(argv)
    print(json.dumps(run_cell_gate(args.models), sort_keys=True))
    return 0


if __name__ == '__main__':
    sys.exit(main())
