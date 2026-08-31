module {
  func.func @step(%input_I: i1, %input_clk: i1, %input_enable: i1, %input_rst_n: i1, %input_undriven_61217: i1, %state_226: i1, %state_227: i1, %state_228: i1, %state_234: i1, %state_235: i1, %state_236: i1, %state_237: i1, %state_1228: i1, %state_1229: i1, %state_1230: i1, %state_1249: i1, %state_1250: i1, %state_1258: i1, %state_1259: i1, %state_1260: i1, %state_1261: i1, %state_1264: i1, %state_1383: i1, %state_1384: i1, %state_1385: i1, %state_1626: i1, %state_1808: i1, %state_1809: i1, %state_1810: i1, %state_2036: i1, %state_2037: i1, %state_2039: i1, %state_2293: i1, %state_2299: i1, %state_2301: i1, %state_2372: i1, %state_2542: i1, %state_2574: i1, %state_2708: i1, %state_2709: i1, %state_2710: i1, %state_2944: i1, %state_2946: i1, %state_2947: i1, %state_2948: i1, %state_2957: i1, %state_2958: i1, %state_2959: i1, %state_2960: i1, %state_4182: i1, %state_4659: i1, %state_4661: i1, %state_4662: i1, %state_4838: i1, %state_4993: i1, %state_5000: i1, %state_5004: i1, %state_5093: i1, %state_5336: i1, %state_5337: i1, %state_5339: i1, %state_5342: i1, %state_5343: i1, %state_5344: i1, %state_5399: i1, %state_5401: i1, %state_5569: i1, %state_5634: i1, %state_5638: i1, %state_5639: i1, %state_6095: i1, %state_6106: i1, %state_6109: i1, %state_6111: i1, %state_6159: i1, %state_6197: i1, %state_6198: i1, %state_6199: i1, %state_6435: i1, %state_6436: i1, %state_6442: i1, %state_6451: i1, %state_8084: i1, %state_8085: i1, %state_8086: i1, %state_8090: i1, %state_8091: i1, %state_8092: i1, %state_8095: i1, %state_8199: i1, %state_8214: i1, %state_8219: i1, %state_8429: i1, %state_8431: i1, %state_8591: i1, %state_8602: i1, %state_8815: i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    "sky130.meta"() {clock_edge = "posedge", clock_port = "clk", input_args = "input_I|input_clk|input_enable|input_rst_n|input_undriven_61217", input_names = "I|clk|enable|rst_n|undriven_61217", layer = "sky130", model_sha256 = "6dad839547f2de43963b7d21e9e91ea8870f5d870650376a242e5bbd135229ef", module = "puzzle", observation = "pre_edge", output_names = "success|O[0]|O[1]|O[2]|O[3]|O[4]|O[5]|O[6]|O[7]", output_values = "state_228|net_62057|net_58926|net_62059|net_59372|net_59371|net_62062|net_62063|net_62064", profile = "IND-1", source_sha256 = "350e998acd33575df3b8872870fef15813975e6d9b05e30744ab750cce524401", state_args = "state_226|state_227|state_228|state_234|state_235|state_236|state_237|state_1228|state_1229|state_1230|state_1249|state_1250|state_1258|state_1259|state_1260|state_1261|state_1264|state_1383|state_1384|state_1385|state_1626|state_1808|state_1809|state_1810|state_2036|state_2037|state_2039|state_2293|state_2299|state_2301|state_2372|state_2542|state_2574|state_2708|state_2709|state_2710|state_2944|state_2946|state_2947|state_2948|state_2957|state_2958|state_2959|state_2960|state_4182|state_4659|state_4661|state_4662|state_4838|state_4993|state_5000|state_5004|state_5093|state_5336|state_5337|state_5339|state_5342|state_5343|state_5344|state_5399|state_5401|state_5569|state_5634|state_5638|state_5639|state_6095|state_6106|state_6109|state_6111|state_6159|state_6197|state_6198|state_6199|state_6435|state_6436|state_6442|state_6451|state_8084|state_8085|state_8086|state_8090|state_8091|state_8092|state_8095|state_8199|state_8214|state_8219|state_8429|state_8431|state_8591|state_8602|state_8815", state_ids = "226|227|228|234|235|236|237|1228|1229|1230|1249|1250|1258|1259|1260|1261|1264|1383|1384|1385|1626|1808|1809|1810|2036|2037|2039|2293|2299|2301|2372|2542|2574|2708|2709|2710|2944|2946|2947|2948|2957|2958|2959|2960|4182|4659|4661|4662|4838|4993|5000|5004|5093|5336|5337|5339|5342|5343|5344|5399|5401|5569|5634|5638|5639|6095|6106|6109|6111|6159|6197|6198|6199|6435|6436|6442|6451|8084|8085|8086|8090|8091|8092|8095|8199|8214|8219|8429|8431|8591|8602|8815"} : () -> ()
    %net_22981, %net_59709 = "sky130.cell"() {input_pins = "", inst = 3857, model = "conb", output_pins = "HI|LO", source_cell = "conb_1"} : () -> (i1, i1)
    %net_23231, %net_58945 = "sky130.cell"() {input_pins = "", inst = 3931, model = "conb", output_pins = "HI|LO", source_cell = "conb_1"} : () -> (i1, i1)
    %net_23666, %net_58766 = "sky130.cell"() {input_pins = "", inst = 4022, model = "conb", output_pins = "HI|LO", source_cell = "conb_1"} : () -> (i1, i1)
    %net_60777, %net_33532 = "sky130.cell"() {input_pins = "", inst = 5765, model = "conb", output_pins = "HI|LO", source_cell = "conb_1"} : () -> (i1, i1)
    %net_42096, %net_58940 = "sky130.cell"() {input_pins = "", inst = 7240, model = "conb", output_pins = "HI|LO", source_cell = "conb_1"} : () -> (i1, i1)
    %net_42364, %net_58764 = "sky130.cell"() {input_pins = "", inst = 7290, model = "conb", output_pins = "HI|LO", source_cell = "conb_1"} : () -> (i1, i1)
    %net_58938 = "sky130.cell"(%state_235, %state_236, %state_234, %state_237) {input_pins = "A1|A2|B1|C1", inst = 67, model = "a211oi", output_pins = "Y", source_cell = "a211oi_2"} : (i1, i1, i1, i1) -> i1
    %net_59904 = "sky130.cell"(%state_236, %state_235) {input_pins = "A|B", inst = 202, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60384 = "sky130.cell"(%state_2946, %state_2944) {input_pins = "A|B", inst = 240, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_59779 = "sky130.cell"(%state_237, %state_234, %state_236, %state_235) {input_pins = "A|B|C|D", inst = 353, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_59871 = "sky130.cell"(%state_228) {input_pins = "A", inst = 385, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_59787 = "sky130.cell"(%state_4182, %state_226) {input_pins = "A|B", inst = 395, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_59789 = "sky130.cell"(%state_226, %state_4182) {input_pins = "A_N|B", inst = 406, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_59873 = "sky130.cell"(%state_234, %state_236, %state_235) {input_pins = "A|B|C", inst = 494, model = "nand3", output_pins = "Y", source_cell = "nand3_2"} : (i1, i1, i1) -> i1
    %net_59744 = "sky130.cell"(%state_236, %state_235, %state_234) {input_pins = "A1|A2|B1", inst = 500, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_59869 = "sky130.cell"(%state_237, %net_59873, %net_59744, %state_226) {input_pins = "A1|A2|B1|C1", inst = 608, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_4683 = "sky130.cell"(%state_237) {input_pins = "A", inst = 624, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60032 = "sky130.cell"(%state_4662, %state_4661, %state_4659, %state_4838) {input_pins = "A_N|B_N|C|D", inst = 1246, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_58845 = "sky130.cell"(%state_4661, %state_4659, %state_4662, %state_4838) {input_pins = "A_N|B|C|D", inst = 1248, model = "and4b", output_pins = "X", source_cell = "and4b_2"} : (i1, i1, i1, i1) -> i1
    %net_59142 = "sky130.cell"(%state_1259, %state_1383) {input_pins = "A_N|B", inst = 1262, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_59976 = "sky130.cell"(%state_4662, %state_4659, %state_4661, %state_4838) {input_pins = "A_N|B_N|C|D", inst = 1323, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_58846 = "sky130.cell"(%state_4838, %state_4659, %state_4661, %state_4662) {input_pins = "A_N|B_N|C|D", inst = 1370, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_60631 = "sky130.cell"(%state_1258, %state_1626) {input_pins = "A_N|B", inst = 1376, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_59998 = "sky130.cell"(%state_1261) {input_pins = "A", inst = 1425, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60004 = "sky130.cell"(%state_4838, %state_4662, %state_4659, %state_4661) {input_pins = "A|B|C|D_N", inst = 1451, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_59141 = "sky130.cell"(%state_1384, %net_59998) {input_pins = "A|B", inst = 1560, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_60744 = "sky130.cell"(%state_1260, %state_1385) {input_pins = "A_N|B", inst = 1591, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_60630 = "sky130.cell"(%state_1230, %state_1810) {input_pins = "A_N|B", inst = 1630, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_60179 = "sky130.cell"(%state_4662, %state_4661, %state_4659, %state_4838) {input_pins = "A|B|C|D_N", inst = 1770, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_60629 = "sky130.cell"(%state_1228, %state_1808) {input_pins = "A_N|B", inst = 1775, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_60118 = "sky130.cell"(%state_4661, %state_4659, %state_4662, %state_4838) {input_pins = "A_N|B_N|C|D", inst = 1788, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_60142 = "sky130.cell"(%state_4838, %state_4662, %state_4661, %state_4659) {input_pins = "A|B|C|D_N", inst = 1803, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_60048 = "sky130.cell"(%state_4838, %state_4661, %state_4659, %state_4662) {input_pins = "A_N|B_N|C|D", inst = 1807, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_60131 = "sky130.cell"(%state_1809) {input_pins = "A", inst = 1968, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60177 = "sky130.cell"(%state_2037) {input_pins = "A", inst = 2012, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_59639 = "sky130.cell"(%state_1250) {input_pins = "A", inst = 2013, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60738 = "sky130.cell"(%state_1264, %state_2036) {input_pins = "A_N|B", inst = 2107, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_59377 = "sky130.cell"(%input_clk) {input_pins = "A", inst = 2358, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_16"} : (i1) -> i1
    %net_60742 = "sky130.cell"(%state_2293, %state_2372) {input_pins = "A_N|B", inst = 2364, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_60167 = "sky130.cell"(%state_4838, %state_4662, %state_4661, %state_4659) {input_pins = "A|B|C|D", inst = 2365, model = "nor4", output_pins = "Y", source_cell = "nor4_2"} : (i1, i1, i1, i1) -> i1
    %net_60235 = "sky130.cell"(%state_4838, %state_4661, %state_4659, %state_4662) {input_pins = "A|B|C|D_N", inst = 2396, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_60712 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 2507, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_60966 = "sky130.cell"(%state_2542, %state_2299) {input_pins = "A_N|B", inst = 2555, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_59674 = "sky130.cell"(%state_2574, %state_2301) {input_pins = "A_N|B", inst = 2571, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61248 = "sky130.cell"(%state_2708) {input_pins = "A", inst = 2711, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60753 = "sky130.cell"(%state_2709, %state_8091) {input_pins = "A_N|B", inst = 2843, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_59669 = "sky130.cell"(%state_235) {input_pins = "A", inst = 2928, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_61126 = "sky130.cell"(%state_236, %state_234, %state_237) {input_pins = "A1|A2|B1", inst = 2935, model = "o21ai", output_pins = "Y", source_cell = "o21ai_2"} : (i1, i1, i1) -> i1
    %net_61108 = "sky130.cell"(%state_237) {input_pins = "A", inst = 2937, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_61125 = "sky130.cell"(%state_235, %state_236) {input_pins = "A_N|B", inst = 2938, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_18179 = "sky130.cell"(%state_235, %state_236, %state_234) {input_pins = "A|B|C", inst = 2950, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_59673 = "sky130.cell"(%state_235, %state_234, %state_236) {input_pins = "A|B|C_N", inst = 2953, model = "nor3b", output_pins = "Y", source_cell = "nor3b_2"} : (i1, i1, i1) -> i1
    %net_60295 = "sky130.cell"(%state_2946, %state_2960) {input_pins = "A|B", inst = 2967, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_60616 = "sky130.cell"(%state_2959, %net_60384) {input_pins = "A|B", inst = 3012, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60343 = "sky130.cell"(%state_2959, %state_2948) {input_pins = "A|B", inst = 3167, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_60490 = "sky130.cell"(%state_2957, %state_2958) {input_pins = "A|B", inst = 3282, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60443 = "sky130.cell"(%net_60490, %net_60384) {input_pins = "A|B", inst = 3283, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60557 = "sky130.cell"(%state_235, %state_234, %state_236) {input_pins = "A|B|C_N", inst = 3287, model = "or3b", output_pins = "X", source_cell = "or3b_2"} : (i1, i1, i1) -> i1
    %net_60584 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 3288, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_58972 = "sky130.cell"(%state_2948, %state_2946) {input_pins = "A|B", inst = 3289, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60290 = "sky130.cell"(%state_2958, %state_2960) {input_pins = "A|B", inst = 3295, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60340 = "sky130.cell"(%state_2957, %state_2944) {input_pins = "A|B", inst = 3296, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_60466 = "sky130.cell"(%state_236, %state_235) {input_pins = "A_N|B", inst = 3478, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_60452 = "sky130.cell"(%state_235, %state_236) {input_pins = "A_N|B", inst = 3484, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_58976 = "sky130.cell"(%state_235, %state_236) {input_pins = "A|B", inst = 3531, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_58977 = "sky130.cell"(%state_234, %state_237) {input_pins = "A|B", inst = 3533, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60309 = "sky130.cell"(%state_236, %state_237) {input_pins = "A|B", inst = 3576, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_22079 = "sky130.cell"(%net_60584) {input_pins = "A", inst = 3639, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_58975 = "sky130.cell"(%state_237) {input_pins = "A", inst = 3669, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60499 = "sky130.cell"(%state_235, %net_58975) {input_pins = "A|B", inst = 3685, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_58978 = "sky130.cell"(%state_235, %state_236) {input_pins = "A|B", inst = 3701, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60315 = "sky130.cell"(%state_234, %net_60499, %net_60452, %net_60309) {input_pins = "A1|A2|A3|B1", inst = 3703, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_60353 = "sky130.cell"(%state_236, %state_234) {input_pins = "A|B", inst = 3715, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_60551 = "sky130.cell"(%net_58976, %net_58978) {input_pins = "A_N|B", inst = 3816, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_59672 = "sky130.cell"(%state_236, %state_235) {input_pins = "A_N|B", inst = 3852, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_60524 = "sky130.cell"(%state_235, %state_236) {input_pins = "A|B", inst = 3873, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60576 = "sky130.cell"(%state_235, %state_236, %state_234) {input_pins = "A|B|C", inst = 3900, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_17578 = "sky130.cell"(%state_235, %state_237, %state_234) {input_pins = "A1|A2|B1", inst = 3978, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_61110 = "sky130.cell"(%state_236, %state_237, %state_234) {input_pins = "A0|A1|S", inst = 3980, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_59651 = "sky130.cell"(%state_237, %state_234, %state_236) {input_pins = "A_N|B|C", inst = 4002, model = "and3b", output_pins = "X", source_cell = "and3b_2"} : (i1, i1, i1) -> i1
    %net_61119 = "sky130.cell"(%state_236, %state_235) {input_pins = "A_N|B", inst = 4023, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61111 = "sky130.cell"(%state_234, %state_237) {input_pins = "A|B", inst = 4052, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_59670 = "sky130.cell"(%state_234, %state_236) {input_pins = "A_N|B", inst = 4070, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61123 = "sky130.cell"(%state_235, %net_61111) {input_pins = "A|B", inst = 4127, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_59213 = "sky130.cell"(%state_4662, %state_4659, %state_4661, %state_4838) {input_pins = "A_N|B_N|C|D", inst = 4705, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_58922 = "sky130.cell"(%state_4182, %input_enable) {input_pins = "A_N|B", inst = 4722, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_60664 = "sky130.cell"(%state_4662, %net_58922, %state_4838) {input_pins = "A1|A2|B1", inst = 4837, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_60663 = "sky130.cell"(%state_4662, %net_58922) {input_pins = "A|B", inst = 4859, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60668 = "sky130.cell"(%state_4838, %state_4662, %state_4659, %net_58922, %state_4661) {input_pins = "A1|A2|A3|A4|B1", inst = 4863, model = "a41oi", output_pins = "Y", source_cell = "a41oi_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_59643 = "sky130.cell"(%state_4838, %state_4662, %state_4659, %net_58922) {input_pins = "A|B|C|D", inst = 4949, model = "and4", output_pins = "X", source_cell = "and4_2"} : (i1, i1, i1, i1) -> i1
    %net_60709 = "sky130.cell"(%state_5093, %state_5401, %net_58922) {input_pins = "A0|A1|S", inst = 5007, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60708 = "sky130.cell"(%state_5401, %state_5000, %net_58922) {input_pins = "A0|A1|S", inst = 5008, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60710 = "sky130.cell"(%state_5399, %state_5093, %net_58922) {input_pins = "A0|A1|S", inst = 5011, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60711 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 5012, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_59597 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 5178, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_59628 = "sky130.cell"(%state_5342, %state_5004, %net_58922) {input_pins = "A0|A1|S", inst = 5205, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60741 = "sky130.cell"(%net_59142, %net_59141, %net_60744) {input_pins = "A|B|C", inst = 5230, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_60816 = "sky130.cell"(%state_4993, %state_5342, %net_58922) {input_pins = "A0|A1|S", inst = 5263, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60817 = "sky130.cell"(%state_5569, %state_4993, %net_58922) {input_pins = "A0|A1|S", inst = 5265, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_30286 = "sky130.cell"(%net_59597) {input_pins = "A", inst = 5290, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60707 = "sky130.cell"(%state_5000, %input_I, %net_58922) {input_pins = "A0|A1|S", inst = 5340, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60818 = "sky130.cell"(%state_5339, %state_5344, %net_58922) {input_pins = "A0|A1|S", inst = 5347, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_31405 = "sky130.cell"(%state_5336, %state_5339, %net_58922) {input_pins = "A0|A1|S", inst = 5400, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_31556 = "sky130.cell"(%state_5344, %state_5343, %net_58922) {input_pins = "A0|A1|S", inst = 5403, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_59627 = "sky130.cell"(%state_5004, %state_5399, %net_58922) {input_pins = "A0|A1|S", inst = 5433, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_58725 = "sky130.cell"(%state_5337) {input_pins = "A", inst = 5532, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_31922 = "sky130.cell"(%state_5343, %state_5569, %net_58922) {input_pins = "A0|A1|S", inst = 5537, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60965 = "sky130.cell"(%state_6111, %state_6095, %state_6159) {input_pins = "A|B|C", inst = 5612, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_60968 = "sky130.cell"(%state_6197, %state_6199, %net_60965) {input_pins = "A|B|C", inst = 5616, model = "nor3", output_pins = "Y", source_cell = "nor3_2"} : (i1, i1, i1) -> i1
    %net_61038 = "sky130.cell"(%state_6198, %state_6197) {input_pins = "A|B", inst = 5628, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60892 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 5629, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_60834 = "sky130.cell"(%net_59213) {input_pins = "A", inst = 5630, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60838 = "sky130.cell"(%state_5634) {input_pins = "A", inst = 5636, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60923 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 5637, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_61273 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 5673, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_59636 = "sky130.cell"(%state_4662, %state_4659, %state_4661, %state_4838) {input_pins = "A|B|C_N|D_N", inst = 5680, model = "or4bb", output_pins = "X", source_cell = "or4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_60774 = "sky130.cell"(%state_4662, %state_4838, %state_4659, %state_4661) {input_pins = "A|B|C|D", inst = 5681, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_60843 = "sky130.cell"(%state_5639, %input_I) {input_pins = "A|B", inst = 5684, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_33372 = "sky130.cell"(%net_61273) {input_pins = "A", inst = 5702, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60839 = "sky130.cell"(%state_5639, %input_I) {input_pins = "A|B", inst = 5711, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60835 = "sky130.cell"(%net_58922) {input_pins = "A", inst = 5775, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60846 = "sky130.cell"(%net_59213, %net_60838, %net_60835) {input_pins = "A0|A1|S", inst = 5778, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_59635 = "sky130.cell"(%net_60774) {input_pins = "A", inst = 5789, model = "buf", output_pins = "X", source_cell = "buf_2"} : (i1) -> i1
    %net_33797 = "sky130.cell"(%net_60923) {input_pins = "A", inst = 5830, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_59616 = "sky130.cell"(%state_5638) {input_pins = "A", inst = 5836, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_33995 = "sky130.cell"(%net_60892) {input_pins = "A", inst = 5882, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60971 = "sky130.cell"(%state_6198, %state_6197) {input_pins = "A|B", inst = 6032, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_60961 = "sky130.cell"(%state_6109, %state_6111) {input_pins = "A_N|B", inst = 6094, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_58726 = "sky130.cell"(%state_6109, %state_6106, %state_6198, %net_60968) {input_pins = "A|B|C|D_N", inst = 6107, model = "nor4b", output_pins = "Y", source_cell = "nor4b_2"} : (i1, i1, i1, i1) -> i1
    %net_60980 = "sky130.cell"(%input_I, %net_58922, %state_6111) {input_pins = "A1|A2|B1", inst = 6160, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_60944 = "sky130.cell"(%state_6111, %input_I, %net_58922) {input_pins = "A|B|C", inst = 6166, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_60969 = "sky130.cell"(%state_6106, %state_6159, %state_6199, %state_6095) {input_pins = "A_N|B_N|C|D", inst = 6194, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_62078 = "sky130.cell"(%state_6109, %state_6106, %state_6198, %net_60968) {input_pins = "A|B|C|D", inst = 6298, model = "and4", output_pins = "X", source_cell = "and4_2"} : (i1, i1, i1, i1) -> i1
    %net_60985 = "sky130.cell"(%state_6109, %state_6106, %state_6095) {input_pins = "A|B|C", inst = 6350, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_60933 = "sky130.cell"(%state_6109, %net_60944, %state_6106) {input_pins = "A1|A2|B1", inst = 6356, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_60906 = "sky130.cell"(%net_59213, %net_58922, %state_6442, %state_6451) {input_pins = "A1|A2|A3|B1", inst = 6403, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60908 = "sky130.cell"(%net_59213, %net_58922, %state_6451, %state_6442) {input_pins = "A|B|C|D", inst = 6404, model = "and4", output_pins = "X", source_cell = "and4_2"} : (i1, i1, i1, i1) -> i1
    %net_60905 = "sky130.cell"(%net_59213, %net_58922) {input_pins = "A|B", inst = 6445, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60902 = "sky130.cell"(%state_6436, %state_6435, %state_6451) {input_pins = "A_N|B|C", inst = 6472, model = "nand3b", output_pins = "Y", source_cell = "nand3b_2"} : (i1, i1, i1) -> i1
    %net_60910 = "sky130.cell"(%state_6436, %state_6435, %net_60908) {input_pins = "A|B|C", inst = 6473, model = "nand3", output_pins = "Y", source_cell = "nand3_2"} : (i1, i1, i1) -> i1
    %net_60911 = "sky130.cell"(%state_6436, %net_60908, %state_6435) {input_pins = "A1|A2|B1", inst = 6474, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_60909 = "sky130.cell"(%net_60908) {input_pins = "A", inst = 6478, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60900 = "sky130.cell"(%state_6436, %net_60908) {input_pins = "A|B", inst = 6481, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_59210 = "sky130.cell"(%state_6442, %net_60902) {input_pins = "A|B", inst = 6609, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61729 = "sky130.cell"(%state_6442, %state_6436) {input_pins = "A|B", inst = 6950, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_61739 = "sky130.cell"(%state_6435, %net_61729) {input_pins = "A|B", inst = 6953, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61754 = "sky130.cell"(%state_6442, %state_6436) {input_pins = "A|B", inst = 6956, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61528 = "sky130.cell"(%state_6451, %net_61739) {input_pins = "A|B", inst = 6957, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61165 = "sky130.cell"(%state_235, %state_234) {input_pins = "A_N|B", inst = 6969, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_42126 = "sky130.cell"(%state_234, %state_237) {input_pins = "A|B", inst = 6970, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61205 = "sky130.cell"(%state_236, %state_237) {input_pins = "A|B", inst = 6971, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61077 = "sky130.cell"(%state_237, %state_234, %state_236, %state_235) {input_pins = "A_N|B|C|D", inst = 6973, model = "and4b", output_pins = "X", source_cell = "and4b_2"} : (i1, i1, i1, i1) -> i1
    %net_61172 = "sky130.cell"(%state_236, %state_234) {input_pins = "A_N|B", inst = 6975, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61079 = "sky130.cell"(%state_235, %state_236, %state_234, %state_237) {input_pins = "A|B|C|D_N", inst = 6990, model = "nor4b", output_pins = "Y", source_cell = "nor4b_2"} : (i1, i1, i1, i1) -> i1
    %net_61170 = "sky130.cell"(%state_234, %state_237) {input_pins = "A_N|B", inst = 6995, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61076 = "sky130.cell"(%state_235, %state_236, %state_237) {input_pins = "A1|A2|B1", inst = 7057, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_61210 = "sky130.cell"(%state_237, %state_234) {input_pins = "A_N|B", inst = 7104, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61215 = "sky130.cell"(%state_235, %state_236, %state_237) {input_pins = "A1|A2|B1", inst = 7153, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_61155 = "sky130.cell"(%state_235, %state_236) {input_pins = "A|B", inst = 7169, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_59662 = "sky130.cell"(%state_234, %state_237, %state_235, %state_236) {input_pins = "A_N|B_N|C|D", inst = 7216, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_59647 = "sky130.cell"(%state_237, %net_61155) {input_pins = "A|B", inst = 7230, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59658 = "sky130.cell"(%state_235, %net_61205, %net_61079) {input_pins = "A1|A2|B1", inst = 7237, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_61191 = "sky130.cell"(%state_235, %state_236, %state_234) {input_pins = "A|B|C", inst = 7238, model = "nor3", output_pins = "Y", source_cell = "nor3_2"} : (i1, i1, i1) -> i1
    %net_59342 = "sky130.cell"(%net_61155, %net_42126) {input_pins = "A|B", inst = 7252, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_59659 = "sky130.cell"(%state_235, %state_234, %net_61205, %net_61191) {input_pins = "A1|A2|A3|B1", inst = 7259, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_61218 = "sky130.cell"(%state_234, %state_235) {input_pins = "A_N|B", inst = 7287, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61176 = "sky130.cell"(%state_234, %state_235) {input_pins = "A_N|B", inst = 7301, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_42487 = "sky130.cell"(%state_236, %net_61165) {input_pins = "A|B", inst = 7311, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_61154 = "sky130.cell"(%state_235, %state_236) {input_pins = "A|B", inst = 7317, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_61208 = "sky130.cell"(%state_235, %state_236) {input_pins = "A|B", inst = 7335, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59511 = "sky130.cell"(%state_6451, %state_6436) {input_pins = "A|B", inst = 7465, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61717 = "sky130.cell"(%state_6451, %state_6435, %state_6436) {input_pins = "A1|A2|B1", inst = 7548, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_43889 = "sky130.cell"(%state_6451, %state_6435) {input_pins = "A|B", inst = 7566, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_61519 = "sky130.cell"(%state_6435, %net_61729) {input_pins = "A|B", inst = 7567, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_61613 = "sky130.cell"(%net_59511, %net_61519) {input_pins = "A_N|B", inst = 7656, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61349 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 8089, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_61066 = "sky130.cell"(%state_8092) {input_pins = "A", inst = 8106, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_46882 = "sky130.cell"(%net_61349) {input_pins = "A", inst = 8166, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_61398 = "sky130.cell"(%input_I, %net_58922) {input_pins = "A|B", inst = 8191, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60750 = "sky130.cell"(%state_8431, %net_61066) {input_pins = "A|B", inst = 8197, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_60987 = "sky130.cell"(%state_8219, %state_8086) {input_pins = "A_N|B", inst = 8218, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61395 = "sky130.cell"(%state_8199) {input_pins = "A", inst = 8290, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60751 = "sky130.cell"(%state_8214, %state_8090) {input_pins = "A_N|B", inst = 8325, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61058 = "sky130.cell"(%state_8085, %net_61395) {input_pins = "A|B", inst = 8367, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_60921 = "sky130.cell"(%state_8095, %state_8429) {input_pins = "A_N|B", inst = 8408, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61329 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 8434, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_61409 = "sky130.cell"(%input_I, %net_58922) {input_pins = "A|B", inst = 8574, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61426 = "sky130.cell"(%input_I, %net_58922) {input_pins = "A|B", inst = 8576, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60920 = "sky130.cell"(%state_8815, %state_8084) {input_pins = "A_N|B", inst = 8590, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61406 = "sky130.cell"(%state_8602) {input_pins = "A", inst = 8660, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_61691 = "sky130.cell"(%state_6442, %state_6451, %state_6436, %state_6435) {input_pins = "A_N|B_N|C|D", inst = 8998, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_62094 = "sky130.cell"(%state_6442, %state_6451, %state_6436, %state_6435) {input_pins = "A1|A2|B1|C1", inst = 9343, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_61857 = "sky130.cell"(%state_6442, %state_6451) {input_pins = "A|B", inst = 9354, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_59536 = "sky130.cell"(%state_4838, %net_61857) {input_pins = "A|B", inst = 9356, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_61768 = "sky130.cell"(%state_4662, %state_6442) {input_pins = "A|B", inst = 9470, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_61770 = "sky130.cell"(%state_4662, %state_6442) {input_pins = "A|B", inst = 9608, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61687 = "sky130.cell"(%state_6442, %state_6451) {input_pins = "A|B", inst = 9622, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61614 = "sky130.cell"(%state_4662, %state_6442) {input_pins = "A|B", inst = 9636, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61635 = "sky130.cell"(%state_6451, %state_6436) {input_pins = "A|B", inst = 9637, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59541 = "sky130.cell"(%net_61768, %net_61614) {input_pins = "A|B", inst = 9730, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59510 = "sky130.cell"(%net_59536, %net_61770) {input_pins = "A|B", inst = 9818, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61420 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 52, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_59660 = "sky130.cell"(%state_236, %net_58938, %net_61079, %net_61077) {input_pins = "A1|A2|B1|C1", inst = 63, model = "a211o", output_pins = "X", source_cell = "a211o_2"} : (i1, i1, i1, i1) -> i1
    %net_58934 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 103, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_58933 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 159, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_60496 = "sky130.cell"(%state_235, %net_58977, %net_60466, %state_234) {input_pins = "A1|A2|B1|B2", inst = 174, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59847 = "sky130.cell"(%state_226, %net_59779) {input_pins = "A|B", inst = 198, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_59866 = "sky130.cell"(%state_235, %net_59779, %state_226) {input_pins = "A1|A2|B1_N", inst = 199, model = "a21boi", output_pins = "Y", source_cell = "a21boi_2"} : (i1, i1, i1) -> i1
    %net_59870 = "sky130.cell"(%net_4683, %net_59873, %state_226) {input_pins = "A1|A2|B1_N", inst = 215, model = "a21boi", output_pins = "Y", source_cell = "a21boi_2"} : (i1, i1, i1) -> i1
    %net_55247 = "sky130.cell"(%net_58725) {input_pins = "A", inst = 247, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_59740 = "sky130.cell"(%net_59779, %net_59904, %state_226) {input_pins = "A1|A2|B1_N", inst = 341, model = "a21boi", output_pins = "Y", source_cell = "a21boi_2"} : (i1, i1, i1) -> i1
    %net_59791 = "sky130.cell"(%net_59616, %net_62078) {input_pins = "A|B", inst = 460, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_59861 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 727, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_60463 = "sky130.cell"(%net_58922, %net_59847) {input_pins = "A_N|B", inst = 743, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_60325 = "sky130.cell"(%net_59847, %net_58922) {input_pins = "A|B", inst = 882, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_60138 = "sky130.cell"(%input_I, %net_58922) {input_pins = "A|B", inst = 1231, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60049 = "sky130.cell"(%input_I, %net_58922, %net_60048, %state_1228) {input_pins = "A1|A2|A3|B1", inst = 1232, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60053 = "sky130.cell"(%input_I, %net_58922, %net_60032, %state_1230) {input_pins = "A1|A2|A3|B1", inst = 1234, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60144 = "sky130.cell"(%state_1229, %net_60131, %net_60142, %net_60138) {input_pins = "A|B|C|D", inst = 1244, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_60180 = "sky130.cell"(%input_I, %net_58922) {input_pins = "A|B", inst = 1255, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_58847 = "sky130.cell"(%input_I, %net_58922, %net_58846, %state_1259) {input_pins = "A1|A2|A3|B1", inst = 1286, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_55521 = "sky130.cell"(%input_I, %net_58922, %net_59976, %state_1260) {input_pins = "A1|A2|A3|B1", inst = 1287, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_59930 = "sky130.cell"(%input_I, %net_58922) {input_pins = "A|B", inst = 1362, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60010 = "sky130.cell"(%state_1384, %net_59998, %net_60004, %net_59930) {input_pins = "A|B|C|D", inst = 1363, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_59983 = "sky130.cell"(%input_I, %net_58922, %state_1260, %net_59976) {input_pins = "A|B|C|D", inst = 1364, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_59970 = "sky130.cell"(%input_I, %net_58922, %state_1259, %net_58846) {input_pins = "A|B|C|D", inst = 1365, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_60011 = "sky130.cell"(%state_1383, %net_59970, %net_58847) {input_pins = "A1|A2|B1", inst = 1366, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_59931 = "sky130.cell"(%net_60004, %net_59930) {input_pins = "A|B", inst = 1377, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60019 = "sky130.cell"(%input_I, %net_58922, %state_1258, %net_58845) {input_pins = "A|B|C|D", inst = 1381, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_59994 = "sky130.cell"(%state_1261, %net_59931, %net_60010) {input_pins = "A1|A2|B1", inst = 1387, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_59962 = "sky130.cell"(%state_1383, %net_59970) {input_pins = "A_N|B", inst = 1569, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_59975 = "sky130.cell"(%state_1385, %net_59983) {input_pins = "A_N|B", inst = 1570, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_59974 = "sky130.cell"(%state_1385, %net_59983, %net_55521) {input_pins = "A1|A2|B1", inst = 1579, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_59972 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 1628, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_60017 = "sky130.cell"(%input_I, %net_58922, %net_58845, %state_1258) {input_pins = "A1|A2|A3|B1", inst = 1635, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_59916 = "sky130.cell"(%input_I, %net_58922, %state_1230, %net_60032) {input_pins = "A|B|C|D", inst = 1641, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_60025 = "sky130.cell"(%state_1626, %net_60019) {input_pins = "A_N|B", inst = 1675, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_10832 = "sky130.cell"(%net_59972) {input_pins = "A", inst = 1701, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60051 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 1736, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_60073 = "sky130.cell"(%input_I, %net_58922, %state_1228, %net_60048) {input_pins = "A|B|C|D", inst = 1772, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_60628 = "sky130.cell"(%state_1229, %net_60131) {input_pins = "A|B", inst = 1776, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_11333 = "sky130.cell"(%state_1808, %net_60073, %net_60049) {input_pins = "A1|A2|B1", inst = 1790, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_59680 = "sky130.cell"(%net_59377) {input_pins = "A", inst = 1793, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_8"} : (i1) -> i1
    %net_60743 = "sky130.cell"(%state_1249, %net_60177) {input_pins = "A|B", inst = 1794, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_60145 = "sky130.cell"(%net_60142, %net_60138) {input_pins = "A|B", inst = 1798, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60085 = "sky130.cell"(%state_1808, %net_60073) {input_pins = "A_N|B", inst = 1959, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_60745 = "sky130.cell"(%state_2039, %net_59639) {input_pins = "A|B", inst = 1982, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_12488 = "sky130.cell"(%net_59680) {input_pins = "A", inst = 2023, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60120 = "sky130.cell"(%input_I, %net_58922, %state_1264, %net_60118) {input_pins = "A|B|C|D", inst = 2034, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_60119 = "sky130.cell"(%input_I, %net_58922, %net_60118, %state_1264) {input_pins = "A1|A2|A3|B1", inst = 2049, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60182 = "sky130.cell"(%net_60179, %net_60180) {input_pins = "A|B", inst = 2143, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61252 = "sky130.cell"(%input_I, %net_58922) {input_pins = "A|B", inst = 2296, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_14153 = "sky130.cell"(%net_58933) {input_pins = "A", inst = 2327, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60194 = "sky130.cell"(%input_I, %net_58922, %net_60167, %state_2293) {input_pins = "A1|A2|A3|B1", inst = 2361, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60195 = "sky130.cell"(%input_I, %net_58922, %state_2293, %net_60167) {input_pins = "A|B|C|D", inst = 2369, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_60257 = "sky130.cell"(%input_I, %net_58922) {input_pins = "A|B", inst = 2370, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60232 = "sky130.cell"(%state_2372, %net_60195) {input_pins = "A_N|B", inst = 2437, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_15027 = "sky130.cell"(%net_60712) {input_pins = "A", inst = 2501, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_61031 = "sky130.cell"(%state_2710, %net_61248) {input_pins = "A|B", inst = 2561, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_60314 = "sky130.cell"(%state_237, %net_18179) {input_pins = "A|B", inst = 2925, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60267 = "sky130.cell"(%state_235, %net_59670, %state_237) {input_pins = "A1|A2|B1", inst = 2926, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_59668 = "sky130.cell"(%state_235, %net_61108, %net_59670) {input_pins = "A|B|C", inst = 2932, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_59666 = "sky130.cell"(%net_59669, %state_234, %net_61108, %state_236) {input_pins = "A1|A2|B1|C1", inst = 2933, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_58765 = "sky130.cell"(%net_61111, %net_61125) {input_pins = "A_N|B", inst = 2936, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_59373 = "sky130.cell"(%state_236, %net_61111, %net_61123, %net_61126) {input_pins = "A1|A2|B1|C1", inst = 2940, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_59665 = "sky130.cell"(%net_60576, %net_59672, %net_59673, %net_61108) {input_pins = "A1|A2|A3|B1", inst = 2941, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_59655 = "sky130.cell"(%state_236, %net_61123, %net_61126) {input_pins = "A1|A2|B1", inst = 2942, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_60534 = "sky130.cell"(%net_58972, %net_60290) {input_pins = "A|B", inst = 2949, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60302 = "sky130.cell"(%net_58922, %net_60616, %net_60534) {input_pins = "A|B|C_N", inst = 2954, model = "nor3b", output_pins = "Y", source_cell = "nor3b_2"} : (i1, i1, i1) -> i1
    %net_58941 = "sky130.cell"(%state_235, %state_234, %state_237, %net_59670, %net_60524) {input_pins = "A1|A2|B1|C1|D1", inst = 2955, model = "a2111oi", output_pins = "Y", source_cell = "a2111oi_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60537 = "sky130.cell"(%input_I, %net_60534, %net_58922) {input_pins = "A1|A2|B1_N", inst = 2956, model = "a21boi", output_pins = "Y", source_cell = "a21boi_2"} : (i1, i1, i1) -> i1
    %net_60621 = "sky130.cell"(%state_235, %state_234, %net_58975, %net_60452) {input_pins = "A1|A2|B1|C1", inst = 2961, model = "a211o", output_pins = "X", source_cell = "a211o_2"} : (i1, i1, i1, i1) -> i1
    %net_60296 = "sky130.cell"(%state_2947, %net_60295) {input_pins = "A|B", inst = 2963, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_58980 = "sky130.cell"(%state_235, %net_58975, %net_60353, %net_58978) {input_pins = "A1|A2|B1|B2", inst = 2968, model = "a22oi", output_pins = "Y", source_cell = "a22oi_2"} : (i1, i1, i1, i1) -> i1
    %net_60312 = "sky130.cell"(%state_2944, %net_60353) {input_pins = "A|B", inst = 3015, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_62084 = "sky130.cell"(%state_2947, %net_58972) {input_pins = "A|B", inst = 3017, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60291 = "sky130.cell"(%input_I, %net_60534, %net_60537) {input_pins = "A1|A2|B1", inst = 3164, model = "o21ai", output_pins = "Y", source_cell = "o21ai_2"} : (i1, i1, i1) -> i1
    %net_60611 = "sky130.cell"(%net_60534, %net_60463) {input_pins = "A|B", inst = 3191, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60526 = "sky130.cell"(%state_234, %net_60452) {input_pins = "A|B", inst = 3276, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60294 = "sky130.cell"(%state_2947, %net_60490) {input_pins = "A|B", inst = 3278, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_22511 = "sky130.cell"(%state_234, %net_58975, %net_58978, %net_58980) {input_pins = "A1|A2|A3|B1", inst = 3279, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60373 = "sky130.cell"(%state_2947, %net_60496) {input_pins = "A|B", inst = 3297, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_58954 = "sky130.cell"(%state_2948, %net_60315) {input_pins = "A|B", inst = 3298, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_60457 = "sky130.cell"(%net_60499, %net_58976, %net_58977) {input_pins = "A|B|C", inst = 3315, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_60453 = "sky130.cell"(%net_59847, %net_58922) {input_pins = "A|B", inst = 3483, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60447 = "sky130.cell"(%net_58922, %state_2958, %net_60453, %state_2947) {input_pins = "A1|A2|B1|B2", inst = 3487, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_60460 = "sky130.cell"(%net_58922, %net_59847) {input_pins = "A_N|B", inst = 3518, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_60474 = "sky130.cell"(%state_2959, %net_60325, %net_60463, %net_60294, %net_60291) {input_pins = "A1|A2|B1|B2|C1", inst = 3587, model = "o221a", output_pins = "X", source_cell = "o221a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_56283 = "sky130.cell"(%net_60526, %net_60309, %net_60499) {input_pins = "A1|A2|B1", inst = 3636, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_60316 = "sky130.cell"(%net_60499, %net_60353, %net_60314, %net_60557) {input_pins = "A1|A2|B1|B2", inst = 3660, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_60527 = "sky130.cell"(%net_60526) {input_pins = "A", inst = 3708, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_58948 = "sky130.cell"(%state_2959, %net_56283) {input_pins = "A|B", inst = 3709, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_62080 = "sky130.cell"(%state_2960, %net_22511) {input_pins = "A|B", inst = 3711, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_22531 = "sky130.cell"(%state_234, %net_60551) {input_pins = "A|B", inst = 3712, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60549 = "sky130.cell"(%net_60353, %net_60314) {input_pins = "A|B", inst = 3809, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60298 = "sky130.cell"(%net_58922, %net_60534) {input_pins = "A|B", inst = 3821, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59705 = "sky130.cell"(%net_59669, %net_60576, %net_61108) {input_pins = "A1|A2|B1", inst = 3858, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_59650 = "sky130.cell"(%net_61111, %net_61119, %net_61110) {input_pins = "A1|A2|B1", inst = 3968, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_57283 = "sky130.cell"(%state_237, %net_61119) {input_pins = "A|B", inst = 3976, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59654 = "sky130.cell"(%state_237, %net_61119, %state_234) {input_pins = "A_N|B|C", inst = 3984, model = "and3b", output_pins = "X", source_cell = "and3b_2"} : (i1, i1, i1) -> i1
    %net_60669 = "sky130.cell"(%net_59213, %net_59210, %net_58922, %state_4182) {input_pins = "A1|A2|A3|B1", inst = 4602, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60665 = "sky130.cell"(%state_4838, %state_4662, %net_58922) {input_pins = "A|B|C", inst = 4660, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_60662 = "sky130.cell"(%net_58922, %net_59213, %net_59643, %state_4661, %net_60668) {input_pins = "A1|A2|B1|B2|C1", inst = 4663, model = "a221oi", output_pins = "Y", source_cell = "a221oi_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60661 = "sky130.cell"(%net_59213, %net_60663) {input_pins = "A|B", inst = 4710, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59641 = "sky130.cell"(%net_58922, %net_59213, %net_60664, %net_60665) {input_pins = "A1|A2|B1|C1", inst = 4835, model = "a211oi", output_pins = "Y", source_cell = "a211oi_2"} : (i1, i1, i1, i1) -> i1
    %net_60895 = "sky130.cell"(%state_4659, %net_60665) {input_pins = "A|B", inst = 4862, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_60715 = "sky130.cell"(%net_60774, %state_5000, %net_59635, %state_5336) {input_pins = "A1|A2|B1|B2", inst = 4999, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_28886 = "sky130.cell"(%net_60711) {input_pins = "A", inst = 5006, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60740 = "sky130.cell"(%net_60745, %net_60742, %net_60738, %net_60743) {input_pins = "A|B|C|D", inst = 5010, model = "and4", output_pins = "X", source_cell = "and4_2"} : (i1, i1, i1, i1) -> i1
    %net_60739 = "sky130.cell"(%net_60629, %net_60628, %net_60631, %net_60630) {input_pins = "A|B|C|D", inst = 5225, model = "and4", output_pins = "X", source_cell = "and4_2"} : (i1, i1, i1, i1) -> i1
    %net_60716 = "sky130.cell"(%net_59636, %state_5344, %net_60777, %state_5339, %net_60715) {input_pins = "A1|A2|B1|B2|C1", inst = 5229, model = "a221o", output_pins = "X", source_cell = "a221o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60713 = "sky130.cell"(%input_I, %net_58922, %net_60716, %state_5337) {input_pins = "A1|A2|A3|B1", inst = 5256, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60989 = "sky130.cell"(%state_6199, %net_60971, %net_60944, %net_60985) {input_pins = "A|B|C|D", inst = 5613, model = "and4", output_pins = "X", source_cell = "and4_2"} : (i1, i1, i1, i1) -> i1
    %net_61008 = "sky130.cell"(%net_60944, %net_60980) {input_pins = "A|B", inst = 5614, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60979 = "sky130.cell"(%net_60944) {input_pins = "A", inst = 5626, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60845 = "sky130.cell"(%state_5634, %net_60839, %net_60843, %net_58922) {input_pins = "A1|A2|B1|C1", inst = 5677, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_33251 = "sky130.cell"(%net_60838, %net_60839, %net_60846) {input_pins = "A1|A2|B1", inst = 5682, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_60844 = "sky130.cell"(%net_60839, %net_60843, %state_5634) {input_pins = "A0|A1|S", inst = 5683, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60833 = "sky130.cell"(%net_60835, %state_5639, %net_60845, %net_60834) {input_pins = "A1|A2|B1|B2", inst = 5781, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_60990 = "sky130.cell"(%net_60971, %net_60944, %net_60985, %state_6199) {input_pins = "A1|A2|A3|B1", inst = 5947, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60935 = "sky130.cell"(%state_6198, %net_60944, %net_60985, %state_6197) {input_pins = "A1|A2|A3|B1", inst = 6017, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60932 = "sky130.cell"(%state_6109, %state_6106, %net_60944) {input_pins = "A|B|C", inst = 6033, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_60934 = "sky130.cell"(%net_60944, %net_60985) {input_pins = "A|B", inst = 6067, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_58727 = "sky130.cell"(%net_60969, %net_60961, %net_60971) {input_pins = "A|B|C", inst = 6092, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_60928 = "sky130.cell"(%input_I, %net_58922, %net_60961, %net_60979, %state_6109) {input_pins = "A1|A2|A3|B1|B2", inst = 6103, model = "a32o", output_pins = "X", source_cell = "a32o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60964 = "sky130.cell"(%state_6159, %net_60989) {input_pins = "A|B", inst = 6110, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_61044 = "sky130.cell"(%state_6198, %net_60934) {input_pins = "A|B", inst = 6195, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60901 = "sky130.cell"(%state_6442, %net_60902, %net_60905, %net_60910, %net_60911) {input_pins = "A1|A2|A3|B1|C1", inst = 6437, model = "o311a", output_pins = "X", source_cell = "o311a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_37127 = "sky130.cell"(%net_59213, %net_58922, %net_60902) {input_pins = "A|B|C", inst = 6441, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_60898 = "sky130.cell"(%net_37127, %net_60905, %state_6442) {input_pins = "A0|A1|S", inst = 6444, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_60899 = "sky130.cell"(%net_60902, %net_60905, %net_60906, %net_60909) {input_pins = "A1|A2|B1|C1", inst = 6446, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_61043 = "sky130.cell"(%net_60751, %net_61058, %net_60753, %net_60987) {input_pins = "A|B|C|D", inst = 6806, model = "and4", output_pins = "X", source_cell = "and4_2"} : (i1, i1, i1, i1) -> i1
    %net_39167 = "sky130.cell"(%net_60966, %net_61031, %net_59674) {input_pins = "A|B|C", inst = 6809, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_61636 = "sky130.cell"(%state_6451, %net_61729, %net_61635) {input_pins = "A1|A2|B1", inst = 6955, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_59648 = "sky130.cell"(%state_237, %net_61155, %net_42126, %net_61208) {input_pins = "A1|A2|B1|B2", inst = 6974, model = "o22a", output_pins = "X", source_cell = "o22a_2"} : (i1, i1, i1, i1) -> i1
    %net_61175 = "sky130.cell"(%state_234, %net_61208, %net_61154) {input_pins = "A|B|C", inst = 6976, model = "nor3", output_pins = "Y", source_cell = "nor3_2"} : (i1, i1, i1) -> i1
    %net_59657 = "sky130.cell"(%state_236, %state_234, %net_61076, %net_61077) {input_pins = "A1|A2|B1|B2", inst = 6989, model = "o22a", output_pins = "X", source_cell = "o22a_2"} : (i1, i1, i1, i1) -> i1
    %net_61173 = "sky130.cell"(%input_undriven_61217, %net_61170, %net_61210, %net_61215) {input_pins = "A1|A2|A3|B1", inst = 6991, model = "a31oi", output_pins = "Y", source_cell = "a31oi_2"} : (i1, i1, i1, i1) -> i1
    %net_59343 = "sky130.cell"(%net_61172, %net_61173, %net_42487, %net_61170, %state_235) {input_pins = "A1|A2|A3|B1|B2", inst = 6992, model = "o32ai", output_pins = "Y", source_cell = "o32ai_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60321 = "sky130.cell"(%net_61076, %net_61077, %net_61079) {input_pins = "A|B|C", inst = 7006, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_61213 = "sky130.cell"(%input_undriven_61217, %net_61170, %net_61210, %net_61218, %net_61215) {input_pins = "A1|A2|A3|B1|C1", inst = 7091, model = "a311o", output_pins = "X", source_cell = "a311o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_61177 = "sky130.cell"(%net_61165, %net_61176, %state_236) {input_pins = "A1|A2|B1", inst = 7291, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_61167 = "sky130.cell"(%net_61208, %net_61165, %net_61215) {input_pins = "A_N|B|C", inst = 7314, model = "and3b", output_pins = "X", source_cell = "and3b_2"} : (i1, i1, i1) -> i1
    %net_59646 = "sky130.cell"(%net_61167, %net_61177) {input_pins = "A|B", inst = 7326, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_61696 = "sky130.cell"(%net_61754, %net_61739, %net_43889) {input_pins = "A|B|C", inst = 7417, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_61530 = "sky130.cell"(%net_61754, %net_43889) {input_pins = "A|B", inst = 7454, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61722 = "sky130.cell"(%state_6435, %net_59511, %net_61530) {input_pins = "A1|A2|B1", inst = 7546, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_61603 = "sky130.cell"(%net_59511, %net_61519) {input_pins = "A|B", inst = 7565, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_61609 = "sky130.cell"(%state_4661, %net_61603) {input_pins = "A|B", inst = 7660, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_46052 = "sky130.cell"(%net_61329) {input_pins = "A", inst = 8087, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_59675 = "sky130.cell"(%state_8591, %net_61406) {input_pins = "A|B", inst = 8575, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_61876 = "sky130.cell"(%state_4838, %net_61857) {input_pins = "A|B", inst = 9341, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61783 = "sky130.cell"(%net_59536, %net_61770) {input_pins = "A|B", inst = 9346, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61813 = "sky130.cell"(%state_4659, %net_61636) {input_pins = "A|B", inst = 9353, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_59533 = "sky130.cell"(%net_61876, %net_61813) {input_pins = "A|B", inst = 9360, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_61758 = "sky130.cell"(%net_61614, %net_61783) {input_pins = "A|B", inst = 9597, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61774 = "sky130.cell"(%net_61768, %net_61614) {input_pins = "A|B", inst = 9607, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_495 = "sky130.cell"(%net_61420) {input_pins = "A", inst = 51, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60165 = "sky130.cell"(%state_2957, %net_62084) {input_pins = "A|B", inst = 142, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_1109 = "sky130.cell"(%state_2039, %net_59639, %net_60235, %net_60257) {input_pins = "A|B|C|D", inst = 144, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_60344 = "sky130.cell"(%net_60340, %net_60343, %net_60463) {input_pins = "A1|A2|B1", inst = 171, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_60386 = "sky130.cell"(%state_2957, %net_62084) {input_pins = "A|B", inst = 173, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_59860 = "sky130.cell"(%net_59871, %state_227, %net_58727, %net_58726) {input_pins = "A1|A2|B1|C1", inst = 203, model = "a211oi", output_pins = "Y", source_cell = "a211oi_2"} : (i1, i1, i1, i1) -> i1
    %net_59743 = "sky130.cell"(%state_228, %state_227, %net_58727) {input_pins = "A1|A2|B1_N", inst = 387, model = "o21ba", output_pins = "X", source_cell = "o21ba_2"} : (i1, i1, i1) -> i1
    %net_59755 = "sky130.cell"(%net_58726, %net_59743) {input_pins = "A|B", inst = 498, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59884 = "sky130.cell"(%net_58726, %state_228, %net_58727, %state_227) {input_pins = "A|B|C|D_N", inst = 536, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_4431 = "sky130.cell"(%net_59861) {input_pins = "A", inst = 599, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_60381 = "sky130.cell"(%net_60463, %net_60296) {input_pins = "A|B", inst = 1166, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60050 = "sky130.cell"(%state_1810, %net_59916, %net_60053) {input_pins = "A1|A2|B1", inst = 1235, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_60074 = "sky130.cell"(%state_1810, %net_59916) {input_pins = "A_N|B", inst = 1240, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_58884 = "sky130.cell"(%state_1249, %net_60177, %net_60179, %net_60180) {input_pins = "A|B|C|D", inst = 1252, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_8622 = "sky130.cell"(%net_60051) {input_pins = "A", inst = 1285, model = "clkbuf", output_pins = "X", source_cell = "clkbuf_4"} : (i1) -> i1
    %net_55469 = "sky130.cell"(%state_1261, %net_59931, %state_1384) {input_pins = "A1|A2|B1", inst = 1367, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_10354 = "sky130.cell"(%state_1626, %net_60019, %net_60017) {input_pins = "A1|A2|B1", inst = 1611, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_60125 = "sky130.cell"(%state_1809, %net_60145, %state_1229) {input_pins = "A1|A2|B1", inst = 1777, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_60116 = "sky130.cell"(%state_2036, %net_60120, %net_60119) {input_pins = "A1|A2|B1", inst = 1780, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_60124 = "sky130.cell"(%state_1809, %net_60145, %net_60144) {input_pins = "A1|A2|B1", inst = 1781, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_59703 = "sky130.cell"(%state_2036, %net_60120) {input_pins = "A_N|B", inst = 1792, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_58883 = "sky130.cell"(%state_2037, %net_60182, %net_58884) {input_pins = "A1|A2|B1", inst = 1795, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_60176 = "sky130.cell"(%state_2037, %net_60182, %state_1249) {input_pins = "A1|A2|B1", inst = 1796, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_60168 = "sky130.cell"(%net_60235, %net_60257) {input_pins = "A|B", inst = 2359, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60259 = "sky130.cell"(%state_2372, %net_60195, %net_60194) {input_pins = "A1|A2|B1", inst = 2363, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61094 = "sky130.cell"(%net_61111, %net_61119, %net_57283, %net_17578, %net_61125) {input_pins = "A1|A2|B1|B2|C1", inst = 2939, model = "o221a", output_pins = "X", source_cell = "o221a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_18859 = "sky130.cell"(%net_58922, %state_2947, %state_2960, %net_60453, %net_60611) {input_pins = "A1|A2|B1|B2|C1", inst = 2965, model = "a221o", output_pins = "X", source_cell = "a221o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60339 = "sky130.cell"(%net_58922, %state_2957, %net_60298, %net_60616, %net_60453) {input_pins = "A1|A2|B1|B2|C1", inst = 2972, model = "a221o", output_pins = "X", source_cell = "a221o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_55991 = "sky130.cell"(%state_2946, %net_60325, %net_60302, %net_60339) {input_pins = "A1|A2|B1|B2", inst = 2973, model = "o22a", output_pins = "X", source_cell = "o22a_2"} : (i1, i1, i1, i1) -> i1
    %net_60345 = "sky130.cell"(%net_60340, %net_60343, %net_60344) {input_pins = "A1|A2|B1", inst = 2974, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_60297 = "sky130.cell"(%state_2959, %net_62084) {input_pins = "A|B", inst = 3014, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_60622 = "sky130.cell"(%net_60527, %net_60549, %net_60621) {input_pins = "A1|A2|B1", inst = 3163, model = "o21ai", output_pins = "Y", source_cell = "o21ai_2"} : (i1, i1, i1) -> i1
    %net_60485 = "sky130.cell"(%net_58922, %net_60534, %net_60297) {input_pins = "A_N|B|C", inst = 3277, model = "and3b", output_pins = "X", source_cell = "and3b_2"} : (i1, i1, i1) -> i1
    %net_60435 = "sky130.cell"(%net_58922, %state_2944, %net_60453) {input_pins = "A1|A2|B1", inst = 3281, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_60500 = "sky130.cell"(%net_58922, %state_2959, %state_2944, %net_60453, %net_60381) {input_pins = "A1|A2|B1|B2|C1", inst = 3285, model = "a221o", output_pins = "X", source_cell = "a221o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60383 = "sky130.cell"(%net_60457, %net_60312) {input_pins = "A|B", inst = 3286, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_60444 = "sky130.cell"(%net_58922, %state_2948, %state_2958, %net_60453) {input_pins = "A1|A2|B1|B2", inst = 3477, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_60389 = "sky130.cell"(%net_60466, %net_60316) {input_pins = "A|B", inst = 3480, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_60593 = "sky130.cell"(%net_60460, %net_60386, %net_60165, %net_60447) {input_pins = "A1|A2|A3|B1", inst = 3489, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60511 = "sky130.cell"(%net_60460, %net_60443, %net_60444) {input_pins = "A1|A2|B1", inst = 3516, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_60552 = "sky130.cell"(%net_60527, %net_60314, %net_22531, %net_60551, %net_60549) {input_pins = "A1|A2|A3|B1|B2", inst = 3710, model = "o32a", output_pins = "X", source_cell = "o32a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60681 = "sky130.cell"(%net_60739, %net_60740, %net_60741) {input_pins = "A|B|C", inst = 5013, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_60929 = "sky130.cell"(%net_60932, %net_60933) {input_pins = "A_N|B", inst = 5603, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_60963 = "sky130.cell"(%net_60989, %net_60990) {input_pins = "A_N|B", inst = 5615, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_35962 = "sky130.cell"(%net_61038, %net_60934, %net_60935) {input_pins = "A1|A2|B1", inst = 5627, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_60832 = "sky130.cell"(%net_59213, %net_58922, %net_60844, %state_5638) {input_pins = "A1|A2|A3|B1", inst = 5640, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_60962 = "sky130.cell"(%state_6095, %net_60932, %net_60934) {input_pins = "A1|A2|B1", inst = 6041, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_39228 = "sky130.cell"(%net_59675, %net_60920, %net_60921, %net_60750) {input_pins = "A|B|C|D", inst = 6822, model = "and4", output_pins = "X", source_cell = "and4_2"} : (i1, i1, i1, i1) -> i1
    %net_61595 = "sky130.cell"(%state_4659, %net_61636, %net_61687, %state_6436) {input_pins = "A1_N|A2_N|B1|B2", inst = 6949, model = "o2bb2a", output_pins = "X", source_cell = "o2bb2a_2"} : (i1, i1, i1, i1) -> i1
    %net_61731 = "sky130.cell"(%state_6451, %state_6436, %state_6435, %net_61530) {input_pins = "A1|A2|A3|B1", inst = 6954, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_59562 = "sky130.cell"(%net_61758) {input_pins = "A", inst = 6962, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_59645 = "sky130.cell"(%net_61172, %net_61173, %net_61175, %net_61213) {input_pins = "A1|A2|A3|B1", inst = 6972, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_59644 = "sky130.cell"(%net_61208, %net_61170, %net_61167) {input_pins = "A1|A2|B1_N", inst = 7167, model = "o21bai", output_pins = "Y", source_cell = "o21bai_2"} : (i1, i1, i1) -> i1
    %net_61705 = "sky130.cell"(%state_6451, %net_61739, %net_61717, %net_61731) {input_pins = "A1|A2|B1|B2", inst = 7380, model = "o22ai", output_pins = "Y", source_cell = "o22ai_2"} : (i1, i1, i1, i1) -> i1
    %net_61541 = "sky130.cell"(%net_59511, %net_61530, %net_61722) {input_pins = "A1|A2|B1", inst = 7381, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_61596 = "sky130.cell"(%net_61528, %net_61530, %net_61696) {input_pins = "A|B|C", inst = 7383, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59526 = "sky130.cell"(%net_61691, %net_61705) {input_pins = "A_N|B", inst = 7416, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61598 = "sky130.cell"(%net_61613, %net_61609, %net_61596) {input_pins = "A1|A2|B1", inst = 7560, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_61586 = "sky130.cell"(%state_4661, %net_61603) {input_pins = "A|B", inst = 7564, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_59480 = "sky130.cell"(%net_59533, %net_59510) {input_pins = "A|B", inst = 8995, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_61781 = "sky130.cell"(%net_59533, %net_59510) {input_pins = "A|B", inst = 8999, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_61637 = "sky130.cell"(%net_59533, %net_61758) {input_pins = "A|B", inst = 9340, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61789 = "sky130.cell"(%net_59510, %net_61783) {input_pins = "A_N|B", inst = 9344, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_61624 = "sky130.cell"(%state_4838, %net_61857, %net_61813, %net_59533, %net_59510) {input_pins = "A1|A2|A3|B1|B2", inst = 9355, model = "a32o", output_pins = "X", source_cell = "a32o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_62089 = "sky130.cell"(%net_59536, %net_61774) {input_pins = "A|B", inst = 9602, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59538 = "sky130.cell"(%net_59480, %net_61789) {input_pins = "A|B", inst = 9612, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_62002 = "sky130.cell"(%net_61774, %net_61789) {input_pins = "A|B", inst = 9615, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_59534 = "sky130.cell"(%net_59533, %net_61789) {input_pins = "A|B", inst = 9705, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_59532 = "sky130.cell"(%net_61774, %net_61781) {input_pins = "A|B", inst = 9763, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61621 = "sky130.cell"(%net_61781, %net_61758) {input_pins = "A|B", inst = 9790, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61800 = "sky130.cell"(%net_59541, %net_61789) {input_pins = "A|B", inst = 9810, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_60221 = "sky130.cell"(%state_1250, %net_60168, %state_2039) {input_pins = "A1|A2|B1", inst = 145, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_60219 = "sky130.cell"(%state_1250, %net_60168, %net_1109) {input_pins = "A1|A2|B1", inst = 147, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_60425 = "sky130.cell"(%state_2958, %net_60389) {input_pins = "A|B", inst = 169, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_59882 = "sky130.cell"(%net_59884) {input_pins = "A", inst = 200, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_60328 = "sky130.cell"(%net_59755, %net_59882, %net_59860) {input_pins = "A|B|C_N", inst = 744, model = "nor3b", output_pins = "Y", source_cell = "nor3b_2"} : (i1, i1, i1) -> i1
    %net_60397 = "sky130.cell"(%net_59860, %net_59755, %net_59882) {input_pins = "A|B|C_N", inst = 745, model = "nor3b", output_pins = "Y", source_cell = "nor3b_2"} : (i1, i1, i1) -> i1
    %net_59724 = "sky130.cell"(%net_58948, %net_60328, %net_60397, %net_59644) {input_pins = "A1|A2|B1|B2", inst = 747, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_58810 = "sky130.cell"(%net_59860, %net_59882, %net_59755) {input_pins = "A|B|C_N", inst = 753, model = "nor3b", output_pins = "Y", source_cell = "nor3b_2"} : (i1, i1, i1) -> i1
    %net_59911 = "sky130.cell"(%net_59860, %net_59755, %net_59882) {input_pins = "A|B|C", inst = 754, model = "nor3", output_pins = "Y", source_cell = "nor3_2"} : (i1, i1, i1) -> i1
    %net_60433 = "sky130.cell"(%net_59755, %net_59882, %net_59860) {input_pins = "A1|A2|B1", inst = 834, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_59716 = "sky130.cell"(%net_59660, %net_60328, %net_60433) {input_pins = "A|B|C", inst = 867, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59722 = "sky130.cell"(%net_60373, %net_60328, %net_60397, %net_59648) {input_pins = "A1|A2|B1|B2", inst = 939, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59717 = "sky130.cell"(%net_58954, %net_60328, %net_60397, %net_59343) {input_pins = "A1|A2|B1|B2", inst = 960, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59912 = "sky130.cell"(%net_60267, %net_58810, %net_59911, %net_59655) {input_pins = "A1|A2|B1|B2", inst = 976, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59844 = "sky130.cell"(%net_59662, %net_60328, %net_60433) {input_pins = "A|B|C", inst = 1076, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_60364 = "sky130.cell"(%net_58940, %net_60328, %net_60433) {input_pins = "A|B|C", inst = 1077, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59721 = "sky130.cell"(%net_60321, %net_60328, %net_60433) {input_pins = "A|B|C", inst = 1080, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59723 = "sky130.cell"(%net_59709, %net_58810, %net_59911, %net_58766) {input_pins = "A1|A2|B1|B2", inst = 1154, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_60409 = "sky130.cell"(%net_59659, %net_60328, %net_60433) {input_pins = "A|B|C", inst = 1190, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_60405 = "sky130.cell"(%net_59658, %net_60328, %net_60433) {input_pins = "A|B|C", inst = 1203, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_62079 = "sky130.cell"(%state_2946, %net_60552) {input_pins = "A|B", inst = 2951, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_58974 = "sky130.cell"(%net_60297, %net_60298) {input_pins = "A_N|B", inst = 2966, model = "and2b", output_pins = "X", source_cell = "and2b_2"} : (i1, i1) -> i1
    %net_58969 = "sky130.cell"(%net_58922, %state_2946, %net_60453, %state_2948, %net_60345) {input_pins = "A1|A2|B1|B2|C1", inst = 2969, model = "a221o", output_pins = "X", source_cell = "a221o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_58950 = "sky130.cell"(%state_2957, %net_60622) {input_pins = "A|B", inst = 3161, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_58968 = "sky130.cell"(%net_58974, %net_60485, %net_60435, %net_60325, %state_2957) {input_pins = "A1|A2|A3|B1|B2", inst = 3284, model = "o32a", output_pins = "X", source_cell = "o32a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_60796 = "sky130.cell"(%net_61043, %net_39228, %net_39167) {input_pins = "A|B|C", inst = 6802, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_61923 = "sky130.cell"(%net_61586, %net_61595) {input_pins = "A|B", inst = 6980, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_61744 = "sky130.cell"(%net_61586, %net_61595) {input_pins = "A|B", inst = 7375, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61599 = "sky130.cell"(%net_61613, %net_61609, %net_61596) {input_pins = "A|B|C", inst = 7382, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_61741 = "sky130.cell"(%net_61586, %net_61595) {input_pins = "A|B", inst = 7415, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59515 = "sky130.cell"(%net_61624, %net_61923) {input_pins = "A|B", inst = 9000, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_59540 = "sky130.cell"(%net_59515, %net_59538) {input_pins = "A|B", inst = 9006, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59564 = "sky130.cell"(%net_62089, %net_61800, %net_61621) {input_pins = "A|B|C", inst = 9008, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_57970 = "sky130.cell"(%net_59515, %net_59534, %net_59532, %net_62002) {input_pins = "A1|A2|A3|B1", inst = 9044, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_59466 = "sky130.cell"(%net_62002, %net_59538) {input_pins = "A_N|B", inst = 9047, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61881 = "sky130.cell"(%net_59515, %net_61758, %net_59538) {input_pins = "A1|A2|B1", inst = 9049, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61825 = "sky130.cell"(%net_59480, %net_61800) {input_pins = "A|B", inst = 9338, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_59481 = "sky130.cell"(%net_61781, %net_61800) {input_pins = "A|B", inst = 9345, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61815 = "sky130.cell"(%net_59534, %net_59532) {input_pins = "A|B", inst = 9351, model = "and2", output_pins = "X", source_cell = "and2_2"} : (i1, i1) -> i1
    %net_61941 = "sky130.cell"(%net_59533, %net_62089) {input_pins = "A|B", inst = 9598, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_62095 = "sky130.cell"(%net_61781, %net_61800) {input_pins = "A|B", inst = 9605, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_59555 = "sky130.cell"(%net_62089, %net_61781, %net_61800) {input_pins = "A|B|C", inst = 9611, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59523 = "sky130.cell"(%net_61941, %net_59515) {input_pins = "A|B", inst = 9714, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59473 = "sky130.cell"(%net_59515, %net_59481) {input_pins = "A|B", inst = 9760, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59848 = "sky130.cell"(%net_59665, %net_58810, %net_59911, %net_59650) {input_pins = "A1|A2|B1|B2", inst = 225, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_60363 = "sky130.cell"(%net_62080, %net_60328, %net_60397, %net_58764) {input_pins = "A1|A2|B1|B2", inst = 238, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59719 = "sky130.cell"(%net_60425, %net_60328, %net_60397, %net_59647) {input_pins = "A1|A2|B1|B2", inst = 239, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59714 = "sky130.cell"(%net_58950, %net_60328, %net_60397, %net_59342) {input_pins = "A1|A2|B1|B2", inst = 241, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59715 = "sky130.cell"(%net_62079, %net_60328, %net_60397, %net_59646) {input_pins = "A1|A2|B1|B2", inst = 242, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59792 = "sky130.cell"(%state_226, %state_4182, %net_60796, %net_60681) {input_pins = "A_N|B|C|D", inst = 450, model = "and4b", output_pins = "X", source_cell = "and4b_2"} : (i1, i1, i1, i1) -> i1
    %net_59834 = "sky130.cell"(%net_59666, %net_58810, %net_59911, %net_58765) {input_pins = "A1|A2|B1|B2", inst = 603, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59718 = "sky130.cell"(%net_58938, %net_60328, %net_60433) {input_pins = "A|B|C", inst = 604, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59856 = "sky130.cell"(%net_59705, %net_58810, %net_59911, %net_59651) {input_pins = "A1|A2|B1|B2", inst = 611, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59842 = "sky130.cell"(%net_59668, %net_58810, %net_59911, %net_59654) {input_pins = "A1|A2|B1|B2", inst = 683, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59836 = "sky130.cell"(%net_58941, %net_58810, %net_59911, %net_61094) {input_pins = "A1|A2|B1|B2", inst = 687, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59839 = "sky130.cell"(%net_58945, %net_58810, %net_59911, %net_59373) {input_pins = "A1|A2|B1|B2", inst = 709, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_59713 = "sky130.cell"(%net_60328, %net_60433) {input_pins = "A|B", inst = 741, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59726 = "sky130.cell"(%net_60383, %net_60328, %net_60397, %net_59645) {input_pins = "A1|A2|B1|B2", inst = 742, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_58811 = "sky130.cell"(%net_59657, %net_60328, %net_60433) {input_pins = "A|B|C", inst = 751, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59798 = "sky130.cell"(%net_59713, %net_59839, %net_59717, %net_59718) {input_pins = "A1|A2|A3|B1", inst = 790, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_59817 = "sky130.cell"(%net_59713, %net_59912, %net_59722, %net_59721) {input_pins = "A1|A2|A3|B1", inst = 1081, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_59686 = "sky130.cell"(%net_59713, %net_59723, %net_60363, %net_60364) {input_pins = "A1|A2|A3|B1", inst = 1143, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_59535 = "sky130.cell"(%net_59515, %net_59534) {input_pins = "A|B", inst = 6872, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61666 = "sky130.cell"(%net_61624, %net_61744, %net_61741) {input_pins = "A1|A2|B1", inst = 6952, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_59476 = "sky130.cell"(%net_61624, %net_61923) {input_pins = "A|B", inst = 6964, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_59519 = "sky130.cell"(%net_61598, %net_61599) {input_pins = "A|B", inst = 7374, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61585 = "sky130.cell"(%net_61666, %net_59519, %net_61598) {input_pins = "A1|A2|B1", inst = 7376, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_61539 = "sky130.cell"(%net_61585, %net_61705, %net_61691) {input_pins = "A1|A2|B1", inst = 7414, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_61605 = "sky130.cell"(%net_61539, %net_61541) {input_pins = "A|B", inst = 7435, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59573 = "sky130.cell"(%net_59540, %net_61881) {input_pins = "A|B", inst = 7766, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_59514 = "sky130.cell"(%net_59476, %net_59562, %net_59532) {input_pins = "A|B|C", inst = 7769, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_61810 = "sky130.cell"(%net_62089, %net_59480, %net_59476, %net_61941) {input_pins = "A1|A2|B1|C1", inst = 8997, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_61890 = "sky130.cell"(%net_59476, %net_59555) {input_pins = "A|B", inst = 9003, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_62086 = "sky130.cell"(%net_59476, %net_59481) {input_pins = "A|B", inst = 9005, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61887 = "sky130.cell"(%net_62089, %net_59515, %net_61825) {input_pins = "A|B|C", inst = 9007, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59574 = "sky130.cell"(%net_61825) {input_pins = "A", inst = 9009, model = "inv", output_pins = "Y", source_cell = "inv_2"} : (i1) -> i1
    %net_59462 = "sky130.cell"(%net_59476, %net_62095) {input_pins = "A|B", inst = 9010, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61850 = "sky130.cell"(%net_59476, %net_59538) {input_pins = "A|B", inst = 9013, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_61963 = "sky130.cell"(%net_62089, %net_59515, %net_59480, %net_61941) {input_pins = "A1|A2|A3|B1", inst = 9045, model = "o31ai", output_pins = "Y", source_cell = "o31ai_2"} : (i1, i1, i1, i1) -> i1
    %net_52036 = "sky130.cell"(%net_59555, %net_59564, %net_59515) {input_pins = "A0|A1|S", inst = 9063, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_61558 = "sky130.cell"(%net_59476, %net_61637, %net_59523) {input_pins = "A1|A2|B1_N", inst = 9115, model = "o21ba", output_pins = "X", source_cell = "o21ba_2"} : (i1, i1, i1) -> i1
    %net_59552 = "sky130.cell"(%net_59476, %net_62002, %net_59555) {input_pins = "A1|A2|B1", inst = 9198, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_53355 = "sky130.cell"(%net_59515, %net_61815, %net_61850) {input_pins = "A1|A2|B1", inst = 9245, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61945 = "sky130.cell"(%net_59476, %net_61800) {input_pins = "A|B", inst = 9265, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_61833 = "sky130.cell"(%net_62089, %net_61825, %net_59515) {input_pins = "A1|A2|B1", inst = 9336, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61618 = "sky130.cell"(%net_59476, %net_61781, %net_62002) {input_pins = "A|B|C", inst = 9540, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_59733 = "sky130.cell"(%net_59713, %net_59836, %net_59715, %net_59716) {input_pins = "A1|A2|A3|B1", inst = 217, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_62064 = "sky130.cell"(%state_226, %net_59686, %net_59779) {input_pins = "A|B|C", inst = 229, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_59902 = "sky130.cell"(%net_59713, %net_59848, %net_59724, %net_58811) {input_pins = "A1|A2|A3|B1", inst = 231, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_59799 = "sky130.cell"(%net_59713, %net_59842, %net_59719, %net_59844) {input_pins = "A1|A2|A3|B1", inst = 232, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_59786 = "sky130.cell"(%net_58725, %net_59791, %net_59792, %state_228, %net_59789) {input_pins = "A1|A2|A3|B1|B2", inst = 233, model = "a32o", output_pins = "X", source_cell = "a32o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_59899 = "sky130.cell"(%net_59713, %net_59834, %net_59714, %net_60409) {input_pins = "A1|A2|A3|B1", inst = 246, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_59371 = "sky130.cell"(%state_226, %net_59798, %net_59779) {input_pins = "A|B|C", inst = 305, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_59372 = "sky130.cell"(%state_226, %net_59733, %net_59779) {input_pins = "A|B|C", inst = 350, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_59788 = "sky130.cell"(%net_55247, %net_59791, %net_59792, %state_227, %net_59789) {input_pins = "A1|A2|A3|B1|B2", inst = 399, model = "a32o", output_pins = "X", source_cell = "a32o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_62063 = "sky130.cell"(%state_226, %net_59817, %net_59779) {input_pins = "A|B|C", inst = 553, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_59905 = "sky130.cell"(%net_59713, %net_59856, %net_59726, %net_60405) {input_pins = "A1|A2|A3|B1", inst = 600, model = "o31a", output_pins = "X", source_cell = "o31a_2"} : (i1, i1, i1, i1) -> i1
    %net_58926 = "sky130.cell"(%state_226, %net_59905, %net_59779) {input_pins = "A|B|C", inst = 1046, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_59529 = "sky130.cell"(%net_59481, %net_59462) {input_pins = "A|B", inst = 6921, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59517 = "sky130.cell"(%net_61941, %net_59476) {input_pins = "A|B", inst = 6936, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_59528 = "sky130.cell"(%net_61585, %net_59526) {input_pins = "A|B", inst = 6945, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_59547 = "sky130.cell"(%net_61666, %net_59519) {input_pins = "A|B", inst = 6946, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_61680 = "sky130.cell"(%net_62086, %net_59476, %net_59466) {input_pins = "A0|A1|S", inst = 6960, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_61904 = "sky130.cell"(%net_59476, %net_61637, %net_61833, %net_59547) {input_pins = "A1|A2|B1|C1", inst = 6968, model = "a211o", output_pins = "X", source_cell = "a211o_2"} : (i1, i1, i1, i1) -> i1
    %net_59530 = "sky130.cell"(%net_59515, %net_59574, %net_59547) {input_pins = "A1|A2|B1", inst = 6977, model = "o21ai", output_pins = "Y", source_cell = "o21ai_2"} : (i1, i1, i1) -> i1
    %net_61567 = "sky130.cell"(%net_61539, %net_61541) {input_pins = "A|B", inst = 6981, model = "xnor2", output_pins = "Y", source_cell = "xnor2_2"} : (i1, i1) -> i1
    %net_61561 = "sky130.cell"(%net_61585, %net_59526) {input_pins = "A|B", inst = 6982, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_61543 = "sky130.cell"(%net_61539, %net_61541) {input_pins = "A|B", inst = 6983, model = "xor2", output_pins = "X", source_cell = "xor2_2"} : (i1, i1) -> i1
    %net_61681 = "sky130.cell"(%net_59547, %net_59538, %net_61680, %net_59528) {input_pins = "A1|A2|B1|C1", inst = 7379, model = "a211o", output_pins = "X", source_cell = "a211o_2"} : (i1, i1, i1, i1) -> i1
    %net_61581 = "sky130.cell"(%net_61605, %net_62094) {input_pins = "A|B", inst = 7400, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61601 = "sky130.cell"(%net_62086, %net_59514, %net_59547) {input_pins = "A1|A2|B1", inst = 7816, model = "o21ai", output_pins = "Y", source_cell = "o21ai_2"} : (i1, i1, i1) -> i1
    %net_45064 = "sky130.cell"(%net_61561, %net_61558, %net_59547) {input_pins = "A1|A2|B1", inst = 7852, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_61571 = "sky130.cell"(%net_61561, %net_59535) {input_pins = "A|B", inst = 7854, model = "or2", output_pins = "X", source_cell = "or2_2"} : (i1, i1) -> i1
    %net_61907 = "sky130.cell"(%net_59547, %net_59523, %net_61904) {input_pins = "A1|A2|B1_N", inst = 8044, model = "a21bo", output_pins = "X", source_cell = "a21bo_2"} : (i1, i1, i1) -> i1
    %net_61942 = "sky130.cell"(%net_59515, %net_59466, %net_61850, %net_59541) {input_pins = "A1|A2|B1|B2", inst = 8996, model = "o22a", output_pins = "X", source_cell = "o22a_2"} : (i1, i1, i1, i1) -> i1
    %net_62087 = "sky130.cell"(%net_59547, %net_62086, %net_61810) {input_pins = "A|B|C", inst = 9001, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_61884 = "sky130.cell"(%net_62095, %net_62086, %net_61825, %net_59476) {input_pins = "A1|A2|B1|B2", inst = 9002, model = "a22o", output_pins = "X", source_cell = "a22o_2"} : (i1, i1, i1, i1) -> i1
    %net_61655 = "sky130.cell"(%net_59547, %net_52036) {input_pins = "A|B", inst = 9004, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61870 = "sky130.cell"(%net_62089, %net_59462, %net_61945) {input_pins = "A1|A2|B1", inst = 9012, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_59559 = "sky130.cell"(%net_59476, %net_61621, %net_59574, %net_59547) {input_pins = "A1|A2|A3|B1", inst = 9062, model = "o31ai", output_pins = "Y", source_cell = "o31ai_2"} : (i1, i1, i1, i1) -> i1
    %net_61538 = "sky130.cell"(%net_59547, %net_61963) {input_pins = "A|B", inst = 9127, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_61630 = "sky130.cell"(%net_59547, %net_59535, %net_59540) {input_pins = "A|B|C", inst = 9337, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_59525 = "sky130.cell"(%net_59547, %net_59528, %net_59564, %net_61833) {input_pins = "A|B|C|D", inst = 9342, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_59516 = "sky130.cell"(%net_59533, %net_59547, %net_61789, %net_62086, %net_59514) {input_pins = "A1|A2|A3|B1|C1", inst = 9347, model = "a311o", output_pins = "X", source_cell = "a311o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_61623 = "sky130.cell"(%net_59515, %net_59481, %net_59547) {input_pins = "A1|A2|B1", inst = 9348, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_59474 = "sky130.cell"(%net_61870, %net_57970, %net_59547) {input_pins = "A0|A1|S", inst = 9357, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_59475 = "sky130.cell"(%net_61621, %net_59530, %net_53355, %net_59547, %net_59528) {input_pins = "A1|A2|B1|B2|C1", inst = 9358, model = "o221a", output_pins = "X", source_cell = "o221a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_59544 = "sky130.cell"(%net_59547, %net_59462) {input_pins = "A|B", inst = 9614, model = "nand2", output_pins = "Y", source_cell = "nand2_2"} : (i1, i1) -> i1
    %net_62057 = "sky130.cell"(%state_226, %net_59902, %net_59779) {input_pins = "A|B|C", inst = 222, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_62059 = "sky130.cell"(%state_226, %net_59899, %net_59779) {input_pins = "A|B|C", inst = 223, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_62062 = "sky130.cell"(%state_226, %net_59799, %net_59779) {input_pins = "A|B|C", inst = 230, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_61724 = "sky130.cell"(%net_59544, %net_62086, %net_59528, %net_61630) {input_pins = "A1|A2|B1|C1", inst = 6947, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_59570 = "sky130.cell"(%net_59517, %net_59547, %net_61618, %net_59528, %net_61655) {input_pins = "A1|A2|A3|B1|C1", inst = 6948, model = "o311a", output_pins = "X", source_cell = "o311a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_59472 = "sky130.cell"(%net_59476, %net_62095, %net_61887, %net_61561) {input_pins = "A1|A2|B1|B2", inst = 6963, model = "o22ai", output_pins = "Y", source_cell = "o22ai_2"} : (i1, i1, i1, i1) -> i1
    %net_61608 = "sky130.cell"(%net_59547, %net_59472, %net_61571, %net_45064, %net_61567) {input_pins = "A1|A2|B1|B2|C1", inst = 6979, model = "a221o", output_pins = "X", source_cell = "a221o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_61555 = "sky130.cell"(%net_59528, %net_59516, %net_61601) {input_pins = "A|B|C", inst = 7404, model = "and3", output_pins = "X", source_cell = "and3_2"} : (i1, i1, i1) -> i1
    %net_61548 = "sky130.cell"(%net_59544, %net_62087, %net_59528) {input_pins = "A1|A2|B1", inst = 7767, model = "a21oi", output_pins = "Y", source_cell = "a21oi_2"} : (i1, i1, i1) -> i1
    %net_59471 = "sky130.cell"(%net_61561, %net_61907, %net_61555) {input_pins = "A1|A2|B1", inst = 7768, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_61899 = "sky130.cell"(%net_59573, %net_61884, %net_59547) {input_pins = "A0|A1|S", inst = 7823, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_59467 = "sky130.cell"(%net_61561, %net_61899, %net_61681, %net_61543) {input_pins = "A1|A2|B1|C1", inst = 7825, model = "o211ai", output_pins = "Y", source_cell = "o211ai_2"} : (i1, i1, i1, i1) -> i1
    %net_61932 = "sky130.cell"(%net_59547, %net_61618, %net_61890, %net_59529, %net_59559) {input_pins = "A1|A2|A3|B1|B2", inst = 7832, model = "o32a", output_pins = "X", source_cell = "o32a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_61559 = "sky130.cell"(%net_59547, %net_61618, %net_59552, %net_59559, %net_59473) {input_pins = "A1|A2|A3|B1|B2", inst = 8011, model = "o32a", output_pins = "X", source_cell = "o32a_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_61537 = "sky130.cell"(%net_61781, %net_61945, %net_61623) {input_pins = "A1|A2|B1_N", inst = 9043, model = "a21bo", output_pins = "X", source_cell = "a21bo_2"} : (i1, i1, i1) -> i1
    %net_61515 = "sky130.cell"(%net_59547, %net_59462, %net_61850, %net_61942, %net_61623) {input_pins = "A1|A2|A3|B1|B2", inst = 9046, model = "a32o", output_pins = "X", source_cell = "a32o_2"} : (i1, i1, i1, i1, i1) -> i1
    %net_61549 = "sky130.cell"(%net_61567, %net_61724, %net_61548) {input_pins = "A|B|C", inst = 6984, model = "or3", output_pins = "X", source_cell = "or3_2"} : (i1, i1, i1) -> i1
    %net_62076 = "sky130.cell"(%net_61543, %net_59471, %net_59467, %net_61581) {input_pins = "A1|A2|B1|C1", inst = 7563, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_61611 = "sky130.cell"(%net_61561, %net_61559, %net_59525) {input_pins = "A1|A2|B1", inst = 7764, model = "o21ai", output_pins = "Y", source_cell = "o21ai_2"} : (i1, i1, i1) -> i1
    %net_61607 = "sky130.cell"(%net_61932, %net_59474, %net_61561) {input_pins = "A0|A1|S", inst = 7819, model = "mux2", output_pins = "X", source_cell = "mux2_1"} : (i1, i1, i1) -> i1
    %net_61544 = "sky130.cell"(%net_61561, %net_61537, %net_61538, %net_61543) {input_pins = "A1|A2|A3|B1", inst = 7820, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_61290 = "sky130.cell"(%net_59570, %net_61544, %net_61581, %net_61549) {input_pins = "A1|A2|B1|C1", inst = 7824, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_61569 = "sky130.cell"(%net_61561, %net_61515, %net_59475, %net_61567) {input_pins = "A1|A2|B1|C1", inst = 7914, model = "a211o", output_pins = "X", source_cell = "a211o_2"} : (i1, i1, i1, i1) -> i1
    %net_61338 = "sky130.cell"(%net_61543, %net_61607, %net_61569, %net_61581) {input_pins = "A1|A2|B1|C1", inst = 6978, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_61480 = "sky130.cell"(%net_61543, %net_61611, %net_61608, %net_61581) {input_pins = "A1|A2|B1|C1", inst = 6987, model = "o211a", output_pins = "X", source_cell = "o211a_2"} : (i1, i1, i1, i1) -> i1
    %net_61323 = "sky130.cell"(%net_61290, %net_61338, %net_61480, %net_62076) {input_pins = "A_N|B_N|C|D", inst = 8213, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_47919 = "sky130.cell"(%input_I, %net_58922, %net_61323, %state_8219) {input_pins = "A1|A2|A3|B1", inst = 8275, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_61314 = "sky130.cell"(%net_62076, %net_61338, %net_61480, %net_61290) {input_pins = "A_N|B_N|C|D", inst = 8428, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_59418 = "sky130.cell"(%net_62076, %net_61290, %net_61338, %net_61480) {input_pins = "A|B|C|D_N", inst = 8437, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_61307 = "sky130.cell"(%state_8085, %net_61395, %net_59418, %net_61398) {input_pins = "A|B|C|D", inst = 8461, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_61399 = "sky130.cell"(%net_59418, %net_61398) {input_pins = "A|B", inst = 8490, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61422 = "sky130.cell"(%net_61290, %net_61338, %net_61480, %net_62076) {input_pins = "A|B|C|D_N", inst = 8579, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_61491 = "sky130.cell"(%net_62076, %net_61290, %net_61338, %net_61480) {input_pins = "A|B|C|D", inst = 8592, model = "nor4", output_pins = "Y", source_cell = "nor4_2"} : (i1, i1, i1, i1) -> i1
    %net_61432 = "sky130.cell"(%net_61338, %net_61480, %net_61290, %net_62076) {input_pins = "A_N|B_N|C|D", inst = 8597, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_61408 = "sky130.cell"(%net_62076, %net_61338, %net_61480, %net_61290) {input_pins = "A|B|C|D_N", inst = 8604, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_49732 = "sky130.cell"(%net_61408, %net_61409) {input_pins = "A|B", inst = 8620, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61410 = "sky130.cell"(%state_8591, %net_61406, %net_61408, %net_61409) {input_pins = "A|B|C|D", inst = 8711, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_61493 = "sky130.cell"(%input_I, %net_58922, %net_61491, %state_8815) {input_pins = "A1|A2|A3|B1", inst = 8741, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_61427 = "sky130.cell"(%net_61422, %net_61426) {input_pins = "A|B", inst = 8771, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61235 = "sky130.cell"(%net_61290, %net_61480, %net_61338, %net_62076) {input_pins = "A_N|B_N|C|D", inst = 2563, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_59679 = "sky130.cell"(%input_I, %net_58922, %state_2574, %net_61235) {input_pins = "A|B|C|D", inst = 2622, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_59419 = "sky130.cell"(%net_62076, %net_61290, %net_61480, %net_61338) {input_pins = "A|B|C|D_N", inst = 2671, model = "or4b", output_pins = "X", source_cell = "or4b_2"} : (i1, i1, i1, i1) -> i1
    %net_61258 = "sky130.cell"(%net_62076, %net_61480, %net_61338, %net_61290) {input_pins = "A_N|B_N|C|D", inst = 2706, model = "and4bb", output_pins = "X", source_cell = "and4bb_2"} : (i1, i1, i1, i1) -> i1
    %net_61244 = "sky130.cell"(%net_61338, %net_61480, %net_61290, %net_62076) {input_pins = "A_N|B|C|D", inst = 2707, model = "and4b", output_pins = "X", source_cell = "and4b_2"} : (i1, i1, i1, i1) -> i1
    %net_61246 = "sky130.cell"(%input_I, %net_58922, %state_2709, %net_61244) {input_pins = "A|B|C|D", inst = 2717, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_61259 = "sky130.cell"(%input_I, %net_58922, %state_2542, %net_61258) {input_pins = "A|B|C|D", inst = 2782, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_61434 = "sky130.cell"(%input_I, %net_58922, %net_61432, %state_8095) {input_pins = "A1|A2|A3|B1", inst = 8099, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_61065 = "sky130.cell"(%state_8092, %net_61427, %state_8431) {input_pins = "A1|A2|B1", inst = 8103, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_59457 = "sky130.cell"(%state_8431, %net_61066, %net_61422, %net_61426) {input_pins = "A|B|C|D", inst = 8108, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_61393 = "sky130.cell"(%state_8199, %net_61399, %net_61307) {input_pins = "A1|A2|B1", inst = 8192, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_47080 = "sky130.cell"(%state_8199, %net_61399, %state_8085) {input_pins = "A1|A2|B1", inst = 8196, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_61315 = "sky130.cell"(%input_I, %net_58922, %net_61314, %state_8214) {input_pins = "A1|A2|A3|B1", inst = 8200, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_46300 = "sky130.cell"(%state_8091, %net_61246) {input_pins = "A_N|B", inst = 8202, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61067 = "sky130.cell"(%input_I, %net_58922, %state_8095, %net_61432) {input_pins = "A|B|C|D", inst = 8203, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_61346 = "sky130.cell"(%input_I, %net_58922, %state_8219, %net_61323) {input_pins = "A|B|C|D", inst = 8212, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_61322 = "sky130.cell"(%state_8086, %net_61346) {input_pins = "A_N|B", inst = 8215, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61317 = "sky130.cell"(%input_I, %net_58922, %state_8214, %net_61314) {input_pins = "A|B|C|D", inst = 8427, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_61494 = "sky130.cell"(%input_I, %net_58922, %state_8815, %net_61491) {input_pins = "A|B|C|D", inst = 8581, model = "nand4", output_pins = "Y", source_cell = "nand4_2"} : (i1, i1, i1, i1) -> i1
    %net_61405 = "sky130.cell"(%state_8602, %net_49732, %state_8591) {input_pins = "A1|A2|B1", inst = 8583, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_61404 = "sky130.cell"(%state_8602, %net_49732, %net_61410) {input_pins = "A1|A2|B1", inst = 8600, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61416 = "sky130.cell"(%state_8092, %net_61427, %net_59457) {input_pins = "A1|A2|B1", inst = 8658, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61430 = "sky130.cell"(%state_8429, %net_61067, %net_61434) {input_pins = "A1|A2|B1", inst = 8695, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61489 = "sky130.cell"(%state_8084, %net_61494, %net_61493) {input_pins = "A1|A2|B1", inst = 8867, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61490 = "sky130.cell"(%state_8084, %net_61494) {input_pins = "A_N|B", inst = 8881, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_772 = "sky130.cell"(%input_I, %net_58922, %net_61244, %state_2709) {input_pins = "A1|A2|A3|B1", inst = 72, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_61243 = "sky130.cell"(%state_8091, %net_61246, %net_772) {input_pins = "A1|A2|B1", inst = 75, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61254 = "sky130.cell"(%net_59419, %net_61252) {input_pins = "A|B", inst = 2298, model = "nor2", output_pins = "Y", source_cell = "nor2_2"} : (i1, i1) -> i1
    %net_61257 = "sky130.cell"(%state_2299, %net_61259) {input_pins = "A_N|B", inst = 2302, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61247 = "sky130.cell"(%state_2708, %net_61254, %state_2710) {input_pins = "A1|A2|B1", inst = 2543, model = "a21o", output_pins = "X", source_cell = "a21o_2"} : (i1, i1, i1) -> i1
    %net_15360 = "sky130.cell"(%input_I, %net_58922, %net_61258, %state_2542) {input_pins = "A1|A2|A3|B1", inst = 2544, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_61255 = "sky130.cell"(%state_2710, %net_61248, %net_59419, %net_61252) {input_pins = "A|B|C|D", inst = 2552, model = "or4", output_pins = "X", source_cell = "or4_2"} : (i1, i1, i1, i1) -> i1
    %net_61236 = "sky130.cell"(%input_I, %net_58922, %net_61235, %state_2574) {input_pins = "A1|A2|A3|B1", inst = 2553, model = "a31o", output_pins = "X", source_cell = "a31o_2"} : (i1, i1, i1, i1) -> i1
    %net_59678 = "sky130.cell"(%state_2301, %net_59679) {input_pins = "A_N|B", inst = 2572, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61256 = "sky130.cell"(%state_2299, %net_61259, %net_15360) {input_pins = "A1|A2|B1", inst = 2740, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_47603 = "sky130.cell"(%state_8090, %net_61317, %net_61315) {input_pins = "A1|A2|B1", inst = 8190, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61391 = "sky130.cell"(%state_8429, %net_61067) {input_pins = "A_N|B", inst = 8201, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_61321 = "sky130.cell"(%state_8086, %net_61346, %net_47919) {input_pins = "A1|A2|B1", inst = 8211, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_61308 = "sky130.cell"(%state_8090, %net_61317) {input_pins = "A_N|B", inst = 8321, model = "nand2b", output_pins = "Y", source_cell = "nand2b_2"} : (i1, i1) -> i1
    %net_57556 = "sky130.cell"(%state_2301, %net_59679, %net_61236) {input_pins = "A1|A2|B1", inst = 2540, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %net_15399 = "sky130.cell"(%state_2708, %net_61254, %net_61255) {input_pins = "A1|A2|B1", inst = 2548, model = "o21a", output_pins = "X", source_cell = "o21a_2"} : (i1, i1, i1) -> i1
    %next_226 = "sky130.cell"(%net_59787, %net_59861, %input_rst_n, %state_226) {input_pins = "D|CLK|RESET_B", inst = 226, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_227 = "sky130.cell"(%net_59788, %net_59861, %input_rst_n, %state_227) {input_pins = "D|CLK|RESET_B", inst = 227, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_228 = "sky130.cell"(%net_59786, %net_59861, %input_rst_n, %state_228) {input_pins = "D|CLK|RESET_B", inst = 228, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_234 = "sky130.cell"(%net_59869, %net_58934, %state_234) {input_pins = "D|CLK", inst = 234, model = "dfxtp", output_pins = "Q", source_cell = "dfxtp_2", state_pin = "Q"} : (i1, i1, i1) -> i1
    %next_235 = "sky130.cell"(%net_59866, %net_59861, %state_235) {input_pins = "D|CLK", inst = 235, model = "dfxtp", output_pins = "Q", source_cell = "dfxtp_2", state_pin = "Q"} : (i1, i1, i1) -> i1
    %next_236 = "sky130.cell"(%net_59740, %net_59861, %state_236) {input_pins = "D|CLK", inst = 236, model = "dfxtp", output_pins = "Q", source_cell = "dfxtp_2", state_pin = "Q"} : (i1, i1, i1) -> i1
    %next_237 = "sky130.cell"(%net_59870, %net_58934, %state_237) {input_pins = "D|CLK", inst = 237, model = "dfxtp", output_pins = "Q", source_cell = "dfxtp_2", state_pin = "Q"} : (i1, i1, i1) -> i1
    %next_1228 = "sky130.cell"(%net_11333, %net_59680, %input_rst_n, %state_1228) {input_pins = "D|CLK|RESET_B", inst = 1228, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1229 = "sky130.cell"(%net_60125, %net_59680, %input_rst_n, %state_1229) {input_pins = "D|CLK|RESET_B", inst = 1229, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1230 = "sky130.cell"(%net_60050, %net_60051, %input_rst_n, %state_1230) {input_pins = "D|CLK|RESET_B", inst = 1230, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1249 = "sky130.cell"(%net_60176, %net_59680, %input_rst_n, %state_1249) {input_pins = "D|CLK|RESET_B", inst = 1249, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1250 = "sky130.cell"(%net_60219, %net_58934, %input_rst_n, %state_1250) {input_pins = "D|CLK|RESET_B", inst = 1250, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1258 = "sky130.cell"(%net_10354, %net_60051, %input_rst_n, %state_1258) {input_pins = "D|CLK|RESET_B", inst = 1258, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1259 = "sky130.cell"(%net_60011, %net_59972, %input_rst_n, %state_1259) {input_pins = "D|CLK|RESET_B", inst = 1259, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1260 = "sky130.cell"(%net_59974, %net_59972, %input_rst_n, %state_1260) {input_pins = "D|CLK|RESET_B", inst = 1260, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1261 = "sky130.cell"(%net_59994, %net_59972, %input_rst_n, %state_1261) {input_pins = "D|CLK|RESET_B", inst = 1261, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1264 = "sky130.cell"(%net_60116, %net_59680, %input_rst_n, %state_1264) {input_pins = "D|CLK|RESET_B", inst = 1264, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1383 = "sky130.cell"(%net_59962, %net_59972, %input_rst_n, %state_1383) {input_pins = "D|CLK|RESET_B", inst = 1383, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1384 = "sky130.cell"(%net_55469, %net_60051, %input_rst_n, %state_1384) {input_pins = "D|CLK|RESET_B", inst = 1384, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1385 = "sky130.cell"(%net_59975, %net_60051, %input_rst_n, %state_1385) {input_pins = "D|CLK|RESET_B", inst = 1385, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1626 = "sky130.cell"(%net_60025, %net_59972, %input_rst_n, %state_1626) {input_pins = "D|CLK|RESET_B", inst = 1626, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1808 = "sky130.cell"(%net_60085, %net_60051, %input_rst_n, %state_1808) {input_pins = "D|CLK|RESET_B", inst = 1808, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1809 = "sky130.cell"(%net_60124, %net_59680, %input_rst_n, %state_1809) {input_pins = "D|CLK|RESET_B", inst = 1809, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1810 = "sky130.cell"(%net_60074, %net_59972, %input_rst_n, %state_1810) {input_pins = "D|CLK|RESET_B", inst = 1810, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2036 = "sky130.cell"(%net_59703, %net_59680, %input_rst_n, %state_2036) {input_pins = "D|CLK|RESET_B", inst = 2036, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2037 = "sky130.cell"(%net_58883, %net_58934, %input_rst_n, %state_2037) {input_pins = "D|CLK|RESET_B", inst = 2037, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2039 = "sky130.cell"(%net_60221, %net_58934, %input_rst_n, %state_2039) {input_pins = "D|CLK|RESET_B", inst = 2039, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2293 = "sky130.cell"(%net_60259, %net_60712, %input_rst_n, %state_2293) {input_pins = "D|CLK|RESET_B", inst = 2293, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2299 = "sky130.cell"(%net_61257, %net_58933, %input_rst_n, %state_2299) {input_pins = "D|CLK|RESET_B", inst = 2299, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2301 = "sky130.cell"(%net_59678, %net_58933, %input_rst_n, %state_2301) {input_pins = "D|CLK|RESET_B", inst = 2301, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2372 = "sky130.cell"(%net_60232, %net_60712, %input_rst_n, %state_2372) {input_pins = "D|CLK|RESET_B", inst = 2372, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2542 = "sky130.cell"(%net_61256, %net_58933, %input_rst_n, %state_2542) {input_pins = "D|CLK|RESET_B", inst = 2542, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2574 = "sky130.cell"(%net_57556, %net_60712, %input_rst_n, %state_2574) {input_pins = "D|CLK|RESET_B", inst = 2574, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2708 = "sky130.cell"(%net_15399, %net_58933, %input_rst_n, %state_2708) {input_pins = "D|CLK|RESET_B", inst = 2708, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2709 = "sky130.cell"(%net_61243, %net_61273, %input_rst_n, %state_2709) {input_pins = "D|CLK|RESET_B", inst = 2709, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2710 = "sky130.cell"(%net_61247, %net_58933, %input_rst_n, %state_2710) {input_pins = "D|CLK|RESET_B", inst = 2710, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2944 = "sky130.cell"(%net_60500, %net_60584, %input_rst_n, %state_2944) {input_pins = "D|CLK|RESET_B", inst = 2944, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2946 = "sky130.cell"(%net_55991, %net_60584, %input_rst_n, %state_2946) {input_pins = "D|CLK|RESET_B", inst = 2946, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2947 = "sky130.cell"(%net_60593, %net_58933, %input_rst_n, %state_2947) {input_pins = "D|CLK|RESET_B", inst = 2947, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2948 = "sky130.cell"(%net_58969, %net_60584, %input_rst_n, %state_2948) {input_pins = "D|CLK|RESET_B", inst = 2948, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2957 = "sky130.cell"(%net_58968, %net_60584, %input_rst_n, %state_2957) {input_pins = "D|CLK|SET_B", inst = 2957, model = "dfstp", output_pins = "Q", source_cell = "dfstp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2958 = "sky130.cell"(%net_60511, %net_60584, %input_rst_n, %state_2958) {input_pins = "D|CLK|SET_B", inst = 2958, model = "dfstp", output_pins = "Q", source_cell = "dfstp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2959 = "sky130.cell"(%net_60474, %net_58934, %input_rst_n, %state_2959) {input_pins = "D|CLK|SET_B", inst = 2959, model = "dfstp", output_pins = "Q", source_cell = "dfstp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2960 = "sky130.cell"(%net_18859, %net_60584, %input_rst_n, %state_2960) {input_pins = "D|CLK|SET_B", inst = 2960, model = "dfstp", output_pins = "Q", source_cell = "dfstp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4182 = "sky130.cell"(%net_60669, %net_60712, %input_rst_n, %state_4182) {input_pins = "D|CLK|RESET_B", inst = 4182, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4659 = "sky130.cell"(%net_60895, %net_59597, %input_rst_n, %state_4659) {input_pins = "D|CLK|RESET_B", inst = 4659, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4661 = "sky130.cell"(%net_60662, %net_59597, %input_rst_n, %state_4661) {input_pins = "D|CLK|RESET_B", inst = 4661, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4662 = "sky130.cell"(%net_60661, %net_59597, %input_rst_n, %state_4662) {input_pins = "D|CLK|RESET_B", inst = 4662, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4838 = "sky130.cell"(%net_59641, %net_59597, %input_rst_n, %state_4838) {input_pins = "D|CLK|RESET_B", inst = 4838, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4993 = "sky130.cell"(%net_60816, %net_60711, %input_rst_n, %state_4993) {input_pins = "D|CLK|RESET_B", inst = 4993, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5000 = "sky130.cell"(%net_60707, %net_60712, %input_rst_n, %state_5000) {input_pins = "D|CLK|RESET_B", inst = 5000, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5004 = "sky130.cell"(%net_59627, %net_59597, %input_rst_n, %state_5004) {input_pins = "D|CLK|RESET_B", inst = 5004, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5093 = "sky130.cell"(%net_60709, %net_60712, %input_rst_n, %state_5093) {input_pins = "D|CLK|RESET_B", inst = 5093, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5336 = "sky130.cell"(%net_31405, %net_60711, %input_rst_n, %state_5336) {input_pins = "D|CLK|RESET_B", inst = 5336, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5337 = "sky130.cell"(%net_60713, %net_60711, %input_rst_n, %state_5337) {input_pins = "D|CLK|RESET_B", inst = 5337, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5339 = "sky130.cell"(%net_60818, %net_60711, %input_rst_n, %state_5339) {input_pins = "D|CLK|RESET_B", inst = 5339, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5342 = "sky130.cell"(%net_59628, %net_61273, %input_rst_n, %state_5342) {input_pins = "D|CLK|RESET_B", inst = 5342, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5343 = "sky130.cell"(%net_31922, %net_61273, %input_rst_n, %state_5343) {input_pins = "D|CLK|RESET_B", inst = 5343, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5344 = "sky130.cell"(%net_31556, %net_61273, %input_rst_n, %state_5344) {input_pins = "D|CLK|RESET_B", inst = 5344, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5399 = "sky130.cell"(%net_60710, %net_60711, %input_rst_n, %state_5399) {input_pins = "D|CLK|RESET_B", inst = 5399, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5401 = "sky130.cell"(%net_60708, %net_59597, %input_rst_n, %state_5401) {input_pins = "D|CLK|RESET_B", inst = 5401, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5569 = "sky130.cell"(%net_60817, %net_61273, %input_rst_n, %state_5569) {input_pins = "D|CLK|RESET_B", inst = 5569, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5634 = "sky130.cell"(%net_33251, %net_60892, %input_rst_n, %state_5634) {input_pins = "D|CLK|RESET_B", inst = 5634, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5638 = "sky130.cell"(%net_60832, %net_60892, %input_rst_n, %state_5638) {input_pins = "D|CLK|RESET_B", inst = 5638, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5639 = "sky130.cell"(%net_60833, %net_60892, %input_rst_n, %state_5639) {input_pins = "D|CLK|RESET_B", inst = 5639, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6095 = "sky130.cell"(%net_60962, %net_60923, %input_rst_n, %state_6095) {input_pins = "D|CLK|RESET_B", inst = 6095, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6106 = "sky130.cell"(%net_60929, %net_60923, %input_rst_n, %state_6106) {input_pins = "D|CLK|RESET_B", inst = 6106, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6109 = "sky130.cell"(%net_60928, %net_61420, %input_rst_n, %state_6109) {input_pins = "D|CLK|RESET_B", inst = 6109, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6111 = "sky130.cell"(%net_61008, %net_61420, %input_rst_n, %state_6111) {input_pins = "D|CLK|RESET_B", inst = 6111, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6159 = "sky130.cell"(%net_60964, %net_61420, %input_rst_n, %state_6159) {input_pins = "D|CLK|RESET_B", inst = 6159, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6197 = "sky130.cell"(%net_35962, %net_60923, %input_rst_n, %state_6197) {input_pins = "D|CLK|RESET_B", inst = 6197, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6198 = "sky130.cell"(%net_61044, %net_60923, %input_rst_n, %state_6198) {input_pins = "D|CLK|RESET_B", inst = 6198, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6199 = "sky130.cell"(%net_60963, %net_60923, %input_rst_n, %state_6199) {input_pins = "D|CLK|RESET_B", inst = 6199, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6435 = "sky130.cell"(%net_60901, %net_60892, %input_rst_n, %state_6435) {input_pins = "D|CLK|RESET_B", inst = 6435, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6436 = "sky130.cell"(%net_60900, %net_60892, %input_rst_n, %state_6436) {input_pins = "D|CLK|RESET_B", inst = 6436, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6442 = "sky130.cell"(%net_60898, %net_60923, %input_rst_n, %state_6442) {input_pins = "D|CLK|RESET_B", inst = 6442, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6451 = "sky130.cell"(%net_60899, %net_60892, %input_rst_n, %state_6451) {input_pins = "D|CLK|RESET_B", inst = 6451, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8084 = "sky130.cell"(%net_61490, %net_61329, %input_rst_n, %state_8084) {input_pins = "D|CLK|RESET_B", inst = 8084, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8085 = "sky130.cell"(%net_47080, %net_61329, %input_rst_n, %state_8085) {input_pins = "D|CLK|RESET_B", inst = 8085, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8086 = "sky130.cell"(%net_61322, %net_61349, %input_rst_n, %state_8086) {input_pins = "D|CLK|RESET_B", inst = 8086, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8090 = "sky130.cell"(%net_61308, %net_61349, %input_rst_n, %state_8090) {input_pins = "D|CLK|RESET_B", inst = 8090, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8091 = "sky130.cell"(%net_46300, %net_61273, %input_rst_n, %state_8091) {input_pins = "D|CLK|RESET_B", inst = 8091, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8092 = "sky130.cell"(%net_61416, %net_61329, %input_rst_n, %state_8092) {input_pins = "D|CLK|RESET_B", inst = 8092, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8095 = "sky130.cell"(%net_61430, %net_61420, %input_rst_n, %state_8095) {input_pins = "D|CLK|RESET_B", inst = 8095, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8199 = "sky130.cell"(%net_61393, %net_61349, %input_rst_n, %state_8199) {input_pins = "D|CLK|RESET_B", inst = 8199, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8214 = "sky130.cell"(%net_47603, %net_61349, %input_rst_n, %state_8214) {input_pins = "D|CLK|RESET_B", inst = 8214, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8219 = "sky130.cell"(%net_61321, %net_61349, %input_rst_n, %state_8219) {input_pins = "D|CLK|RESET_B", inst = 8219, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8429 = "sky130.cell"(%net_61391, %net_61420, %input_rst_n, %state_8429) {input_pins = "D|CLK|RESET_B", inst = 8429, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8431 = "sky130.cell"(%net_61065, %net_61329, %input_rst_n, %state_8431) {input_pins = "D|CLK|RESET_B", inst = 8431, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8591 = "sky130.cell"(%net_61405, %net_61420, %input_rst_n, %state_8591) {input_pins = "D|CLK|RESET_B", inst = 8591, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8602 = "sky130.cell"(%net_61404, %net_61329, %input_rst_n, %state_8602) {input_pins = "D|CLK|RESET_B", inst = 8602, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8815 = "sky130.cell"(%net_61489, %net_61329, %input_rst_n, %state_8815) {input_pins = "D|CLK|RESET_B", inst = 8815, model = "dfrtp", output_pins = "Q", source_cell = "dfrtp_2", state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    return %next_226, %next_227, %next_228, %next_234, %next_235, %next_236, %next_237, %next_1228, %next_1229, %next_1230, %next_1249, %next_1250, %next_1258, %next_1259, %next_1260, %next_1261, %next_1264, %next_1383, %next_1384, %next_1385, %next_1626, %next_1808, %next_1809, %next_1810, %next_2036, %next_2037, %next_2039, %next_2293, %next_2299, %next_2301, %next_2372, %next_2542, %next_2574, %next_2708, %next_2709, %next_2710, %next_2944, %next_2946, %next_2947, %next_2948, %next_2957, %next_2958, %next_2959, %next_2960, %next_4182, %next_4659, %next_4661, %next_4662, %next_4838, %next_4993, %next_5000, %next_5004, %next_5093, %next_5336, %next_5337, %next_5339, %next_5342, %next_5343, %next_5344, %next_5399, %next_5401, %next_5569, %next_5634, %next_5638, %next_5639, %next_6095, %next_6106, %next_6109, %next_6111, %next_6159, %next_6197, %next_6198, %next_6199, %next_6435, %next_6436, %next_6442, %next_6451, %next_8084, %next_8085, %next_8086, %next_8090, %next_8091, %next_8092, %next_8095, %next_8199, %next_8214, %next_8219, %next_8429, %next_8431, %next_8591, %next_8602, %next_8815, %state_228, %net_62057, %net_58926, %net_62059, %net_59372, %net_59371, %net_62062, %net_62063, %net_62064 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}
