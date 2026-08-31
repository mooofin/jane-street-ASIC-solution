module {
  func.func @step(%input_A: i1, %input_B: i1, %input_clk: i1, %input_en: i1, %input_rst_n: i1, %state_141: i1, %state_142: i1, %state_146: i1, %state_180: i1, %state_181: i1, %state_182: i1, %state_348: i1, %state_368: i1, %state_385: i1, %state_386: i1, %state_387: i1, %state_388: i1, %state_433: i1, %state_453: i1, %state_541: i1, %state_554: i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    "silicon.meta"() {clock_edge = "posedge", clock_port = "clk", input_args = "input_A|input_B|input_clk|input_en|input_rst_n", input_names = "A|B|clk|en|rst_n", layer = "silicon", model_sha256 = "6dad839547f2de43963b7d21e9e91ea8870f5d870650376a242e5bbd135229ef", module = "warmup", observation = "pre_edge", output_names = "S", output_values = "i659_3", profile = "IND-1", source_sha256 = "89883609e2e53c2dbd23fd4809c8091289d43727cb44d9556d8799aaa987c111", state_args = "state_141|state_142|state_146|state_180|state_181|state_182|state_348|state_368|state_385|state_386|state_387|state_388|state_433|state_453|state_541|state_554", state_ids = "141|142|146|180|181|182|348|368|385|386|387|388|433|453|541|554"} : () -> ()
    %const_7128 = "silicon.const"() {net = 7128, value = 1} : () -> i1
    %const_7133 = "silicon.const"() {net = 7133, value = 0} : () -> i1
    %i137_0 = "silicon.mux"(%input_en, %state_180, %state_146) {inst = 137, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i138_0 = "silicon.mux"(%input_en, %state_146, %state_142) {inst = 138, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i139_0 = "silicon.mux"(%input_en, %state_141, %state_182) {inst = 139, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i140_0 = "silicon.mux"(%input_en, %input_A, %state_181) {inst = 140, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i210_0 = "silicon.mux"(%input_en, %state_142, %state_141) {inst = 210, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i234_0 = "silicon.mux"(%input_en, %state_368, %state_180) {inst = 234, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i274_0 = "silicon.mux"(%input_en, %state_182, %state_348) {inst = 274, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i339_0 = "silicon.mux"(%input_en, %state_181, %state_368) {inst = 339, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i369_0 = "silicon.mux"(%input_en, %state_433, %state_388) {inst = 369, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i378_0 = "silicon.mux"(%input_en, %state_541, %state_433) {inst = 378, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i379_0 = "silicon.mux"(%input_en, %input_B, %state_541) {inst = 379, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i404_0 = "silicon.mux"(%input_en, %state_385, %state_387) {inst = 404, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i418_0 = "silicon.mux"(%input_en, %state_386, %state_554) {inst = 418, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i426_0 = "silicon.mux"(%input_en, %state_453, %state_385) {inst = 426, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i596_0 = "silicon.mux"(%input_en, %state_554, %state_453) {inst = 596, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i603_0 = "silicon.mux"(%input_en, %state_388, %state_386) {inst = 603, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i616_0 = "silicon.or"(%state_387, %state_348) {inst = 616, source_primitive = "nor"} : (i1, i1) -> i1
    %i616_1 = "silicon.not"(%i616_0) {inst = 616, source_primitive = "nor"} : (i1) -> i1
    %i617_0 = "silicon.or"(%state_386, %state_146) {inst = 617, source_primitive = "nor"} : (i1, i1) -> i1
    %i617_1 = "silicon.not"(%i617_0) {inst = 617, source_primitive = "nor"} : (i1) -> i1
    %i618_0 = "silicon.or"(%state_453, %state_141) {inst = 618, source_primitive = "nor"} : (i1, i1) -> i1
    %i618_1 = "silicon.not"(%i618_0) {inst = 618, source_primitive = "nor"} : (i1) -> i1
    %i630_0 = "silicon.and"(%state_387, %state_348) {inst = 630, source_primitive = "and"} : (i1, i1) -> i1
    %i631_0 = "silicon.xor"(%state_368, %state_433) {inst = 631, source_primitive = "xor"} : (i1, i1) -> i1
    %i636_0 = "silicon.or"(%state_182, %state_385) {inst = 636, source_primitive = "or"} : (i1, i1) -> i1
    %i639_0 = "silicon.and"(%state_453, %state_141) {inst = 639, source_primitive = "and"} : (i1, i1) -> i1
    %i685_0 = "silicon.or"(%state_180, %state_388) {inst = 685, source_primitive = "or"} : (i1, i1) -> i1
    %i711_0 = "silicon.and"(%state_386, %state_146) {inst = 711, source_primitive = "and"} : (i1, i1) -> i1
    %i761_0 = "silicon.or"(%i618_1, %i639_0) {inst = 761, source_primitive = "nor"} : (i1, i1) -> i1
    %i761_1 = "silicon.not"(%i761_0) {inst = 761, source_primitive = "nor"} : (i1) -> i1
    %i765_0 = "silicon.or"(%i617_1, %i711_0) {inst = 765, source_primitive = "nor"} : (i1, i1) -> i1
    %i765_1 = "silicon.not"(%i765_0) {inst = 765, source_primitive = "nor"} : (i1) -> i1
    %i841_0 = "silicon.or"(%state_141, %state_453) {inst = 841, source_primitive = "or"} : (i1, i1) -> i1
    %i844_0 = "silicon.or"(%state_554, %state_142) {inst = 844, source_primitive = "nor"} : (i1, i1) -> i1
    %i844_1 = "silicon.not"(%i844_0) {inst = 844, source_primitive = "nor"} : (i1) -> i1
    %i864_0 = "silicon.and"(%state_433, %state_368) {inst = 864, source_primitive = "and"} : (i1, i1) -> i1
    %i866_0 = "silicon.and"(%i841_0, %state_554) {inst = 866, source_primitive = "and"} : (i1, i1) -> i1
    %i866_1 = "silicon.and"(%i866_0, %state_142) {inst = 866, source_primitive = "and"} : (i1, i1) -> i1
    %i866_2 = "silicon.or"(%i866_1, %i639_0) {inst = 866, source_primitive = "or"} : (i1, i1) -> i1
    %i895_0 = "silicon.or"(%state_146, %state_386) {inst = 895, source_primitive = "or"} : (i1, i1) -> i1
    %i976_0 = "silicon.and"(%state_182, %state_385) {inst = 976, source_primitive = "nand"} : (i1, i1) -> i1
    %i976_1 = "silicon.not"(%i976_0) {inst = 976, source_primitive = "nand"} : (i1) -> i1
    %i978_0 = "silicon.and"(%state_180, %state_388) {inst = 978, source_primitive = "nand"} : (i1, i1) -> i1
    %i978_1 = "silicon.not"(%i978_0) {inst = 978, source_primitive = "nand"} : (i1) -> i1
    %i989_0 = "silicon.or"(%i630_0, %i616_1) {inst = 989, source_primitive = "nor"} : (i1, i1) -> i1
    %i989_1 = "silicon.not"(%i989_0) {inst = 989, source_primitive = "nor"} : (i1) -> i1
    %i1002_0 = "silicon.and"(%state_181, %state_541) {inst = 1002, source_primitive = "nand"} : (i1, i1) -> i1
    %i1002_1 = "silicon.not"(%i1002_0) {inst = 1002, source_primitive = "nand"} : (i1) -> i1
    %i1011_0 = "silicon.and"(%i685_0, %i978_1) {inst = 1011, source_primitive = "and"} : (i1, i1) -> i1
    %i1048_0 = "silicon.and"(%i631_0, %state_541) {inst = 1048, source_primitive = "and"} : (i1, i1) -> i1
    %i1048_1 = "silicon.and"(%i1048_0, %state_181) {inst = 1048, source_primitive = "and"} : (i1, i1) -> i1
    %i1048_2 = "silicon.or"(%i1048_1, %i864_0) {inst = 1048, source_primitive = "or"} : (i1, i1) -> i1
    %i1052_0 = "silicon.xor"(%i1002_1, %i631_0) {inst = 1052, source_primitive = "xnor"} : (i1, i1) -> i1
    %i1052_1 = "silicon.not"(%i1052_0) {inst = 1052, source_primitive = "xnor"} : (i1) -> i1
    %i1069_0 = "silicon.or"(%state_181, %state_541) {inst = 1069, source_primitive = "or"} : (i1, i1) -> i1
    %i1070_0 = "silicon.and"(%state_554, %state_142) {inst = 1070, source_primitive = "and"} : (i1, i1) -> i1
    %i613_0 = "silicon.and"(%i895_0, %state_388) {inst = 613, source_primitive = "and"} : (i1, i1) -> i1
    %i613_1 = "silicon.and"(%i613_0, %state_180) {inst = 613, source_primitive = "and"} : (i1, i1) -> i1
    %i613_2 = "silicon.or"(%i613_1, %i711_0) {inst = 613, source_primitive = "or"} : (i1, i1) -> i1
    %i619_0 = "silicon.or"(%i1070_0, %i844_1) {inst = 619, source_primitive = "nor"} : (i1, i1) -> i1
    %i619_1 = "silicon.not"(%i619_0) {inst = 619, source_primitive = "nor"} : (i1) -> i1
    %i629_0 = "silicon.and"(%i1002_1, %i1069_0) {inst = 629, source_primitive = "and"} : (i1, i1) -> i1
    %i634_0 = "silicon.xor"(%i1011_0, %i1048_2) {inst = 634, source_primitive = "xor"} : (i1, i1) -> i1
    %i707_0 = "silicon.and"(%i1011_0, %i1048_2) {inst = 707, source_primitive = "nand"} : (i1, i1) -> i1
    %i707_1 = "silicon.not"(%i707_0) {inst = 707, source_primitive = "nand"} : (i1) -> i1
    %i707_2 = "silicon.and"(%i978_1, %i707_1) {inst = 707, source_primitive = "nand"} : (i1, i1) -> i1
    %i707_3 = "silicon.not"(%i707_2) {inst = 707, source_primitive = "nand"} : (i1) -> i1
    %i852_0 = "silicon.and"(%i636_0, %i976_1) {inst = 852, source_primitive = "nand"} : (i1, i1) -> i1
    %i852_1 = "silicon.not"(%i852_0) {inst = 852, source_primitive = "nand"} : (i1) -> i1
    %i917_0 = "silicon.and"(%i765_1, %i1048_2) {inst = 917, source_primitive = "and"} : (i1, i1) -> i1
    %i917_1 = "silicon.and"(%i917_0, %i1011_0) {inst = 917, source_primitive = "and"} : (i1, i1) -> i1
    %i917_2 = "silicon.or"(%i917_1, %i613_2) {inst = 917, source_primitive = "or"} : (i1, i1) -> i1
    %i972_0 = "silicon.xor"(%i707_3, %i765_1) {inst = 972, source_primitive = "xor"} : (i1, i1) -> i1
    %i633_0 = "silicon.xor"(%i917_2, %i619_1) {inst = 633, source_primitive = "xor"} : (i1, i1) -> i1
    %i635_0 = "silicon.and"(%i761_1, %i619_1) {inst = 635, source_primitive = "and"} : (i1, i1) -> i1
    %i635_1 = "silicon.and"(%i635_0, %i917_2) {inst = 635, source_primitive = "and"} : (i1, i1) -> i1
    %i635_2 = "silicon.or"(%i635_1, %i866_2) {inst = 635, source_primitive = "or"} : (i1, i1) -> i1
    %i781_0 = "silicon.and"(%i619_1, %i917_2) {inst = 781, source_primitive = "and"} : (i1, i1) -> i1
    %i781_1 = "silicon.or"(%i781_0, %i1070_0) {inst = 781, source_primitive = "or"} : (i1, i1) -> i1
    %i900_0 = "silicon.xor"(%i852_1, %i635_2) {inst = 900, source_primitive = "xnor"} : (i1, i1) -> i1
    %i900_1 = "silicon.not"(%i900_0) {inst = 900, source_primitive = "xnor"} : (i1) -> i1
    %i622_0 = "silicon.not"(%i976_1) {inst = 622, source_primitive = "not"} : (i1) -> i1
    %i622_1 = "silicon.and"(%i636_0, %i635_2) {inst = 622, source_primitive = "and"} : (i1, i1) -> i1
    %i622_2 = "silicon.or"(%i622_0, %i622_1) {inst = 622, source_primitive = "nor"} : (i1, i1) -> i1
    %i622_3 = "silicon.not"(%i622_2) {inst = 622, source_primitive = "nor"} : (i1) -> i1
    %i623_0 = "silicon.not"(%i630_0) {inst = 623, source_primitive = "not"} : (i1) -> i1
    %i623_1 = "silicon.or"(%i622_3, %i616_1) {inst = 623, source_primitive = "or"} : (i1, i1) -> i1
    %i623_2 = "silicon.and"(%i623_0, %i623_1) {inst = 623, source_primitive = "nand"} : (i1, i1) -> i1
    %i623_3 = "silicon.not"(%i623_2) {inst = 623, source_primitive = "nand"} : (i1) -> i1
    %i632_0 = "silicon.xor"(%i781_1, %i761_1) {inst = 632, source_primitive = "xor"} : (i1, i1) -> i1
    %i975_0 = "silicon.xor"(%i989_1, %i622_3) {inst = 975, source_primitive = "xnor"} : (i1, i1) -> i1
    %i975_1 = "silicon.not"(%i975_0) {inst = 975, source_primitive = "xnor"} : (i1) -> i1
    %i6_0 = "silicon.or"(%i972_0, %i634_0) {inst = 6, source_primitive = "nor"} : (i1, i1) -> i1
    %i6_1 = "silicon.not"(%i6_0) {inst = 6, source_primitive = "nor"} : (i1) -> i1
    %i6_2 = "silicon.and"(%i6_1, %i633_0) {inst = 6, source_primitive = "and"} : (i1, i1) -> i1
    %i6_3 = "silicon.and"(%i6_2, %i632_0) {inst = 6, source_primitive = "and"} : (i1, i1) -> i1
    %i108_0 = "silicon.and"(%i623_3, %i900_1) {inst = 108, source_primitive = "and"} : (i1, i1) -> i1
    %i108_1 = "silicon.and"(%i108_0, %i975_1) {inst = 108, source_primitive = "and"} : (i1, i1) -> i1
    %i659_0 = "silicon.or"(%i1052_1, %i629_0) {inst = 659, source_primitive = "nor"} : (i1, i1) -> i1
    %i659_1 = "silicon.not"(%i659_0) {inst = 659, source_primitive = "nor"} : (i1) -> i1
    %i659_2 = "silicon.and"(%i659_1, %i108_1) {inst = 659, source_primitive = "and"} : (i1, i1) -> i1
    %i659_3 = "silicon.and"(%i659_2, %i6_3) {inst = 659, source_primitive = "and"} : (i1, i1) -> i1
    %next_141 = "silicon.dff"(%i210_0, %input_clk, %input_rst_n, %state_141) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 141, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_142 = "silicon.dff"(%i138_0, %input_clk, %input_rst_n, %state_142) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 142, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_146 = "silicon.dff"(%i137_0, %input_clk, %input_rst_n, %state_146) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 146, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_180 = "silicon.dff"(%i234_0, %input_clk, %input_rst_n, %state_180) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 180, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_181 = "silicon.dff"(%i140_0, %input_clk, %input_rst_n, %state_181) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 181, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_182 = "silicon.dff"(%i139_0, %input_clk, %input_rst_n, %state_182) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 182, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_348 = "silicon.dff"(%i274_0, %input_clk, %input_rst_n, %state_348) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 348, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_368 = "silicon.dff"(%i339_0, %input_clk, %input_rst_n, %state_368) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 368, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_385 = "silicon.dff"(%i426_0, %input_clk, %input_rst_n, %state_385) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 385, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_386 = "silicon.dff"(%i603_0, %input_clk, %input_rst_n, %state_386) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 386, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_387 = "silicon.dff"(%i404_0, %input_clk, %input_rst_n, %state_387) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 387, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_388 = "silicon.dff"(%i369_0, %input_clk, %input_rst_n, %state_388) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 388, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_433 = "silicon.dff"(%i378_0, %input_clk, %input_rst_n, %state_433) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 433, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_453 = "silicon.dff"(%i596_0, %input_clk, %input_rst_n, %state_453) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 453, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_541 = "silicon.dff"(%i379_0, %input_clk, %input_rst_n, %state_541) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 541, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_554 = "silicon.dff"(%i418_0, %input_clk, %input_rst_n, %state_554) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 554, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    return %next_141, %next_142, %next_146, %next_180, %next_181, %next_182, %next_348, %next_368, %next_385, %next_386, %next_387, %next_388, %next_433, %next_453, %next_541, %next_554, %i659_3 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}
