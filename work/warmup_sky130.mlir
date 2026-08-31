module {
  func.func @step(%input_A: i1, %input_B: i1, %input_clk: i1, %input_en: i1, %input_rst_n: i1, %state_141: i1, %state_142: i1, %state_146: i1, %state_180: i1, %state_181: i1, %state_182: i1, %state_348: i1, %state_368: i1, %state_385: i1, %state_386: i1, %state_387: i1, %state_388: i1, %state_433: i1, %state_453: i1, %state_541: i1, %state_554: i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    "sky130.meta"() {clock_edge = "posedge", clock_port = "clk", input_args = "input_A|input_B|input_clk|input_en|input_rst_n", input_names = "A|B|clk|en|rst_n", layer = "sky130", model_sha256 = "6dad839547f2de43963b7d21e9e91ea8870f5d870650376a242e5bbd135229ef", module = "warmup", observation = "pre_edge", output_names = "S", output_values = "net_7756", profile = "IND-1", source_sha256 = "89883609e2e53c2dbd23fd4809c8091289d43727cb44d9556d8799aaa987c111", state_args = "state_141|state_142|state_146|state_180|state_181|state_182|state_348|state_368|state_385|state_386|state_387|state_388|state_433|state_453|state_541|state_554", state_ids = "141|142|146|180|181|182|348|368|385|386|387|388|433|453|541|554"} : () -> ()
    %const_7128 = "sky130.const"() {net = 7128, value = 1} : () -> i1
    %const_7133 = "sky130.const"() {net = 7133, value = 0} : () -> i1
    %net_7555 = "sky130.cell"(%input_clk) {input_pins = "A", inst = 5, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_16"} : (i1) -> i1
    %net_7560 = "sky130.cell"(%net_7555) {input_pins = "A", inst = 136, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_16"} : (i1) -> i1
    %net_7591 = "sky130.cell"(%state_146, %state_180, %input_en) {input_pins = "A0|A1|S", inst = 137, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7592 = "sky130.cell"(%state_142, %state_146, %input_en) {input_pins = "A0|A1|S", inst = 138, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7594 = "sky130.cell"(%state_182, %state_141, %input_en) {input_pins = "A0|A1|S", inst = 139, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7253 = "sky130.cell"(%state_181, %input_A, %input_en) {input_pins = "A0|A1|S", inst = 140, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7593 = "sky130.cell"(%state_141, %state_142, %input_en) {input_pins = "A0|A1|S", inst = 210, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7590 = "sky130.cell"(%state_180, %state_368, %input_en) {input_pins = "A0|A1|S", inst = 234, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7596 = "sky130.cell"(%state_348, %state_182, %input_en) {input_pins = "A0|A1|S", inst = 274, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7589 = "sky130.cell"(%state_368, %state_181, %input_en) {input_pins = "A0|A1|S", inst = 339, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7329 = "sky130.cell"(%state_388, %state_433, %input_en) {input_pins = "A0|A1|S", inst = 369, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7327 = "sky130.cell"(%state_433, %state_541, %input_en) {input_pins = "A0|A1|S", inst = 378, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7326 = "sky130.cell"(%state_541, %input_B, %input_en) {input_pins = "A0|A1|S", inst = 379, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7646 = "sky130.cell"(%state_387, %state_385, %input_en) {input_pins = "A0|A1|S", inst = 404, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7643 = "sky130.cell"(%state_554, %state_386, %input_en) {input_pins = "A0|A1|S", inst = 418, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7645 = "sky130.cell"(%state_385, %state_453, %input_en) {input_pins = "A0|A1|S", inst = 426, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7618 = "sky130.cell"(%net_7555) {input_pins = "A", inst = 443, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_16"} : (i1) -> i1
    %net_7644 = "sky130.cell"(%state_453, %state_554, %input_en) {input_pins = "A0|A1|S", inst = 596, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7642 = "sky130.cell"(%state_386, %state_388, %input_en) {input_pins = "A0|A1|S", inst = 603, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_7713 = "sky130.cell"(%state_387, %state_348) {input_pins = "A|B", inst = 616, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_7679 = "sky130.cell"(%state_386, %state_146) {input_pins = "A|B", inst = 617, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_7701 = "sky130.cell"(%state_453, %state_141) {input_pins = "A|B", inst = 618, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_7712 = "sky130.cell"(%state_387, %state_348) {input_pins = "A|B", inst = 630, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_7669 = "sky130.cell"(%state_433, %state_368) {input_pins = "A|B", inst = 631, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_7707 = "sky130.cell"(%state_385, %state_182) {input_pins = "A|B", inst = 636, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_7703 = "sky130.cell"(%state_453, %state_141) {input_pins = "A|B", inst = 639, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_7673 = "sky130.cell"(%state_388, %state_180) {input_pins = "A|B", inst = 685, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_7682 = "sky130.cell"(%state_386, %state_146) {input_pins = "A|B", inst = 711, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_7705 = "sky130.cell"(%net_7701, %net_7703) {input_pins = "A|B", inst = 761, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_7683 = "sky130.cell"(%net_7679, %net_7682) {input_pins = "A|B", inst = 765, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_7702 = "sky130.cell"(%state_453, %state_141) {input_pins = "A|B", inst = 841, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_7691 = "sky130.cell"(%state_554, %state_142) {input_pins = "A|B", inst = 844, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_7668 = "sky130.cell"(%state_433, %state_368) {input_pins = "A|B", inst = 864, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_7709 = "sky130.cell"(%state_554, %state_142, %net_7702, %net_7703) {input_pins = "A1|A2|A3|B1", inst = 866, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_7121 = "sky130.cell"(%state_386, %state_146) {input_pins = "A|B", inst = 895, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_7706 = "sky130.cell"(%state_385, %state_182) {input_pins = "A|B", inst = 976, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_7674 = "sky130.cell"(%state_388, %state_180) {input_pins = "A|B", inst = 978, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_7714 = "sky130.cell"(%net_7712, %net_7713) {input_pins = "A|B", inst = 989, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_7665 = "sky130.cell"(%state_541, %state_181) {input_pins = "A|B", inst = 1002, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_7677 = "sky130.cell"(%net_7673, %net_7674) {input_pins = "A|B", inst = 1011, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_7672 = "sky130.cell"(%state_541, %state_181, %net_7669, %net_7668) {input_pins = "A1|A2|A3|B1", inst = 1048, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_7739 = "sky130.cell"(%net_7665, %net_7669) {input_pins = "A|B", inst = 1052, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_7717 = "sky130.cell"(%state_541, %state_181) {input_pins = "A|B", inst = 1069, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_7689 = "sky130.cell"(%state_554, %state_142) {input_pins = "A|B", inst = 1070, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_7122 = "sky130.cell"(%state_388, %state_180, %net_7121, %net_7682) {input_pins = "A1|A2|A3|B1", inst = 613, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_7692 = "sky130.cell"(%net_7689, %net_7691) {input_pins = "A|B", inst = 619, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_7531 = "sky130.cell"(%net_7665, %net_7717) {input_pins = "A|B", inst = 629, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_7532 = "sky130.cell"(%net_7672, %net_7677) {input_pins = "A|B", inst = 634, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_7688 = "sky130.cell"(%net_7672, %net_7677, %net_7674) {input_pins = "A1|A2|B1_N", inst = 707, model = "a21bo", output_pins = "X", source_cell = "a21bo_2"} : (i1, i1, i1) -> i1
    %net_7708 = "sky130.cell"(%net_7706, %net_7707) {input_pins = "A|B", inst = 852, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_7123 = "sky130.cell"(%net_7672, %net_7677, %net_7683, %net_7122) {input_pins = "A1|A2|A3|B1", inst = 917, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_7533 = "sky130.cell"(%net_7683, %net_7688) {input_pins = "A|B", inst = 972, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_7743 = "sky130.cell"(%net_7692, %net_7123) {input_pins = "A|B", inst = 633, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_7711 = "sky130.cell"(%net_7692, %net_7123, %net_7705, %net_7709) {input_pins = "A1|A2|A3|B1", inst = 635, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_7401 = "sky130.cell"(%net_7692, %net_7123, %net_7689) {input_pins = "A1|A2|B1", inst = 781, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_7536 = "sky130.cell"(%net_7708, %net_7711) {input_pins = "A|B", inst = 900, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_7716 = "sky130.cell"(%net_7707, %net_7711, %net_7706) {input_pins = "A1|A2|B1_N", inst = 622, model = "a21boi", output_pins = "Y", source_cell = "a21boi_2"} : (i1, i1, i1) -> i1
    %net_7538 = "sky130.cell"(%net_7713, %net_7716, %net_7712) {input_pins = "A1|A2|B1_N", inst = 623, model = "o21bai", output_pins = "Y", source_cell = "o21bai_2"} : (i1, i1, i1) -> i1
    %net_7535 = "sky130.cell"(%net_7705, %net_7401) {input_pins = "A|B", inst = 632, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_7537 = "sky130.cell"(%net_7714, %net_7716) {input_pins = "A|B", inst = 975, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_7540 = "sky130.cell"(%net_7533, %net_7532, %net_7743, %net_7535) {input_pins = "A_N|B_N|C|D", inst = 6, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_7539 = "sky130.cell"(%net_7536, %net_7537, %net_7538) {input_pins = "A|B|C", inst = 108, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_7756 = "sky130.cell"(%net_7739, %net_7531, %net_7539, %net_7540) {input_pins = "A_N|B_N|C|D", inst = 659, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %next_141 = "sky130.cell"(%net_7593, %net_7560, %input_rst_n, %state_141) {input_pins = "D|CLK|RESET_B", inst = 141, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_142 = "sky130.cell"(%net_7592, %net_7560, %input_rst_n, %state_142) {input_pins = "D|CLK|RESET_B", inst = 142, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_146 = "sky130.cell"(%net_7591, %net_7560, %input_rst_n, %state_146) {input_pins = "D|CLK|RESET_B", inst = 146, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_180 = "sky130.cell"(%net_7590, %net_7560, %input_rst_n, %state_180) {input_pins = "D|CLK|RESET_B", inst = 180, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_181 = "sky130.cell"(%net_7253, %net_7560, %input_rst_n, %state_181) {input_pins = "D|CLK|RESET_B", inst = 181, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_182 = "sky130.cell"(%net_7594, %net_7560, %input_rst_n, %state_182) {input_pins = "D|CLK|RESET_B", inst = 182, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_348 = "sky130.cell"(%net_7596, %net_7560, %input_rst_n, %state_348) {input_pins = "D|CLK|RESET_B", inst = 348, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_368 = "sky130.cell"(%net_7589, %net_7560, %input_rst_n, %state_368) {input_pins = "D|CLK|RESET_B", inst = 368, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_385 = "sky130.cell"(%net_7645, %net_7618, %input_rst_n, %state_385) {input_pins = "D|CLK|RESET_B", inst = 385, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_386 = "sky130.cell"(%net_7642, %net_7618, %input_rst_n, %state_386) {input_pins = "D|CLK|RESET_B", inst = 386, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_387 = "sky130.cell"(%net_7646, %net_7618, %input_rst_n, %state_387) {input_pins = "D|CLK|RESET_B", inst = 387, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_388 = "sky130.cell"(%net_7329, %net_7618, %input_rst_n, %state_388) {input_pins = "D|CLK|RESET_B", inst = 388, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_433 = "sky130.cell"(%net_7327, %net_7618, %input_rst_n, %state_433) {input_pins = "D|CLK|RESET_B", inst = 433, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_453 = "sky130.cell"(%net_7644, %net_7618, %input_rst_n, %state_453) {input_pins = "D|CLK|RESET_B", inst = 453, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_541 = "sky130.cell"(%net_7326, %net_7618, %input_rst_n, %state_541) {input_pins = "D|CLK|RESET_B", inst = 541, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_554 = "sky130.cell"(%net_7643, %net_7618, %input_rst_n, %state_554) {input_pins = "D|CLK|RESET_B", inst = 554, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    return %next_141, %next_142, %next_146, %next_180, %next_181, %next_182, %next_348, %next_368, %next_385, %next_386, %next_387, %next_388, %next_433, %next_453, %next_541, %next_554, %net_7756 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}
