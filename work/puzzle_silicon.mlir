module {
  func.func @step(%input_I: i1, %input_clk: i1, %input_enable: i1, %input_rst_n: i1, %input_undriven_61217: i1, %state_226: i1, %state_227: i1, %state_228: i1, %state_234: i1, %state_235: i1, %state_236: i1, %state_237: i1, %state_1228: i1, %state_1229: i1, %state_1230: i1, %state_1249: i1, %state_1250: i1, %state_1258: i1, %state_1259: i1, %state_1260: i1, %state_1261: i1, %state_1264: i1, %state_1383: i1, %state_1384: i1, %state_1385: i1, %state_1626: i1, %state_1808: i1, %state_1809: i1, %state_1810: i1, %state_2036: i1, %state_2037: i1, %state_2039: i1, %state_2293: i1, %state_2299: i1, %state_2301: i1, %state_2372: i1, %state_2542: i1, %state_2574: i1, %state_2708: i1, %state_2709: i1, %state_2710: i1, %state_2944: i1, %state_2946: i1, %state_2947: i1, %state_2948: i1, %state_2957: i1, %state_2958: i1, %state_2959: i1, %state_2960: i1, %state_4182: i1, %state_4659: i1, %state_4661: i1, %state_4662: i1, %state_4838: i1, %state_4993: i1, %state_5000: i1, %state_5004: i1, %state_5093: i1, %state_5336: i1, %state_5337: i1, %state_5339: i1, %state_5342: i1, %state_5343: i1, %state_5344: i1, %state_5399: i1, %state_5401: i1, %state_5569: i1, %state_5634: i1, %state_5638: i1, %state_5639: i1, %state_6095: i1, %state_6106: i1, %state_6109: i1, %state_6111: i1, %state_6159: i1, %state_6197: i1, %state_6198: i1, %state_6199: i1, %state_6435: i1, %state_6436: i1, %state_6442: i1, %state_6451: i1, %state_8084: i1, %state_8085: i1, %state_8086: i1, %state_8090: i1, %state_8091: i1, %state_8092: i1, %state_8095: i1, %state_8199: i1, %state_8214: i1, %state_8219: i1, %state_8429: i1, %state_8431: i1, %state_8591: i1, %state_8602: i1, %state_8815: i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    "silicon.meta"() {clock_edge = "posedge", clock_port = "clk", input_args = "input_I|input_clk|input_enable|input_rst_n|input_undriven_61217", input_names = "I|clk|enable|rst_n|undriven_61217", layer = "silicon", model_sha256 = "6dad839547f2de43963b7d21e9e91ea8870f5d870650376a242e5bbd135229ef", module = "puzzle", observation = "pre_edge", output_names = "success|O[0]|O[1]|O[2]|O[3]|O[4]|O[5]|O[6]|O[7]", output_values = "state_228|i222_1|i1046_1|i223_1|i350_1|i305_1|i230_1|i553_1|i229_1", profile = "IND-1", source_sha256 = "350e998acd33575df3b8872870fef15813975e6d9b05e30744ab750cce524401", state_args = "state_226|state_227|state_228|state_234|state_235|state_236|state_237|state_1228|state_1229|state_1230|state_1249|state_1250|state_1258|state_1259|state_1260|state_1261|state_1264|state_1383|state_1384|state_1385|state_1626|state_1808|state_1809|state_1810|state_2036|state_2037|state_2039|state_2293|state_2299|state_2301|state_2372|state_2542|state_2574|state_2708|state_2709|state_2710|state_2944|state_2946|state_2947|state_2948|state_2957|state_2958|state_2959|state_2960|state_4182|state_4659|state_4661|state_4662|state_4838|state_4993|state_5000|state_5004|state_5093|state_5336|state_5337|state_5339|state_5342|state_5343|state_5344|state_5399|state_5401|state_5569|state_5634|state_5638|state_5639|state_6095|state_6106|state_6109|state_6111|state_6159|state_6197|state_6198|state_6199|state_6435|state_6436|state_6442|state_6451|state_8084|state_8085|state_8086|state_8090|state_8091|state_8092|state_8095|state_8199|state_8214|state_8219|state_8429|state_8431|state_8591|state_8602|state_8815", state_ids = "226|227|228|234|235|236|237|1228|1229|1230|1249|1250|1258|1259|1260|1261|1264|1383|1384|1385|1626|1808|1809|1810|2036|2037|2039|2293|2299|2301|2372|2542|2574|2708|2709|2710|2944|2946|2947|2948|2957|2958|2959|2960|4182|4659|4661|4662|4838|4993|5000|5004|5093|5336|5337|5339|5342|5343|5344|5399|5401|5569|5634|5638|5639|6095|6106|6109|6111|6159|6197|6198|6199|6435|6436|6442|6451|8084|8085|8086|8090|8091|8092|8095|8199|8214|8219|8429|8431|8591|8602|8815"} : () -> ()
    %net_22981 = "silicon.const"() {inst = 3857, source_pin = "HI", value = 1} : () -> i1
    %net_59709 = "silicon.const"() {inst = 3857, source_pin = "LO", value = 0} : () -> i1
    %net_23231 = "silicon.const"() {inst = 3931, source_pin = "HI", value = 1} : () -> i1
    %net_58945 = "silicon.const"() {inst = 3931, source_pin = "LO", value = 0} : () -> i1
    %net_23666 = "silicon.const"() {inst = 4022, source_pin = "HI", value = 1} : () -> i1
    %net_58766 = "silicon.const"() {inst = 4022, source_pin = "LO", value = 0} : () -> i1
    %net_60777 = "silicon.const"() {inst = 5765, source_pin = "HI", value = 1} : () -> i1
    %net_33532 = "silicon.const"() {inst = 5765, source_pin = "LO", value = 0} : () -> i1
    %net_42096 = "silicon.const"() {inst = 7240, source_pin = "HI", value = 1} : () -> i1
    %net_58940 = "silicon.const"() {inst = 7240, source_pin = "LO", value = 0} : () -> i1
    %net_42364 = "silicon.const"() {inst = 7290, source_pin = "HI", value = 1} : () -> i1
    %net_58764 = "silicon.const"() {inst = 7290, source_pin = "LO", value = 0} : () -> i1
    %i67_0 = "silicon.and"(%state_235, %state_236) {inst = 67, source_primitive = "and"} : (i1, i1) -> i1
    %i67_1 = "silicon.or"(%i67_0, %state_234) {inst = 67, source_primitive = "nor"} : (i1, i1) -> i1
    %i67_2 = "silicon.or"(%i67_1, %state_237) {inst = 67, source_primitive = "nor"} : (i1, i1) -> i1
    %i67_3 = "silicon.not"(%i67_2) {inst = 67, source_primitive = "nor"} : (i1) -> i1
    %i202_0 = "silicon.xor"(%state_236, %state_235) {inst = 202, source_primitive = "xnor"} : (i1, i1) -> i1
    %i202_1 = "silicon.not"(%i202_0) {inst = 202, source_primitive = "xnor"} : (i1) -> i1
    %i240_0 = "silicon.xor"(%state_2944, %state_2946) {inst = 240, source_primitive = "xor"} : (i1, i1) -> i1
    %i353_0 = "silicon.and"(%state_235, %state_236) {inst = 353, source_primitive = "nand"} : (i1, i1) -> i1
    %i353_1 = "silicon.and"(%i353_0, %state_234) {inst = 353, source_primitive = "nand"} : (i1, i1) -> i1
    %i353_2 = "silicon.and"(%i353_1, %state_237) {inst = 353, source_primitive = "nand"} : (i1, i1) -> i1
    %i353_3 = "silicon.not"(%i353_2) {inst = 353, source_primitive = "nand"} : (i1) -> i1
    %i385_0 = "silicon.not"(%state_228) {inst = 385, source_primitive = "not"} : (i1) -> i1
    %i395_0 = "silicon.or"(%state_226, %state_4182) {inst = 395, source_primitive = "or"} : (i1, i1) -> i1
    %i406_0 = "silicon.not"(%state_4182) {inst = 406, source_primitive = "not"} : (i1) -> i1
    %i406_1 = "silicon.or"(%i406_0, %state_226) {inst = 406, source_primitive = "or"} : (i1, i1) -> i1
    %i494_0 = "silicon.and"(%state_236, %state_234) {inst = 494, source_primitive = "nand"} : (i1, i1) -> i1
    %i494_1 = "silicon.and"(%i494_0, %state_235) {inst = 494, source_primitive = "nand"} : (i1, i1) -> i1
    %i494_2 = "silicon.not"(%i494_1) {inst = 494, source_primitive = "nand"} : (i1) -> i1
    %i500_0 = "silicon.and"(%state_236, %state_235) {inst = 500, source_primitive = "and"} : (i1, i1) -> i1
    %i500_1 = "silicon.or"(%i500_0, %state_234) {inst = 500, source_primitive = "or"} : (i1, i1) -> i1
    %i608_0 = "silicon.or"(%i494_2, %state_237) {inst = 608, source_primitive = "or"} : (i1, i1) -> i1
    %i608_1 = "silicon.and"(%i608_0, %i500_1) {inst = 608, source_primitive = "and"} : (i1, i1) -> i1
    %i608_2 = "silicon.and"(%i608_1, %state_226) {inst = 608, source_primitive = "and"} : (i1, i1) -> i1
    %i624_0 = "silicon.not"(%state_237) {inst = 624, source_primitive = "not"} : (i1) -> i1
    %i1246_0 = "silicon.or"(%state_4662, %state_4661) {inst = 1246, source_primitive = "nor"} : (i1, i1) -> i1
    %i1246_1 = "silicon.not"(%i1246_0) {inst = 1246, source_primitive = "nor"} : (i1) -> i1
    %i1246_2 = "silicon.and"(%i1246_1, %state_4659) {inst = 1246, source_primitive = "and"} : (i1, i1) -> i1
    %i1246_3 = "silicon.and"(%i1246_2, %state_4838) {inst = 1246, source_primitive = "and"} : (i1, i1) -> i1
    %i1248_0 = "silicon.not"(%state_4661) {inst = 1248, source_primitive = "not"} : (i1) -> i1
    %i1248_1 = "silicon.and"(%i1248_0, %state_4659) {inst = 1248, source_primitive = "and"} : (i1, i1) -> i1
    %i1248_2 = "silicon.and"(%i1248_1, %state_4662) {inst = 1248, source_primitive = "and"} : (i1, i1) -> i1
    %i1248_3 = "silicon.and"(%i1248_2, %state_4838) {inst = 1248, source_primitive = "and"} : (i1, i1) -> i1
    %i1262_0 = "silicon.not"(%state_1259) {inst = 1262, source_primitive = "not"} : (i1) -> i1
    %i1262_1 = "silicon.and"(%i1262_0, %state_1383) {inst = 1262, source_primitive = "and"} : (i1, i1) -> i1
    %i1323_0 = "silicon.or"(%state_4662, %state_4659) {inst = 1323, source_primitive = "nor"} : (i1, i1) -> i1
    %i1323_1 = "silicon.not"(%i1323_0) {inst = 1323, source_primitive = "nor"} : (i1) -> i1
    %i1323_2 = "silicon.and"(%i1323_1, %state_4661) {inst = 1323, source_primitive = "and"} : (i1, i1) -> i1
    %i1323_3 = "silicon.and"(%i1323_2, %state_4838) {inst = 1323, source_primitive = "and"} : (i1, i1) -> i1
    %i1370_0 = "silicon.or"(%state_4838, %state_4659) {inst = 1370, source_primitive = "nor"} : (i1, i1) -> i1
    %i1370_1 = "silicon.not"(%i1370_0) {inst = 1370, source_primitive = "nor"} : (i1) -> i1
    %i1370_2 = "silicon.and"(%i1370_1, %state_4661) {inst = 1370, source_primitive = "and"} : (i1, i1) -> i1
    %i1370_3 = "silicon.and"(%i1370_2, %state_4662) {inst = 1370, source_primitive = "and"} : (i1, i1) -> i1
    %i1376_0 = "silicon.not"(%state_1258) {inst = 1376, source_primitive = "not"} : (i1) -> i1
    %i1376_1 = "silicon.and"(%i1376_0, %state_1626) {inst = 1376, source_primitive = "and"} : (i1, i1) -> i1
    %i1425_0 = "silicon.not"(%state_1261) {inst = 1425, source_primitive = "not"} : (i1) -> i1
    %i1451_0 = "silicon.not"(%state_4661) {inst = 1451, source_primitive = "not"} : (i1) -> i1
    %i1451_1 = "silicon.or"(%i1451_0, %state_4659) {inst = 1451, source_primitive = "or"} : (i1, i1) -> i1
    %i1451_2 = "silicon.or"(%i1451_1, %state_4662) {inst = 1451, source_primitive = "or"} : (i1, i1) -> i1
    %i1451_3 = "silicon.or"(%i1451_2, %state_4838) {inst = 1451, source_primitive = "or"} : (i1, i1) -> i1
    %i1560_0 = "silicon.and"(%state_1384, %i1425_0) {inst = 1560, source_primitive = "and"} : (i1, i1) -> i1
    %i1591_0 = "silicon.not"(%state_1260) {inst = 1591, source_primitive = "not"} : (i1) -> i1
    %i1591_1 = "silicon.and"(%i1591_0, %state_1385) {inst = 1591, source_primitive = "and"} : (i1, i1) -> i1
    %i1630_0 = "silicon.not"(%state_1230) {inst = 1630, source_primitive = "not"} : (i1) -> i1
    %i1630_1 = "silicon.and"(%i1630_0, %state_1810) {inst = 1630, source_primitive = "and"} : (i1, i1) -> i1
    %i1770_0 = "silicon.not"(%state_4838) {inst = 1770, source_primitive = "not"} : (i1) -> i1
    %i1770_1 = "silicon.or"(%i1770_0, %state_4659) {inst = 1770, source_primitive = "or"} : (i1, i1) -> i1
    %i1770_2 = "silicon.or"(%i1770_1, %state_4661) {inst = 1770, source_primitive = "or"} : (i1, i1) -> i1
    %i1770_3 = "silicon.or"(%i1770_2, %state_4662) {inst = 1770, source_primitive = "or"} : (i1, i1) -> i1
    %i1775_0 = "silicon.not"(%state_1228) {inst = 1775, source_primitive = "not"} : (i1) -> i1
    %i1775_1 = "silicon.and"(%i1775_0, %state_1808) {inst = 1775, source_primitive = "and"} : (i1, i1) -> i1
    %i1788_0 = "silicon.or"(%state_4661, %state_4659) {inst = 1788, source_primitive = "nor"} : (i1, i1) -> i1
    %i1788_1 = "silicon.not"(%i1788_0) {inst = 1788, source_primitive = "nor"} : (i1) -> i1
    %i1788_2 = "silicon.and"(%i1788_1, %state_4662) {inst = 1788, source_primitive = "and"} : (i1, i1) -> i1
    %i1788_3 = "silicon.and"(%i1788_2, %state_4838) {inst = 1788, source_primitive = "and"} : (i1, i1) -> i1
    %i1803_0 = "silicon.not"(%state_4659) {inst = 1803, source_primitive = "not"} : (i1) -> i1
    %i1803_1 = "silicon.or"(%i1803_0, %state_4661) {inst = 1803, source_primitive = "or"} : (i1, i1) -> i1
    %i1803_2 = "silicon.or"(%i1803_1, %state_4662) {inst = 1803, source_primitive = "or"} : (i1, i1) -> i1
    %i1803_3 = "silicon.or"(%i1803_2, %state_4838) {inst = 1803, source_primitive = "or"} : (i1, i1) -> i1
    %i1807_0 = "silicon.or"(%state_4838, %state_4661) {inst = 1807, source_primitive = "nor"} : (i1, i1) -> i1
    %i1807_1 = "silicon.not"(%i1807_0) {inst = 1807, source_primitive = "nor"} : (i1) -> i1
    %i1807_2 = "silicon.and"(%i1807_1, %state_4659) {inst = 1807, source_primitive = "and"} : (i1, i1) -> i1
    %i1807_3 = "silicon.and"(%i1807_2, %state_4662) {inst = 1807, source_primitive = "and"} : (i1, i1) -> i1
    %i1968_0 = "silicon.not"(%state_1809) {inst = 1968, source_primitive = "not"} : (i1) -> i1
    %i2012_0 = "silicon.not"(%state_2037) {inst = 2012, source_primitive = "not"} : (i1) -> i1
    %i2013_0 = "silicon.not"(%state_1250) {inst = 2013, source_primitive = "not"} : (i1) -> i1
    %i2107_0 = "silicon.not"(%state_1264) {inst = 2107, source_primitive = "not"} : (i1) -> i1
    %i2107_1 = "silicon.and"(%i2107_0, %state_2036) {inst = 2107, source_primitive = "and"} : (i1, i1) -> i1
    %i2364_0 = "silicon.not"(%state_2293) {inst = 2364, source_primitive = "not"} : (i1) -> i1
    %i2364_1 = "silicon.and"(%i2364_0, %state_2372) {inst = 2364, source_primitive = "and"} : (i1, i1) -> i1
    %i2365_0 = "silicon.or"(%state_4838, %state_4662) {inst = 2365, source_primitive = "nor"} : (i1, i1) -> i1
    %i2365_1 = "silicon.or"(%i2365_0, %state_4661) {inst = 2365, source_primitive = "nor"} : (i1, i1) -> i1
    %i2365_2 = "silicon.or"(%i2365_1, %state_4659) {inst = 2365, source_primitive = "nor"} : (i1, i1) -> i1
    %i2365_3 = "silicon.not"(%i2365_2) {inst = 2365, source_primitive = "nor"} : (i1) -> i1
    %i2396_0 = "silicon.not"(%state_4662) {inst = 2396, source_primitive = "not"} : (i1) -> i1
    %i2396_1 = "silicon.or"(%i2396_0, %state_4659) {inst = 2396, source_primitive = "or"} : (i1, i1) -> i1
    %i2396_2 = "silicon.or"(%i2396_1, %state_4661) {inst = 2396, source_primitive = "or"} : (i1, i1) -> i1
    %i2396_3 = "silicon.or"(%i2396_2, %state_4838) {inst = 2396, source_primitive = "or"} : (i1, i1) -> i1
    %i2555_0 = "silicon.not"(%state_2542) {inst = 2555, source_primitive = "not"} : (i1) -> i1
    %i2555_1 = "silicon.and"(%i2555_0, %state_2299) {inst = 2555, source_primitive = "and"} : (i1, i1) -> i1
    %i2571_0 = "silicon.not"(%state_2574) {inst = 2571, source_primitive = "not"} : (i1) -> i1
    %i2571_1 = "silicon.and"(%i2571_0, %state_2301) {inst = 2571, source_primitive = "and"} : (i1, i1) -> i1
    %i2711_0 = "silicon.not"(%state_2708) {inst = 2711, source_primitive = "not"} : (i1) -> i1
    %i2843_0 = "silicon.not"(%state_2709) {inst = 2843, source_primitive = "not"} : (i1) -> i1
    %i2843_1 = "silicon.and"(%i2843_0, %state_8091) {inst = 2843, source_primitive = "and"} : (i1, i1) -> i1
    %i2928_0 = "silicon.not"(%state_235) {inst = 2928, source_primitive = "not"} : (i1) -> i1
    %i2935_0 = "silicon.or"(%state_234, %state_236) {inst = 2935, source_primitive = "or"} : (i1, i1) -> i1
    %i2935_1 = "silicon.and"(%state_237, %i2935_0) {inst = 2935, source_primitive = "nand"} : (i1, i1) -> i1
    %i2935_2 = "silicon.not"(%i2935_1) {inst = 2935, source_primitive = "nand"} : (i1) -> i1
    %i2937_0 = "silicon.not"(%state_237) {inst = 2937, source_primitive = "not"} : (i1) -> i1
    %i2938_0 = "silicon.not"(%state_236) {inst = 2938, source_primitive = "not"} : (i1) -> i1
    %i2938_1 = "silicon.or"(%i2938_0, %state_235) {inst = 2938, source_primitive = "or"} : (i1, i1) -> i1
    %i2950_0 = "silicon.and"(%state_234, %state_235) {inst = 2950, source_primitive = "and"} : (i1, i1) -> i1
    %i2950_1 = "silicon.and"(%i2950_0, %state_236) {inst = 2950, source_primitive = "and"} : (i1, i1) -> i1
    %i2953_0 = "silicon.or"(%state_235, %state_234) {inst = 2953, source_primitive = "nor"} : (i1, i1) -> i1
    %i2953_1 = "silicon.not"(%i2953_0) {inst = 2953, source_primitive = "nor"} : (i1) -> i1
    %i2953_2 = "silicon.and"(%state_236, %i2953_1) {inst = 2953, source_primitive = "and"} : (i1, i1) -> i1
    %i2967_0 = "silicon.xor"(%state_2960, %state_2946) {inst = 2967, source_primitive = "xor"} : (i1, i1) -> i1
    %i3012_0 = "silicon.xor"(%state_2959, %i240_0) {inst = 3012, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3012_1 = "silicon.not"(%i3012_0) {inst = 3012, source_primitive = "xnor"} : (i1) -> i1
    %i3167_0 = "silicon.xor"(%state_2948, %state_2959) {inst = 3167, source_primitive = "xor"} : (i1, i1) -> i1
    %i3282_0 = "silicon.xor"(%state_2957, %state_2958) {inst = 3282, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3282_1 = "silicon.not"(%i3282_0) {inst = 3282, source_primitive = "xnor"} : (i1) -> i1
    %i3283_0 = "silicon.xor"(%i3282_1, %i240_0) {inst = 3283, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3283_1 = "silicon.not"(%i3283_0) {inst = 3283, source_primitive = "xnor"} : (i1) -> i1
    %i3287_0 = "silicon.not"(%state_236) {inst = 3287, source_primitive = "not"} : (i1) -> i1
    %i3287_1 = "silicon.or"(%state_234, %state_235) {inst = 3287, source_primitive = "or"} : (i1, i1) -> i1
    %i3287_2 = "silicon.or"(%i3287_1, %i3287_0) {inst = 3287, source_primitive = "or"} : (i1, i1) -> i1
    %i3289_0 = "silicon.xor"(%state_2948, %state_2946) {inst = 3289, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3289_1 = "silicon.not"(%i3289_0) {inst = 3289, source_primitive = "xnor"} : (i1) -> i1
    %i3295_0 = "silicon.xor"(%state_2958, %state_2960) {inst = 3295, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3295_1 = "silicon.not"(%i3295_0) {inst = 3295, source_primitive = "xnor"} : (i1) -> i1
    %i3296_0 = "silicon.xor"(%state_2944, %state_2957) {inst = 3296, source_primitive = "xor"} : (i1, i1) -> i1
    %i3478_0 = "silicon.not"(%state_235) {inst = 3478, source_primitive = "not"} : (i1) -> i1
    %i3478_1 = "silicon.or"(%i3478_0, %state_236) {inst = 3478, source_primitive = "or"} : (i1, i1) -> i1
    %i3484_0 = "silicon.not"(%state_235) {inst = 3484, source_primitive = "not"} : (i1) -> i1
    %i3484_1 = "silicon.and"(%i3484_0, %state_236) {inst = 3484, source_primitive = "and"} : (i1, i1) -> i1
    %i3531_0 = "silicon.or"(%state_235, %state_236) {inst = 3531, source_primitive = "nor"} : (i1, i1) -> i1
    %i3531_1 = "silicon.not"(%i3531_0) {inst = 3531, source_primitive = "nor"} : (i1) -> i1
    %i3533_0 = "silicon.or"(%state_234, %state_237) {inst = 3533, source_primitive = "nor"} : (i1, i1) -> i1
    %i3533_1 = "silicon.not"(%i3533_0) {inst = 3533, source_primitive = "nor"} : (i1) -> i1
    %i3576_0 = "silicon.and"(%state_237, %state_236) {inst = 3576, source_primitive = "nand"} : (i1, i1) -> i1
    %i3576_1 = "silicon.not"(%i3576_0) {inst = 3576, source_primitive = "nand"} : (i1) -> i1
    %i3669_0 = "silicon.not"(%state_237) {inst = 3669, source_primitive = "not"} : (i1) -> i1
    %i3685_0 = "silicon.or"(%state_235, %i3669_0) {inst = 3685, source_primitive = "nor"} : (i1, i1) -> i1
    %i3685_1 = "silicon.not"(%i3685_0) {inst = 3685, source_primitive = "nor"} : (i1) -> i1
    %i3701_0 = "silicon.and"(%state_236, %state_235) {inst = 3701, source_primitive = "nand"} : (i1, i1) -> i1
    %i3701_1 = "silicon.not"(%i3701_0) {inst = 3701, source_primitive = "nand"} : (i1) -> i1
    %i3703_0 = "silicon.or"(%i3685_1, %state_234) {inst = 3703, source_primitive = "or"} : (i1, i1) -> i1
    %i3703_1 = "silicon.or"(%i3703_0, %i3484_1) {inst = 3703, source_primitive = "or"} : (i1, i1) -> i1
    %i3703_2 = "silicon.and"(%i3703_1, %i3576_1) {inst = 3703, source_primitive = "and"} : (i1, i1) -> i1
    %i3715_0 = "silicon.or"(%state_234, %state_236) {inst = 3715, source_primitive = "or"} : (i1, i1) -> i1
    %i3816_0 = "silicon.not"(%i3531_1) {inst = 3816, source_primitive = "not"} : (i1) -> i1
    %i3816_1 = "silicon.and"(%i3816_0, %i3701_1) {inst = 3816, source_primitive = "and"} : (i1, i1) -> i1
    %i3852_0 = "silicon.not"(%state_236) {inst = 3852, source_primitive = "not"} : (i1) -> i1
    %i3852_1 = "silicon.and"(%i3852_0, %state_235) {inst = 3852, source_primitive = "and"} : (i1, i1) -> i1
    %i3873_0 = "silicon.or"(%state_235, %state_236) {inst = 3873, source_primitive = "nor"} : (i1, i1) -> i1
    %i3873_1 = "silicon.not"(%i3873_0) {inst = 3873, source_primitive = "nor"} : (i1) -> i1
    %i3900_0 = "silicon.and"(%state_234, %state_235) {inst = 3900, source_primitive = "and"} : (i1, i1) -> i1
    %i3900_1 = "silicon.and"(%i3900_0, %state_236) {inst = 3900, source_primitive = "and"} : (i1, i1) -> i1
    %i3978_0 = "silicon.and"(%state_235, %state_237) {inst = 3978, source_primitive = "and"} : (i1, i1) -> i1
    %i3978_1 = "silicon.or"(%state_234, %i3978_0) {inst = 3978, source_primitive = "nor"} : (i1, i1) -> i1
    %i3978_2 = "silicon.not"(%i3978_1) {inst = 3978, source_primitive = "nor"} : (i1) -> i1
    %i3980_0 = "silicon.mux"(%state_234, %state_237, %state_236) {inst = 3980, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i4002_0 = "silicon.not"(%state_237) {inst = 4002, source_primitive = "not"} : (i1) -> i1
    %i4002_1 = "silicon.and"(%state_236, %i4002_0) {inst = 4002, source_primitive = "and"} : (i1, i1) -> i1
    %i4002_2 = "silicon.and"(%i4002_1, %state_234) {inst = 4002, source_primitive = "and"} : (i1, i1) -> i1
    %i4023_0 = "silicon.not"(%state_236) {inst = 4023, source_primitive = "not"} : (i1) -> i1
    %i4023_1 = "silicon.and"(%i4023_0, %state_235) {inst = 4023, source_primitive = "and"} : (i1, i1) -> i1
    %i4052_0 = "silicon.or"(%state_237, %state_234) {inst = 4052, source_primitive = "or"} : (i1, i1) -> i1
    %i4070_0 = "silicon.not"(%state_234) {inst = 4070, source_primitive = "not"} : (i1) -> i1
    %i4070_1 = "silicon.and"(%i4070_0, %state_236) {inst = 4070, source_primitive = "and"} : (i1, i1) -> i1
    %i4127_0 = "silicon.and"(%i4052_0, %state_235) {inst = 4127, source_primitive = "nand"} : (i1, i1) -> i1
    %i4127_1 = "silicon.not"(%i4127_0) {inst = 4127, source_primitive = "nand"} : (i1) -> i1
    %i4705_0 = "silicon.or"(%state_4662, %state_4659) {inst = 4705, source_primitive = "nor"} : (i1, i1) -> i1
    %i4705_1 = "silicon.not"(%i4705_0) {inst = 4705, source_primitive = "nor"} : (i1) -> i1
    %i4705_2 = "silicon.and"(%i4705_1, %state_4661) {inst = 4705, source_primitive = "and"} : (i1, i1) -> i1
    %i4705_3 = "silicon.and"(%i4705_2, %state_4838) {inst = 4705, source_primitive = "and"} : (i1, i1) -> i1
    %i4722_0 = "silicon.not"(%state_4182) {inst = 4722, source_primitive = "not"} : (i1) -> i1
    %i4722_1 = "silicon.and"(%i4722_0, %input_enable) {inst = 4722, source_primitive = "and"} : (i1, i1) -> i1
    %i4837_0 = "silicon.and"(%state_4662, %i4722_1) {inst = 4837, source_primitive = "and"} : (i1, i1) -> i1
    %i4837_1 = "silicon.or"(%state_4838, %i4837_0) {inst = 4837, source_primitive = "nor"} : (i1, i1) -> i1
    %i4837_2 = "silicon.not"(%i4837_1) {inst = 4837, source_primitive = "nor"} : (i1) -> i1
    %i4859_0 = "silicon.xor"(%state_4662, %i4722_1) {inst = 4859, source_primitive = "xnor"} : (i1, i1) -> i1
    %i4859_1 = "silicon.not"(%i4859_0) {inst = 4859, source_primitive = "xnor"} : (i1) -> i1
    %i4863_0 = "silicon.and"(%state_4838, %state_4662) {inst = 4863, source_primitive = "and"} : (i1, i1) -> i1
    %i4863_1 = "silicon.and"(%i4863_0, %state_4659) {inst = 4863, source_primitive = "and"} : (i1, i1) -> i1
    %i4863_2 = "silicon.and"(%i4863_1, %i4722_1) {inst = 4863, source_primitive = "and"} : (i1, i1) -> i1
    %i4863_3 = "silicon.or"(%state_4661, %i4863_2) {inst = 4863, source_primitive = "nor"} : (i1, i1) -> i1
    %i4863_4 = "silicon.not"(%i4863_3) {inst = 4863, source_primitive = "nor"} : (i1) -> i1
    %i4949_0 = "silicon.and"(%state_4838, %state_4662) {inst = 4949, source_primitive = "and"} : (i1, i1) -> i1
    %i4949_1 = "silicon.and"(%i4949_0, %state_4659) {inst = 4949, source_primitive = "and"} : (i1, i1) -> i1
    %i4949_2 = "silicon.and"(%i4949_1, %i4722_1) {inst = 4949, source_primitive = "and"} : (i1, i1) -> i1
    %i5007_0 = "silicon.mux"(%i4722_1, %state_5401, %state_5093) {inst = 5007, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5008_0 = "silicon.mux"(%i4722_1, %state_5000, %state_5401) {inst = 5008, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5011_0 = "silicon.mux"(%i4722_1, %state_5093, %state_5399) {inst = 5011, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5205_0 = "silicon.mux"(%i4722_1, %state_5004, %state_5342) {inst = 5205, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5230_0 = "silicon.and"(%i1591_1, %i1262_1) {inst = 5230, source_primitive = "and"} : (i1, i1) -> i1
    %i5230_1 = "silicon.and"(%i5230_0, %i1560_0) {inst = 5230, source_primitive = "and"} : (i1, i1) -> i1
    %i5263_0 = "silicon.mux"(%i4722_1, %state_5342, %state_4993) {inst = 5263, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5265_0 = "silicon.mux"(%i4722_1, %state_4993, %state_5569) {inst = 5265, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5340_0 = "silicon.mux"(%i4722_1, %input_I, %state_5000) {inst = 5340, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5347_0 = "silicon.mux"(%i4722_1, %state_5344, %state_5339) {inst = 5347, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5400_0 = "silicon.mux"(%i4722_1, %state_5339, %state_5336) {inst = 5400, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5403_0 = "silicon.mux"(%i4722_1, %state_5343, %state_5344) {inst = 5403, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5433_0 = "silicon.mux"(%i4722_1, %state_5399, %state_5004) {inst = 5433, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5532_0 = "silicon.not"(%state_5337) {inst = 5532, source_primitive = "not"} : (i1) -> i1
    %i5537_0 = "silicon.mux"(%i4722_1, %state_5569, %state_5343) {inst = 5537, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5612_0 = "silicon.or"(%state_6095, %state_6111) {inst = 5612, source_primitive = "or"} : (i1, i1) -> i1
    %i5612_1 = "silicon.or"(%i5612_0, %state_6159) {inst = 5612, source_primitive = "or"} : (i1, i1) -> i1
    %i5616_0 = "silicon.or"(%i5612_1, %state_6197) {inst = 5616, source_primitive = "nor"} : (i1, i1) -> i1
    %i5616_1 = "silicon.or"(%i5616_0, %state_6199) {inst = 5616, source_primitive = "nor"} : (i1, i1) -> i1
    %i5616_2 = "silicon.not"(%i5616_1) {inst = 5616, source_primitive = "nor"} : (i1) -> i1
    %i5628_0 = "silicon.and"(%state_6197, %state_6198) {inst = 5628, source_primitive = "nand"} : (i1, i1) -> i1
    %i5628_1 = "silicon.not"(%i5628_0) {inst = 5628, source_primitive = "nand"} : (i1) -> i1
    %i5630_0 = "silicon.not"(%i4705_3) {inst = 5630, source_primitive = "not"} : (i1) -> i1
    %i5636_0 = "silicon.not"(%state_5634) {inst = 5636, source_primitive = "not"} : (i1) -> i1
    %i5680_0 = "silicon.and"(%state_4838, %state_4661) {inst = 5680, source_primitive = "nand"} : (i1, i1) -> i1
    %i5680_1 = "silicon.not"(%i5680_0) {inst = 5680, source_primitive = "nand"} : (i1) -> i1
    %i5680_2 = "silicon.or"(%state_4659, %state_4662) {inst = 5680, source_primitive = "or"} : (i1, i1) -> i1
    %i5680_3 = "silicon.or"(%i5680_2, %i5680_1) {inst = 5680, source_primitive = "or"} : (i1, i1) -> i1
    %i5681_0 = "silicon.or"(%state_4661, %state_4659) {inst = 5681, source_primitive = "or"} : (i1, i1) -> i1
    %i5681_1 = "silicon.or"(%i5681_0, %state_4838) {inst = 5681, source_primitive = "or"} : (i1, i1) -> i1
    %i5681_2 = "silicon.or"(%i5681_1, %state_4662) {inst = 5681, source_primitive = "or"} : (i1, i1) -> i1
    %i5684_0 = "silicon.or"(%input_I, %state_5639) {inst = 5684, source_primitive = "or"} : (i1, i1) -> i1
    %i5711_0 = "silicon.and"(%input_I, %state_5639) {inst = 5711, source_primitive = "nand"} : (i1, i1) -> i1
    %i5711_1 = "silicon.not"(%i5711_0) {inst = 5711, source_primitive = "nand"} : (i1) -> i1
    %i5775_0 = "silicon.not"(%i4722_1) {inst = 5775, source_primitive = "not"} : (i1) -> i1
    %i5778_0 = "silicon.mux"(%i5775_0, %i5636_0, %i4705_3) {inst = 5778, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5836_0 = "silicon.not"(%state_5638) {inst = 5836, source_primitive = "not"} : (i1) -> i1
    %i6032_0 = "silicon.and"(%state_6198, %state_6197) {inst = 6032, source_primitive = "and"} : (i1, i1) -> i1
    %i6094_0 = "silicon.not"(%state_6109) {inst = 6094, source_primitive = "not"} : (i1) -> i1
    %i6094_1 = "silicon.and"(%i6094_0, %state_6111) {inst = 6094, source_primitive = "and"} : (i1, i1) -> i1
    %i6107_0 = "silicon.not"(%i5616_2) {inst = 6107, source_primitive = "not"} : (i1) -> i1
    %i6107_1 = "silicon.or"(%state_6109, %state_6106) {inst = 6107, source_primitive = "nor"} : (i1, i1) -> i1
    %i6107_2 = "silicon.or"(%i6107_1, %state_6198) {inst = 6107, source_primitive = "nor"} : (i1, i1) -> i1
    %i6107_3 = "silicon.or"(%i6107_2, %i6107_0) {inst = 6107, source_primitive = "nor"} : (i1, i1) -> i1
    %i6107_4 = "silicon.not"(%i6107_3) {inst = 6107, source_primitive = "nor"} : (i1) -> i1
    %i6160_0 = "silicon.and"(%input_I, %i4722_1) {inst = 6160, source_primitive = "and"} : (i1, i1) -> i1
    %i6160_1 = "silicon.or"(%state_6111, %i6160_0) {inst = 6160, source_primitive = "nor"} : (i1, i1) -> i1
    %i6160_2 = "silicon.not"(%i6160_1) {inst = 6160, source_primitive = "nor"} : (i1) -> i1
    %i6166_0 = "silicon.and"(%i4722_1, %state_6111) {inst = 6166, source_primitive = "and"} : (i1, i1) -> i1
    %i6166_1 = "silicon.and"(%i6166_0, %input_I) {inst = 6166, source_primitive = "and"} : (i1, i1) -> i1
    %i6194_0 = "silicon.or"(%state_6106, %state_6159) {inst = 6194, source_primitive = "nor"} : (i1, i1) -> i1
    %i6194_1 = "silicon.not"(%i6194_0) {inst = 6194, source_primitive = "nor"} : (i1) -> i1
    %i6194_2 = "silicon.and"(%i6194_1, %state_6199) {inst = 6194, source_primitive = "and"} : (i1, i1) -> i1
    %i6194_3 = "silicon.and"(%i6194_2, %state_6095) {inst = 6194, source_primitive = "and"} : (i1, i1) -> i1
    %i6298_0 = "silicon.and"(%state_6109, %state_6106) {inst = 6298, source_primitive = "and"} : (i1, i1) -> i1
    %i6298_1 = "silicon.and"(%i6298_0, %state_6198) {inst = 6298, source_primitive = "and"} : (i1, i1) -> i1
    %i6298_2 = "silicon.and"(%i6298_1, %i5616_2) {inst = 6298, source_primitive = "and"} : (i1, i1) -> i1
    %i6350_0 = "silicon.and"(%state_6095, %state_6109) {inst = 6350, source_primitive = "and"} : (i1, i1) -> i1
    %i6350_1 = "silicon.and"(%i6350_0, %state_6106) {inst = 6350, source_primitive = "and"} : (i1, i1) -> i1
    %i6356_0 = "silicon.and"(%state_6109, %i6166_1) {inst = 6356, source_primitive = "and"} : (i1, i1) -> i1
    %i6356_1 = "silicon.or"(%i6356_0, %state_6106) {inst = 6356, source_primitive = "or"} : (i1, i1) -> i1
    %i6403_0 = "silicon.and"(%state_6442, %i4705_3) {inst = 6403, source_primitive = "and"} : (i1, i1) -> i1
    %i6403_1 = "silicon.and"(%i6403_0, %i4722_1) {inst = 6403, source_primitive = "and"} : (i1, i1) -> i1
    %i6403_2 = "silicon.or"(%i6403_1, %state_6451) {inst = 6403, source_primitive = "or"} : (i1, i1) -> i1
    %i6404_0 = "silicon.and"(%i4705_3, %i4722_1) {inst = 6404, source_primitive = "and"} : (i1, i1) -> i1
    %i6404_1 = "silicon.and"(%i6404_0, %state_6451) {inst = 6404, source_primitive = "and"} : (i1, i1) -> i1
    %i6404_2 = "silicon.and"(%i6404_1, %state_6442) {inst = 6404, source_primitive = "and"} : (i1, i1) -> i1
    %i6445_0 = "silicon.and"(%i4722_1, %i4705_3) {inst = 6445, source_primitive = "nand"} : (i1, i1) -> i1
    %i6445_1 = "silicon.not"(%i6445_0) {inst = 6445, source_primitive = "nand"} : (i1) -> i1
    %i6472_0 = "silicon.not"(%state_6436) {inst = 6472, source_primitive = "not"} : (i1) -> i1
    %i6472_1 = "silicon.and"(%state_6435, %i6472_0) {inst = 6472, source_primitive = "nand"} : (i1, i1) -> i1
    %i6472_2 = "silicon.and"(%i6472_1, %state_6451) {inst = 6472, source_primitive = "nand"} : (i1, i1) -> i1
    %i6472_3 = "silicon.not"(%i6472_2) {inst = 6472, source_primitive = "nand"} : (i1) -> i1
    %i6473_0 = "silicon.and"(%state_6435, %state_6436) {inst = 6473, source_primitive = "nand"} : (i1, i1) -> i1
    %i6473_1 = "silicon.and"(%i6473_0, %i6404_2) {inst = 6473, source_primitive = "nand"} : (i1, i1) -> i1
    %i6473_2 = "silicon.not"(%i6473_1) {inst = 6473, source_primitive = "nand"} : (i1) -> i1
    %i6474_0 = "silicon.and"(%state_6436, %i6404_2) {inst = 6474, source_primitive = "and"} : (i1, i1) -> i1
    %i6474_1 = "silicon.or"(%i6474_0, %state_6435) {inst = 6474, source_primitive = "or"} : (i1, i1) -> i1
    %i6478_0 = "silicon.not"(%i6404_2) {inst = 6478, source_primitive = "not"} : (i1) -> i1
    %i6481_0 = "silicon.xor"(%i6404_2, %state_6436) {inst = 6481, source_primitive = "xor"} : (i1, i1) -> i1
    %i6609_0 = "silicon.or"(%state_6442, %i6472_3) {inst = 6609, source_primitive = "nor"} : (i1, i1) -> i1
    %i6609_1 = "silicon.not"(%i6609_0) {inst = 6609, source_primitive = "nor"} : (i1) -> i1
    %i6950_0 = "silicon.xor"(%state_6436, %state_6442) {inst = 6950, source_primitive = "xor"} : (i1, i1) -> i1
    %i6953_0 = "silicon.and"(%i6950_0, %state_6435) {inst = 6953, source_primitive = "nand"} : (i1, i1) -> i1
    %i6953_1 = "silicon.not"(%i6953_0) {inst = 6953, source_primitive = "nand"} : (i1) -> i1
    %i6956_0 = "silicon.and"(%state_6436, %state_6442) {inst = 6956, source_primitive = "nand"} : (i1, i1) -> i1
    %i6956_1 = "silicon.not"(%i6956_0) {inst = 6956, source_primitive = "nand"} : (i1) -> i1
    %i6957_0 = "silicon.or"(%state_6451, %i6953_1) {inst = 6957, source_primitive = "nor"} : (i1, i1) -> i1
    %i6957_1 = "silicon.not"(%i6957_0) {inst = 6957, source_primitive = "nor"} : (i1) -> i1
    %i6969_0 = "silicon.not"(%state_234) {inst = 6969, source_primitive = "not"} : (i1) -> i1
    %i6969_1 = "silicon.or"(%i6969_0, %state_235) {inst = 6969, source_primitive = "or"} : (i1, i1) -> i1
    %i6970_0 = "silicon.and"(%state_237, %state_234) {inst = 6970, source_primitive = "nand"} : (i1, i1) -> i1
    %i6970_1 = "silicon.not"(%i6970_0) {inst = 6970, source_primitive = "nand"} : (i1) -> i1
    %i6971_0 = "silicon.or"(%state_236, %state_237) {inst = 6971, source_primitive = "nor"} : (i1, i1) -> i1
    %i6971_1 = "silicon.not"(%i6971_0) {inst = 6971, source_primitive = "nor"} : (i1) -> i1
    %i6973_0 = "silicon.not"(%state_237) {inst = 6973, source_primitive = "not"} : (i1) -> i1
    %i6973_1 = "silicon.and"(%i6973_0, %state_234) {inst = 6973, source_primitive = "and"} : (i1, i1) -> i1
    %i6973_2 = "silicon.and"(%i6973_1, %state_236) {inst = 6973, source_primitive = "and"} : (i1, i1) -> i1
    %i6973_3 = "silicon.and"(%i6973_2, %state_235) {inst = 6973, source_primitive = "and"} : (i1, i1) -> i1
    %i6975_0 = "silicon.not"(%state_236) {inst = 6975, source_primitive = "not"} : (i1) -> i1
    %i6975_1 = "silicon.and"(%i6975_0, %state_234) {inst = 6975, source_primitive = "and"} : (i1, i1) -> i1
    %i6990_0 = "silicon.not"(%state_237) {inst = 6990, source_primitive = "not"} : (i1) -> i1
    %i6990_1 = "silicon.or"(%state_235, %state_236) {inst = 6990, source_primitive = "nor"} : (i1, i1) -> i1
    %i6990_2 = "silicon.or"(%i6990_1, %state_234) {inst = 6990, source_primitive = "nor"} : (i1, i1) -> i1
    %i6990_3 = "silicon.or"(%i6990_2, %i6990_0) {inst = 6990, source_primitive = "nor"} : (i1, i1) -> i1
    %i6990_4 = "silicon.not"(%i6990_3) {inst = 6990, source_primitive = "nor"} : (i1) -> i1
    %i6995_0 = "silicon.not"(%state_237) {inst = 6995, source_primitive = "not"} : (i1) -> i1
    %i6995_1 = "silicon.or"(%i6995_0, %state_234) {inst = 6995, source_primitive = "or"} : (i1, i1) -> i1
    %i7057_0 = "silicon.and"(%state_235, %state_236) {inst = 7057, source_primitive = "and"} : (i1, i1) -> i1
    %i7057_1 = "silicon.or"(%state_237, %i7057_0) {inst = 7057, source_primitive = "nor"} : (i1, i1) -> i1
    %i7057_2 = "silicon.not"(%i7057_1) {inst = 7057, source_primitive = "nor"} : (i1) -> i1
    %i7104_0 = "silicon.not"(%state_234) {inst = 7104, source_primitive = "not"} : (i1) -> i1
    %i7104_1 = "silicon.or"(%i7104_0, %state_237) {inst = 7104, source_primitive = "or"} : (i1, i1) -> i1
    %i7153_0 = "silicon.and"(%state_235, %state_236) {inst = 7153, source_primitive = "and"} : (i1, i1) -> i1
    %i7153_1 = "silicon.or"(%state_237, %i7153_0) {inst = 7153, source_primitive = "nor"} : (i1, i1) -> i1
    %i7153_2 = "silicon.not"(%i7153_1) {inst = 7153, source_primitive = "nor"} : (i1) -> i1
    %i7169_0 = "silicon.and"(%state_236, %state_235) {inst = 7169, source_primitive = "nand"} : (i1, i1) -> i1
    %i7169_1 = "silicon.not"(%i7169_0) {inst = 7169, source_primitive = "nand"} : (i1) -> i1
    %i7216_0 = "silicon.or"(%state_234, %state_237) {inst = 7216, source_primitive = "nor"} : (i1, i1) -> i1
    %i7216_1 = "silicon.not"(%i7216_0) {inst = 7216, source_primitive = "nor"} : (i1) -> i1
    %i7216_2 = "silicon.and"(%i7216_1, %state_235) {inst = 7216, source_primitive = "and"} : (i1, i1) -> i1
    %i7216_3 = "silicon.and"(%i7216_2, %state_236) {inst = 7216, source_primitive = "and"} : (i1, i1) -> i1
    %i7230_0 = "silicon.or"(%state_237, %i7169_1) {inst = 7230, source_primitive = "nor"} : (i1, i1) -> i1
    %i7230_1 = "silicon.not"(%i7230_0) {inst = 7230, source_primitive = "nor"} : (i1) -> i1
    %i7237_0 = "silicon.and"(%state_235, %i6971_1) {inst = 7237, source_primitive = "and"} : (i1, i1) -> i1
    %i7237_1 = "silicon.or"(%i7237_0, %i6990_4) {inst = 7237, source_primitive = "or"} : (i1, i1) -> i1
    %i7238_0 = "silicon.or"(%state_234, %state_235) {inst = 7238, source_primitive = "nor"} : (i1, i1) -> i1
    %i7238_1 = "silicon.or"(%i7238_0, %state_236) {inst = 7238, source_primitive = "nor"} : (i1, i1) -> i1
    %i7238_2 = "silicon.not"(%i7238_1) {inst = 7238, source_primitive = "nor"} : (i1) -> i1
    %i7252_0 = "silicon.and"(%i7169_1, %i6970_1) {inst = 7252, source_primitive = "and"} : (i1, i1) -> i1
    %i7259_0 = "silicon.and"(%i6971_1, %state_235) {inst = 7259, source_primitive = "and"} : (i1, i1) -> i1
    %i7259_1 = "silicon.and"(%i7259_0, %state_234) {inst = 7259, source_primitive = "and"} : (i1, i1) -> i1
    %i7259_2 = "silicon.or"(%i7259_1, %i7238_2) {inst = 7259, source_primitive = "or"} : (i1, i1) -> i1
    %i7287_0 = "silicon.not"(%state_234) {inst = 7287, source_primitive = "not"} : (i1) -> i1
    %i7287_1 = "silicon.and"(%i7287_0, %state_235) {inst = 7287, source_primitive = "and"} : (i1, i1) -> i1
    %i7301_0 = "silicon.not"(%state_235) {inst = 7301, source_primitive = "not"} : (i1) -> i1
    %i7301_1 = "silicon.or"(%i7301_0, %state_234) {inst = 7301, source_primitive = "or"} : (i1, i1) -> i1
    %i7311_0 = "silicon.and"(%state_236, %i6969_1) {inst = 7311, source_primitive = "and"} : (i1, i1) -> i1
    %i7317_0 = "silicon.and"(%state_235, %state_236) {inst = 7317, source_primitive = "and"} : (i1, i1) -> i1
    %i7335_0 = "silicon.or"(%state_235, %state_236) {inst = 7335, source_primitive = "nor"} : (i1, i1) -> i1
    %i7335_1 = "silicon.not"(%i7335_0) {inst = 7335, source_primitive = "nor"} : (i1) -> i1
    %i7465_0 = "silicon.and"(%state_6436, %state_6451) {inst = 7465, source_primitive = "nand"} : (i1, i1) -> i1
    %i7465_1 = "silicon.not"(%i7465_0) {inst = 7465, source_primitive = "nand"} : (i1) -> i1
    %i7548_0 = "silicon.and"(%state_6451, %state_6435) {inst = 7548, source_primitive = "and"} : (i1, i1) -> i1
    %i7548_1 = "silicon.or"(%state_6436, %i7548_0) {inst = 7548, source_primitive = "nor"} : (i1, i1) -> i1
    %i7548_2 = "silicon.not"(%i7548_1) {inst = 7548, source_primitive = "nor"} : (i1) -> i1
    %i7566_0 = "silicon.xor"(%state_6451, %state_6435) {inst = 7566, source_primitive = "xnor"} : (i1, i1) -> i1
    %i7566_1 = "silicon.not"(%i7566_0) {inst = 7566, source_primitive = "xnor"} : (i1) -> i1
    %i7567_0 = "silicon.xor"(%i6950_0, %state_6435) {inst = 7567, source_primitive = "xor"} : (i1, i1) -> i1
    %i7656_0 = "silicon.not"(%i7567_0) {inst = 7656, source_primitive = "not"} : (i1) -> i1
    %i7656_1 = "silicon.or"(%i7656_0, %i7465_1) {inst = 7656, source_primitive = "or"} : (i1, i1) -> i1
    %i8106_0 = "silicon.not"(%state_8092) {inst = 8106, source_primitive = "not"} : (i1) -> i1
    %i8191_0 = "silicon.and"(%i4722_1, %input_I) {inst = 8191, source_primitive = "nand"} : (i1, i1) -> i1
    %i8191_1 = "silicon.not"(%i8191_0) {inst = 8191, source_primitive = "nand"} : (i1) -> i1
    %i8197_0 = "silicon.and"(%state_8431, %i8106_0) {inst = 8197, source_primitive = "and"} : (i1, i1) -> i1
    %i8218_0 = "silicon.not"(%state_8219) {inst = 8218, source_primitive = "not"} : (i1) -> i1
    %i8218_1 = "silicon.and"(%i8218_0, %state_8086) {inst = 8218, source_primitive = "and"} : (i1, i1) -> i1
    %i8290_0 = "silicon.not"(%state_8199) {inst = 8290, source_primitive = "not"} : (i1) -> i1
    %i8325_0 = "silicon.not"(%state_8214) {inst = 8325, source_primitive = "not"} : (i1) -> i1
    %i8325_1 = "silicon.and"(%i8325_0, %state_8090) {inst = 8325, source_primitive = "and"} : (i1, i1) -> i1
    %i8367_0 = "silicon.and"(%state_8085, %i8290_0) {inst = 8367, source_primitive = "and"} : (i1, i1) -> i1
    %i8408_0 = "silicon.not"(%state_8095) {inst = 8408, source_primitive = "not"} : (i1) -> i1
    %i8408_1 = "silicon.and"(%i8408_0, %state_8429) {inst = 8408, source_primitive = "and"} : (i1, i1) -> i1
    %i8574_0 = "silicon.and"(%i4722_1, %input_I) {inst = 8574, source_primitive = "nand"} : (i1, i1) -> i1
    %i8574_1 = "silicon.not"(%i8574_0) {inst = 8574, source_primitive = "nand"} : (i1) -> i1
    %i8576_0 = "silicon.and"(%i4722_1, %input_I) {inst = 8576, source_primitive = "nand"} : (i1, i1) -> i1
    %i8576_1 = "silicon.not"(%i8576_0) {inst = 8576, source_primitive = "nand"} : (i1) -> i1
    %i8590_0 = "silicon.not"(%state_8815) {inst = 8590, source_primitive = "not"} : (i1) -> i1
    %i8590_1 = "silicon.and"(%i8590_0, %state_8084) {inst = 8590, source_primitive = "and"} : (i1, i1) -> i1
    %i8660_0 = "silicon.not"(%state_8602) {inst = 8660, source_primitive = "not"} : (i1) -> i1
    %i8998_0 = "silicon.or"(%state_6442, %state_6451) {inst = 8998, source_primitive = "nor"} : (i1, i1) -> i1
    %i8998_1 = "silicon.not"(%i8998_0) {inst = 8998, source_primitive = "nor"} : (i1) -> i1
    %i8998_2 = "silicon.and"(%i8998_1, %state_6436) {inst = 8998, source_primitive = "and"} : (i1, i1) -> i1
    %i8998_3 = "silicon.and"(%i8998_2, %state_6435) {inst = 8998, source_primitive = "and"} : (i1, i1) -> i1
    %i9343_0 = "silicon.or"(%state_6451, %state_6442) {inst = 9343, source_primitive = "or"} : (i1, i1) -> i1
    %i9343_1 = "silicon.and"(%i9343_0, %state_6436) {inst = 9343, source_primitive = "and"} : (i1, i1) -> i1
    %i9343_2 = "silicon.and"(%i9343_1, %state_6435) {inst = 9343, source_primitive = "and"} : (i1, i1) -> i1
    %i9354_0 = "silicon.xor"(%state_6451, %state_6442) {inst = 9354, source_primitive = "xor"} : (i1, i1) -> i1
    %i9356_0 = "silicon.xor"(%state_4838, %i9354_0) {inst = 9356, source_primitive = "xnor"} : (i1, i1) -> i1
    %i9356_1 = "silicon.not"(%i9356_0) {inst = 9356, source_primitive = "xnor"} : (i1) -> i1
    %i9470_0 = "silicon.and"(%state_4662, %state_6442) {inst = 9470, source_primitive = "and"} : (i1, i1) -> i1
    %i9608_0 = "silicon.and"(%state_6442, %state_4662) {inst = 9608, source_primitive = "nand"} : (i1, i1) -> i1
    %i9608_1 = "silicon.not"(%i9608_0) {inst = 9608, source_primitive = "nand"} : (i1) -> i1
    %i9622_0 = "silicon.and"(%state_6451, %state_6442) {inst = 9622, source_primitive = "nand"} : (i1, i1) -> i1
    %i9622_1 = "silicon.not"(%i9622_0) {inst = 9622, source_primitive = "nand"} : (i1) -> i1
    %i9636_0 = "silicon.or"(%state_4662, %state_6442) {inst = 9636, source_primitive = "nor"} : (i1, i1) -> i1
    %i9636_1 = "silicon.not"(%i9636_0) {inst = 9636, source_primitive = "nor"} : (i1) -> i1
    %i9637_0 = "silicon.or"(%state_6451, %state_6436) {inst = 9637, source_primitive = "nor"} : (i1, i1) -> i1
    %i9637_1 = "silicon.not"(%i9637_0) {inst = 9637, source_primitive = "nor"} : (i1) -> i1
    %i9730_0 = "silicon.or"(%i9470_0, %i9636_1) {inst = 9730, source_primitive = "nor"} : (i1, i1) -> i1
    %i9730_1 = "silicon.not"(%i9730_0) {inst = 9730, source_primitive = "nor"} : (i1) -> i1
    %i9818_0 = "silicon.or"(%i9356_1, %i9608_1) {inst = 9818, source_primitive = "nor"} : (i1, i1) -> i1
    %i9818_1 = "silicon.not"(%i9818_0) {inst = 9818, source_primitive = "nor"} : (i1) -> i1
    %i63_0 = "silicon.and"(%state_236, %i67_3) {inst = 63, source_primitive = "and"} : (i1, i1) -> i1
    %i63_1 = "silicon.or"(%i63_0, %i6973_3) {inst = 63, source_primitive = "or"} : (i1, i1) -> i1
    %i63_2 = "silicon.or"(%i63_1, %i6990_4) {inst = 63, source_primitive = "or"} : (i1, i1) -> i1
    %i174_0 = "silicon.and"(%i3478_1, %state_234) {inst = 174, source_primitive = "and"} : (i1, i1) -> i1
    %i174_1 = "silicon.and"(%state_235, %i3533_1) {inst = 174, source_primitive = "and"} : (i1, i1) -> i1
    %i174_2 = "silicon.or"(%i174_1, %i174_0) {inst = 174, source_primitive = "or"} : (i1, i1) -> i1
    %i198_0 = "silicon.and"(%state_226, %i353_3) {inst = 198, source_primitive = "and"} : (i1, i1) -> i1
    %i199_0 = "silicon.not"(%state_226) {inst = 199, source_primitive = "not"} : (i1) -> i1
    %i199_1 = "silicon.and"(%state_235, %i353_3) {inst = 199, source_primitive = "and"} : (i1, i1) -> i1
    %i199_2 = "silicon.or"(%i199_0, %i199_1) {inst = 199, source_primitive = "nor"} : (i1, i1) -> i1
    %i199_3 = "silicon.not"(%i199_2) {inst = 199, source_primitive = "nor"} : (i1) -> i1
    %i215_0 = "silicon.not"(%state_226) {inst = 215, source_primitive = "not"} : (i1) -> i1
    %i215_1 = "silicon.and"(%i624_0, %i494_2) {inst = 215, source_primitive = "and"} : (i1, i1) -> i1
    %i215_2 = "silicon.or"(%i215_0, %i215_1) {inst = 215, source_primitive = "nor"} : (i1, i1) -> i1
    %i215_3 = "silicon.not"(%i215_2) {inst = 215, source_primitive = "nor"} : (i1) -> i1
    %i247_0 = "silicon.not"(%i5532_0) {inst = 247, source_primitive = "not"} : (i1) -> i1
    %i341_0 = "silicon.not"(%state_226) {inst = 341, source_primitive = "not"} : (i1) -> i1
    %i341_1 = "silicon.and"(%i353_3, %i202_1) {inst = 341, source_primitive = "and"} : (i1, i1) -> i1
    %i341_2 = "silicon.or"(%i341_0, %i341_1) {inst = 341, source_primitive = "nor"} : (i1, i1) -> i1
    %i341_3 = "silicon.not"(%i341_2) {inst = 341, source_primitive = "nor"} : (i1) -> i1
    %i460_0 = "silicon.and"(%i5836_0, %i6298_2) {inst = 460, source_primitive = "and"} : (i1, i1) -> i1
    %i743_0 = "silicon.not"(%i198_0) {inst = 743, source_primitive = "not"} : (i1) -> i1
    %i743_1 = "silicon.or"(%i743_0, %i4722_1) {inst = 743, source_primitive = "or"} : (i1, i1) -> i1
    %i882_0 = "silicon.or"(%i4722_1, %i198_0) {inst = 882, source_primitive = "or"} : (i1, i1) -> i1
    %i1231_0 = "silicon.and"(%i4722_1, %input_I) {inst = 1231, source_primitive = "nand"} : (i1, i1) -> i1
    %i1231_1 = "silicon.not"(%i1231_0) {inst = 1231, source_primitive = "nand"} : (i1) -> i1
    %i1232_0 = "silicon.and"(%i1807_3, %input_I) {inst = 1232, source_primitive = "and"} : (i1, i1) -> i1
    %i1232_1 = "silicon.and"(%i1232_0, %i4722_1) {inst = 1232, source_primitive = "and"} : (i1, i1) -> i1
    %i1232_2 = "silicon.or"(%i1232_1, %state_1228) {inst = 1232, source_primitive = "or"} : (i1, i1) -> i1
    %i1234_0 = "silicon.and"(%i1246_3, %input_I) {inst = 1234, source_primitive = "and"} : (i1, i1) -> i1
    %i1234_1 = "silicon.and"(%i1234_0, %i4722_1) {inst = 1234, source_primitive = "and"} : (i1, i1) -> i1
    %i1234_2 = "silicon.or"(%i1234_1, %state_1230) {inst = 1234, source_primitive = "or"} : (i1, i1) -> i1
    %i1244_0 = "silicon.or"(%i1231_1, %i1803_3) {inst = 1244, source_primitive = "or"} : (i1, i1) -> i1
    %i1244_1 = "silicon.or"(%i1244_0, %i1968_0) {inst = 1244, source_primitive = "or"} : (i1, i1) -> i1
    %i1244_2 = "silicon.or"(%i1244_1, %state_1229) {inst = 1244, source_primitive = "or"} : (i1, i1) -> i1
    %i1255_0 = "silicon.and"(%i4722_1, %input_I) {inst = 1255, source_primitive = "nand"} : (i1, i1) -> i1
    %i1255_1 = "silicon.not"(%i1255_0) {inst = 1255, source_primitive = "nand"} : (i1) -> i1
    %i1286_0 = "silicon.and"(%i1370_3, %input_I) {inst = 1286, source_primitive = "and"} : (i1, i1) -> i1
    %i1286_1 = "silicon.and"(%i1286_0, %i4722_1) {inst = 1286, source_primitive = "and"} : (i1, i1) -> i1
    %i1286_2 = "silicon.or"(%i1286_1, %state_1259) {inst = 1286, source_primitive = "or"} : (i1, i1) -> i1
    %i1287_0 = "silicon.and"(%i1323_3, %input_I) {inst = 1287, source_primitive = "and"} : (i1, i1) -> i1
    %i1287_1 = "silicon.and"(%i1287_0, %i4722_1) {inst = 1287, source_primitive = "and"} : (i1, i1) -> i1
    %i1287_2 = "silicon.or"(%i1287_1, %state_1260) {inst = 1287, source_primitive = "or"} : (i1, i1) -> i1
    %i1362_0 = "silicon.and"(%i4722_1, %input_I) {inst = 1362, source_primitive = "nand"} : (i1, i1) -> i1
    %i1362_1 = "silicon.not"(%i1362_0) {inst = 1362, source_primitive = "nand"} : (i1) -> i1
    %i1363_0 = "silicon.or"(%i1362_1, %i1451_3) {inst = 1363, source_primitive = "or"} : (i1, i1) -> i1
    %i1363_1 = "silicon.or"(%i1363_0, %i1425_0) {inst = 1363, source_primitive = "or"} : (i1, i1) -> i1
    %i1363_2 = "silicon.or"(%i1363_1, %state_1384) {inst = 1363, source_primitive = "or"} : (i1, i1) -> i1
    %i1364_0 = "silicon.and"(%i1323_3, %state_1260) {inst = 1364, source_primitive = "nand"} : (i1, i1) -> i1
    %i1364_1 = "silicon.and"(%i1364_0, %i4722_1) {inst = 1364, source_primitive = "nand"} : (i1, i1) -> i1
    %i1364_2 = "silicon.and"(%i1364_1, %input_I) {inst = 1364, source_primitive = "nand"} : (i1, i1) -> i1
    %i1364_3 = "silicon.not"(%i1364_2) {inst = 1364, source_primitive = "nand"} : (i1) -> i1
    %i1365_0 = "silicon.and"(%i1370_3, %state_1259) {inst = 1365, source_primitive = "nand"} : (i1, i1) -> i1
    %i1365_1 = "silicon.and"(%i1365_0, %i4722_1) {inst = 1365, source_primitive = "nand"} : (i1, i1) -> i1
    %i1365_2 = "silicon.and"(%i1365_1, %input_I) {inst = 1365, source_primitive = "nand"} : (i1, i1) -> i1
    %i1365_3 = "silicon.not"(%i1365_2) {inst = 1365, source_primitive = "nand"} : (i1) -> i1
    %i1366_0 = "silicon.or"(%i1365_3, %state_1383) {inst = 1366, source_primitive = "or"} : (i1, i1) -> i1
    %i1366_1 = "silicon.and"(%i1366_0, %i1286_2) {inst = 1366, source_primitive = "and"} : (i1, i1) -> i1
    %i1377_0 = "silicon.or"(%i1451_3, %i1362_1) {inst = 1377, source_primitive = "nor"} : (i1, i1) -> i1
    %i1377_1 = "silicon.not"(%i1377_0) {inst = 1377, source_primitive = "nor"} : (i1) -> i1
    %i1381_0 = "silicon.and"(%i1248_3, %state_1258) {inst = 1381, source_primitive = "nand"} : (i1, i1) -> i1
    %i1381_1 = "silicon.and"(%i1381_0, %i4722_1) {inst = 1381, source_primitive = "nand"} : (i1, i1) -> i1
    %i1381_2 = "silicon.and"(%i1381_1, %input_I) {inst = 1381, source_primitive = "nand"} : (i1, i1) -> i1
    %i1381_3 = "silicon.not"(%i1381_2) {inst = 1381, source_primitive = "nand"} : (i1) -> i1
    %i1387_0 = "silicon.or"(%i1377_1, %state_1261) {inst = 1387, source_primitive = "or"} : (i1, i1) -> i1
    %i1387_1 = "silicon.and"(%i1387_0, %i1363_2) {inst = 1387, source_primitive = "and"} : (i1, i1) -> i1
    %i1569_0 = "silicon.not"(%i1365_3) {inst = 1569, source_primitive = "not"} : (i1) -> i1
    %i1569_1 = "silicon.or"(%i1569_0, %state_1383) {inst = 1569, source_primitive = "or"} : (i1, i1) -> i1
    %i1570_0 = "silicon.not"(%i1364_3) {inst = 1570, source_primitive = "not"} : (i1) -> i1
    %i1570_1 = "silicon.or"(%i1570_0, %state_1385) {inst = 1570, source_primitive = "or"} : (i1, i1) -> i1
    %i1579_0 = "silicon.or"(%i1364_3, %state_1385) {inst = 1579, source_primitive = "or"} : (i1, i1) -> i1
    %i1579_1 = "silicon.and"(%i1579_0, %i1287_2) {inst = 1579, source_primitive = "and"} : (i1, i1) -> i1
    %i1635_0 = "silicon.and"(%i1248_3, %input_I) {inst = 1635, source_primitive = "and"} : (i1, i1) -> i1
    %i1635_1 = "silicon.and"(%i1635_0, %i4722_1) {inst = 1635, source_primitive = "and"} : (i1, i1) -> i1
    %i1635_2 = "silicon.or"(%i1635_1, %state_1258) {inst = 1635, source_primitive = "or"} : (i1, i1) -> i1
    %i1641_0 = "silicon.and"(%i1246_3, %state_1230) {inst = 1641, source_primitive = "nand"} : (i1, i1) -> i1
    %i1641_1 = "silicon.and"(%i1641_0, %i4722_1) {inst = 1641, source_primitive = "nand"} : (i1, i1) -> i1
    %i1641_2 = "silicon.and"(%i1641_1, %input_I) {inst = 1641, source_primitive = "nand"} : (i1, i1) -> i1
    %i1641_3 = "silicon.not"(%i1641_2) {inst = 1641, source_primitive = "nand"} : (i1) -> i1
    %i1675_0 = "silicon.not"(%i1381_3) {inst = 1675, source_primitive = "not"} : (i1) -> i1
    %i1675_1 = "silicon.or"(%i1675_0, %state_1626) {inst = 1675, source_primitive = "or"} : (i1, i1) -> i1
    %i1772_0 = "silicon.and"(%i1807_3, %state_1228) {inst = 1772, source_primitive = "nand"} : (i1, i1) -> i1
    %i1772_1 = "silicon.and"(%i1772_0, %i4722_1) {inst = 1772, source_primitive = "nand"} : (i1, i1) -> i1
    %i1772_2 = "silicon.and"(%i1772_1, %input_I) {inst = 1772, source_primitive = "nand"} : (i1, i1) -> i1
    %i1772_3 = "silicon.not"(%i1772_2) {inst = 1772, source_primitive = "nand"} : (i1) -> i1
    %i1776_0 = "silicon.and"(%state_1229, %i1968_0) {inst = 1776, source_primitive = "and"} : (i1, i1) -> i1
    %i1790_0 = "silicon.or"(%i1772_3, %state_1808) {inst = 1790, source_primitive = "or"} : (i1, i1) -> i1
    %i1790_1 = "silicon.and"(%i1790_0, %i1232_2) {inst = 1790, source_primitive = "and"} : (i1, i1) -> i1
    %i1794_0 = "silicon.and"(%state_1249, %i2012_0) {inst = 1794, source_primitive = "and"} : (i1, i1) -> i1
    %i1798_0 = "silicon.or"(%i1803_3, %i1231_1) {inst = 1798, source_primitive = "nor"} : (i1, i1) -> i1
    %i1798_1 = "silicon.not"(%i1798_0) {inst = 1798, source_primitive = "nor"} : (i1) -> i1
    %i1959_0 = "silicon.not"(%i1772_3) {inst = 1959, source_primitive = "not"} : (i1) -> i1
    %i1959_1 = "silicon.or"(%i1959_0, %state_1808) {inst = 1959, source_primitive = "or"} : (i1, i1) -> i1
    %i1982_0 = "silicon.and"(%state_2039, %i2013_0) {inst = 1982, source_primitive = "and"} : (i1, i1) -> i1
    %i2034_0 = "silicon.and"(%i1788_3, %state_1264) {inst = 2034, source_primitive = "nand"} : (i1, i1) -> i1
    %i2034_1 = "silicon.and"(%i2034_0, %i4722_1) {inst = 2034, source_primitive = "nand"} : (i1, i1) -> i1
    %i2034_2 = "silicon.and"(%i2034_1, %input_I) {inst = 2034, source_primitive = "nand"} : (i1, i1) -> i1
    %i2034_3 = "silicon.not"(%i2034_2) {inst = 2034, source_primitive = "nand"} : (i1) -> i1
    %i2049_0 = "silicon.and"(%i1788_3, %input_I) {inst = 2049, source_primitive = "and"} : (i1, i1) -> i1
    %i2049_1 = "silicon.and"(%i2049_0, %i4722_1) {inst = 2049, source_primitive = "and"} : (i1, i1) -> i1
    %i2049_2 = "silicon.or"(%i2049_1, %state_1264) {inst = 2049, source_primitive = "or"} : (i1, i1) -> i1
    %i2143_0 = "silicon.or"(%i1770_3, %i1255_1) {inst = 2143, source_primitive = "nor"} : (i1, i1) -> i1
    %i2143_1 = "silicon.not"(%i2143_0) {inst = 2143, source_primitive = "nor"} : (i1) -> i1
    %i2296_0 = "silicon.and"(%i4722_1, %input_I) {inst = 2296, source_primitive = "nand"} : (i1, i1) -> i1
    %i2296_1 = "silicon.not"(%i2296_0) {inst = 2296, source_primitive = "nand"} : (i1) -> i1
    %i2361_0 = "silicon.and"(%i2365_3, %input_I) {inst = 2361, source_primitive = "and"} : (i1, i1) -> i1
    %i2361_1 = "silicon.and"(%i2361_0, %i4722_1) {inst = 2361, source_primitive = "and"} : (i1, i1) -> i1
    %i2361_2 = "silicon.or"(%i2361_1, %state_2293) {inst = 2361, source_primitive = "or"} : (i1, i1) -> i1
    %i2369_0 = "silicon.and"(%i2365_3, %state_2293) {inst = 2369, source_primitive = "nand"} : (i1, i1) -> i1
    %i2369_1 = "silicon.and"(%i2369_0, %i4722_1) {inst = 2369, source_primitive = "nand"} : (i1, i1) -> i1
    %i2369_2 = "silicon.and"(%i2369_1, %input_I) {inst = 2369, source_primitive = "nand"} : (i1, i1) -> i1
    %i2369_3 = "silicon.not"(%i2369_2) {inst = 2369, source_primitive = "nand"} : (i1) -> i1
    %i2370_0 = "silicon.and"(%i4722_1, %input_I) {inst = 2370, source_primitive = "nand"} : (i1, i1) -> i1
    %i2370_1 = "silicon.not"(%i2370_0) {inst = 2370, source_primitive = "nand"} : (i1) -> i1
    %i2437_0 = "silicon.not"(%i2369_3) {inst = 2437, source_primitive = "not"} : (i1) -> i1
    %i2437_1 = "silicon.or"(%i2437_0, %state_2372) {inst = 2437, source_primitive = "or"} : (i1, i1) -> i1
    %i2561_0 = "silicon.and"(%state_2710, %i2711_0) {inst = 2561, source_primitive = "and"} : (i1, i1) -> i1
    %i2925_0 = "silicon.xor"(%state_237, %i2950_1) {inst = 2925, source_primitive = "xnor"} : (i1, i1) -> i1
    %i2925_1 = "silicon.not"(%i2925_0) {inst = 2925, source_primitive = "xnor"} : (i1) -> i1
    %i2926_0 = "silicon.and"(%state_235, %i4070_1) {inst = 2926, source_primitive = "and"} : (i1, i1) -> i1
    %i2926_1 = "silicon.or"(%state_237, %i2926_0) {inst = 2926, source_primitive = "nor"} : (i1, i1) -> i1
    %i2926_2 = "silicon.not"(%i2926_1) {inst = 2926, source_primitive = "nor"} : (i1) -> i1
    %i2932_0 = "silicon.and"(%i4070_1, %state_235) {inst = 2932, source_primitive = "and"} : (i1, i1) -> i1
    %i2932_1 = "silicon.and"(%i2932_0, %i2937_0) {inst = 2932, source_primitive = "and"} : (i1, i1) -> i1
    %i2933_0 = "silicon.or"(%state_234, %i2928_0) {inst = 2933, source_primitive = "or"} : (i1, i1) -> i1
    %i2933_1 = "silicon.and"(%i2933_0, %i2937_0) {inst = 2933, source_primitive = "and"} : (i1, i1) -> i1
    %i2933_2 = "silicon.and"(%i2933_1, %state_236) {inst = 2933, source_primitive = "and"} : (i1, i1) -> i1
    %i2936_0 = "silicon.not"(%i4052_0) {inst = 2936, source_primitive = "not"} : (i1) -> i1
    %i2936_1 = "silicon.and"(%i2936_0, %i2938_1) {inst = 2936, source_primitive = "and"} : (i1, i1) -> i1
    %i2940_0 = "silicon.or"(%i4052_0, %state_236) {inst = 2940, source_primitive = "or"} : (i1, i1) -> i1
    %i2940_1 = "silicon.and"(%i2940_0, %i4127_1) {inst = 2940, source_primitive = "and"} : (i1, i1) -> i1
    %i2940_2 = "silicon.and"(%i2940_1, %i2935_2) {inst = 2940, source_primitive = "and"} : (i1, i1) -> i1
    %i2941_0 = "silicon.or"(%i3852_1, %i3900_1) {inst = 2941, source_primitive = "or"} : (i1, i1) -> i1
    %i2941_1 = "silicon.or"(%i2941_0, %i2953_2) {inst = 2941, source_primitive = "or"} : (i1, i1) -> i1
    %i2941_2 = "silicon.and"(%i2941_1, %i2937_0) {inst = 2941, source_primitive = "and"} : (i1, i1) -> i1
    %i2942_0 = "silicon.or"(%i4127_1, %state_236) {inst = 2942, source_primitive = "or"} : (i1, i1) -> i1
    %i2942_1 = "silicon.and"(%i2942_0, %i2935_2) {inst = 2942, source_primitive = "and"} : (i1, i1) -> i1
    %i2949_0 = "silicon.xor"(%i3289_1, %i3295_1) {inst = 2949, source_primitive = "xnor"} : (i1, i1) -> i1
    %i2949_1 = "silicon.not"(%i2949_0) {inst = 2949, source_primitive = "xnor"} : (i1) -> i1
    %i2954_0 = "silicon.or"(%i4722_1, %i3012_1) {inst = 2954, source_primitive = "nor"} : (i1, i1) -> i1
    %i2954_1 = "silicon.not"(%i2954_0) {inst = 2954, source_primitive = "nor"} : (i1) -> i1
    %i2954_2 = "silicon.and"(%i2949_1, %i2954_1) {inst = 2954, source_primitive = "and"} : (i1, i1) -> i1
    %i2955_0 = "silicon.and"(%state_235, %state_234) {inst = 2955, source_primitive = "and"} : (i1, i1) -> i1
    %i2955_1 = "silicon.or"(%state_237, %i4070_1) {inst = 2955, source_primitive = "nor"} : (i1, i1) -> i1
    %i2955_2 = "silicon.or"(%i2955_1, %i3873_1) {inst = 2955, source_primitive = "nor"} : (i1, i1) -> i1
    %i2955_3 = "silicon.or"(%i2955_2, %i2955_0) {inst = 2955, source_primitive = "nor"} : (i1, i1) -> i1
    %i2955_4 = "silicon.not"(%i2955_3) {inst = 2955, source_primitive = "nor"} : (i1) -> i1
    %i2956_0 = "silicon.not"(%i4722_1) {inst = 2956, source_primitive = "not"} : (i1) -> i1
    %i2956_1 = "silicon.and"(%input_I, %i2949_1) {inst = 2956, source_primitive = "and"} : (i1, i1) -> i1
    %i2956_2 = "silicon.or"(%i2956_0, %i2956_1) {inst = 2956, source_primitive = "nor"} : (i1, i1) -> i1
    %i2956_3 = "silicon.not"(%i2956_2) {inst = 2956, source_primitive = "nor"} : (i1) -> i1
    %i2961_0 = "silicon.and"(%state_235, %state_234) {inst = 2961, source_primitive = "and"} : (i1, i1) -> i1
    %i2961_1 = "silicon.or"(%i2961_0, %i3484_1) {inst = 2961, source_primitive = "or"} : (i1, i1) -> i1
    %i2961_2 = "silicon.or"(%i2961_1, %i3669_0) {inst = 2961, source_primitive = "or"} : (i1, i1) -> i1
    %i2963_0 = "silicon.xor"(%state_2947, %i2967_0) {inst = 2963, source_primitive = "xnor"} : (i1, i1) -> i1
    %i2963_1 = "silicon.not"(%i2963_0) {inst = 2963, source_primitive = "xnor"} : (i1) -> i1
    %i2968_0 = "silicon.and"(%i3669_0, %state_235) {inst = 2968, source_primitive = "nand"} : (i1, i1) -> i1
    %i2968_1 = "silicon.not"(%i2968_0) {inst = 2968, source_primitive = "nand"} : (i1) -> i1
    %i2968_2 = "silicon.and"(%i3701_1, %i3715_0) {inst = 2968, source_primitive = "nand"} : (i1, i1) -> i1
    %i2968_3 = "silicon.not"(%i2968_2) {inst = 2968, source_primitive = "nand"} : (i1) -> i1
    %i2968_4 = "silicon.and"(%i2968_1, %i2968_3) {inst = 2968, source_primitive = "and"} : (i1, i1) -> i1
    %i3015_0 = "silicon.xor"(%i3715_0, %state_2944) {inst = 3015, source_primitive = "xor"} : (i1, i1) -> i1
    %i3017_0 = "silicon.xor"(%state_2947, %i3289_1) {inst = 3017, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3017_1 = "silicon.not"(%i3017_0) {inst = 3017, source_primitive = "xnor"} : (i1) -> i1
    %i3164_0 = "silicon.or"(%i2949_1, %input_I) {inst = 3164, source_primitive = "or"} : (i1, i1) -> i1
    %i3164_1 = "silicon.and"(%i2956_3, %i3164_0) {inst = 3164, source_primitive = "nand"} : (i1, i1) -> i1
    %i3164_2 = "silicon.not"(%i3164_1) {inst = 3164, source_primitive = "nand"} : (i1) -> i1
    %i3191_0 = "silicon.or"(%i2949_1, %i743_1) {inst = 3191, source_primitive = "nor"} : (i1, i1) -> i1
    %i3191_1 = "silicon.not"(%i3191_0) {inst = 3191, source_primitive = "nor"} : (i1) -> i1
    %i3276_0 = "silicon.and"(%i3484_1, %state_234) {inst = 3276, source_primitive = "nand"} : (i1, i1) -> i1
    %i3276_1 = "silicon.not"(%i3276_0) {inst = 3276, source_primitive = "nand"} : (i1) -> i1
    %i3278_0 = "silicon.xor"(%state_2947, %i3282_1) {inst = 3278, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3278_1 = "silicon.not"(%i3278_0) {inst = 3278, source_primitive = "xnor"} : (i1) -> i1
    %i3279_0 = "silicon.and"(%i3701_1, %state_234) {inst = 3279, source_primitive = "and"} : (i1, i1) -> i1
    %i3279_1 = "silicon.and"(%i3279_0, %i3669_0) {inst = 3279, source_primitive = "and"} : (i1, i1) -> i1
    %i3279_2 = "silicon.or"(%i3279_1, %i2968_4) {inst = 3279, source_primitive = "or"} : (i1, i1) -> i1
    %i3297_0 = "silicon.xor"(%state_2947, %i174_2) {inst = 3297, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3297_1 = "silicon.not"(%i3297_0) {inst = 3297, source_primitive = "xnor"} : (i1) -> i1
    %i3298_0 = "silicon.xor"(%i3703_2, %state_2948) {inst = 3298, source_primitive = "xor"} : (i1, i1) -> i1
    %i3315_0 = "silicon.or"(%i3531_1, %i3685_1) {inst = 3315, source_primitive = "or"} : (i1, i1) -> i1
    %i3315_1 = "silicon.or"(%i3315_0, %i3533_1) {inst = 3315, source_primitive = "or"} : (i1, i1) -> i1
    %i3483_0 = "silicon.or"(%i198_0, %i4722_1) {inst = 3483, source_primitive = "nor"} : (i1, i1) -> i1
    %i3483_1 = "silicon.not"(%i3483_0) {inst = 3483, source_primitive = "nor"} : (i1) -> i1
    %i3487_0 = "silicon.and"(%i3483_1, %state_2947) {inst = 3487, source_primitive = "and"} : (i1, i1) -> i1
    %i3487_1 = "silicon.and"(%i4722_1, %state_2958) {inst = 3487, source_primitive = "and"} : (i1, i1) -> i1
    %i3487_2 = "silicon.or"(%i3487_1, %i3487_0) {inst = 3487, source_primitive = "or"} : (i1, i1) -> i1
    %i3518_0 = "silicon.not"(%i4722_1) {inst = 3518, source_primitive = "not"} : (i1) -> i1
    %i3518_1 = "silicon.and"(%i3518_0, %i198_0) {inst = 3518, source_primitive = "and"} : (i1, i1) -> i1
    %i3587_0 = "silicon.or"(%i3278_1, %i743_1) {inst = 3587, source_primitive = "or"} : (i1, i1) -> i1
    %i3587_1 = "silicon.or"(%i882_0, %state_2959) {inst = 3587, source_primitive = "or"} : (i1, i1) -> i1
    %i3587_2 = "silicon.and"(%i3587_0, %i3587_1) {inst = 3587, source_primitive = "and"} : (i1, i1) -> i1
    %i3587_3 = "silicon.and"(%i3587_2, %i3164_2) {inst = 3587, source_primitive = "and"} : (i1, i1) -> i1
    %i3636_0 = "silicon.and"(%i3276_1, %i3576_1) {inst = 3636, source_primitive = "and"} : (i1, i1) -> i1
    %i3636_1 = "silicon.or"(%i3685_1, %i3636_0) {inst = 3636, source_primitive = "nor"} : (i1, i1) -> i1
    %i3636_2 = "silicon.not"(%i3636_1) {inst = 3636, source_primitive = "nor"} : (i1) -> i1
    %i3660_0 = "silicon.and"(%i2925_1, %i3287_2) {inst = 3660, source_primitive = "and"} : (i1, i1) -> i1
    %i3660_1 = "silicon.and"(%i3685_1, %i3715_0) {inst = 3660, source_primitive = "and"} : (i1, i1) -> i1
    %i3660_2 = "silicon.or"(%i3660_1, %i3660_0) {inst = 3660, source_primitive = "or"} : (i1, i1) -> i1
    %i3708_0 = "silicon.not"(%i3276_1) {inst = 3708, source_primitive = "not"} : (i1) -> i1
    %i3709_0 = "silicon.xor"(%state_2959, %i3636_2) {inst = 3709, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3709_1 = "silicon.not"(%i3709_0) {inst = 3709, source_primitive = "xnor"} : (i1) -> i1
    %i3711_0 = "silicon.xor"(%state_2960, %i3279_2) {inst = 3711, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3711_1 = "silicon.not"(%i3711_0) {inst = 3711, source_primitive = "xnor"} : (i1) -> i1
    %i3712_0 = "silicon.or"(%state_234, %i3816_1) {inst = 3712, source_primitive = "nor"} : (i1, i1) -> i1
    %i3712_1 = "silicon.not"(%i3712_0) {inst = 3712, source_primitive = "nor"} : (i1) -> i1
    %i3809_0 = "silicon.and"(%i2925_1, %i3715_0) {inst = 3809, source_primitive = "nand"} : (i1, i1) -> i1
    %i3809_1 = "silicon.not"(%i3809_0) {inst = 3809, source_primitive = "nand"} : (i1) -> i1
    %i3821_0 = "silicon.or"(%i4722_1, %i2949_1) {inst = 3821, source_primitive = "nor"} : (i1, i1) -> i1
    %i3821_1 = "silicon.not"(%i3821_0) {inst = 3821, source_primitive = "nor"} : (i1) -> i1
    %i3858_0 = "silicon.or"(%i3900_1, %i2928_0) {inst = 3858, source_primitive = "or"} : (i1, i1) -> i1
    %i3858_1 = "silicon.and"(%i3858_0, %i2937_0) {inst = 3858, source_primitive = "and"} : (i1, i1) -> i1
    %i3968_0 = "silicon.and"(%i4052_0, %i4023_1) {inst = 3968, source_primitive = "and"} : (i1, i1) -> i1
    %i3968_1 = "silicon.or"(%i3980_0, %i3968_0) {inst = 3968, source_primitive = "nor"} : (i1, i1) -> i1
    %i3968_2 = "silicon.not"(%i3968_1) {inst = 3968, source_primitive = "nor"} : (i1) -> i1
    %i3976_0 = "silicon.or"(%state_237, %i4023_1) {inst = 3976, source_primitive = "nor"} : (i1, i1) -> i1
    %i3976_1 = "silicon.not"(%i3976_0) {inst = 3976, source_primitive = "nor"} : (i1) -> i1
    %i3984_0 = "silicon.not"(%state_237) {inst = 3984, source_primitive = "not"} : (i1) -> i1
    %i3984_1 = "silicon.and"(%state_234, %i3984_0) {inst = 3984, source_primitive = "and"} : (i1, i1) -> i1
    %i3984_2 = "silicon.and"(%i3984_1, %i4023_1) {inst = 3984, source_primitive = "and"} : (i1, i1) -> i1
    %i4602_0 = "silicon.and"(%i4722_1, %i4705_3) {inst = 4602, source_primitive = "and"} : (i1, i1) -> i1
    %i4602_1 = "silicon.and"(%i4602_0, %i6609_1) {inst = 4602, source_primitive = "and"} : (i1, i1) -> i1
    %i4602_2 = "silicon.or"(%i4602_1, %state_4182) {inst = 4602, source_primitive = "or"} : (i1, i1) -> i1
    %i4660_0 = "silicon.and"(%i4722_1, %state_4838) {inst = 4660, source_primitive = "and"} : (i1, i1) -> i1
    %i4660_1 = "silicon.and"(%i4660_0, %state_4662) {inst = 4660, source_primitive = "and"} : (i1, i1) -> i1
    %i4663_0 = "silicon.and"(%i4949_2, %state_4661) {inst = 4663, source_primitive = "and"} : (i1, i1) -> i1
    %i4663_1 = "silicon.and"(%i4722_1, %i4705_3) {inst = 4663, source_primitive = "and"} : (i1, i1) -> i1
    %i4663_2 = "silicon.or"(%i4663_0, %i4863_4) {inst = 4663, source_primitive = "nor"} : (i1, i1) -> i1
    %i4663_3 = "silicon.or"(%i4663_2, %i4663_1) {inst = 4663, source_primitive = "nor"} : (i1, i1) -> i1
    %i4663_4 = "silicon.not"(%i4663_3) {inst = 4663, source_primitive = "nor"} : (i1) -> i1
    %i4710_0 = "silicon.or"(%i4705_3, %i4859_1) {inst = 4710, source_primitive = "nor"} : (i1, i1) -> i1
    %i4710_1 = "silicon.not"(%i4710_0) {inst = 4710, source_primitive = "nor"} : (i1) -> i1
    %i4835_0 = "silicon.and"(%i4722_1, %i4705_3) {inst = 4835, source_primitive = "and"} : (i1, i1) -> i1
    %i4835_1 = "silicon.or"(%i4835_0, %i4837_2) {inst = 4835, source_primitive = "nor"} : (i1, i1) -> i1
    %i4835_2 = "silicon.or"(%i4835_1, %i4660_1) {inst = 4835, source_primitive = "nor"} : (i1, i1) -> i1
    %i4835_3 = "silicon.not"(%i4835_2) {inst = 4835, source_primitive = "nor"} : (i1) -> i1
    %i4862_0 = "silicon.xor"(%i4660_1, %state_4659) {inst = 4862, source_primitive = "xor"} : (i1, i1) -> i1
    %i4999_0 = "silicon.and"(%i5681_2, %state_5336) {inst = 4999, source_primitive = "and"} : (i1, i1) -> i1
    %i4999_1 = "silicon.and"(%i5681_2, %state_5000) {inst = 4999, source_primitive = "and"} : (i1, i1) -> i1
    %i4999_2 = "silicon.or"(%i4999_1, %i4999_0) {inst = 4999, source_primitive = "or"} : (i1, i1) -> i1
    %i5010_0 = "silicon.and"(%i1982_0, %i2364_1) {inst = 5010, source_primitive = "and"} : (i1, i1) -> i1
    %i5010_1 = "silicon.and"(%i5010_0, %i2107_1) {inst = 5010, source_primitive = "and"} : (i1, i1) -> i1
    %i5010_2 = "silicon.and"(%i5010_1, %i1794_0) {inst = 5010, source_primitive = "and"} : (i1, i1) -> i1
    %i5225_0 = "silicon.and"(%i1775_1, %i1776_0) {inst = 5225, source_primitive = "and"} : (i1, i1) -> i1
    %i5225_1 = "silicon.and"(%i5225_0, %i1376_1) {inst = 5225, source_primitive = "and"} : (i1, i1) -> i1
    %i5225_2 = "silicon.and"(%i5225_1, %i1630_1) {inst = 5225, source_primitive = "and"} : (i1, i1) -> i1
    %i5229_0 = "silicon.and"(%net_60777, %state_5339) {inst = 5229, source_primitive = "and"} : (i1, i1) -> i1
    %i5229_1 = "silicon.and"(%i5680_3, %state_5344) {inst = 5229, source_primitive = "and"} : (i1, i1) -> i1
    %i5229_2 = "silicon.or"(%i5229_1, %i5229_0) {inst = 5229, source_primitive = "or"} : (i1, i1) -> i1
    %i5229_3 = "silicon.or"(%i5229_2, %i4999_2) {inst = 5229, source_primitive = "or"} : (i1, i1) -> i1
    %i5256_0 = "silicon.and"(%i5229_3, %input_I) {inst = 5256, source_primitive = "and"} : (i1, i1) -> i1
    %i5256_1 = "silicon.and"(%i5256_0, %i4722_1) {inst = 5256, source_primitive = "and"} : (i1, i1) -> i1
    %i5256_2 = "silicon.or"(%i5256_1, %state_5337) {inst = 5256, source_primitive = "or"} : (i1, i1) -> i1
    %i5613_0 = "silicon.and"(%state_6199, %i6032_0) {inst = 5613, source_primitive = "and"} : (i1, i1) -> i1
    %i5613_1 = "silicon.and"(%i5613_0, %i6166_1) {inst = 5613, source_primitive = "and"} : (i1, i1) -> i1
    %i5613_2 = "silicon.and"(%i5613_1, %i6350_1) {inst = 5613, source_primitive = "and"} : (i1, i1) -> i1
    %i5614_0 = "silicon.or"(%i6166_1, %i6160_2) {inst = 5614, source_primitive = "nor"} : (i1, i1) -> i1
    %i5614_1 = "silicon.not"(%i5614_0) {inst = 5614, source_primitive = "nor"} : (i1) -> i1
    %i5626_0 = "silicon.not"(%i6166_1) {inst = 5626, source_primitive = "not"} : (i1) -> i1
    %i5677_0 = "silicon.or"(%i5711_1, %state_5634) {inst = 5677, source_primitive = "or"} : (i1, i1) -> i1
    %i5677_1 = "silicon.and"(%i5677_0, %i5684_0) {inst = 5677, source_primitive = "and"} : (i1, i1) -> i1
    %i5677_2 = "silicon.and"(%i5677_1, %i4722_1) {inst = 5677, source_primitive = "and"} : (i1, i1) -> i1
    %i5682_0 = "silicon.and"(%i5636_0, %i5711_1) {inst = 5682, source_primitive = "and"} : (i1, i1) -> i1
    %i5682_1 = "silicon.or"(%i5778_0, %i5682_0) {inst = 5682, source_primitive = "nor"} : (i1, i1) -> i1
    %i5682_2 = "silicon.not"(%i5682_1) {inst = 5682, source_primitive = "nor"} : (i1) -> i1
    %i5683_0 = "silicon.mux"(%state_5634, %i5684_0, %i5711_1) {inst = 5683, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i5781_0 = "silicon.and"(%i5677_2, %i5630_0) {inst = 5781, source_primitive = "and"} : (i1, i1) -> i1
    %i5781_1 = "silicon.and"(%i5775_0, %state_5639) {inst = 5781, source_primitive = "and"} : (i1, i1) -> i1
    %i5781_2 = "silicon.or"(%i5781_1, %i5781_0) {inst = 5781, source_primitive = "or"} : (i1, i1) -> i1
    %i5947_0 = "silicon.and"(%i6350_1, %i6032_0) {inst = 5947, source_primitive = "and"} : (i1, i1) -> i1
    %i5947_1 = "silicon.and"(%i5947_0, %i6166_1) {inst = 5947, source_primitive = "and"} : (i1, i1) -> i1
    %i5947_2 = "silicon.or"(%i5947_1, %state_6199) {inst = 5947, source_primitive = "or"} : (i1, i1) -> i1
    %i6017_0 = "silicon.and"(%i6350_1, %state_6198) {inst = 6017, source_primitive = "and"} : (i1, i1) -> i1
    %i6017_1 = "silicon.and"(%i6017_0, %i6166_1) {inst = 6017, source_primitive = "and"} : (i1, i1) -> i1
    %i6017_2 = "silicon.or"(%i6017_1, %state_6197) {inst = 6017, source_primitive = "or"} : (i1, i1) -> i1
    %i6033_0 = "silicon.and"(%i6166_1, %state_6109) {inst = 6033, source_primitive = "and"} : (i1, i1) -> i1
    %i6033_1 = "silicon.and"(%i6033_0, %state_6106) {inst = 6033, source_primitive = "and"} : (i1, i1) -> i1
    %i6067_0 = "silicon.and"(%i6350_1, %i6166_1) {inst = 6067, source_primitive = "nand"} : (i1, i1) -> i1
    %i6067_1 = "silicon.not"(%i6067_0) {inst = 6067, source_primitive = "nand"} : (i1) -> i1
    %i6092_0 = "silicon.and"(%i6032_0, %i6194_3) {inst = 6092, source_primitive = "and"} : (i1, i1) -> i1
    %i6092_1 = "silicon.and"(%i6092_0, %i6094_1) {inst = 6092, source_primitive = "and"} : (i1, i1) -> i1
    %i6103_0 = "silicon.and"(%i6094_1, %input_I) {inst = 6103, source_primitive = "and"} : (i1, i1) -> i1
    %i6103_1 = "silicon.and"(%i6103_0, %i4722_1) {inst = 6103, source_primitive = "and"} : (i1, i1) -> i1
    %i6103_2 = "silicon.and"(%i5626_0, %state_6109) {inst = 6103, source_primitive = "and"} : (i1, i1) -> i1
    %i6103_3 = "silicon.or"(%i6103_2, %i6103_1) {inst = 6103, source_primitive = "or"} : (i1, i1) -> i1
    %i6110_0 = "silicon.xor"(%i5613_2, %state_6159) {inst = 6110, source_primitive = "xor"} : (i1, i1) -> i1
    %i6195_0 = "silicon.xor"(%state_6198, %i6067_1) {inst = 6195, source_primitive = "xnor"} : (i1, i1) -> i1
    %i6195_1 = "silicon.not"(%i6195_0) {inst = 6195, source_primitive = "xnor"} : (i1) -> i1
    %i6437_0 = "silicon.or"(%i6472_3, %state_6442) {inst = 6437, source_primitive = "or"} : (i1, i1) -> i1
    %i6437_1 = "silicon.or"(%i6437_0, %i6445_1) {inst = 6437, source_primitive = "or"} : (i1, i1) -> i1
    %i6437_2 = "silicon.and"(%i6437_1, %i6473_2) {inst = 6437, source_primitive = "and"} : (i1, i1) -> i1
    %i6437_3 = "silicon.and"(%i6437_2, %i6474_1) {inst = 6437, source_primitive = "and"} : (i1, i1) -> i1
    %i6441_0 = "silicon.and"(%i6472_3, %i4705_3) {inst = 6441, source_primitive = "and"} : (i1, i1) -> i1
    %i6441_1 = "silicon.and"(%i6441_0, %i4722_1) {inst = 6441, source_primitive = "and"} : (i1, i1) -> i1
    %i6444_0 = "silicon.mux"(%state_6442, %i6445_1, %i6441_1) {inst = 6444, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i6446_0 = "silicon.or"(%i6445_1, %i6472_3) {inst = 6446, source_primitive = "or"} : (i1, i1) -> i1
    %i6446_1 = "silicon.and"(%i6446_0, %i6403_2) {inst = 6446, source_primitive = "and"} : (i1, i1) -> i1
    %i6446_2 = "silicon.and"(%i6446_1, %i6478_0) {inst = 6446, source_primitive = "and"} : (i1, i1) -> i1
    %i6806_0 = "silicon.and"(%i8325_1, %i8367_0) {inst = 6806, source_primitive = "and"} : (i1, i1) -> i1
    %i6806_1 = "silicon.and"(%i6806_0, %i2843_1) {inst = 6806, source_primitive = "and"} : (i1, i1) -> i1
    %i6806_2 = "silicon.and"(%i6806_1, %i8218_1) {inst = 6806, source_primitive = "and"} : (i1, i1) -> i1
    %i6809_0 = "silicon.and"(%i2571_1, %i2555_1) {inst = 6809, source_primitive = "and"} : (i1, i1) -> i1
    %i6809_1 = "silicon.and"(%i6809_0, %i2561_0) {inst = 6809, source_primitive = "and"} : (i1, i1) -> i1
    %i6955_0 = "silicon.and"(%state_6451, %i6950_0) {inst = 6955, source_primitive = "and"} : (i1, i1) -> i1
    %i6955_1 = "silicon.or"(%i9637_1, %i6955_0) {inst = 6955, source_primitive = "nor"} : (i1, i1) -> i1
    %i6955_2 = "silicon.not"(%i6955_1) {inst = 6955, source_primitive = "nor"} : (i1) -> i1
    %i6974_0 = "silicon.or"(%i7169_1, %state_237) {inst = 6974, source_primitive = "or"} : (i1, i1) -> i1
    %i6974_1 = "silicon.or"(%i7335_1, %i6970_1) {inst = 6974, source_primitive = "or"} : (i1, i1) -> i1
    %i6974_2 = "silicon.and"(%i6974_0, %i6974_1) {inst = 6974, source_primitive = "and"} : (i1, i1) -> i1
    %i6976_0 = "silicon.or"(%i7317_0, %state_234) {inst = 6976, source_primitive = "nor"} : (i1, i1) -> i1
    %i6976_1 = "silicon.or"(%i6976_0, %i7335_1) {inst = 6976, source_primitive = "nor"} : (i1, i1) -> i1
    %i6976_2 = "silicon.not"(%i6976_1) {inst = 6976, source_primitive = "nor"} : (i1) -> i1
    %i6989_0 = "silicon.or"(%state_234, %state_236) {inst = 6989, source_primitive = "or"} : (i1, i1) -> i1
    %i6989_1 = "silicon.or"(%i6973_3, %i7057_2) {inst = 6989, source_primitive = "or"} : (i1, i1) -> i1
    %i6989_2 = "silicon.and"(%i6989_0, %i6989_1) {inst = 6989, source_primitive = "and"} : (i1, i1) -> i1
    %i6991_0 = "silicon.and"(%i7104_1, %input_undriven_61217) {inst = 6991, source_primitive = "and"} : (i1, i1) -> i1
    %i6991_1 = "silicon.and"(%i6991_0, %i6995_1) {inst = 6991, source_primitive = "and"} : (i1, i1) -> i1
    %i6991_2 = "silicon.or"(%i7153_2, %i6991_1) {inst = 6991, source_primitive = "nor"} : (i1, i1) -> i1
    %i6991_3 = "silicon.not"(%i6991_2) {inst = 6991, source_primitive = "nor"} : (i1) -> i1
    %i6992_0 = "silicon.or"(%i7311_0, %i6975_1) {inst = 6992, source_primitive = "nor"} : (i1, i1) -> i1
    %i6992_1 = "silicon.or"(%i6992_0, %i6991_3) {inst = 6992, source_primitive = "nor"} : (i1, i1) -> i1
    %i6992_2 = "silicon.not"(%i6992_1) {inst = 6992, source_primitive = "nor"} : (i1) -> i1
    %i6992_3 = "silicon.or"(%i6995_1, %state_235) {inst = 6992, source_primitive = "nor"} : (i1, i1) -> i1
    %i6992_4 = "silicon.not"(%i6992_3) {inst = 6992, source_primitive = "nor"} : (i1) -> i1
    %i6992_5 = "silicon.or"(%i6992_4, %i6992_2) {inst = 6992, source_primitive = "or"} : (i1, i1) -> i1
    %i7006_0 = "silicon.or"(%i6973_3, %i7057_2) {inst = 7006, source_primitive = "or"} : (i1, i1) -> i1
    %i7006_1 = "silicon.or"(%i7006_0, %i6990_4) {inst = 7006, source_primitive = "or"} : (i1, i1) -> i1
    %i7091_0 = "silicon.and"(%i7104_1, %input_undriven_61217) {inst = 7091, source_primitive = "and"} : (i1, i1) -> i1
    %i7091_1 = "silicon.and"(%i7091_0, %i6995_1) {inst = 7091, source_primitive = "and"} : (i1, i1) -> i1
    %i7091_2 = "silicon.or"(%i7091_1, %i7153_2) {inst = 7091, source_primitive = "or"} : (i1, i1) -> i1
    %i7091_3 = "silicon.or"(%i7091_2, %i7287_1) {inst = 7091, source_primitive = "or"} : (i1, i1) -> i1
    %i7291_0 = "silicon.and"(%i6969_1, %i7301_1) {inst = 7291, source_primitive = "and"} : (i1, i1) -> i1
    %i7291_1 = "silicon.or"(%i7291_0, %state_236) {inst = 7291, source_primitive = "or"} : (i1, i1) -> i1
    %i7314_0 = "silicon.not"(%i7335_1) {inst = 7314, source_primitive = "not"} : (i1) -> i1
    %i7314_1 = "silicon.and"(%i7153_2, %i7314_0) {inst = 7314, source_primitive = "and"} : (i1, i1) -> i1
    %i7314_2 = "silicon.and"(%i7314_1, %i6969_1) {inst = 7314, source_primitive = "and"} : (i1, i1) -> i1
    %i7326_0 = "silicon.xor"(%i7314_2, %i7291_1) {inst = 7326, source_primitive = "xnor"} : (i1, i1) -> i1
    %i7326_1 = "silicon.not"(%i7326_0) {inst = 7326, source_primitive = "xnor"} : (i1) -> i1
    %i7417_0 = "silicon.and"(%i7566_1, %i6956_1) {inst = 7417, source_primitive = "and"} : (i1, i1) -> i1
    %i7417_1 = "silicon.and"(%i7417_0, %i6953_1) {inst = 7417, source_primitive = "and"} : (i1, i1) -> i1
    %i7454_0 = "silicon.or"(%i6956_1, %i7566_1) {inst = 7454, source_primitive = "nor"} : (i1, i1) -> i1
    %i7454_1 = "silicon.not"(%i7454_0) {inst = 7454, source_primitive = "nor"} : (i1) -> i1
    %i7546_0 = "silicon.and"(%state_6435, %i7465_1) {inst = 7546, source_primitive = "and"} : (i1, i1) -> i1
    %i7546_1 = "silicon.or"(%i7454_1, %i7546_0) {inst = 7546, source_primitive = "nor"} : (i1, i1) -> i1
    %i7546_2 = "silicon.not"(%i7546_1) {inst = 7546, source_primitive = "nor"} : (i1) -> i1
    %i7565_0 = "silicon.xor"(%i7465_1, %i7567_0) {inst = 7565, source_primitive = "xnor"} : (i1, i1) -> i1
    %i7565_1 = "silicon.not"(%i7565_0) {inst = 7565, source_primitive = "xnor"} : (i1) -> i1
    %i7660_0 = "silicon.and"(%i7565_1, %state_4661) {inst = 7660, source_primitive = "nand"} : (i1, i1) -> i1
    %i7660_1 = "silicon.not"(%i7660_0) {inst = 7660, source_primitive = "nand"} : (i1) -> i1
    %i8575_0 = "silicon.and"(%state_8591, %i8660_0) {inst = 8575, source_primitive = "and"} : (i1, i1) -> i1
    %i9341_0 = "silicon.and"(%i9354_0, %state_4838) {inst = 9341, source_primitive = "nand"} : (i1, i1) -> i1
    %i9341_1 = "silicon.not"(%i9341_0) {inst = 9341, source_primitive = "nand"} : (i1) -> i1
    %i9346_0 = "silicon.and"(%i9608_1, %i9356_1) {inst = 9346, source_primitive = "nand"} : (i1, i1) -> i1
    %i9346_1 = "silicon.not"(%i9346_0) {inst = 9346, source_primitive = "nand"} : (i1) -> i1
    %i9353_0 = "silicon.xor"(%i6955_2, %state_4659) {inst = 9353, source_primitive = "xor"} : (i1, i1) -> i1
    %i9360_0 = "silicon.xor"(%i9341_1, %i9353_0) {inst = 9360, source_primitive = "xnor"} : (i1, i1) -> i1
    %i9360_1 = "silicon.not"(%i9360_0) {inst = 9360, source_primitive = "xnor"} : (i1) -> i1
    %i9597_0 = "silicon.or"(%i9636_1, %i9346_1) {inst = 9597, source_primitive = "nor"} : (i1, i1) -> i1
    %i9597_1 = "silicon.not"(%i9597_0) {inst = 9597, source_primitive = "nor"} : (i1) -> i1
    %i9607_0 = "silicon.or"(%i9636_1, %i9470_0) {inst = 9607, source_primitive = "or"} : (i1, i1) -> i1
    %i142_0 = "silicon.or"(%i3017_1, %state_2957) {inst = 142, source_primitive = "or"} : (i1, i1) -> i1
    %i144_0 = "silicon.or"(%i2370_1, %i2396_3) {inst = 144, source_primitive = "or"} : (i1, i1) -> i1
    %i144_1 = "silicon.or"(%i144_0, %i2013_0) {inst = 144, source_primitive = "or"} : (i1, i1) -> i1
    %i144_2 = "silicon.or"(%i144_1, %state_2039) {inst = 144, source_primitive = "or"} : (i1, i1) -> i1
    %i171_0 = "silicon.and"(%i3296_0, %i3167_0) {inst = 171, source_primitive = "and"} : (i1, i1) -> i1
    %i171_1 = "silicon.or"(%i743_1, %i171_0) {inst = 171, source_primitive = "nor"} : (i1, i1) -> i1
    %i171_2 = "silicon.not"(%i171_1) {inst = 171, source_primitive = "nor"} : (i1) -> i1
    %i173_0 = "silicon.and"(%i3017_1, %state_2957) {inst = 173, source_primitive = "nand"} : (i1, i1) -> i1
    %i173_1 = "silicon.not"(%i173_0) {inst = 173, source_primitive = "nand"} : (i1) -> i1
    %i203_0 = "silicon.and"(%i385_0, %state_227) {inst = 203, source_primitive = "and"} : (i1, i1) -> i1
    %i203_1 = "silicon.or"(%i203_0, %i6092_1) {inst = 203, source_primitive = "nor"} : (i1, i1) -> i1
    %i203_2 = "silicon.or"(%i203_1, %i6107_4) {inst = 203, source_primitive = "nor"} : (i1, i1) -> i1
    %i203_3 = "silicon.not"(%i203_2) {inst = 203, source_primitive = "nor"} : (i1) -> i1
    %i387_0 = "silicon.or"(%state_228, %state_227) {inst = 387, source_primitive = "nor"} : (i1, i1) -> i1
    %i387_1 = "silicon.not"(%i387_0) {inst = 387, source_primitive = "nor"} : (i1) -> i1
    %i387_2 = "silicon.or"(%i6092_1, %i387_1) {inst = 387, source_primitive = "nor"} : (i1, i1) -> i1
    %i387_3 = "silicon.not"(%i387_2) {inst = 387, source_primitive = "nor"} : (i1) -> i1
    %i498_0 = "silicon.or"(%i6107_4, %i387_3) {inst = 498, source_primitive = "nor"} : (i1, i1) -> i1
    %i498_1 = "silicon.not"(%i498_0) {inst = 498, source_primitive = "nor"} : (i1) -> i1
    %i536_0 = "silicon.not"(%state_227) {inst = 536, source_primitive = "not"} : (i1) -> i1
    %i536_1 = "silicon.or"(%i536_0, %i6092_1) {inst = 536, source_primitive = "or"} : (i1, i1) -> i1
    %i536_2 = "silicon.or"(%i536_1, %state_228) {inst = 536, source_primitive = "or"} : (i1, i1) -> i1
    %i536_3 = "silicon.or"(%i536_2, %i6107_4) {inst = 536, source_primitive = "or"} : (i1, i1) -> i1
    %i1166_0 = "silicon.or"(%i743_1, %i2963_1) {inst = 1166, source_primitive = "nor"} : (i1, i1) -> i1
    %i1166_1 = "silicon.not"(%i1166_0) {inst = 1166, source_primitive = "nor"} : (i1) -> i1
    %i1235_0 = "silicon.or"(%i1641_3, %state_1810) {inst = 1235, source_primitive = "or"} : (i1, i1) -> i1
    %i1235_1 = "silicon.and"(%i1235_0, %i1234_2) {inst = 1235, source_primitive = "and"} : (i1, i1) -> i1
    %i1240_0 = "silicon.not"(%i1641_3) {inst = 1240, source_primitive = "not"} : (i1) -> i1
    %i1240_1 = "silicon.or"(%i1240_0, %state_1810) {inst = 1240, source_primitive = "or"} : (i1, i1) -> i1
    %i1252_0 = "silicon.or"(%i1255_1, %i1770_3) {inst = 1252, source_primitive = "or"} : (i1, i1) -> i1
    %i1252_1 = "silicon.or"(%i1252_0, %i2012_0) {inst = 1252, source_primitive = "or"} : (i1, i1) -> i1
    %i1252_2 = "silicon.or"(%i1252_1, %state_1249) {inst = 1252, source_primitive = "or"} : (i1, i1) -> i1
    %i1367_0 = "silicon.and"(%state_1261, %i1377_1) {inst = 1367, source_primitive = "and"} : (i1, i1) -> i1
    %i1367_1 = "silicon.or"(%i1367_0, %state_1384) {inst = 1367, source_primitive = "or"} : (i1, i1) -> i1
    %i1611_0 = "silicon.or"(%i1381_3, %state_1626) {inst = 1611, source_primitive = "or"} : (i1, i1) -> i1
    %i1611_1 = "silicon.and"(%i1611_0, %i1635_2) {inst = 1611, source_primitive = "and"} : (i1, i1) -> i1
    %i1777_0 = "silicon.and"(%state_1809, %i1798_1) {inst = 1777, source_primitive = "and"} : (i1, i1) -> i1
    %i1777_1 = "silicon.or"(%i1777_0, %state_1229) {inst = 1777, source_primitive = "or"} : (i1, i1) -> i1
    %i1780_0 = "silicon.or"(%i2034_3, %state_2036) {inst = 1780, source_primitive = "or"} : (i1, i1) -> i1
    %i1780_1 = "silicon.and"(%i1780_0, %i2049_2) {inst = 1780, source_primitive = "and"} : (i1, i1) -> i1
    %i1781_0 = "silicon.or"(%i1798_1, %state_1809) {inst = 1781, source_primitive = "or"} : (i1, i1) -> i1
    %i1781_1 = "silicon.and"(%i1781_0, %i1244_2) {inst = 1781, source_primitive = "and"} : (i1, i1) -> i1
    %i1792_0 = "silicon.not"(%i2034_3) {inst = 1792, source_primitive = "not"} : (i1) -> i1
    %i1792_1 = "silicon.or"(%i1792_0, %state_2036) {inst = 1792, source_primitive = "or"} : (i1, i1) -> i1
    %i1795_0 = "silicon.or"(%i2143_1, %state_2037) {inst = 1795, source_primitive = "or"} : (i1, i1) -> i1
    %i1795_1 = "silicon.and"(%i1795_0, %i1252_2) {inst = 1795, source_primitive = "and"} : (i1, i1) -> i1
    %i1796_0 = "silicon.and"(%state_2037, %i2143_1) {inst = 1796, source_primitive = "and"} : (i1, i1) -> i1
    %i1796_1 = "silicon.or"(%i1796_0, %state_1249) {inst = 1796, source_primitive = "or"} : (i1, i1) -> i1
    %i2359_0 = "silicon.or"(%i2396_3, %i2370_1) {inst = 2359, source_primitive = "nor"} : (i1, i1) -> i1
    %i2359_1 = "silicon.not"(%i2359_0) {inst = 2359, source_primitive = "nor"} : (i1) -> i1
    %i2363_0 = "silicon.or"(%i2369_3, %state_2372) {inst = 2363, source_primitive = "or"} : (i1, i1) -> i1
    %i2363_1 = "silicon.and"(%i2363_0, %i2361_2) {inst = 2363, source_primitive = "and"} : (i1, i1) -> i1
    %i2939_0 = "silicon.or"(%i3978_2, %i3976_1) {inst = 2939, source_primitive = "or"} : (i1, i1) -> i1
    %i2939_1 = "silicon.or"(%i4023_1, %i4052_0) {inst = 2939, source_primitive = "or"} : (i1, i1) -> i1
    %i2939_2 = "silicon.and"(%i2939_0, %i2939_1) {inst = 2939, source_primitive = "and"} : (i1, i1) -> i1
    %i2939_3 = "silicon.and"(%i2939_2, %i2938_1) {inst = 2939, source_primitive = "and"} : (i1, i1) -> i1
    %i2965_0 = "silicon.and"(%state_2960, %i3483_1) {inst = 2965, source_primitive = "and"} : (i1, i1) -> i1
    %i2965_1 = "silicon.and"(%i4722_1, %state_2947) {inst = 2965, source_primitive = "and"} : (i1, i1) -> i1
    %i2965_2 = "silicon.or"(%i2965_1, %i2965_0) {inst = 2965, source_primitive = "or"} : (i1, i1) -> i1
    %i2965_3 = "silicon.or"(%i2965_2, %i3191_1) {inst = 2965, source_primitive = "or"} : (i1, i1) -> i1
    %i2972_0 = "silicon.and"(%i3821_1, %i3012_1) {inst = 2972, source_primitive = "and"} : (i1, i1) -> i1
    %i2972_1 = "silicon.and"(%i4722_1, %state_2957) {inst = 2972, source_primitive = "and"} : (i1, i1) -> i1
    %i2972_2 = "silicon.or"(%i2972_1, %i2972_0) {inst = 2972, source_primitive = "or"} : (i1, i1) -> i1
    %i2972_3 = "silicon.or"(%i2972_2, %i3483_1) {inst = 2972, source_primitive = "or"} : (i1, i1) -> i1
    %i2973_0 = "silicon.or"(%i882_0, %state_2946) {inst = 2973, source_primitive = "or"} : (i1, i1) -> i1
    %i2973_1 = "silicon.or"(%i2972_3, %i2954_2) {inst = 2973, source_primitive = "or"} : (i1, i1) -> i1
    %i2973_2 = "silicon.and"(%i2973_0, %i2973_1) {inst = 2973, source_primitive = "and"} : (i1, i1) -> i1
    %i2974_0 = "silicon.or"(%i3167_0, %i3296_0) {inst = 2974, source_primitive = "or"} : (i1, i1) -> i1
    %i2974_1 = "silicon.and"(%i2974_0, %i171_2) {inst = 2974, source_primitive = "and"} : (i1, i1) -> i1
    %i3014_0 = "silicon.xor"(%i3017_1, %state_2959) {inst = 3014, source_primitive = "xor"} : (i1, i1) -> i1
    %i3163_0 = "silicon.or"(%i3809_1, %i3708_0) {inst = 3163, source_primitive = "or"} : (i1, i1) -> i1
    %i3163_1 = "silicon.and"(%i2961_2, %i3163_0) {inst = 3163, source_primitive = "nand"} : (i1, i1) -> i1
    %i3163_2 = "silicon.not"(%i3163_1) {inst = 3163, source_primitive = "nand"} : (i1) -> i1
    %i3277_0 = "silicon.not"(%i4722_1) {inst = 3277, source_primitive = "not"} : (i1) -> i1
    %i3277_1 = "silicon.and"(%i3014_0, %i3277_0) {inst = 3277, source_primitive = "and"} : (i1, i1) -> i1
    %i3277_2 = "silicon.and"(%i3277_1, %i2949_1) {inst = 3277, source_primitive = "and"} : (i1, i1) -> i1
    %i3281_0 = "silicon.and"(%i4722_1, %state_2944) {inst = 3281, source_primitive = "and"} : (i1, i1) -> i1
    %i3281_1 = "silicon.or"(%i3281_0, %i3483_1) {inst = 3281, source_primitive = "or"} : (i1, i1) -> i1
    %i3285_0 = "silicon.and"(%state_2944, %i3483_1) {inst = 3285, source_primitive = "and"} : (i1, i1) -> i1
    %i3285_1 = "silicon.and"(%i4722_1, %state_2959) {inst = 3285, source_primitive = "and"} : (i1, i1) -> i1
    %i3285_2 = "silicon.or"(%i3285_1, %i3285_0) {inst = 3285, source_primitive = "or"} : (i1, i1) -> i1
    %i3285_3 = "silicon.or"(%i3285_2, %i1166_1) {inst = 3285, source_primitive = "or"} : (i1, i1) -> i1
    %i3286_0 = "silicon.xor"(%i3315_1, %i3015_0) {inst = 3286, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3286_1 = "silicon.not"(%i3286_0) {inst = 3286, source_primitive = "xnor"} : (i1) -> i1
    %i3477_0 = "silicon.and"(%state_2958, %i3483_1) {inst = 3477, source_primitive = "and"} : (i1, i1) -> i1
    %i3477_1 = "silicon.and"(%i4722_1, %state_2948) {inst = 3477, source_primitive = "and"} : (i1, i1) -> i1
    %i3477_2 = "silicon.or"(%i3477_1, %i3477_0) {inst = 3477, source_primitive = "or"} : (i1, i1) -> i1
    %i3480_0 = "silicon.and"(%i3660_2, %i3478_1) {inst = 3480, source_primitive = "nand"} : (i1, i1) -> i1
    %i3480_1 = "silicon.not"(%i3480_0) {inst = 3480, source_primitive = "nand"} : (i1) -> i1
    %i3489_0 = "silicon.and"(%i142_0, %i3518_1) {inst = 3489, source_primitive = "and"} : (i1, i1) -> i1
    %i3489_1 = "silicon.and"(%i3489_0, %i173_1) {inst = 3489, source_primitive = "and"} : (i1, i1) -> i1
    %i3489_2 = "silicon.or"(%i3489_1, %i3487_2) {inst = 3489, source_primitive = "or"} : (i1, i1) -> i1
    %i3516_0 = "silicon.and"(%i3518_1, %i3283_1) {inst = 3516, source_primitive = "and"} : (i1, i1) -> i1
    %i3516_1 = "silicon.or"(%i3516_0, %i3477_2) {inst = 3516, source_primitive = "or"} : (i1, i1) -> i1
    %i3710_0 = "silicon.or"(%i2925_1, %i3708_0) {inst = 3710, source_primitive = "or"} : (i1, i1) -> i1
    %i3710_1 = "silicon.or"(%i3710_0, %i3712_1) {inst = 3710, source_primitive = "or"} : (i1, i1) -> i1
    %i3710_2 = "silicon.or"(%i3809_1, %i3816_1) {inst = 3710, source_primitive = "or"} : (i1, i1) -> i1
    %i3710_3 = "silicon.and"(%i3710_1, %i3710_2) {inst = 3710, source_primitive = "and"} : (i1, i1) -> i1
    %i5013_0 = "silicon.and"(%i5230_1, %i5225_2) {inst = 5013, source_primitive = "and"} : (i1, i1) -> i1
    %i5013_1 = "silicon.and"(%i5013_0, %i5010_2) {inst = 5013, source_primitive = "and"} : (i1, i1) -> i1
    %i5603_0 = "silicon.not"(%i6033_1) {inst = 5603, source_primitive = "not"} : (i1) -> i1
    %i5603_1 = "silicon.and"(%i5603_0, %i6356_1) {inst = 5603, source_primitive = "and"} : (i1, i1) -> i1
    %i5615_0 = "silicon.not"(%i5613_2) {inst = 5615, source_primitive = "not"} : (i1) -> i1
    %i5615_1 = "silicon.and"(%i5615_0, %i5947_2) {inst = 5615, source_primitive = "and"} : (i1, i1) -> i1
    %i5627_0 = "silicon.or"(%i6067_1, %i5628_1) {inst = 5627, source_primitive = "or"} : (i1, i1) -> i1
    %i5627_1 = "silicon.and"(%i5627_0, %i6017_2) {inst = 5627, source_primitive = "and"} : (i1, i1) -> i1
    %i5640_0 = "silicon.and"(%i5683_0, %i4705_3) {inst = 5640, source_primitive = "and"} : (i1, i1) -> i1
    %i5640_1 = "silicon.and"(%i5640_0, %i4722_1) {inst = 5640, source_primitive = "and"} : (i1, i1) -> i1
    %i5640_2 = "silicon.or"(%i5640_1, %state_5638) {inst = 5640, source_primitive = "or"} : (i1, i1) -> i1
    %i6041_0 = "silicon.or"(%i6033_1, %state_6095) {inst = 6041, source_primitive = "or"} : (i1, i1) -> i1
    %i6041_1 = "silicon.and"(%i6041_0, %i6067_1) {inst = 6041, source_primitive = "and"} : (i1, i1) -> i1
    %i6822_0 = "silicon.and"(%i8575_0, %i8590_1) {inst = 6822, source_primitive = "and"} : (i1, i1) -> i1
    %i6822_1 = "silicon.and"(%i6822_0, %i8408_1) {inst = 6822, source_primitive = "and"} : (i1, i1) -> i1
    %i6822_2 = "silicon.and"(%i6822_1, %i8197_0) {inst = 6822, source_primitive = "and"} : (i1, i1) -> i1
    %i6949_0 = "silicon.and"(%i6955_2, %state_4659) {inst = 6949, source_primitive = "nand"} : (i1, i1) -> i1
    %i6949_1 = "silicon.not"(%i6949_0) {inst = 6949, source_primitive = "nand"} : (i1) -> i1
    %i6949_2 = "silicon.or"(%state_6436, %i9622_1) {inst = 6949, source_primitive = "or"} : (i1, i1) -> i1
    %i6949_3 = "silicon.and"(%i6949_1, %i6949_2) {inst = 6949, source_primitive = "and"} : (i1, i1) -> i1
    %i6954_0 = "silicon.and"(%state_6435, %state_6451) {inst = 6954, source_primitive = "and"} : (i1, i1) -> i1
    %i6954_1 = "silicon.and"(%i6954_0, %state_6436) {inst = 6954, source_primitive = "and"} : (i1, i1) -> i1
    %i6954_2 = "silicon.or"(%i6954_1, %i7454_1) {inst = 6954, source_primitive = "or"} : (i1, i1) -> i1
    %i6962_0 = "silicon.not"(%i9597_1) {inst = 6962, source_primitive = "not"} : (i1) -> i1
    %i6972_0 = "silicon.or"(%i6991_3, %i6975_1) {inst = 6972, source_primitive = "or"} : (i1, i1) -> i1
    %i6972_1 = "silicon.or"(%i6972_0, %i6976_2) {inst = 6972, source_primitive = "or"} : (i1, i1) -> i1
    %i6972_2 = "silicon.and"(%i6972_1, %i7091_3) {inst = 6972, source_primitive = "and"} : (i1, i1) -> i1
    %i7167_0 = "silicon.not"(%i7314_2) {inst = 7167, source_primitive = "not"} : (i1) -> i1
    %i7167_1 = "silicon.or"(%i6995_1, %i7335_1) {inst = 7167, source_primitive = "or"} : (i1, i1) -> i1
    %i7167_2 = "silicon.and"(%i7167_0, %i7167_1) {inst = 7167, source_primitive = "nand"} : (i1, i1) -> i1
    %i7167_3 = "silicon.not"(%i7167_2) {inst = 7167, source_primitive = "nand"} : (i1) -> i1
    %i7380_0 = "silicon.or"(%i7548_2, %i6954_2) {inst = 7380, source_primitive = "nor"} : (i1, i1) -> i1
    %i7380_1 = "silicon.not"(%i7380_0) {inst = 7380, source_primitive = "nor"} : (i1) -> i1
    %i7380_2 = "silicon.or"(%state_6451, %i6953_1) {inst = 7380, source_primitive = "nor"} : (i1, i1) -> i1
    %i7380_3 = "silicon.not"(%i7380_2) {inst = 7380, source_primitive = "nor"} : (i1) -> i1
    %i7380_4 = "silicon.or"(%i7380_3, %i7380_1) {inst = 7380, source_primitive = "or"} : (i1, i1) -> i1
    %i7381_0 = "silicon.and"(%i7465_1, %i7454_1) {inst = 7381, source_primitive = "and"} : (i1, i1) -> i1
    %i7381_1 = "silicon.or"(%i7381_0, %i7546_2) {inst = 7381, source_primitive = "or"} : (i1, i1) -> i1
    %i7383_0 = "silicon.or"(%i7454_1, %i6957_1) {inst = 7383, source_primitive = "or"} : (i1, i1) -> i1
    %i7383_1 = "silicon.or"(%i7383_0, %i7417_1) {inst = 7383, source_primitive = "or"} : (i1, i1) -> i1
    %i7416_0 = "silicon.not"(%i8998_3) {inst = 7416, source_primitive = "not"} : (i1) -> i1
    %i7416_1 = "silicon.and"(%i7416_0, %i7380_4) {inst = 7416, source_primitive = "and"} : (i1, i1) -> i1
    %i7560_0 = "silicon.and"(%i7656_1, %i7660_1) {inst = 7560, source_primitive = "and"} : (i1, i1) -> i1
    %i7560_1 = "silicon.or"(%i7383_1, %i7560_0) {inst = 7560, source_primitive = "nor"} : (i1, i1) -> i1
    %i7560_2 = "silicon.not"(%i7560_1) {inst = 7560, source_primitive = "nor"} : (i1) -> i1
    %i7564_0 = "silicon.xor"(%state_4661, %i7565_1) {inst = 7564, source_primitive = "xnor"} : (i1, i1) -> i1
    %i7564_1 = "silicon.not"(%i7564_0) {inst = 7564, source_primitive = "xnor"} : (i1) -> i1
    %i8995_0 = "silicon.xor"(%i9818_1, %i9360_1) {inst = 8995, source_primitive = "xor"} : (i1, i1) -> i1
    %i8999_0 = "silicon.xor"(%i9360_1, %i9818_1) {inst = 8999, source_primitive = "xnor"} : (i1, i1) -> i1
    %i8999_1 = "silicon.not"(%i8999_0) {inst = 8999, source_primitive = "xnor"} : (i1) -> i1
    %i9340_0 = "silicon.and"(%i9597_1, %i9360_1) {inst = 9340, source_primitive = "nand"} : (i1, i1) -> i1
    %i9340_1 = "silicon.not"(%i9340_0) {inst = 9340, source_primitive = "nand"} : (i1) -> i1
    %i9344_0 = "silicon.not"(%i9818_1) {inst = 9344, source_primitive = "not"} : (i1) -> i1
    %i9344_1 = "silicon.and"(%i9344_0, %i9346_1) {inst = 9344, source_primitive = "and"} : (i1, i1) -> i1
    %i9355_0 = "silicon.and"(%i9353_0, %state_4838) {inst = 9355, source_primitive = "and"} : (i1, i1) -> i1
    %i9355_1 = "silicon.and"(%i9355_0, %i9354_0) {inst = 9355, source_primitive = "and"} : (i1, i1) -> i1
    %i9355_2 = "silicon.and"(%i9360_1, %i9818_1) {inst = 9355, source_primitive = "and"} : (i1, i1) -> i1
    %i9355_3 = "silicon.or"(%i9355_2, %i9355_1) {inst = 9355, source_primitive = "or"} : (i1, i1) -> i1
    %i9602_0 = "silicon.or"(%i9356_1, %i9607_0) {inst = 9602, source_primitive = "nor"} : (i1, i1) -> i1
    %i9602_1 = "silicon.not"(%i9602_0) {inst = 9602, source_primitive = "nor"} : (i1) -> i1
    %i9612_0 = "silicon.or"(%i9344_1, %i8995_0) {inst = 9612, source_primitive = "or"} : (i1, i1) -> i1
    %i9615_0 = "silicon.and"(%i9607_0, %i9344_1) {inst = 9615, source_primitive = "and"} : (i1, i1) -> i1
    %i9705_0 = "silicon.and"(%i9344_1, %i9360_1) {inst = 9705, source_primitive = "nand"} : (i1, i1) -> i1
    %i9705_1 = "silicon.not"(%i9705_0) {inst = 9705, source_primitive = "nand"} : (i1) -> i1
    %i9763_0 = "silicon.and"(%i8999_1, %i9607_0) {inst = 9763, source_primitive = "nand"} : (i1, i1) -> i1
    %i9763_1 = "silicon.not"(%i9763_0) {inst = 9763, source_primitive = "nand"} : (i1) -> i1
    %i9790_0 = "silicon.or"(%i8999_1, %i9597_1) {inst = 9790, source_primitive = "nor"} : (i1, i1) -> i1
    %i9790_1 = "silicon.not"(%i9790_0) {inst = 9790, source_primitive = "nor"} : (i1) -> i1
    %i9810_0 = "silicon.or"(%i9730_1, %i9344_1) {inst = 9810, source_primitive = "nor"} : (i1, i1) -> i1
    %i9810_1 = "silicon.not"(%i9810_0) {inst = 9810, source_primitive = "nor"} : (i1) -> i1
    %i145_0 = "silicon.and"(%state_1250, %i2359_1) {inst = 145, source_primitive = "and"} : (i1, i1) -> i1
    %i145_1 = "silicon.or"(%i145_0, %state_2039) {inst = 145, source_primitive = "or"} : (i1, i1) -> i1
    %i147_0 = "silicon.or"(%i2359_1, %state_1250) {inst = 147, source_primitive = "or"} : (i1, i1) -> i1
    %i147_1 = "silicon.and"(%i147_0, %i144_2) {inst = 147, source_primitive = "and"} : (i1, i1) -> i1
    %i169_0 = "silicon.xor"(%i3480_1, %state_2958) {inst = 169, source_primitive = "xor"} : (i1, i1) -> i1
    %i200_0 = "silicon.not"(%i536_3) {inst = 200, source_primitive = "not"} : (i1) -> i1
    %i744_0 = "silicon.or"(%i498_1, %i200_0) {inst = 744, source_primitive = "nor"} : (i1, i1) -> i1
    %i744_1 = "silicon.not"(%i744_0) {inst = 744, source_primitive = "nor"} : (i1) -> i1
    %i744_2 = "silicon.and"(%i203_3, %i744_1) {inst = 744, source_primitive = "and"} : (i1, i1) -> i1
    %i745_0 = "silicon.or"(%i203_3, %i498_1) {inst = 745, source_primitive = "nor"} : (i1, i1) -> i1
    %i745_1 = "silicon.not"(%i745_0) {inst = 745, source_primitive = "nor"} : (i1) -> i1
    %i745_2 = "silicon.and"(%i200_0, %i745_1) {inst = 745, source_primitive = "and"} : (i1, i1) -> i1
    %i747_0 = "silicon.and"(%i745_2, %i7167_3) {inst = 747, source_primitive = "and"} : (i1, i1) -> i1
    %i747_1 = "silicon.and"(%i3709_1, %i744_2) {inst = 747, source_primitive = "and"} : (i1, i1) -> i1
    %i747_2 = "silicon.or"(%i747_1, %i747_0) {inst = 747, source_primitive = "or"} : (i1, i1) -> i1
    %i753_0 = "silicon.or"(%i203_3, %i200_0) {inst = 753, source_primitive = "nor"} : (i1, i1) -> i1
    %i753_1 = "silicon.not"(%i753_0) {inst = 753, source_primitive = "nor"} : (i1) -> i1
    %i753_2 = "silicon.and"(%i498_1, %i753_1) {inst = 753, source_primitive = "and"} : (i1, i1) -> i1
    %i754_0 = "silicon.or"(%i200_0, %i203_3) {inst = 754, source_primitive = "nor"} : (i1, i1) -> i1
    %i754_1 = "silicon.or"(%i754_0, %i498_1) {inst = 754, source_primitive = "nor"} : (i1, i1) -> i1
    %i754_2 = "silicon.not"(%i754_1) {inst = 754, source_primitive = "nor"} : (i1) -> i1
    %i834_0 = "silicon.and"(%i498_1, %i200_0) {inst = 834, source_primitive = "and"} : (i1, i1) -> i1
    %i834_1 = "silicon.or"(%i203_3, %i834_0) {inst = 834, source_primitive = "nor"} : (i1, i1) -> i1
    %i834_2 = "silicon.not"(%i834_1) {inst = 834, source_primitive = "nor"} : (i1) -> i1
    %i867_0 = "silicon.or"(%i744_2, %i63_2) {inst = 867, source_primitive = "or"} : (i1, i1) -> i1
    %i867_1 = "silicon.or"(%i867_0, %i834_2) {inst = 867, source_primitive = "or"} : (i1, i1) -> i1
    %i939_0 = "silicon.and"(%i745_2, %i6974_2) {inst = 939, source_primitive = "and"} : (i1, i1) -> i1
    %i939_1 = "silicon.and"(%i3297_1, %i744_2) {inst = 939, source_primitive = "and"} : (i1, i1) -> i1
    %i939_2 = "silicon.or"(%i939_1, %i939_0) {inst = 939, source_primitive = "or"} : (i1, i1) -> i1
    %i960_0 = "silicon.and"(%i745_2, %i6992_5) {inst = 960, source_primitive = "and"} : (i1, i1) -> i1
    %i960_1 = "silicon.and"(%i3298_0, %i744_2) {inst = 960, source_primitive = "and"} : (i1, i1) -> i1
    %i960_2 = "silicon.or"(%i960_1, %i960_0) {inst = 960, source_primitive = "or"} : (i1, i1) -> i1
    %i976_0 = "silicon.and"(%i754_2, %i2942_1) {inst = 976, source_primitive = "and"} : (i1, i1) -> i1
    %i976_1 = "silicon.and"(%i2926_2, %i753_2) {inst = 976, source_primitive = "and"} : (i1, i1) -> i1
    %i976_2 = "silicon.or"(%i976_1, %i976_0) {inst = 976, source_primitive = "or"} : (i1, i1) -> i1
    %i1076_0 = "silicon.or"(%i744_2, %i7216_3) {inst = 1076, source_primitive = "or"} : (i1, i1) -> i1
    %i1076_1 = "silicon.or"(%i1076_0, %i834_2) {inst = 1076, source_primitive = "or"} : (i1, i1) -> i1
    %i1077_0 = "silicon.or"(%i744_2, %net_58940) {inst = 1077, source_primitive = "or"} : (i1, i1) -> i1
    %i1077_1 = "silicon.or"(%i1077_0, %i834_2) {inst = 1077, source_primitive = "or"} : (i1, i1) -> i1
    %i1080_0 = "silicon.or"(%i744_2, %i7006_1) {inst = 1080, source_primitive = "or"} : (i1, i1) -> i1
    %i1080_1 = "silicon.or"(%i1080_0, %i834_2) {inst = 1080, source_primitive = "or"} : (i1, i1) -> i1
    %i1154_0 = "silicon.and"(%i754_2, %net_58766) {inst = 1154, source_primitive = "and"} : (i1, i1) -> i1
    %i1154_1 = "silicon.and"(%net_59709, %i753_2) {inst = 1154, source_primitive = "and"} : (i1, i1) -> i1
    %i1154_2 = "silicon.or"(%i1154_1, %i1154_0) {inst = 1154, source_primitive = "or"} : (i1, i1) -> i1
    %i1190_0 = "silicon.or"(%i744_2, %i7259_2) {inst = 1190, source_primitive = "or"} : (i1, i1) -> i1
    %i1190_1 = "silicon.or"(%i1190_0, %i834_2) {inst = 1190, source_primitive = "or"} : (i1, i1) -> i1
    %i1203_0 = "silicon.or"(%i744_2, %i7237_1) {inst = 1203, source_primitive = "or"} : (i1, i1) -> i1
    %i1203_1 = "silicon.or"(%i1203_0, %i834_2) {inst = 1203, source_primitive = "or"} : (i1, i1) -> i1
    %i2951_0 = "silicon.xor"(%i3710_3, %state_2946) {inst = 2951, source_primitive = "xor"} : (i1, i1) -> i1
    %i2966_0 = "silicon.not"(%i3014_0) {inst = 2966, source_primitive = "not"} : (i1) -> i1
    %i2966_1 = "silicon.and"(%i2966_0, %i3821_1) {inst = 2966, source_primitive = "and"} : (i1, i1) -> i1
    %i2969_0 = "silicon.and"(%i3483_1, %state_2948) {inst = 2969, source_primitive = "and"} : (i1, i1) -> i1
    %i2969_1 = "silicon.and"(%i4722_1, %state_2946) {inst = 2969, source_primitive = "and"} : (i1, i1) -> i1
    %i2969_2 = "silicon.or"(%i2969_1, %i2969_0) {inst = 2969, source_primitive = "or"} : (i1, i1) -> i1
    %i2969_3 = "silicon.or"(%i2969_2, %i2974_1) {inst = 2969, source_primitive = "or"} : (i1, i1) -> i1
    %i3161_0 = "silicon.xor"(%state_2957, %i3163_2) {inst = 3161, source_primitive = "xnor"} : (i1, i1) -> i1
    %i3161_1 = "silicon.not"(%i3161_0) {inst = 3161, source_primitive = "xnor"} : (i1) -> i1
    %i3284_0 = "silicon.or"(%i3277_2, %i2966_1) {inst = 3284, source_primitive = "or"} : (i1, i1) -> i1
    %i3284_1 = "silicon.or"(%i3284_0, %i3281_1) {inst = 3284, source_primitive = "or"} : (i1, i1) -> i1
    %i3284_2 = "silicon.or"(%state_2957, %i882_0) {inst = 3284, source_primitive = "or"} : (i1, i1) -> i1
    %i3284_3 = "silicon.and"(%i3284_1, %i3284_2) {inst = 3284, source_primitive = "and"} : (i1, i1) -> i1
    %i6802_0 = "silicon.and"(%i6809_1, %i6806_2) {inst = 6802, source_primitive = "and"} : (i1, i1) -> i1
    %i6802_1 = "silicon.and"(%i6802_0, %i6822_2) {inst = 6802, source_primitive = "and"} : (i1, i1) -> i1
    %i6980_0 = "silicon.xor"(%i7564_1, %i6949_3) {inst = 6980, source_primitive = "xnor"} : (i1, i1) -> i1
    %i6980_1 = "silicon.not"(%i6980_0) {inst = 6980, source_primitive = "xnor"} : (i1) -> i1
    %i7375_0 = "silicon.and"(%i6949_3, %i7564_1) {inst = 7375, source_primitive = "nand"} : (i1, i1) -> i1
    %i7375_1 = "silicon.not"(%i7375_0) {inst = 7375, source_primitive = "nand"} : (i1) -> i1
    %i7382_0 = "silicon.and"(%i7383_1, %i7656_1) {inst = 7382, source_primitive = "and"} : (i1, i1) -> i1
    %i7382_1 = "silicon.and"(%i7382_0, %i7660_1) {inst = 7382, source_primitive = "and"} : (i1, i1) -> i1
    %i7415_0 = "silicon.or"(%i7564_1, %i6949_3) {inst = 7415, source_primitive = "nor"} : (i1, i1) -> i1
    %i7415_1 = "silicon.not"(%i7415_0) {inst = 7415, source_primitive = "nor"} : (i1) -> i1
    %i9000_0 = "silicon.xor"(%i6980_1, %i9355_3) {inst = 9000, source_primitive = "xor"} : (i1, i1) -> i1
    %i9006_0 = "silicon.or"(%i9000_0, %i9612_0) {inst = 9006, source_primitive = "nor"} : (i1, i1) -> i1
    %i9006_1 = "silicon.not"(%i9006_0) {inst = 9006, source_primitive = "nor"} : (i1) -> i1
    %i9008_0 = "silicon.or"(%i9810_1, %i9602_1) {inst = 9008, source_primitive = "or"} : (i1, i1) -> i1
    %i9008_1 = "silicon.or"(%i9008_0, %i9790_1) {inst = 9008, source_primitive = "or"} : (i1, i1) -> i1
    %i9044_0 = "silicon.and"(%i9763_1, %i9000_0) {inst = 9044, source_primitive = "and"} : (i1, i1) -> i1
    %i9044_1 = "silicon.and"(%i9044_0, %i9705_1) {inst = 9044, source_primitive = "and"} : (i1, i1) -> i1
    %i9044_2 = "silicon.or"(%i9044_1, %i9615_0) {inst = 9044, source_primitive = "or"} : (i1, i1) -> i1
    %i9047_0 = "silicon.not"(%i9612_0) {inst = 9047, source_primitive = "not"} : (i1) -> i1
    %i9047_1 = "silicon.or"(%i9047_0, %i9615_0) {inst = 9047, source_primitive = "or"} : (i1, i1) -> i1
    %i9049_0 = "silicon.or"(%i9597_1, %i9000_0) {inst = 9049, source_primitive = "or"} : (i1, i1) -> i1
    %i9049_1 = "silicon.and"(%i9049_0, %i9612_0) {inst = 9049, source_primitive = "and"} : (i1, i1) -> i1
    %i9338_0 = "silicon.or"(%i9810_1, %i8995_0) {inst = 9338, source_primitive = "or"} : (i1, i1) -> i1
    %i9345_0 = "silicon.or"(%i8999_1, %i9810_1) {inst = 9345, source_primitive = "nor"} : (i1, i1) -> i1
    %i9345_1 = "silicon.not"(%i9345_0) {inst = 9345, source_primitive = "nor"} : (i1) -> i1
    %i9351_0 = "silicon.and"(%i9705_1, %i9763_1) {inst = 9351, source_primitive = "and"} : (i1, i1) -> i1
    %i9598_0 = "silicon.and"(%i9602_1, %i9360_1) {inst = 9598, source_primitive = "nand"} : (i1, i1) -> i1
    %i9598_1 = "silicon.not"(%i9598_0) {inst = 9598, source_primitive = "nand"} : (i1) -> i1
    %i9605_0 = "silicon.and"(%i9810_1, %i8999_1) {inst = 9605, source_primitive = "nand"} : (i1, i1) -> i1
    %i9605_1 = "silicon.not"(%i9605_0) {inst = 9605, source_primitive = "nand"} : (i1) -> i1
    %i9611_0 = "silicon.or"(%i8999_1, %i9602_1) {inst = 9611, source_primitive = "or"} : (i1, i1) -> i1
    %i9611_1 = "silicon.or"(%i9611_0, %i9810_1) {inst = 9611, source_primitive = "or"} : (i1, i1) -> i1
    %i9714_0 = "silicon.or"(%i9598_1, %i9000_0) {inst = 9714, source_primitive = "nor"} : (i1, i1) -> i1
    %i9714_1 = "silicon.not"(%i9714_0) {inst = 9714, source_primitive = "nor"} : (i1) -> i1
    %i9760_0 = "silicon.or"(%i9000_0, %i9345_1) {inst = 9760, source_primitive = "nor"} : (i1, i1) -> i1
    %i9760_1 = "silicon.not"(%i9760_0) {inst = 9760, source_primitive = "nor"} : (i1) -> i1
    %i225_0 = "silicon.and"(%i754_2, %i3968_2) {inst = 225, source_primitive = "and"} : (i1, i1) -> i1
    %i225_1 = "silicon.and"(%i2941_2, %i753_2) {inst = 225, source_primitive = "and"} : (i1, i1) -> i1
    %i225_2 = "silicon.or"(%i225_1, %i225_0) {inst = 225, source_primitive = "or"} : (i1, i1) -> i1
    %i238_0 = "silicon.and"(%i745_2, %net_58764) {inst = 238, source_primitive = "and"} : (i1, i1) -> i1
    %i238_1 = "silicon.and"(%i3711_1, %i744_2) {inst = 238, source_primitive = "and"} : (i1, i1) -> i1
    %i238_2 = "silicon.or"(%i238_1, %i238_0) {inst = 238, source_primitive = "or"} : (i1, i1) -> i1
    %i239_0 = "silicon.and"(%i745_2, %i7230_1) {inst = 239, source_primitive = "and"} : (i1, i1) -> i1
    %i239_1 = "silicon.and"(%i169_0, %i744_2) {inst = 239, source_primitive = "and"} : (i1, i1) -> i1
    %i239_2 = "silicon.or"(%i239_1, %i239_0) {inst = 239, source_primitive = "or"} : (i1, i1) -> i1
    %i241_0 = "silicon.and"(%i745_2, %i7252_0) {inst = 241, source_primitive = "and"} : (i1, i1) -> i1
    %i241_1 = "silicon.and"(%i3161_1, %i744_2) {inst = 241, source_primitive = "and"} : (i1, i1) -> i1
    %i241_2 = "silicon.or"(%i241_1, %i241_0) {inst = 241, source_primitive = "or"} : (i1, i1) -> i1
    %i242_0 = "silicon.and"(%i745_2, %i7326_1) {inst = 242, source_primitive = "and"} : (i1, i1) -> i1
    %i242_1 = "silicon.and"(%i2951_0, %i744_2) {inst = 242, source_primitive = "and"} : (i1, i1) -> i1
    %i242_2 = "silicon.or"(%i242_1, %i242_0) {inst = 242, source_primitive = "or"} : (i1, i1) -> i1
    %i450_0 = "silicon.not"(%state_226) {inst = 450, source_primitive = "not"} : (i1) -> i1
    %i450_1 = "silicon.and"(%i450_0, %state_4182) {inst = 450, source_primitive = "and"} : (i1, i1) -> i1
    %i450_2 = "silicon.and"(%i450_1, %i6802_1) {inst = 450, source_primitive = "and"} : (i1, i1) -> i1
    %i450_3 = "silicon.and"(%i450_2, %i5013_1) {inst = 450, source_primitive = "and"} : (i1, i1) -> i1
    %i603_0 = "silicon.and"(%i754_2, %i2936_1) {inst = 603, source_primitive = "and"} : (i1, i1) -> i1
    %i603_1 = "silicon.and"(%i2933_2, %i753_2) {inst = 603, source_primitive = "and"} : (i1, i1) -> i1
    %i603_2 = "silicon.or"(%i603_1, %i603_0) {inst = 603, source_primitive = "or"} : (i1, i1) -> i1
    %i604_0 = "silicon.or"(%i744_2, %i67_3) {inst = 604, source_primitive = "or"} : (i1, i1) -> i1
    %i604_1 = "silicon.or"(%i604_0, %i834_2) {inst = 604, source_primitive = "or"} : (i1, i1) -> i1
    %i611_0 = "silicon.and"(%i754_2, %i4002_2) {inst = 611, source_primitive = "and"} : (i1, i1) -> i1
    %i611_1 = "silicon.and"(%i3858_1, %i753_2) {inst = 611, source_primitive = "and"} : (i1, i1) -> i1
    %i611_2 = "silicon.or"(%i611_1, %i611_0) {inst = 611, source_primitive = "or"} : (i1, i1) -> i1
    %i683_0 = "silicon.and"(%i754_2, %i3984_2) {inst = 683, source_primitive = "and"} : (i1, i1) -> i1
    %i683_1 = "silicon.and"(%i2932_1, %i753_2) {inst = 683, source_primitive = "and"} : (i1, i1) -> i1
    %i683_2 = "silicon.or"(%i683_1, %i683_0) {inst = 683, source_primitive = "or"} : (i1, i1) -> i1
    %i687_0 = "silicon.and"(%i754_2, %i2939_3) {inst = 687, source_primitive = "and"} : (i1, i1) -> i1
    %i687_1 = "silicon.and"(%i2955_4, %i753_2) {inst = 687, source_primitive = "and"} : (i1, i1) -> i1
    %i687_2 = "silicon.or"(%i687_1, %i687_0) {inst = 687, source_primitive = "or"} : (i1, i1) -> i1
    %i709_0 = "silicon.and"(%i754_2, %i2940_2) {inst = 709, source_primitive = "and"} : (i1, i1) -> i1
    %i709_1 = "silicon.and"(%net_58945, %i753_2) {inst = 709, source_primitive = "and"} : (i1, i1) -> i1
    %i709_2 = "silicon.or"(%i709_1, %i709_0) {inst = 709, source_primitive = "or"} : (i1, i1) -> i1
    %i741_0 = "silicon.or"(%i744_2, %i834_2) {inst = 741, source_primitive = "nor"} : (i1, i1) -> i1
    %i741_1 = "silicon.not"(%i741_0) {inst = 741, source_primitive = "nor"} : (i1) -> i1
    %i742_0 = "silicon.and"(%i745_2, %i6972_2) {inst = 742, source_primitive = "and"} : (i1, i1) -> i1
    %i742_1 = "silicon.and"(%i3286_1, %i744_2) {inst = 742, source_primitive = "and"} : (i1, i1) -> i1
    %i742_2 = "silicon.or"(%i742_1, %i742_0) {inst = 742, source_primitive = "or"} : (i1, i1) -> i1
    %i751_0 = "silicon.or"(%i744_2, %i6989_2) {inst = 751, source_primitive = "or"} : (i1, i1) -> i1
    %i751_1 = "silicon.or"(%i751_0, %i834_2) {inst = 751, source_primitive = "or"} : (i1, i1) -> i1
    %i790_0 = "silicon.or"(%i709_2, %i741_1) {inst = 790, source_primitive = "or"} : (i1, i1) -> i1
    %i790_1 = "silicon.or"(%i790_0, %i960_2) {inst = 790, source_primitive = "or"} : (i1, i1) -> i1
    %i790_2 = "silicon.and"(%i790_1, %i604_1) {inst = 790, source_primitive = "and"} : (i1, i1) -> i1
    %i1081_0 = "silicon.or"(%i976_2, %i741_1) {inst = 1081, source_primitive = "or"} : (i1, i1) -> i1
    %i1081_1 = "silicon.or"(%i1081_0, %i939_2) {inst = 1081, source_primitive = "or"} : (i1, i1) -> i1
    %i1081_2 = "silicon.and"(%i1081_1, %i1080_1) {inst = 1081, source_primitive = "and"} : (i1, i1) -> i1
    %i1143_0 = "silicon.or"(%i1154_2, %i741_1) {inst = 1143, source_primitive = "or"} : (i1, i1) -> i1
    %i1143_1 = "silicon.or"(%i1143_0, %i238_2) {inst = 1143, source_primitive = "or"} : (i1, i1) -> i1
    %i1143_2 = "silicon.and"(%i1143_1, %i1077_1) {inst = 1143, source_primitive = "and"} : (i1, i1) -> i1
    %i6872_0 = "silicon.or"(%i9000_0, %i9705_1) {inst = 6872, source_primitive = "nor"} : (i1, i1) -> i1
    %i6872_1 = "silicon.not"(%i6872_0) {inst = 6872, source_primitive = "nor"} : (i1) -> i1
    %i6952_0 = "silicon.and"(%i9355_3, %i7375_1) {inst = 6952, source_primitive = "and"} : (i1, i1) -> i1
    %i6952_1 = "silicon.or"(%i6952_0, %i7415_1) {inst = 6952, source_primitive = "or"} : (i1, i1) -> i1
    %i6964_0 = "silicon.xor"(%i9355_3, %i6980_1) {inst = 6964, source_primitive = "xnor"} : (i1, i1) -> i1
    %i6964_1 = "silicon.not"(%i6964_0) {inst = 6964, source_primitive = "xnor"} : (i1) -> i1
    %i7374_0 = "silicon.or"(%i7560_2, %i7382_1) {inst = 7374, source_primitive = "nor"} : (i1, i1) -> i1
    %i7374_1 = "silicon.not"(%i7374_0) {inst = 7374, source_primitive = "nor"} : (i1) -> i1
    %i7376_0 = "silicon.and"(%i6952_1, %i7374_1) {inst = 7376, source_primitive = "and"} : (i1, i1) -> i1
    %i7376_1 = "silicon.or"(%i7376_0, %i7560_2) {inst = 7376, source_primitive = "or"} : (i1, i1) -> i1
    %i7414_0 = "silicon.and"(%i7376_1, %i7380_4) {inst = 7414, source_primitive = "and"} : (i1, i1) -> i1
    %i7414_1 = "silicon.or"(%i8998_3, %i7414_0) {inst = 7414, source_primitive = "nor"} : (i1, i1) -> i1
    %i7414_2 = "silicon.not"(%i7414_1) {inst = 7414, source_primitive = "nor"} : (i1) -> i1
    %i7435_0 = "silicon.or"(%i7414_2, %i7381_1) {inst = 7435, source_primitive = "nor"} : (i1, i1) -> i1
    %i7435_1 = "silicon.not"(%i7435_0) {inst = 7435, source_primitive = "nor"} : (i1) -> i1
    %i7766_0 = "silicon.or"(%i9049_1, %i9006_1) {inst = 7766, source_primitive = "or"} : (i1, i1) -> i1
    %i7769_0 = "silicon.and"(%i9763_1, %i6964_1) {inst = 7769, source_primitive = "and"} : (i1, i1) -> i1
    %i7769_1 = "silicon.and"(%i7769_0, %i6962_0) {inst = 7769, source_primitive = "and"} : (i1, i1) -> i1
    %i8997_0 = "silicon.or"(%i8995_0, %i9602_1) {inst = 8997, source_primitive = "or"} : (i1, i1) -> i1
    %i8997_1 = "silicon.and"(%i8997_0, %i6964_1) {inst = 8997, source_primitive = "and"} : (i1, i1) -> i1
    %i8997_2 = "silicon.and"(%i8997_1, %i9598_1) {inst = 8997, source_primitive = "and"} : (i1, i1) -> i1
    %i9003_0 = "silicon.or"(%i6964_1, %i9611_1) {inst = 9003, source_primitive = "nor"} : (i1, i1) -> i1
    %i9003_1 = "silicon.not"(%i9003_0) {inst = 9003, source_primitive = "nor"} : (i1) -> i1
    %i9005_0 = "silicon.or"(%i6964_1, %i9345_1) {inst = 9005, source_primitive = "nor"} : (i1, i1) -> i1
    %i9005_1 = "silicon.not"(%i9005_0) {inst = 9005, source_primitive = "nor"} : (i1) -> i1
    %i9007_0 = "silicon.or"(%i9000_0, %i9602_1) {inst = 9007, source_primitive = "or"} : (i1, i1) -> i1
    %i9007_1 = "silicon.or"(%i9007_0, %i9338_0) {inst = 9007, source_primitive = "or"} : (i1, i1) -> i1
    %i9009_0 = "silicon.not"(%i9338_0) {inst = 9009, source_primitive = "not"} : (i1) -> i1
    %i9010_0 = "silicon.and"(%i9605_1, %i6964_1) {inst = 9010, source_primitive = "nand"} : (i1, i1) -> i1
    %i9010_1 = "silicon.not"(%i9010_0) {inst = 9010, source_primitive = "nand"} : (i1) -> i1
    %i9013_0 = "silicon.or"(%i9612_0, %i6964_1) {inst = 9013, source_primitive = "or"} : (i1, i1) -> i1
    %i9045_0 = "silicon.or"(%i9000_0, %i9602_1) {inst = 9045, source_primitive = "or"} : (i1, i1) -> i1
    %i9045_1 = "silicon.or"(%i9045_0, %i8995_0) {inst = 9045, source_primitive = "or"} : (i1, i1) -> i1
    %i9045_2 = "silicon.and"(%i9598_1, %i9045_1) {inst = 9045, source_primitive = "nand"} : (i1, i1) -> i1
    %i9045_3 = "silicon.not"(%i9045_2) {inst = 9045, source_primitive = "nand"} : (i1) -> i1
    %i9063_0 = "silicon.mux"(%i9000_0, %i9008_1, %i9611_1) {inst = 9063, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i9115_0 = "silicon.or"(%i6964_1, %i9340_1) {inst = 9115, source_primitive = "nor"} : (i1, i1) -> i1
    %i9115_1 = "silicon.not"(%i9115_0) {inst = 9115, source_primitive = "nor"} : (i1) -> i1
    %i9115_2 = "silicon.or"(%i9714_1, %i9115_1) {inst = 9115, source_primitive = "nor"} : (i1, i1) -> i1
    %i9115_3 = "silicon.not"(%i9115_2) {inst = 9115, source_primitive = "nor"} : (i1) -> i1
    %i9198_0 = "silicon.and"(%i6964_1, %i9615_0) {inst = 9198, source_primitive = "and"} : (i1, i1) -> i1
    %i9198_1 = "silicon.or"(%i9611_1, %i9198_0) {inst = 9198, source_primitive = "nor"} : (i1, i1) -> i1
    %i9198_2 = "silicon.not"(%i9198_1) {inst = 9198, source_primitive = "nor"} : (i1) -> i1
    %i9245_0 = "silicon.or"(%i9351_0, %i9000_0) {inst = 9245, source_primitive = "or"} : (i1, i1) -> i1
    %i9245_1 = "silicon.and"(%i9245_0, %i9013_0) {inst = 9245, source_primitive = "and"} : (i1, i1) -> i1
    %i9265_0 = "silicon.or"(%i9810_1, %i6964_1) {inst = 9265, source_primitive = "or"} : (i1, i1) -> i1
    %i9336_0 = "silicon.or"(%i9338_0, %i9602_1) {inst = 9336, source_primitive = "or"} : (i1, i1) -> i1
    %i9336_1 = "silicon.and"(%i9336_0, %i9000_0) {inst = 9336, source_primitive = "and"} : (i1, i1) -> i1
    %i9540_0 = "silicon.and"(%i9615_0, %i6964_1) {inst = 9540, source_primitive = "and"} : (i1, i1) -> i1
    %i9540_1 = "silicon.and"(%i9540_0, %i8999_1) {inst = 9540, source_primitive = "and"} : (i1, i1) -> i1
    %i217_0 = "silicon.or"(%i687_2, %i741_1) {inst = 217, source_primitive = "or"} : (i1, i1) -> i1
    %i217_1 = "silicon.or"(%i217_0, %i242_2) {inst = 217, source_primitive = "or"} : (i1, i1) -> i1
    %i217_2 = "silicon.and"(%i217_1, %i867_1) {inst = 217, source_primitive = "and"} : (i1, i1) -> i1
    %i229_0 = "silicon.and"(%i353_3, %state_226) {inst = 229, source_primitive = "and"} : (i1, i1) -> i1
    %i229_1 = "silicon.and"(%i229_0, %i1143_2) {inst = 229, source_primitive = "and"} : (i1, i1) -> i1
    %i231_0 = "silicon.or"(%i225_2, %i741_1) {inst = 231, source_primitive = "or"} : (i1, i1) -> i1
    %i231_1 = "silicon.or"(%i231_0, %i747_2) {inst = 231, source_primitive = "or"} : (i1, i1) -> i1
    %i231_2 = "silicon.and"(%i231_1, %i751_1) {inst = 231, source_primitive = "and"} : (i1, i1) -> i1
    %i232_0 = "silicon.or"(%i683_2, %i741_1) {inst = 232, source_primitive = "or"} : (i1, i1) -> i1
    %i232_1 = "silicon.or"(%i232_0, %i239_2) {inst = 232, source_primitive = "or"} : (i1, i1) -> i1
    %i232_2 = "silicon.and"(%i232_1, %i1076_1) {inst = 232, source_primitive = "and"} : (i1, i1) -> i1
    %i233_0 = "silicon.and"(%i450_3, %i5532_0) {inst = 233, source_primitive = "and"} : (i1, i1) -> i1
    %i233_1 = "silicon.and"(%i233_0, %i460_0) {inst = 233, source_primitive = "and"} : (i1, i1) -> i1
    %i233_2 = "silicon.and"(%state_228, %i406_1) {inst = 233, source_primitive = "and"} : (i1, i1) -> i1
    %i233_3 = "silicon.or"(%i233_2, %i233_1) {inst = 233, source_primitive = "or"} : (i1, i1) -> i1
    %i246_0 = "silicon.or"(%i603_2, %i741_1) {inst = 246, source_primitive = "or"} : (i1, i1) -> i1
    %i246_1 = "silicon.or"(%i246_0, %i241_2) {inst = 246, source_primitive = "or"} : (i1, i1) -> i1
    %i246_2 = "silicon.and"(%i246_1, %i1190_1) {inst = 246, source_primitive = "and"} : (i1, i1) -> i1
    %i305_0 = "silicon.and"(%i353_3, %state_226) {inst = 305, source_primitive = "and"} : (i1, i1) -> i1
    %i305_1 = "silicon.and"(%i305_0, %i790_2) {inst = 305, source_primitive = "and"} : (i1, i1) -> i1
    %i350_0 = "silicon.and"(%i353_3, %state_226) {inst = 350, source_primitive = "and"} : (i1, i1) -> i1
    %i350_1 = "silicon.and"(%i350_0, %i217_2) {inst = 350, source_primitive = "and"} : (i1, i1) -> i1
    %i399_0 = "silicon.and"(%i450_3, %i247_0) {inst = 399, source_primitive = "and"} : (i1, i1) -> i1
    %i399_1 = "silicon.and"(%i399_0, %i460_0) {inst = 399, source_primitive = "and"} : (i1, i1) -> i1
    %i399_2 = "silicon.and"(%state_227, %i406_1) {inst = 399, source_primitive = "and"} : (i1, i1) -> i1
    %i399_3 = "silicon.or"(%i399_2, %i399_1) {inst = 399, source_primitive = "or"} : (i1, i1) -> i1
    %i553_0 = "silicon.and"(%i353_3, %state_226) {inst = 553, source_primitive = "and"} : (i1, i1) -> i1
    %i553_1 = "silicon.and"(%i553_0, %i1081_2) {inst = 553, source_primitive = "and"} : (i1, i1) -> i1
    %i600_0 = "silicon.or"(%i611_2, %i741_1) {inst = 600, source_primitive = "or"} : (i1, i1) -> i1
    %i600_1 = "silicon.or"(%i600_0, %i742_2) {inst = 600, source_primitive = "or"} : (i1, i1) -> i1
    %i600_2 = "silicon.and"(%i600_1, %i1203_1) {inst = 600, source_primitive = "and"} : (i1, i1) -> i1
    %i1046_0 = "silicon.and"(%i353_3, %state_226) {inst = 1046, source_primitive = "and"} : (i1, i1) -> i1
    %i1046_1 = "silicon.and"(%i1046_0, %i600_2) {inst = 1046, source_primitive = "and"} : (i1, i1) -> i1
    %i6921_0 = "silicon.or"(%i9345_1, %i9010_1) {inst = 6921, source_primitive = "nor"} : (i1, i1) -> i1
    %i6921_1 = "silicon.not"(%i6921_0) {inst = 6921, source_primitive = "nor"} : (i1) -> i1
    %i6936_0 = "silicon.or"(%i9598_1, %i6964_1) {inst = 6936, source_primitive = "nor"} : (i1, i1) -> i1
    %i6936_1 = "silicon.not"(%i6936_0) {inst = 6936, source_primitive = "nor"} : (i1) -> i1
    %i6945_0 = "silicon.xor"(%i7376_1, %i7416_1) {inst = 6945, source_primitive = "xnor"} : (i1, i1) -> i1
    %i6945_1 = "silicon.not"(%i6945_0) {inst = 6945, source_primitive = "xnor"} : (i1) -> i1
    %i6946_0 = "silicon.xor"(%i7374_1, %i6952_1) {inst = 6946, source_primitive = "xor"} : (i1, i1) -> i1
    %i6960_0 = "silicon.mux"(%i9047_1, %i6964_1, %i9005_1) {inst = 6960, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i6968_0 = "silicon.and"(%i6964_1, %i9340_1) {inst = 6968, source_primitive = "and"} : (i1, i1) -> i1
    %i6968_1 = "silicon.or"(%i6968_0, %i6946_0) {inst = 6968, source_primitive = "or"} : (i1, i1) -> i1
    %i6968_2 = "silicon.or"(%i6968_1, %i9336_1) {inst = 6968, source_primitive = "or"} : (i1, i1) -> i1
    %i6977_0 = "silicon.or"(%i9009_0, %i9000_0) {inst = 6977, source_primitive = "or"} : (i1, i1) -> i1
    %i6977_1 = "silicon.and"(%i6946_0, %i6977_0) {inst = 6977, source_primitive = "nand"} : (i1, i1) -> i1
    %i6977_2 = "silicon.not"(%i6977_1) {inst = 6977, source_primitive = "nand"} : (i1) -> i1
    %i6981_0 = "silicon.xor"(%i7414_2, %i7381_1) {inst = 6981, source_primitive = "xnor"} : (i1, i1) -> i1
    %i6981_1 = "silicon.not"(%i6981_0) {inst = 6981, source_primitive = "xnor"} : (i1) -> i1
    %i6982_0 = "silicon.xor"(%i7416_1, %i7376_1) {inst = 6982, source_primitive = "xor"} : (i1, i1) -> i1
    %i6983_0 = "silicon.xor"(%i7381_1, %i7414_2) {inst = 6983, source_primitive = "xor"} : (i1, i1) -> i1
    %i7379_0 = "silicon.and"(%i6946_0, %i9612_0) {inst = 7379, source_primitive = "and"} : (i1, i1) -> i1
    %i7379_1 = "silicon.or"(%i7379_0, %i6945_1) {inst = 7379, source_primitive = "or"} : (i1, i1) -> i1
    %i7379_2 = "silicon.or"(%i7379_1, %i6960_0) {inst = 7379, source_primitive = "or"} : (i1, i1) -> i1
    %i7400_0 = "silicon.or"(%i7435_1, %i9343_2) {inst = 7400, source_primitive = "nor"} : (i1, i1) -> i1
    %i7400_1 = "silicon.not"(%i7400_0) {inst = 7400, source_primitive = "nor"} : (i1) -> i1
    %i7816_0 = "silicon.or"(%i7769_1, %i9005_1) {inst = 7816, source_primitive = "or"} : (i1, i1) -> i1
    %i7816_1 = "silicon.and"(%i6946_0, %i7816_0) {inst = 7816, source_primitive = "nand"} : (i1, i1) -> i1
    %i7816_2 = "silicon.not"(%i7816_1) {inst = 7816, source_primitive = "nand"} : (i1) -> i1
    %i7852_0 = "silicon.and"(%i6982_0, %i9115_3) {inst = 7852, source_primitive = "and"} : (i1, i1) -> i1
    %i7852_1 = "silicon.or"(%i6946_0, %i7852_0) {inst = 7852, source_primitive = "nor"} : (i1, i1) -> i1
    %i7852_2 = "silicon.not"(%i7852_1) {inst = 7852, source_primitive = "nor"} : (i1) -> i1
    %i7854_0 = "silicon.or"(%i6872_1, %i6982_0) {inst = 7854, source_primitive = "or"} : (i1, i1) -> i1
    %i8044_0 = "silicon.and"(%i9714_1, %i6946_0) {inst = 8044, source_primitive = "nand"} : (i1, i1) -> i1
    %i8044_1 = "silicon.not"(%i8044_0) {inst = 8044, source_primitive = "nand"} : (i1) -> i1
    %i8044_2 = "silicon.and"(%i6968_2, %i8044_1) {inst = 8044, source_primitive = "nand"} : (i1, i1) -> i1
    %i8044_3 = "silicon.not"(%i8044_2) {inst = 8044, source_primitive = "nand"} : (i1) -> i1
    %i8996_0 = "silicon.or"(%i9047_1, %i9000_0) {inst = 8996, source_primitive = "or"} : (i1, i1) -> i1
    %i8996_1 = "silicon.or"(%i9730_1, %i9013_0) {inst = 8996, source_primitive = "or"} : (i1, i1) -> i1
    %i8996_2 = "silicon.and"(%i8996_0, %i8996_1) {inst = 8996, source_primitive = "and"} : (i1, i1) -> i1
    %i9001_0 = "silicon.or"(%i9005_1, %i6946_0) {inst = 9001, source_primitive = "or"} : (i1, i1) -> i1
    %i9001_1 = "silicon.or"(%i9001_0, %i8997_2) {inst = 9001, source_primitive = "or"} : (i1, i1) -> i1
    %i9002_0 = "silicon.and"(%i9338_0, %i6964_1) {inst = 9002, source_primitive = "and"} : (i1, i1) -> i1
    %i9002_1 = "silicon.and"(%i9605_1, %i9005_1) {inst = 9002, source_primitive = "and"} : (i1, i1) -> i1
    %i9002_2 = "silicon.or"(%i9002_1, %i9002_0) {inst = 9002, source_primitive = "or"} : (i1, i1) -> i1
    %i9004_0 = "silicon.and"(%i9063_0, %i6946_0) {inst = 9004, source_primitive = "nand"} : (i1, i1) -> i1
    %i9004_1 = "silicon.not"(%i9004_0) {inst = 9004, source_primitive = "nand"} : (i1) -> i1
    %i9012_0 = "silicon.or"(%i9010_1, %i9602_1) {inst = 9012, source_primitive = "or"} : (i1, i1) -> i1
    %i9012_1 = "silicon.and"(%i9012_0, %i9265_0) {inst = 9012, source_primitive = "and"} : (i1, i1) -> i1
    %i9062_0 = "silicon.or"(%i9790_1, %i6964_1) {inst = 9062, source_primitive = "or"} : (i1, i1) -> i1
    %i9062_1 = "silicon.or"(%i9062_0, %i9009_0) {inst = 9062, source_primitive = "or"} : (i1, i1) -> i1
    %i9062_2 = "silicon.and"(%i6946_0, %i9062_1) {inst = 9062, source_primitive = "nand"} : (i1, i1) -> i1
    %i9062_3 = "silicon.not"(%i9062_2) {inst = 9062, source_primitive = "nand"} : (i1) -> i1
    %i9127_0 = "silicon.and"(%i9045_3, %i6946_0) {inst = 9127, source_primitive = "nand"} : (i1, i1) -> i1
    %i9127_1 = "silicon.not"(%i9127_0) {inst = 9127, source_primitive = "nand"} : (i1) -> i1
    %i9337_0 = "silicon.or"(%i6872_1, %i6946_0) {inst = 9337, source_primitive = "or"} : (i1, i1) -> i1
    %i9337_1 = "silicon.or"(%i9337_0, %i9006_1) {inst = 9337, source_primitive = "or"} : (i1, i1) -> i1
    %i9342_0 = "silicon.or"(%i9336_1, %i9008_1) {inst = 9342, source_primitive = "or"} : (i1, i1) -> i1
    %i9342_1 = "silicon.or"(%i9342_0, %i6945_1) {inst = 9342, source_primitive = "or"} : (i1, i1) -> i1
    %i9342_2 = "silicon.or"(%i9342_1, %i6946_0) {inst = 9342, source_primitive = "or"} : (i1, i1) -> i1
    %i9347_0 = "silicon.and"(%i9344_1, %i9360_1) {inst = 9347, source_primitive = "and"} : (i1, i1) -> i1
    %i9347_1 = "silicon.and"(%i9347_0, %i6946_0) {inst = 9347, source_primitive = "and"} : (i1, i1) -> i1
    %i9347_2 = "silicon.or"(%i9347_1, %i7769_1) {inst = 9347, source_primitive = "or"} : (i1, i1) -> i1
    %i9347_3 = "silicon.or"(%i9347_2, %i9005_1) {inst = 9347, source_primitive = "or"} : (i1, i1) -> i1
    %i9348_0 = "silicon.and"(%i9000_0, %i9345_1) {inst = 9348, source_primitive = "and"} : (i1, i1) -> i1
    %i9348_1 = "silicon.or"(%i6946_0, %i9348_0) {inst = 9348, source_primitive = "nor"} : (i1, i1) -> i1
    %i9348_2 = "silicon.not"(%i9348_1) {inst = 9348, source_primitive = "nor"} : (i1) -> i1
    %i9357_0 = "silicon.mux"(%i6946_0, %i9044_2, %i9012_1) {inst = 9357, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i9358_0 = "silicon.or"(%i6946_0, %i9245_1) {inst = 9358, source_primitive = "or"} : (i1, i1) -> i1
    %i9358_1 = "silicon.or"(%i6977_2, %i9790_1) {inst = 9358, source_primitive = "or"} : (i1, i1) -> i1
    %i9358_2 = "silicon.and"(%i9358_0, %i9358_1) {inst = 9358, source_primitive = "and"} : (i1, i1) -> i1
    %i9358_3 = "silicon.and"(%i9358_2, %i6945_1) {inst = 9358, source_primitive = "and"} : (i1, i1) -> i1
    %i9614_0 = "silicon.and"(%i9010_1, %i6946_0) {inst = 9614, source_primitive = "nand"} : (i1, i1) -> i1
    %i9614_1 = "silicon.not"(%i9614_0) {inst = 9614, source_primitive = "nand"} : (i1) -> i1
    %i222_0 = "silicon.and"(%i353_3, %state_226) {inst = 222, source_primitive = "and"} : (i1, i1) -> i1
    %i222_1 = "silicon.and"(%i222_0, %i231_2) {inst = 222, source_primitive = "and"} : (i1, i1) -> i1
    %i223_0 = "silicon.and"(%i353_3, %state_226) {inst = 223, source_primitive = "and"} : (i1, i1) -> i1
    %i223_1 = "silicon.and"(%i223_0, %i246_2) {inst = 223, source_primitive = "and"} : (i1, i1) -> i1
    %i230_0 = "silicon.and"(%i353_3, %state_226) {inst = 230, source_primitive = "and"} : (i1, i1) -> i1
    %i230_1 = "silicon.and"(%i230_0, %i232_2) {inst = 230, source_primitive = "and"} : (i1, i1) -> i1
    %i6947_0 = "silicon.or"(%i9005_1, %i9614_1) {inst = 6947, source_primitive = "or"} : (i1, i1) -> i1
    %i6947_1 = "silicon.and"(%i6947_0, %i6945_1) {inst = 6947, source_primitive = "and"} : (i1, i1) -> i1
    %i6947_2 = "silicon.and"(%i6947_1, %i9337_1) {inst = 6947, source_primitive = "and"} : (i1, i1) -> i1
    %i6948_0 = "silicon.or"(%i6946_0, %i6936_1) {inst = 6948, source_primitive = "or"} : (i1, i1) -> i1
    %i6948_1 = "silicon.or"(%i6948_0, %i9540_1) {inst = 6948, source_primitive = "or"} : (i1, i1) -> i1
    %i6948_2 = "silicon.and"(%i6948_1, %i6945_1) {inst = 6948, source_primitive = "and"} : (i1, i1) -> i1
    %i6948_3 = "silicon.and"(%i6948_2, %i9004_1) {inst = 6948, source_primitive = "and"} : (i1, i1) -> i1
    %i6963_0 = "silicon.or"(%i9007_1, %i6982_0) {inst = 6963, source_primitive = "nor"} : (i1, i1) -> i1
    %i6963_1 = "silicon.not"(%i6963_0) {inst = 6963, source_primitive = "nor"} : (i1) -> i1
    %i6963_2 = "silicon.or"(%i6964_1, %i9605_1) {inst = 6963, source_primitive = "nor"} : (i1, i1) -> i1
    %i6963_3 = "silicon.not"(%i6963_2) {inst = 6963, source_primitive = "nor"} : (i1) -> i1
    %i6963_4 = "silicon.or"(%i6963_3, %i6963_1) {inst = 6963, source_primitive = "or"} : (i1, i1) -> i1
    %i6979_0 = "silicon.and"(%i7854_0, %i7852_2) {inst = 6979, source_primitive = "and"} : (i1, i1) -> i1
    %i6979_1 = "silicon.and"(%i6946_0, %i6963_4) {inst = 6979, source_primitive = "and"} : (i1, i1) -> i1
    %i6979_2 = "silicon.or"(%i6979_1, %i6979_0) {inst = 6979, source_primitive = "or"} : (i1, i1) -> i1
    %i6979_3 = "silicon.or"(%i6979_2, %i6981_1) {inst = 6979, source_primitive = "or"} : (i1, i1) -> i1
    %i7404_0 = "silicon.and"(%i7816_2, %i6945_1) {inst = 7404, source_primitive = "and"} : (i1, i1) -> i1
    %i7404_1 = "silicon.and"(%i7404_0, %i9347_3) {inst = 7404, source_primitive = "and"} : (i1, i1) -> i1
    %i7767_0 = "silicon.and"(%i9614_1, %i9001_1) {inst = 7767, source_primitive = "and"} : (i1, i1) -> i1
    %i7767_1 = "silicon.or"(%i6945_1, %i7767_0) {inst = 7767, source_primitive = "nor"} : (i1, i1) -> i1
    %i7767_2 = "silicon.not"(%i7767_1) {inst = 7767, source_primitive = "nor"} : (i1) -> i1
    %i7768_0 = "silicon.and"(%i6982_0, %i8044_3) {inst = 7768, source_primitive = "and"} : (i1, i1) -> i1
    %i7768_1 = "silicon.or"(%i7768_0, %i7404_1) {inst = 7768, source_primitive = "or"} : (i1, i1) -> i1
    %i7823_0 = "silicon.mux"(%i6946_0, %i9002_2, %i7766_0) {inst = 7823, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i7825_0 = "silicon.or"(%i7823_0, %i6982_0) {inst = 7825, source_primitive = "or"} : (i1, i1) -> i1
    %i7825_1 = "silicon.and"(%i6983_0, %i7825_0) {inst = 7825, source_primitive = "nand"} : (i1, i1) -> i1
    %i7825_2 = "silicon.and"(%i7825_1, %i7379_2) {inst = 7825, source_primitive = "nand"} : (i1, i1) -> i1
    %i7825_3 = "silicon.not"(%i7825_2) {inst = 7825, source_primitive = "nand"} : (i1) -> i1
    %i7832_0 = "silicon.or"(%i9540_1, %i6946_0) {inst = 7832, source_primitive = "or"} : (i1, i1) -> i1
    %i7832_1 = "silicon.or"(%i7832_0, %i9003_1) {inst = 7832, source_primitive = "or"} : (i1, i1) -> i1
    %i7832_2 = "silicon.or"(%i9062_3, %i6921_1) {inst = 7832, source_primitive = "or"} : (i1, i1) -> i1
    %i7832_3 = "silicon.and"(%i7832_1, %i7832_2) {inst = 7832, source_primitive = "and"} : (i1, i1) -> i1
    %i8011_0 = "silicon.or"(%i9540_1, %i6946_0) {inst = 8011, source_primitive = "or"} : (i1, i1) -> i1
    %i8011_1 = "silicon.or"(%i8011_0, %i9198_2) {inst = 8011, source_primitive = "or"} : (i1, i1) -> i1
    %i8011_2 = "silicon.or"(%i9760_1, %i9062_3) {inst = 8011, source_primitive = "or"} : (i1, i1) -> i1
    %i8011_3 = "silicon.and"(%i8011_1, %i8011_2) {inst = 8011, source_primitive = "and"} : (i1, i1) -> i1
    %i9043_0 = "silicon.and"(%i9265_0, %i8999_1) {inst = 9043, source_primitive = "nand"} : (i1, i1) -> i1
    %i9043_1 = "silicon.not"(%i9043_0) {inst = 9043, source_primitive = "nand"} : (i1) -> i1
    %i9043_2 = "silicon.and"(%i9348_2, %i9043_1) {inst = 9043, source_primitive = "nand"} : (i1, i1) -> i1
    %i9043_3 = "silicon.not"(%i9043_2) {inst = 9043, source_primitive = "nand"} : (i1) -> i1
    %i9046_0 = "silicon.and"(%i9013_0, %i6946_0) {inst = 9046, source_primitive = "and"} : (i1, i1) -> i1
    %i9046_1 = "silicon.and"(%i9046_0, %i9010_1) {inst = 9046, source_primitive = "and"} : (i1, i1) -> i1
    %i9046_2 = "silicon.and"(%i8996_2, %i9348_2) {inst = 9046, source_primitive = "and"} : (i1, i1) -> i1
    %i9046_3 = "silicon.or"(%i9046_2, %i9046_1) {inst = 9046, source_primitive = "or"} : (i1, i1) -> i1
    %i6984_0 = "silicon.or"(%i6947_2, %i6981_1) {inst = 6984, source_primitive = "or"} : (i1, i1) -> i1
    %i6984_1 = "silicon.or"(%i6984_0, %i7767_2) {inst = 6984, source_primitive = "or"} : (i1, i1) -> i1
    %i7563_0 = "silicon.or"(%i7768_1, %i6983_0) {inst = 7563, source_primitive = "or"} : (i1, i1) -> i1
    %i7563_1 = "silicon.and"(%i7563_0, %i7825_3) {inst = 7563, source_primitive = "and"} : (i1, i1) -> i1
    %i7563_2 = "silicon.and"(%i7563_1, %i7400_1) {inst = 7563, source_primitive = "and"} : (i1, i1) -> i1
    %i7764_0 = "silicon.or"(%i8011_3, %i6982_0) {inst = 7764, source_primitive = "or"} : (i1, i1) -> i1
    %i7764_1 = "silicon.and"(%i9342_2, %i7764_0) {inst = 7764, source_primitive = "nand"} : (i1, i1) -> i1
    %i7764_2 = "silicon.not"(%i7764_1) {inst = 7764, source_primitive = "nand"} : (i1) -> i1
    %i7819_0 = "silicon.mux"(%i6982_0, %i9357_0, %i7832_3) {inst = 7819, source_primitive = "udp_mux"} : (i1, i1, i1) -> i1
    %i7820_0 = "silicon.and"(%i9127_1, %i6982_0) {inst = 7820, source_primitive = "and"} : (i1, i1) -> i1
    %i7820_1 = "silicon.and"(%i7820_0, %i9043_3) {inst = 7820, source_primitive = "and"} : (i1, i1) -> i1
    %i7820_2 = "silicon.or"(%i7820_1, %i6983_0) {inst = 7820, source_primitive = "or"} : (i1, i1) -> i1
    %i7824_0 = "silicon.or"(%i7820_2, %i6948_3) {inst = 7824, source_primitive = "or"} : (i1, i1) -> i1
    %i7824_1 = "silicon.and"(%i7824_0, %i7400_1) {inst = 7824, source_primitive = "and"} : (i1, i1) -> i1
    %i7824_2 = "silicon.and"(%i7824_1, %i6984_1) {inst = 7824, source_primitive = "and"} : (i1, i1) -> i1
    %i7914_0 = "silicon.and"(%i6982_0, %i9046_3) {inst = 7914, source_primitive = "and"} : (i1, i1) -> i1
    %i7914_1 = "silicon.or"(%i7914_0, %i6981_1) {inst = 7914, source_primitive = "or"} : (i1, i1) -> i1
    %i7914_2 = "silicon.or"(%i7914_1, %i9358_3) {inst = 7914, source_primitive = "or"} : (i1, i1) -> i1
    %i6978_0 = "silicon.or"(%i7819_0, %i6983_0) {inst = 6978, source_primitive = "or"} : (i1, i1) -> i1
    %i6978_1 = "silicon.and"(%i6978_0, %i7914_2) {inst = 6978, source_primitive = "and"} : (i1, i1) -> i1
    %i6978_2 = "silicon.and"(%i6978_1, %i7400_1) {inst = 6978, source_primitive = "and"} : (i1, i1) -> i1
    %i6987_0 = "silicon.or"(%i7764_2, %i6983_0) {inst = 6987, source_primitive = "or"} : (i1, i1) -> i1
    %i6987_1 = "silicon.and"(%i6987_0, %i6979_3) {inst = 6987, source_primitive = "and"} : (i1, i1) -> i1
    %i6987_2 = "silicon.and"(%i6987_1, %i7400_1) {inst = 6987, source_primitive = "and"} : (i1, i1) -> i1
    %i8213_0 = "silicon.or"(%i7824_2, %i6978_2) {inst = 8213, source_primitive = "nor"} : (i1, i1) -> i1
    %i8213_1 = "silicon.not"(%i8213_0) {inst = 8213, source_primitive = "nor"} : (i1) -> i1
    %i8213_2 = "silicon.and"(%i8213_1, %i6987_2) {inst = 8213, source_primitive = "and"} : (i1, i1) -> i1
    %i8213_3 = "silicon.and"(%i8213_2, %i7563_2) {inst = 8213, source_primitive = "and"} : (i1, i1) -> i1
    %i8275_0 = "silicon.and"(%i8213_3, %input_I) {inst = 8275, source_primitive = "and"} : (i1, i1) -> i1
    %i8275_1 = "silicon.and"(%i8275_0, %i4722_1) {inst = 8275, source_primitive = "and"} : (i1, i1) -> i1
    %i8275_2 = "silicon.or"(%i8275_1, %state_8219) {inst = 8275, source_primitive = "or"} : (i1, i1) -> i1
    %i8428_0 = "silicon.or"(%i7563_2, %i6978_2) {inst = 8428, source_primitive = "nor"} : (i1, i1) -> i1
    %i8428_1 = "silicon.not"(%i8428_0) {inst = 8428, source_primitive = "nor"} : (i1) -> i1
    %i8428_2 = "silicon.and"(%i8428_1, %i6987_2) {inst = 8428, source_primitive = "and"} : (i1, i1) -> i1
    %i8428_3 = "silicon.and"(%i8428_2, %i7824_2) {inst = 8428, source_primitive = "and"} : (i1, i1) -> i1
    %i8437_0 = "silicon.not"(%i6987_2) {inst = 8437, source_primitive = "not"} : (i1) -> i1
    %i8437_1 = "silicon.or"(%i8437_0, %i6978_2) {inst = 8437, source_primitive = "or"} : (i1, i1) -> i1
    %i8437_2 = "silicon.or"(%i8437_1, %i7824_2) {inst = 8437, source_primitive = "or"} : (i1, i1) -> i1
    %i8437_3 = "silicon.or"(%i8437_2, %i7563_2) {inst = 8437, source_primitive = "or"} : (i1, i1) -> i1
    %i8461_0 = "silicon.or"(%i8191_1, %i8437_3) {inst = 8461, source_primitive = "or"} : (i1, i1) -> i1
    %i8461_1 = "silicon.or"(%i8461_0, %i8290_0) {inst = 8461, source_primitive = "or"} : (i1, i1) -> i1
    %i8461_2 = "silicon.or"(%i8461_1, %state_8085) {inst = 8461, source_primitive = "or"} : (i1, i1) -> i1
    %i8490_0 = "silicon.or"(%i8437_3, %i8191_1) {inst = 8490, source_primitive = "nor"} : (i1, i1) -> i1
    %i8490_1 = "silicon.not"(%i8490_0) {inst = 8490, source_primitive = "nor"} : (i1) -> i1
    %i8579_0 = "silicon.not"(%i7563_2) {inst = 8579, source_primitive = "not"} : (i1) -> i1
    %i8579_1 = "silicon.or"(%i8579_0, %i6987_2) {inst = 8579, source_primitive = "or"} : (i1, i1) -> i1
    %i8579_2 = "silicon.or"(%i8579_1, %i6978_2) {inst = 8579, source_primitive = "or"} : (i1, i1) -> i1
    %i8579_3 = "silicon.or"(%i8579_2, %i7824_2) {inst = 8579, source_primitive = "or"} : (i1, i1) -> i1
    %i8592_0 = "silicon.or"(%i7563_2, %i7824_2) {inst = 8592, source_primitive = "nor"} : (i1, i1) -> i1
    %i8592_1 = "silicon.or"(%i8592_0, %i6978_2) {inst = 8592, source_primitive = "nor"} : (i1, i1) -> i1
    %i8592_2 = "silicon.or"(%i8592_1, %i6987_2) {inst = 8592, source_primitive = "nor"} : (i1, i1) -> i1
    %i8592_3 = "silicon.not"(%i8592_2) {inst = 8592, source_primitive = "nor"} : (i1) -> i1
    %i8597_0 = "silicon.or"(%i6978_2, %i6987_2) {inst = 8597, source_primitive = "nor"} : (i1, i1) -> i1
    %i8597_1 = "silicon.not"(%i8597_0) {inst = 8597, source_primitive = "nor"} : (i1) -> i1
    %i8597_2 = "silicon.and"(%i8597_1, %i7824_2) {inst = 8597, source_primitive = "and"} : (i1, i1) -> i1
    %i8597_3 = "silicon.and"(%i8597_2, %i7563_2) {inst = 8597, source_primitive = "and"} : (i1, i1) -> i1
    %i8604_0 = "silicon.not"(%i7824_2) {inst = 8604, source_primitive = "not"} : (i1) -> i1
    %i8604_1 = "silicon.or"(%i8604_0, %i6987_2) {inst = 8604, source_primitive = "or"} : (i1, i1) -> i1
    %i8604_2 = "silicon.or"(%i8604_1, %i6978_2) {inst = 8604, source_primitive = "or"} : (i1, i1) -> i1
    %i8604_3 = "silicon.or"(%i8604_2, %i7563_2) {inst = 8604, source_primitive = "or"} : (i1, i1) -> i1
    %i8620_0 = "silicon.or"(%i8604_3, %i8574_1) {inst = 8620, source_primitive = "nor"} : (i1, i1) -> i1
    %i8620_1 = "silicon.not"(%i8620_0) {inst = 8620, source_primitive = "nor"} : (i1) -> i1
    %i8711_0 = "silicon.or"(%i8574_1, %i8604_3) {inst = 8711, source_primitive = "or"} : (i1, i1) -> i1
    %i8711_1 = "silicon.or"(%i8711_0, %i8660_0) {inst = 8711, source_primitive = "or"} : (i1, i1) -> i1
    %i8711_2 = "silicon.or"(%i8711_1, %state_8591) {inst = 8711, source_primitive = "or"} : (i1, i1) -> i1
    %i8741_0 = "silicon.and"(%i8592_3, %input_I) {inst = 8741, source_primitive = "and"} : (i1, i1) -> i1
    %i8741_1 = "silicon.and"(%i8741_0, %i4722_1) {inst = 8741, source_primitive = "and"} : (i1, i1) -> i1
    %i8741_2 = "silicon.or"(%i8741_1, %state_8815) {inst = 8741, source_primitive = "or"} : (i1, i1) -> i1
    %i8771_0 = "silicon.or"(%i8579_3, %i8576_1) {inst = 8771, source_primitive = "nor"} : (i1, i1) -> i1
    %i8771_1 = "silicon.not"(%i8771_0) {inst = 8771, source_primitive = "nor"} : (i1) -> i1
    %i2563_0 = "silicon.or"(%i7824_2, %i6987_2) {inst = 2563, source_primitive = "nor"} : (i1, i1) -> i1
    %i2563_1 = "silicon.not"(%i2563_0) {inst = 2563, source_primitive = "nor"} : (i1) -> i1
    %i2563_2 = "silicon.and"(%i2563_1, %i6978_2) {inst = 2563, source_primitive = "and"} : (i1, i1) -> i1
    %i2563_3 = "silicon.and"(%i2563_2, %i7563_2) {inst = 2563, source_primitive = "and"} : (i1, i1) -> i1
    %i2622_0 = "silicon.and"(%i2563_3, %state_2574) {inst = 2622, source_primitive = "nand"} : (i1, i1) -> i1
    %i2622_1 = "silicon.and"(%i2622_0, %i4722_1) {inst = 2622, source_primitive = "nand"} : (i1, i1) -> i1
    %i2622_2 = "silicon.and"(%i2622_1, %input_I) {inst = 2622, source_primitive = "nand"} : (i1, i1) -> i1
    %i2622_3 = "silicon.not"(%i2622_2) {inst = 2622, source_primitive = "nand"} : (i1) -> i1
    %i2671_0 = "silicon.not"(%i6978_2) {inst = 2671, source_primitive = "not"} : (i1) -> i1
    %i2671_1 = "silicon.or"(%i2671_0, %i6987_2) {inst = 2671, source_primitive = "or"} : (i1, i1) -> i1
    %i2671_2 = "silicon.or"(%i2671_1, %i7824_2) {inst = 2671, source_primitive = "or"} : (i1, i1) -> i1
    %i2671_3 = "silicon.or"(%i2671_2, %i7563_2) {inst = 2671, source_primitive = "or"} : (i1, i1) -> i1
    %i2706_0 = "silicon.or"(%i7563_2, %i6987_2) {inst = 2706, source_primitive = "nor"} : (i1, i1) -> i1
    %i2706_1 = "silicon.not"(%i2706_0) {inst = 2706, source_primitive = "nor"} : (i1) -> i1
    %i2706_2 = "silicon.and"(%i2706_1, %i6978_2) {inst = 2706, source_primitive = "and"} : (i1, i1) -> i1
    %i2706_3 = "silicon.and"(%i2706_2, %i7824_2) {inst = 2706, source_primitive = "and"} : (i1, i1) -> i1
    %i2707_0 = "silicon.not"(%i6978_2) {inst = 2707, source_primitive = "not"} : (i1) -> i1
    %i2707_1 = "silicon.and"(%i2707_0, %i6987_2) {inst = 2707, source_primitive = "and"} : (i1, i1) -> i1
    %i2707_2 = "silicon.and"(%i2707_1, %i7824_2) {inst = 2707, source_primitive = "and"} : (i1, i1) -> i1
    %i2707_3 = "silicon.and"(%i2707_2, %i7563_2) {inst = 2707, source_primitive = "and"} : (i1, i1) -> i1
    %i2717_0 = "silicon.and"(%i2707_3, %state_2709) {inst = 2717, source_primitive = "nand"} : (i1, i1) -> i1
    %i2717_1 = "silicon.and"(%i2717_0, %i4722_1) {inst = 2717, source_primitive = "nand"} : (i1, i1) -> i1
    %i2717_2 = "silicon.and"(%i2717_1, %input_I) {inst = 2717, source_primitive = "nand"} : (i1, i1) -> i1
    %i2717_3 = "silicon.not"(%i2717_2) {inst = 2717, source_primitive = "nand"} : (i1) -> i1
    %i2782_0 = "silicon.and"(%i2706_3, %state_2542) {inst = 2782, source_primitive = "nand"} : (i1, i1) -> i1
    %i2782_1 = "silicon.and"(%i2782_0, %i4722_1) {inst = 2782, source_primitive = "nand"} : (i1, i1) -> i1
    %i2782_2 = "silicon.and"(%i2782_1, %input_I) {inst = 2782, source_primitive = "nand"} : (i1, i1) -> i1
    %i2782_3 = "silicon.not"(%i2782_2) {inst = 2782, source_primitive = "nand"} : (i1) -> i1
    %i8099_0 = "silicon.and"(%i8597_3, %input_I) {inst = 8099, source_primitive = "and"} : (i1, i1) -> i1
    %i8099_1 = "silicon.and"(%i8099_0, %i4722_1) {inst = 8099, source_primitive = "and"} : (i1, i1) -> i1
    %i8099_2 = "silicon.or"(%i8099_1, %state_8095) {inst = 8099, source_primitive = "or"} : (i1, i1) -> i1
    %i8103_0 = "silicon.and"(%state_8092, %i8771_1) {inst = 8103, source_primitive = "and"} : (i1, i1) -> i1
    %i8103_1 = "silicon.or"(%i8103_0, %state_8431) {inst = 8103, source_primitive = "or"} : (i1, i1) -> i1
    %i8108_0 = "silicon.or"(%i8576_1, %i8579_3) {inst = 8108, source_primitive = "or"} : (i1, i1) -> i1
    %i8108_1 = "silicon.or"(%i8108_0, %i8106_0) {inst = 8108, source_primitive = "or"} : (i1, i1) -> i1
    %i8108_2 = "silicon.or"(%i8108_1, %state_8431) {inst = 8108, source_primitive = "or"} : (i1, i1) -> i1
    %i8192_0 = "silicon.or"(%i8490_1, %state_8199) {inst = 8192, source_primitive = "or"} : (i1, i1) -> i1
    %i8192_1 = "silicon.and"(%i8192_0, %i8461_2) {inst = 8192, source_primitive = "and"} : (i1, i1) -> i1
    %i8196_0 = "silicon.and"(%state_8199, %i8490_1) {inst = 8196, source_primitive = "and"} : (i1, i1) -> i1
    %i8196_1 = "silicon.or"(%i8196_0, %state_8085) {inst = 8196, source_primitive = "or"} : (i1, i1) -> i1
    %i8200_0 = "silicon.and"(%i8428_3, %input_I) {inst = 8200, source_primitive = "and"} : (i1, i1) -> i1
    %i8200_1 = "silicon.and"(%i8200_0, %i4722_1) {inst = 8200, source_primitive = "and"} : (i1, i1) -> i1
    %i8200_2 = "silicon.or"(%i8200_1, %state_8214) {inst = 8200, source_primitive = "or"} : (i1, i1) -> i1
    %i8202_0 = "silicon.not"(%i2717_3) {inst = 8202, source_primitive = "not"} : (i1) -> i1
    %i8202_1 = "silicon.or"(%i8202_0, %state_8091) {inst = 8202, source_primitive = "or"} : (i1, i1) -> i1
    %i8203_0 = "silicon.and"(%i8597_3, %state_8095) {inst = 8203, source_primitive = "nand"} : (i1, i1) -> i1
    %i8203_1 = "silicon.and"(%i8203_0, %i4722_1) {inst = 8203, source_primitive = "nand"} : (i1, i1) -> i1
    %i8203_2 = "silicon.and"(%i8203_1, %input_I) {inst = 8203, source_primitive = "nand"} : (i1, i1) -> i1
    %i8203_3 = "silicon.not"(%i8203_2) {inst = 8203, source_primitive = "nand"} : (i1) -> i1
    %i8212_0 = "silicon.and"(%i8213_3, %state_8219) {inst = 8212, source_primitive = "nand"} : (i1, i1) -> i1
    %i8212_1 = "silicon.and"(%i8212_0, %i4722_1) {inst = 8212, source_primitive = "nand"} : (i1, i1) -> i1
    %i8212_2 = "silicon.and"(%i8212_1, %input_I) {inst = 8212, source_primitive = "nand"} : (i1, i1) -> i1
    %i8212_3 = "silicon.not"(%i8212_2) {inst = 8212, source_primitive = "nand"} : (i1) -> i1
    %i8215_0 = "silicon.not"(%i8212_3) {inst = 8215, source_primitive = "not"} : (i1) -> i1
    %i8215_1 = "silicon.or"(%i8215_0, %state_8086) {inst = 8215, source_primitive = "or"} : (i1, i1) -> i1
    %i8427_0 = "silicon.and"(%i8428_3, %state_8214) {inst = 8427, source_primitive = "nand"} : (i1, i1) -> i1
    %i8427_1 = "silicon.and"(%i8427_0, %i4722_1) {inst = 8427, source_primitive = "nand"} : (i1, i1) -> i1
    %i8427_2 = "silicon.and"(%i8427_1, %input_I) {inst = 8427, source_primitive = "nand"} : (i1, i1) -> i1
    %i8427_3 = "silicon.not"(%i8427_2) {inst = 8427, source_primitive = "nand"} : (i1) -> i1
    %i8581_0 = "silicon.and"(%i8592_3, %state_8815) {inst = 8581, source_primitive = "nand"} : (i1, i1) -> i1
    %i8581_1 = "silicon.and"(%i8581_0, %i4722_1) {inst = 8581, source_primitive = "nand"} : (i1, i1) -> i1
    %i8581_2 = "silicon.and"(%i8581_1, %input_I) {inst = 8581, source_primitive = "nand"} : (i1, i1) -> i1
    %i8581_3 = "silicon.not"(%i8581_2) {inst = 8581, source_primitive = "nand"} : (i1) -> i1
    %i8583_0 = "silicon.and"(%state_8602, %i8620_1) {inst = 8583, source_primitive = "and"} : (i1, i1) -> i1
    %i8583_1 = "silicon.or"(%i8583_0, %state_8591) {inst = 8583, source_primitive = "or"} : (i1, i1) -> i1
    %i8600_0 = "silicon.or"(%i8620_1, %state_8602) {inst = 8600, source_primitive = "or"} : (i1, i1) -> i1
    %i8600_1 = "silicon.and"(%i8600_0, %i8711_2) {inst = 8600, source_primitive = "and"} : (i1, i1) -> i1
    %i8658_0 = "silicon.or"(%i8771_1, %state_8092) {inst = 8658, source_primitive = "or"} : (i1, i1) -> i1
    %i8658_1 = "silicon.and"(%i8658_0, %i8108_2) {inst = 8658, source_primitive = "and"} : (i1, i1) -> i1
    %i8695_0 = "silicon.or"(%i8203_3, %state_8429) {inst = 8695, source_primitive = "or"} : (i1, i1) -> i1
    %i8695_1 = "silicon.and"(%i8695_0, %i8099_2) {inst = 8695, source_primitive = "and"} : (i1, i1) -> i1
    %i8867_0 = "silicon.or"(%i8581_3, %state_8084) {inst = 8867, source_primitive = "or"} : (i1, i1) -> i1
    %i8867_1 = "silicon.and"(%i8867_0, %i8741_2) {inst = 8867, source_primitive = "and"} : (i1, i1) -> i1
    %i8881_0 = "silicon.not"(%i8581_3) {inst = 8881, source_primitive = "not"} : (i1) -> i1
    %i8881_1 = "silicon.or"(%i8881_0, %state_8084) {inst = 8881, source_primitive = "or"} : (i1, i1) -> i1
    %i72_0 = "silicon.and"(%i2707_3, %input_I) {inst = 72, source_primitive = "and"} : (i1, i1) -> i1
    %i72_1 = "silicon.and"(%i72_0, %i4722_1) {inst = 72, source_primitive = "and"} : (i1, i1) -> i1
    %i72_2 = "silicon.or"(%i72_1, %state_2709) {inst = 72, source_primitive = "or"} : (i1, i1) -> i1
    %i75_0 = "silicon.or"(%i2717_3, %state_8091) {inst = 75, source_primitive = "or"} : (i1, i1) -> i1
    %i75_1 = "silicon.and"(%i75_0, %i72_2) {inst = 75, source_primitive = "and"} : (i1, i1) -> i1
    %i2298_0 = "silicon.or"(%i2671_3, %i2296_1) {inst = 2298, source_primitive = "nor"} : (i1, i1) -> i1
    %i2298_1 = "silicon.not"(%i2298_0) {inst = 2298, source_primitive = "nor"} : (i1) -> i1
    %i2302_0 = "silicon.not"(%i2782_3) {inst = 2302, source_primitive = "not"} : (i1) -> i1
    %i2302_1 = "silicon.or"(%i2302_0, %state_2299) {inst = 2302, source_primitive = "or"} : (i1, i1) -> i1
    %i2543_0 = "silicon.and"(%state_2708, %i2298_1) {inst = 2543, source_primitive = "and"} : (i1, i1) -> i1
    %i2543_1 = "silicon.or"(%i2543_0, %state_2710) {inst = 2543, source_primitive = "or"} : (i1, i1) -> i1
    %i2544_0 = "silicon.and"(%i2706_3, %input_I) {inst = 2544, source_primitive = "and"} : (i1, i1) -> i1
    %i2544_1 = "silicon.and"(%i2544_0, %i4722_1) {inst = 2544, source_primitive = "and"} : (i1, i1) -> i1
    %i2544_2 = "silicon.or"(%i2544_1, %state_2542) {inst = 2544, source_primitive = "or"} : (i1, i1) -> i1
    %i2552_0 = "silicon.or"(%i2296_1, %i2671_3) {inst = 2552, source_primitive = "or"} : (i1, i1) -> i1
    %i2552_1 = "silicon.or"(%i2552_0, %i2711_0) {inst = 2552, source_primitive = "or"} : (i1, i1) -> i1
    %i2552_2 = "silicon.or"(%i2552_1, %state_2710) {inst = 2552, source_primitive = "or"} : (i1, i1) -> i1
    %i2553_0 = "silicon.and"(%i2563_3, %input_I) {inst = 2553, source_primitive = "and"} : (i1, i1) -> i1
    %i2553_1 = "silicon.and"(%i2553_0, %i4722_1) {inst = 2553, source_primitive = "and"} : (i1, i1) -> i1
    %i2553_2 = "silicon.or"(%i2553_1, %state_2574) {inst = 2553, source_primitive = "or"} : (i1, i1) -> i1
    %i2572_0 = "silicon.not"(%i2622_3) {inst = 2572, source_primitive = "not"} : (i1) -> i1
    %i2572_1 = "silicon.or"(%i2572_0, %state_2301) {inst = 2572, source_primitive = "or"} : (i1, i1) -> i1
    %i2740_0 = "silicon.or"(%i2782_3, %state_2299) {inst = 2740, source_primitive = "or"} : (i1, i1) -> i1
    %i2740_1 = "silicon.and"(%i2740_0, %i2544_2) {inst = 2740, source_primitive = "and"} : (i1, i1) -> i1
    %i8190_0 = "silicon.or"(%i8427_3, %state_8090) {inst = 8190, source_primitive = "or"} : (i1, i1) -> i1
    %i8190_1 = "silicon.and"(%i8190_0, %i8200_2) {inst = 8190, source_primitive = "and"} : (i1, i1) -> i1
    %i8201_0 = "silicon.not"(%i8203_3) {inst = 8201, source_primitive = "not"} : (i1) -> i1
    %i8201_1 = "silicon.or"(%i8201_0, %state_8429) {inst = 8201, source_primitive = "or"} : (i1, i1) -> i1
    %i8211_0 = "silicon.or"(%i8212_3, %state_8086) {inst = 8211, source_primitive = "or"} : (i1, i1) -> i1
    %i8211_1 = "silicon.and"(%i8211_0, %i8275_2) {inst = 8211, source_primitive = "and"} : (i1, i1) -> i1
    %i8321_0 = "silicon.not"(%i8427_3) {inst = 8321, source_primitive = "not"} : (i1) -> i1
    %i8321_1 = "silicon.or"(%i8321_0, %state_8090) {inst = 8321, source_primitive = "or"} : (i1, i1) -> i1
    %i2540_0 = "silicon.or"(%i2622_3, %state_2301) {inst = 2540, source_primitive = "or"} : (i1, i1) -> i1
    %i2540_1 = "silicon.and"(%i2540_0, %i2553_2) {inst = 2540, source_primitive = "and"} : (i1, i1) -> i1
    %i2548_0 = "silicon.or"(%i2298_1, %state_2708) {inst = 2548, source_primitive = "or"} : (i1, i1) -> i1
    %i2548_1 = "silicon.and"(%i2548_0, %i2552_2) {inst = 2548, source_primitive = "and"} : (i1, i1) -> i1
    %next_226 = "silicon.dff"(%i395_0, %input_clk, %input_rst_n, %state_226) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 226, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_227 = "silicon.dff"(%i399_3, %input_clk, %input_rst_n, %state_227) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 227, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_228 = "silicon.dff"(%i233_3, %input_clk, %input_rst_n, %state_228) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 228, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_234 = "silicon.dff"(%i608_2, %input_clk, %state_234) {clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 234, state_pin = "Q"} : (i1, i1, i1) -> i1
    %next_235 = "silicon.dff"(%i199_3, %input_clk, %state_235) {clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 235, state_pin = "Q"} : (i1, i1, i1) -> i1
    %next_236 = "silicon.dff"(%i341_3, %input_clk, %state_236) {clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 236, state_pin = "Q"} : (i1, i1, i1) -> i1
    %next_237 = "silicon.dff"(%i215_3, %input_clk, %state_237) {clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 237, state_pin = "Q"} : (i1, i1, i1) -> i1
    %next_1228 = "silicon.dff"(%i1790_1, %input_clk, %input_rst_n, %state_1228) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1228, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1229 = "silicon.dff"(%i1777_1, %input_clk, %input_rst_n, %state_1229) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1229, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1230 = "silicon.dff"(%i1235_1, %input_clk, %input_rst_n, %state_1230) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1230, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1249 = "silicon.dff"(%i1796_1, %input_clk, %input_rst_n, %state_1249) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1249, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1250 = "silicon.dff"(%i147_1, %input_clk, %input_rst_n, %state_1250) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1250, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1258 = "silicon.dff"(%i1611_1, %input_clk, %input_rst_n, %state_1258) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1258, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1259 = "silicon.dff"(%i1366_1, %input_clk, %input_rst_n, %state_1259) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1259, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1260 = "silicon.dff"(%i1579_1, %input_clk, %input_rst_n, %state_1260) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1260, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1261 = "silicon.dff"(%i1387_1, %input_clk, %input_rst_n, %state_1261) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1261, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1264 = "silicon.dff"(%i1780_1, %input_clk, %input_rst_n, %state_1264) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1264, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1383 = "silicon.dff"(%i1569_1, %input_clk, %input_rst_n, %state_1383) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1383, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1384 = "silicon.dff"(%i1367_1, %input_clk, %input_rst_n, %state_1384) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1384, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1385 = "silicon.dff"(%i1570_1, %input_clk, %input_rst_n, %state_1385) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1385, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1626 = "silicon.dff"(%i1675_1, %input_clk, %input_rst_n, %state_1626) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1626, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1808 = "silicon.dff"(%i1959_1, %input_clk, %input_rst_n, %state_1808) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1808, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1809 = "silicon.dff"(%i1781_1, %input_clk, %input_rst_n, %state_1809) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1809, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_1810 = "silicon.dff"(%i1240_1, %input_clk, %input_rst_n, %state_1810) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 1810, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2036 = "silicon.dff"(%i1792_1, %input_clk, %input_rst_n, %state_2036) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2036, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2037 = "silicon.dff"(%i1795_1, %input_clk, %input_rst_n, %state_2037) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2037, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2039 = "silicon.dff"(%i145_1, %input_clk, %input_rst_n, %state_2039) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2039, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2293 = "silicon.dff"(%i2363_1, %input_clk, %input_rst_n, %state_2293) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2293, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2299 = "silicon.dff"(%i2302_1, %input_clk, %input_rst_n, %state_2299) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2299, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2301 = "silicon.dff"(%i2572_1, %input_clk, %input_rst_n, %state_2301) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2301, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2372 = "silicon.dff"(%i2437_1, %input_clk, %input_rst_n, %state_2372) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2372, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2542 = "silicon.dff"(%i2740_1, %input_clk, %input_rst_n, %state_2542) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2542, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2574 = "silicon.dff"(%i2540_1, %input_clk, %input_rst_n, %state_2574) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2574, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2708 = "silicon.dff"(%i2548_1, %input_clk, %input_rst_n, %state_2708) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2708, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2709 = "silicon.dff"(%i75_1, %input_clk, %input_rst_n, %state_2709) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2709, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2710 = "silicon.dff"(%i2543_1, %input_clk, %input_rst_n, %state_2710) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2710, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2944 = "silicon.dff"(%i3285_3, %input_clk, %input_rst_n, %state_2944) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2944, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2946 = "silicon.dff"(%i2973_2, %input_clk, %input_rst_n, %state_2946) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2946, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2947 = "silicon.dff"(%i3489_2, %input_clk, %input_rst_n, %state_2947) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2947, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2948 = "silicon.dff"(%i2969_3, %input_clk, %input_rst_n, %state_2948) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2948, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2957 = "silicon.dff"(%i3284_3, %input_clk, %input_rst_n, %state_2957) {async_active = 0, async_pin = "SET_B", async_value = 1, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2957, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2958 = "silicon.dff"(%i3516_1, %input_clk, %input_rst_n, %state_2958) {async_active = 0, async_pin = "SET_B", async_value = 1, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2958, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2959 = "silicon.dff"(%i3587_3, %input_clk, %input_rst_n, %state_2959) {async_active = 0, async_pin = "SET_B", async_value = 1, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2959, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_2960 = "silicon.dff"(%i2965_3, %input_clk, %input_rst_n, %state_2960) {async_active = 0, async_pin = "SET_B", async_value = 1, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 2960, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4182 = "silicon.dff"(%i4602_2, %input_clk, %input_rst_n, %state_4182) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 4182, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4659 = "silicon.dff"(%i4862_0, %input_clk, %input_rst_n, %state_4659) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 4659, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4661 = "silicon.dff"(%i4663_4, %input_clk, %input_rst_n, %state_4661) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 4661, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4662 = "silicon.dff"(%i4710_1, %input_clk, %input_rst_n, %state_4662) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 4662, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4838 = "silicon.dff"(%i4835_3, %input_clk, %input_rst_n, %state_4838) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 4838, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_4993 = "silicon.dff"(%i5263_0, %input_clk, %input_rst_n, %state_4993) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 4993, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5000 = "silicon.dff"(%i5340_0, %input_clk, %input_rst_n, %state_5000) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5000, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5004 = "silicon.dff"(%i5433_0, %input_clk, %input_rst_n, %state_5004) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5004, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5093 = "silicon.dff"(%i5007_0, %input_clk, %input_rst_n, %state_5093) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5093, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5336 = "silicon.dff"(%i5400_0, %input_clk, %input_rst_n, %state_5336) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5336, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5337 = "silicon.dff"(%i5256_2, %input_clk, %input_rst_n, %state_5337) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5337, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5339 = "silicon.dff"(%i5347_0, %input_clk, %input_rst_n, %state_5339) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5339, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5342 = "silicon.dff"(%i5205_0, %input_clk, %input_rst_n, %state_5342) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5342, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5343 = "silicon.dff"(%i5537_0, %input_clk, %input_rst_n, %state_5343) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5343, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5344 = "silicon.dff"(%i5403_0, %input_clk, %input_rst_n, %state_5344) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5344, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5399 = "silicon.dff"(%i5011_0, %input_clk, %input_rst_n, %state_5399) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5399, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5401 = "silicon.dff"(%i5008_0, %input_clk, %input_rst_n, %state_5401) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5401, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5569 = "silicon.dff"(%i5265_0, %input_clk, %input_rst_n, %state_5569) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5569, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5634 = "silicon.dff"(%i5682_2, %input_clk, %input_rst_n, %state_5634) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5634, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5638 = "silicon.dff"(%i5640_2, %input_clk, %input_rst_n, %state_5638) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5638, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_5639 = "silicon.dff"(%i5781_2, %input_clk, %input_rst_n, %state_5639) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 5639, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6095 = "silicon.dff"(%i6041_1, %input_clk, %input_rst_n, %state_6095) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6095, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6106 = "silicon.dff"(%i5603_1, %input_clk, %input_rst_n, %state_6106) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6106, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6109 = "silicon.dff"(%i6103_3, %input_clk, %input_rst_n, %state_6109) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6109, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6111 = "silicon.dff"(%i5614_1, %input_clk, %input_rst_n, %state_6111) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6111, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6159 = "silicon.dff"(%i6110_0, %input_clk, %input_rst_n, %state_6159) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6159, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6197 = "silicon.dff"(%i5627_1, %input_clk, %input_rst_n, %state_6197) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6197, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6198 = "silicon.dff"(%i6195_1, %input_clk, %input_rst_n, %state_6198) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6198, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6199 = "silicon.dff"(%i5615_1, %input_clk, %input_rst_n, %state_6199) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6199, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6435 = "silicon.dff"(%i6437_3, %input_clk, %input_rst_n, %state_6435) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6435, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6436 = "silicon.dff"(%i6481_0, %input_clk, %input_rst_n, %state_6436) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6436, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6442 = "silicon.dff"(%i6444_0, %input_clk, %input_rst_n, %state_6442) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6442, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_6451 = "silicon.dff"(%i6446_2, %input_clk, %input_rst_n, %state_6451) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 6451, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8084 = "silicon.dff"(%i8881_1, %input_clk, %input_rst_n, %state_8084) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8084, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8085 = "silicon.dff"(%i8196_1, %input_clk, %input_rst_n, %state_8085) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8085, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8086 = "silicon.dff"(%i8215_1, %input_clk, %input_rst_n, %state_8086) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8086, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8090 = "silicon.dff"(%i8321_1, %input_clk, %input_rst_n, %state_8090) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8090, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8091 = "silicon.dff"(%i8202_1, %input_clk, %input_rst_n, %state_8091) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8091, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8092 = "silicon.dff"(%i8658_1, %input_clk, %input_rst_n, %state_8092) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8092, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8095 = "silicon.dff"(%i8695_1, %input_clk, %input_rst_n, %state_8095) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8095, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8199 = "silicon.dff"(%i8192_1, %input_clk, %input_rst_n, %state_8199) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8199, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8214 = "silicon.dff"(%i8190_1, %input_clk, %input_rst_n, %state_8214) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8214, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8219 = "silicon.dff"(%i8211_1, %input_clk, %input_rst_n, %state_8219) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8219, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8429 = "silicon.dff"(%i8201_1, %input_clk, %input_rst_n, %state_8429) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8429, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8431 = "silicon.dff"(%i8103_1, %input_clk, %input_rst_n, %state_8431) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8431, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8591 = "silicon.dff"(%i8583_1, %input_clk, %input_rst_n, %state_8591) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8591, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8602 = "silicon.dff"(%i8600_1, %input_clk, %input_rst_n, %state_8602) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8602, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    %next_8815 = "silicon.dff"(%i8867_1, %input_clk, %input_rst_n, %state_8815) {async_active = 0, async_pin = "RESET_B", async_value = 0, clock_edge = "posedge", clock_pin = "CLK", data_pin = "D", inst = 8815, state_pin = "Q"} : (i1, i1, i1, i1) -> i1
    return %next_226, %next_227, %next_228, %next_234, %next_235, %next_236, %next_237, %next_1228, %next_1229, %next_1230, %next_1249, %next_1250, %next_1258, %next_1259, %next_1260, %next_1261, %next_1264, %next_1383, %next_1384, %next_1385, %next_1626, %next_1808, %next_1809, %next_1810, %next_2036, %next_2037, %next_2039, %next_2293, %next_2299, %next_2301, %next_2372, %next_2542, %next_2574, %next_2708, %next_2709, %next_2710, %next_2944, %next_2946, %next_2947, %next_2948, %next_2957, %next_2958, %next_2959, %next_2960, %next_4182, %next_4659, %next_4661, %next_4662, %next_4838, %next_4993, %next_5000, %next_5004, %next_5093, %next_5336, %next_5337, %next_5339, %next_5342, %next_5343, %next_5344, %next_5399, %next_5401, %next_5569, %next_5634, %next_5638, %next_5639, %next_6095, %next_6106, %next_6109, %next_6111, %next_6159, %next_6197, %next_6198, %next_6199, %next_6435, %next_6436, %next_6442, %next_6451, %next_8084, %next_8085, %next_8086, %next_8090, %next_8091, %next_8092, %next_8095, %next_8199, %next_8214, %next_8219, %next_8429, %next_8431, %next_8591, %next_8602, %next_8815, %state_228, %i222_1, %i1046_1, %i223_1, %i350_1, %i305_1, %i230_1, %i553_1, %i229_1 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}
