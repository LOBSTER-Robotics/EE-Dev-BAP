// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Wed May 27 15:34:22 2026
//
// Verilog Description of module top
//

module top (phy_clk125, sw, led);   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(4[8:11])
    input phy_clk125;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(9[9:19])
    input [7:0]sw;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    output [7:0]led;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    
    wire phy_clk125_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=phy_clk125_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(9[9:19])
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;
    
    wire sw_c_7, sw_c_6, sw_c_5, sw_c_4, sw_c_3, sw_c_2, sw_c_1, 
        sw_c_0, led_c_6, led_c_5, led_c_4, led_c_3, led_c_2, led_c_1, 
        led_c_0, blink_led, led_7__N_1;
    
    VHI i14 (.Z(VCC_net));
    \led_blinker(125000000,1)  u_blinker (.phy_clk125_c(phy_clk125_c), .GND_net(GND_net), 
            .VCC_net(VCC_net), .blink_led(blink_led));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(32[17:40])
    OB led_pad_6 (.I(led_c_6), .O(led[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    OB led_pad_7 (.I(led_7__N_1), .O(led[7]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    LUT4 i174_2_lut (.A(sw_c_6), .B(sw_c_7), .Z(led_7__N_1)) /* synthesis lut_function=(!(A (B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(58[15:36])
    defparam i174_2_lut.init = 16'h7777;
    GSR GSR_INST (.GSR(VCC_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    LUT4 sw_4__I_0_1_lut (.A(sw_c_4), .Z(led_c_5)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(56[15:24])
    defparam sw_4__I_0_1_lut.init = 16'h5555;
    LUT4 sw_3__I_0_1_lut (.A(sw_c_3), .Z(led_c_4)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(55[15:24])
    defparam sw_3__I_0_1_lut.init = 16'h5555;
    LUT4 sw_5__I_0_1_lut (.A(sw_c_5), .Z(led_c_6)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(57[15:24])
    defparam sw_5__I_0_1_lut.init = 16'h5555;
    LUT4 sw_2__I_0_1_lut (.A(sw_c_2), .Z(led_c_3)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(54[15:24])
    defparam sw_2__I_0_1_lut.init = 16'h5555;
    LUT4 sw_1__I_0_1_lut (.A(sw_c_1), .Z(led_c_2)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(53[15:24])
    defparam sw_1__I_0_1_lut.init = 16'h5555;
    LUT4 sw_0__I_0_1_lut (.A(sw_c_0), .Z(led_c_1)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(52[15:24])
    defparam sw_0__I_0_1_lut.init = 16'h5555;
    LUT4 blink_led_I_0_1_lut (.A(blink_led), .Z(led_c_0)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(46[15:28])
    defparam blink_led_I_0_1_lut.init = 16'h5555;
    VLO i13 (.Z(GND_net));
    OB led_pad_5 (.I(led_c_5), .O(led[5]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    OB led_pad_4 (.I(led_c_4), .O(led[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    OB led_pad_3 (.I(led_c_3), .O(led[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    OB led_pad_2 (.I(led_c_2), .O(led[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    OB led_pad_1 (.I(led_c_1), .O(led[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    OB led_pad_0 (.I(led_c_0), .O(led[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(19[9:12])
    IB phy_clk125_pad (.I(phy_clk125), .O(phy_clk125_c));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(9[9:19])
    IB sw_pad_7 (.I(sw[7]), .O(sw_c_7));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    IB sw_pad_6 (.I(sw[6]), .O(sw_c_6));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    IB sw_pad_5 (.I(sw[5]), .O(sw_c_5));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    IB sw_pad_4 (.I(sw[4]), .O(sw_c_4));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    IB sw_pad_3 (.I(sw[3]), .O(sw_c_3));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    IB sw_pad_2 (.I(sw[2]), .O(sw_c_2));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    IB sw_pad_1 (.I(sw[1]), .O(sw_c_1));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    IB sw_pad_0 (.I(sw[0]), .O(sw_c_0));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(14[9:11])
    
endmodule
//
// Verilog Description of module \led_blinker(125000000,1) 
//

module \led_blinker(125000000,1)  (phy_clk125_c, GND_net, VCC_net, blink_led);
    input phy_clk125_c;
    input GND_net;
    input VCC_net;
    output blink_led;
    
    wire phy_clk125_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=phy_clk125_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/top.vhd(9[9:19])
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;
    wire [31:0]counter;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/led_blinker.vhd(21[12:19])
    
    wire n172, n176, n180, n160, n161, n162, n37;
    wire [31:0]n133;
    
    wire n163, n164, n85, n84, n83, n82, n81, n80, n79, n78, 
        n77, n76, n75, n74, n73, n72, n188, n171, n71, n70, 
        n187, n165, n166, n170, led_N_74, n186, n90, n159, n169, 
        n175, n185, n179;
    
    LUT4 i159_1_lut (.A(counter[25]), .Z(n172)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i159_1_lut.init = 16'h5555;
    LUT4 i163_1_lut (.A(counter[16]), .Z(n176)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i163_1_lut.init = 16'h5555;
    LUT4 i167_1_lut (.A(counter[20]), .Z(n180)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i167_1_lut.init = 16'h5555;
    LUT4 i147_1_lut (.A(counter[19]), .Z(n160)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i147_1_lut.init = 16'h5555;
    LUT4 i148_1_lut (.A(counter[7]), .Z(n161)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i148_1_lut.init = 16'h5555;
    LUT4 i149_1_lut (.A(counter[2]), .Z(n162)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i149_1_lut.init = 16'h5555;
    FD1S3IX counter_16__i31 (.D(n133[31]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[31])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i31.GSR = "ENABLED";
    LUT4 i150_1_lut (.A(counter[10]), .Z(n163)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i150_1_lut.init = 16'h5555;
    LUT4 i151_1_lut (.A(counter[3]), .Z(n164)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i151_1_lut.init = 16'h5555;
    CCU2C counter_16_add_4_33 (.A0(counter[31]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n85), .S0(n133[31]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_33.INIT0 = 16'haaa0;
    defparam counter_16_add_4_33.INIT1 = 16'h0000;
    defparam counter_16_add_4_33.INJECT1_0 = "NO";
    defparam counter_16_add_4_33.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_31 (.A0(counter[29]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[30]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n84), .COUT(n85), .S0(n133[29]), .S1(n133[30]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_31.INIT0 = 16'haaa0;
    defparam counter_16_add_4_31.INIT1 = 16'haaa0;
    defparam counter_16_add_4_31.INJECT1_0 = "NO";
    defparam counter_16_add_4_31.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_29 (.A0(counter[27]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[28]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n83), .COUT(n84), .S0(n133[27]), .S1(n133[28]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_29.INIT0 = 16'haaa0;
    defparam counter_16_add_4_29.INIT1 = 16'haaa0;
    defparam counter_16_add_4_29.INJECT1_0 = "NO";
    defparam counter_16_add_4_29.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_27 (.A0(counter[25]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[26]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n82), .COUT(n83), .S0(n133[25]), .S1(n133[26]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_27.INIT0 = 16'haaa0;
    defparam counter_16_add_4_27.INIT1 = 16'haaa0;
    defparam counter_16_add_4_27.INJECT1_0 = "NO";
    defparam counter_16_add_4_27.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_25 (.A0(counter[23]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[24]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n81), .COUT(n82), .S0(n133[23]), .S1(n133[24]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_25.INIT0 = 16'haaa0;
    defparam counter_16_add_4_25.INIT1 = 16'haaa0;
    defparam counter_16_add_4_25.INJECT1_0 = "NO";
    defparam counter_16_add_4_25.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_23 (.A0(counter[21]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[22]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n80), .COUT(n81), .S0(n133[21]), .S1(n133[22]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_23.INIT0 = 16'haaa0;
    defparam counter_16_add_4_23.INIT1 = 16'haaa0;
    defparam counter_16_add_4_23.INJECT1_0 = "NO";
    defparam counter_16_add_4_23.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_21 (.A0(counter[19]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[20]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n79), .COUT(n80), .S0(n133[19]), .S1(n133[20]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_21.INIT0 = 16'haaa0;
    defparam counter_16_add_4_21.INIT1 = 16'haaa0;
    defparam counter_16_add_4_21.INJECT1_0 = "NO";
    defparam counter_16_add_4_21.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_19 (.A0(counter[17]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[18]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n78), .COUT(n79), .S0(n133[17]), .S1(n133[18]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_19.INIT0 = 16'haaa0;
    defparam counter_16_add_4_19.INIT1 = 16'haaa0;
    defparam counter_16_add_4_19.INJECT1_0 = "NO";
    defparam counter_16_add_4_19.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_17 (.A0(counter[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[16]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n77), .COUT(n78), .S0(n133[15]), .S1(n133[16]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_17.INIT0 = 16'haaa0;
    defparam counter_16_add_4_17.INIT1 = 16'haaa0;
    defparam counter_16_add_4_17.INJECT1_0 = "NO";
    defparam counter_16_add_4_17.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_15 (.A0(counter[13]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n76), .COUT(n77), .S0(n133[13]), .S1(n133[14]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_15.INIT0 = 16'haaa0;
    defparam counter_16_add_4_15.INIT1 = 16'haaa0;
    defparam counter_16_add_4_15.INJECT1_0 = "NO";
    defparam counter_16_add_4_15.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_13 (.A0(counter[11]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n75), .COUT(n76), .S0(n133[11]), .S1(n133[12]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_13.INIT0 = 16'haaa0;
    defparam counter_16_add_4_13.INIT1 = 16'haaa0;
    defparam counter_16_add_4_13.INJECT1_0 = "NO";
    defparam counter_16_add_4_13.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_11 (.A0(counter[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[10]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n74), .COUT(n75), .S0(n133[9]), .S1(n133[10]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_11.INIT0 = 16'haaa0;
    defparam counter_16_add_4_11.INIT1 = 16'haaa0;
    defparam counter_16_add_4_11.INJECT1_0 = "NO";
    defparam counter_16_add_4_11.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_9 (.A0(counter[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[8]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n73), .COUT(n74), .S0(n133[7]), .S1(n133[8]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_9.INIT0 = 16'haaa0;
    defparam counter_16_add_4_9.INIT1 = 16'haaa0;
    defparam counter_16_add_4_9.INJECT1_0 = "NO";
    defparam counter_16_add_4_9.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_7 (.A0(counter[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[6]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n72), .COUT(n73), .S0(n133[5]), .S1(n133[6]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_7.INIT0 = 16'haaa0;
    defparam counter_16_add_4_7.INIT1 = 16'haaa0;
    defparam counter_16_add_4_7.INJECT1_0 = "NO";
    defparam counter_16_add_4_7.INJECT1_1 = "NO";
    CCU2C equal_169_32 (.A0(n171), .B0(n172), .C0(n176), .D0(n180), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n188), 
          .S1(n37));
    defparam equal_169_32.INIT0 = 16'h0001;
    defparam equal_169_32.INIT1 = 16'h0000;
    defparam equal_169_32.INJECT1_0 = "YES";
    defparam equal_169_32.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_5 (.A0(counter[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[4]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n71), .COUT(n72), .S0(n133[3]), .S1(n133[4]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_5.INIT0 = 16'haaa0;
    defparam counter_16_add_4_5.INIT1 = 16'haaa0;
    defparam counter_16_add_4_5.INJECT1_0 = "NO";
    defparam counter_16_add_4_5.INJECT1_1 = "NO";
    CCU2C counter_16_add_4_3 (.A0(counter[1]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n70), .COUT(n71), .S0(n133[1]), .S1(n133[2]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_3.INIT0 = 16'haaa0;
    defparam counter_16_add_4_3.INIT1 = 16'haaa0;
    defparam counter_16_add_4_3.INJECT1_0 = "NO";
    defparam counter_16_add_4_3.INJECT1_1 = "NO";
    CCU2C equal_169_31 (.A0(n160), .B0(n161), .C0(n162), .D0(n163), 
          .A1(n164), .B1(n165), .C1(n166), .D1(n170), .CIN(n187), 
          .COUT(n188));
    defparam equal_169_31.INIT0 = 16'h0001;
    defparam equal_169_31.INIT1 = 16'h0001;
    defparam equal_169_31.INJECT1_0 = "YES";
    defparam equal_169_31.INJECT1_1 = "YES";
    FD1S3IX counter_16__i0 (.D(n133[0]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[0])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i0.GSR = "ENABLED";
    FD1S3AX led_reg_15 (.D(led_N_74), .CK(phy_clk125_c), .Q(blink_led)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=21, LSE_LCOL=17, LSE_RCOL=40, LSE_LLINE=32, LSE_RLINE=32 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/test_boardprogramming/led_blinker.vhd(28[9] 37[16])
    defparam led_reg_15.GSR = "ENABLED";
    FD1S3IX counter_16__i30 (.D(n133[30]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[30])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i30.GSR = "ENABLED";
    FD1S3IX counter_16__i29 (.D(n133[29]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[29])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i29.GSR = "ENABLED";
    FD1S3IX counter_16__i28 (.D(n133[28]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[28])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i28.GSR = "ENABLED";
    FD1S3IX counter_16__i27 (.D(n133[27]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[27])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i27.GSR = "ENABLED";
    FD1S3IX counter_16__i26 (.D(n133[26]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[26])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i26.GSR = "ENABLED";
    FD1S3IX counter_16__i25 (.D(n133[25]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[25])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i25.GSR = "ENABLED";
    FD1S3IX counter_16__i24 (.D(n133[24]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[24])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i24.GSR = "ENABLED";
    FD1S3IX counter_16__i23 (.D(n133[23]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[23])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i23.GSR = "ENABLED";
    FD1S3IX counter_16__i22 (.D(n133[22]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[22])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i22.GSR = "ENABLED";
    FD1S3IX counter_16__i21 (.D(n133[21]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[21])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i21.GSR = "ENABLED";
    FD1S3IX counter_16__i20 (.D(n133[20]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[20])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i20.GSR = "ENABLED";
    FD1S3IX counter_16__i19 (.D(n133[19]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[19])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i19.GSR = "ENABLED";
    FD1S3IX counter_16__i18 (.D(n133[18]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[18])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i18.GSR = "ENABLED";
    FD1S3IX counter_16__i17 (.D(n133[17]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[17])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i17.GSR = "ENABLED";
    FD1S3IX counter_16__i16 (.D(n133[16]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[16])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i16.GSR = "ENABLED";
    FD1S3IX counter_16__i15 (.D(n133[15]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[15])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i15.GSR = "ENABLED";
    FD1S3IX counter_16__i14 (.D(n133[14]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[14])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i14.GSR = "ENABLED";
    FD1S3IX counter_16__i13 (.D(n133[13]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[13])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i13.GSR = "ENABLED";
    FD1S3IX counter_16__i12 (.D(n133[12]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[12])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i12.GSR = "ENABLED";
    FD1S3IX counter_16__i11 (.D(n133[11]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[11])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i11.GSR = "ENABLED";
    FD1S3IX counter_16__i10 (.D(n133[10]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[10])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i10.GSR = "ENABLED";
    FD1S3IX counter_16__i9 (.D(n133[9]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[9])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i9.GSR = "ENABLED";
    FD1S3IX counter_16__i8 (.D(n133[8]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[8])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i8.GSR = "ENABLED";
    FD1S3IX counter_16__i7 (.D(n133[7]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[7])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i7.GSR = "ENABLED";
    FD1S3IX counter_16__i6 (.D(n133[6]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[6])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i6.GSR = "ENABLED";
    FD1S3IX counter_16__i5 (.D(n133[5]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[5])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i5.GSR = "ENABLED";
    FD1S3IX counter_16__i4 (.D(n133[4]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[4])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i4.GSR = "ENABLED";
    FD1S3IX counter_16__i3 (.D(n133[3]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[3])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i3.GSR = "ENABLED";
    FD1S3IX counter_16__i2 (.D(n133[2]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[2])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i2.GSR = "ENABLED";
    FD1S3IX counter_16__i1 (.D(n133[1]), .CK(phy_clk125_c), .CD(n37), 
            .Q(counter[1])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16__i1.GSR = "ENABLED";
    CCU2C equal_169_29 (.A0(counter[18]), .B0(counter[17]), .C0(counter[26]), 
          .D0(counter[27]), .A1(counter[31]), .B1(counter[29]), .C1(counter[30]), 
          .D1(counter[6]), .CIN(n186), .COUT(n187));
    defparam equal_169_29.INIT0 = 16'h0001;
    defparam equal_169_29.INIT1 = 16'h0001;
    defparam equal_169_29.INJECT1_0 = "YES";
    defparam equal_169_29.INJECT1_1 = "YES";
    LUT4 i158_1_lut (.A(counter[23]), .Z(n171)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i158_1_lut.init = 16'h5555;
    LUT4 i152_1_lut (.A(counter[13]), .Z(n165)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i152_1_lut.init = 16'h5555;
    LUT4 i77_1_lut (.A(counter[4]), .Z(n90)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i77_1_lut.init = 16'h5555;
    LUT4 i146_1_lut (.A(counter[1]), .Z(n159)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i146_1_lut.init = 16'h5555;
    LUT4 i156_1_lut (.A(counter[15]), .Z(n169)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i156_1_lut.init = 16'h5555;
    LUT4 i162_1_lut (.A(counter[0]), .Z(n175)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i162_1_lut.init = 16'h5555;
    CCU2C equal_169_27 (.A0(n179), .B0(n90), .C0(counter[14]), .D0(counter[9]), 
          .A1(counter[8]), .B1(counter[12]), .C1(counter[5]), .D1(counter[22]), 
          .CIN(n185), .COUT(n186));
    defparam equal_169_27.INIT0 = 16'h0001;
    defparam equal_169_27.INIT1 = 16'h0001;
    defparam equal_169_27.INJECT1_0 = "YES";
    defparam equal_169_27.INJECT1_1 = "YES";
    LUT4 i153_1_lut (.A(counter[24]), .Z(n166)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i153_1_lut.init = 16'h5555;
    LUT4 i157_1_lut (.A(counter[11]), .Z(n170)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i157_1_lut.init = 16'h5555;
    LUT4 i1_2_lut (.A(blink_led), .B(n37), .Z(led_N_74)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i1_2_lut.init = 16'h6666;
    LUT4 i166_1_lut (.A(counter[21]), .Z(n179)) /* synthesis lut_function=(!(A)) */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam i166_1_lut.init = 16'h5555;
    CCU2C equal_169_0 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(n159), .B1(n169), .C1(n175), .D1(counter[28]), .COUT(n185));
    defparam equal_169_0.INIT0 = 16'h000F;
    defparam equal_169_0.INIT1 = 16'h0001;
    defparam equal_169_0.INJECT1_0 = "NO";
    defparam equal_169_0.INJECT1_1 = "YES";
    CCU2C counter_16_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[0]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .COUT(n70), .S1(n133[0]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/numeric_std.vhd(1241[12:13])
    defparam counter_16_add_4_1.INIT0 = 16'h0000;
    defparam counter_16_add_4_1.INIT1 = 16'h555f;
    defparam counter_16_add_4_1.INJECT1_0 = "NO";
    defparam counter_16_add_4_1.INJECT1_1 = "NO";
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

