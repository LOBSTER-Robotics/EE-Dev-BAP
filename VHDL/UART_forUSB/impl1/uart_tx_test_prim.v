// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Fri May 29 16:40:15 2026
//
// Verilog Description of module uart_tx_test
//

module uart_tx_test (Clk, Rst, n_Rst, Uart_Tx, Uart_Rx, leds);   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(5[8:20])
    input Clk;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(7[9:12])
    input Rst;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(8[9:12])
    output n_Rst;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(9[3:8])
    output Uart_Tx;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(11[9:16])
    input Uart_Rx;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(12[9:16])
    output [7:0]leds;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(7[9:12])
    
    wire GND_net, VCC_net, Rst_c, n_Rst_c, leds_c, Uart_Rx_c_0, 
        leds_c_2, leds_c_1, tx_valid;
    wire [7:0]tx_data;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(21[12:19])
    
    wire n596, n70, Clk_c_enable_1, n91, n131, n4, n67, n64, 
        n61, n58, n55, n52, n49, n46;
    wire [19:0]Count;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(63[12:17])
    
    wire n773, n772, n771, n770, n769, n768, n767, n766, n765, 
        n100, n764, n97, n94, n88, n85, n82, n79, n76, n73, 
        n1077;
    
    VHI i2 (.Z(VCC_net));
    FD1P3AX tx_data_i7 (.D(VCC_net), .SP(Clk_c_enable_1), .CK(Clk_c), 
            .Q(tx_data[7])) /* synthesis lse_init_val=0 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(81[9] 97[16])
    defparam tx_data_i7.GSR = "ENABLED";
    OB leds_pad_7 (.I(GND_net), .O(leds[7]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    OB Uart_Tx_pad (.I(leds_c), .O(Uart_Tx));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(11[9:16])
    FD1S3IX tx_valid_13 (.D(leds_c_1), .CK(Clk_c), .CD(Rst_c), .Q(tx_valid)) /* synthesis lse_init_val=0 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(81[9] 97[16])
    defparam tx_valid_13.GSR = "ENABLED";
    OB n_Rst_pad (.I(n_Rst_c), .O(n_Rst));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(9[3:8])
    LUT4 n131_bdd_3_lut_696 (.A(n131), .B(tx_valid), .C(leds_c_1), .Z(n1077)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam n131_bdd_3_lut_696.init = 16'h8080;
    \variable_clock_divider(32)  u_clk_div (.GND_net(GND_net), .VCC_net(VCC_net), 
            .leds_c_2(leds_c_2), .Clk_c(Clk_c), .Rst_c(Rst_c));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(65[14:48])
    LUT4 Rst_I_0_1_lut (.A(Rst_c), .Z(n_Rst_c)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(63[12:19])
    defparam Rst_I_0_1_lut.init = 16'h5555;
    LUT4 i82_2_lut (.A(leds_c_1), .B(Rst_c), .Z(Clk_c_enable_1)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(83[13] 96[20])
    defparam i82_2_lut.init = 16'h2222;
    CCU2C add_387_21 (.A0(Count[19]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n773), 
          .S0(n46));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_21.INIT0 = 16'haaa0;
    defparam add_387_21.INIT1 = 16'h0000;
    defparam add_387_21.INJECT1_0 = "NO";
    defparam add_387_21.INJECT1_1 = "NO";
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    CCU2C add_387_19 (.A0(n596), .B0(Count[19]), .C0(Count[17]), .D0(VCC_net), 
          .A1(Count[18]), .B1(n4), .C1(Count[17]), .D1(Count[19]), .CIN(n772), 
          .COUT(n773), .S0(n52), .S1(n49));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_19.INIT0 = 16'h7878;
    defparam add_387_19.INIT1 = 16'h56aa;
    defparam add_387_19.INJECT1_0 = "NO";
    defparam add_387_19.INJECT1_1 = "NO";
    CCU2C add_387_17 (.A0(Count[15]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(Count[16]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n771), .COUT(n772), .S0(n58), .S1(n55));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_17.INIT0 = 16'haaa0;
    defparam add_387_17.INIT1 = 16'haaa0;
    defparam add_387_17.INJECT1_0 = "NO";
    defparam add_387_17.INJECT1_1 = "NO";
    \olo_intf_uart(125000000.0,9600.0,8,"1","none")(1,1,1,4)  u_uart (.Clk_c(Clk_c), 
            .leds_c(leds_c), .Rst_c(Rst_c), .leds_c_1(leds_c_1), .tx_valid(tx_valid), 
            .n131(n131), .\tx_data[7] (tx_data[7]), .n1077(n1077), .Uart_Rx_c_0(Uart_Rx_c_0), 
            .\Count[17] (Count[17]), .\Count[18] (Count[18]), .n596(n596), 
            .\Count[12] (Count[12]), .\Count[15] (Count[15]), .\Count[14] (Count[14]), 
            .\Count[13] (Count[13]), .\Count[16] (Count[16]), .\Count[10] (Count[10]), 
            .\Count[9] (Count[9]), .\Count[11] (Count[11]), .\Count[8] (Count[8]), 
            .\Count[7] (Count[7]), .\Count[6] (Count[6]), .\Count[5] (Count[5]), 
            .\Count[1] (Count[1]), .\Count[2] (Count[2]), .\Count[3] (Count[3]), 
            .\Count[4] (Count[4]), .\Count[19] (Count[19]), .n4(n4), .n46(n46), 
            .n49(n49), .n52(n52), .n55(n55), .n58(n58), .n61(n61), 
            .n64(n64), .n67(n67), .n70(n70), .n73(n73), .n76(n76), 
            .n79(n79), .n82(n82), .n85(n85), .n88(n88), .n91(n91), 
            .n94(n94), .n97(n97), .n100(n100));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(36[14:39])
    CCU2C add_387_15 (.A0(Count[13]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(Count[14]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n770), .COUT(n771), .S0(n64), .S1(n61));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_15.INIT0 = 16'haaa0;
    defparam add_387_15.INIT1 = 16'haaa0;
    defparam add_387_15.INJECT1_0 = "NO";
    defparam add_387_15.INJECT1_1 = "NO";
    CCU2C add_387_13 (.A0(Count[11]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(Count[12]), .B1(n4), .C1(Count[17]), .D1(Count[19]), .CIN(n769), 
          .COUT(n770), .S0(n70), .S1(n67));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_13.INIT0 = 16'haaa0;
    defparam add_387_13.INIT1 = 16'h56aa;
    defparam add_387_13.INJECT1_0 = "NO";
    defparam add_387_13.INJECT1_1 = "NO";
    CCU2C add_387_11 (.A0(Count[9]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(Count[10]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n768), .COUT(n769), .S0(n76), .S1(n73));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_11.INIT0 = 16'haaa0;
    defparam add_387_11.INIT1 = 16'haaa0;
    defparam add_387_11.INJECT1_0 = "NO";
    defparam add_387_11.INJECT1_1 = "NO";
    CCU2C add_387_9 (.A0(Count[7]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(Count[8]), .B1(n4), .C1(Count[17]), .D1(Count[19]), .CIN(n767), 
          .COUT(n768), .S0(n82), .S1(n79));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_9.INIT0 = 16'haaa0;
    defparam add_387_9.INIT1 = 16'h56aa;
    defparam add_387_9.INJECT1_0 = "NO";
    defparam add_387_9.INJECT1_1 = "NO";
    CCU2C add_387_7 (.A0(n596), .B0(Count[19]), .C0(Count[5]), .D0(VCC_net), 
          .A1(Count[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), .CIN(n766), 
          .COUT(n767), .S0(n88), .S1(n85));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_7.INIT0 = 16'h8787;
    defparam add_387_7.INIT1 = 16'h555f;
    defparam add_387_7.INJECT1_0 = "NO";
    defparam add_387_7.INJECT1_1 = "NO";
    CCU2C add_387_5 (.A0(Count[3]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(Count[4]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), .CIN(n765), 
          .COUT(n766), .S0(n94), .S1(n91));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_5.INIT0 = 16'haaa0;
    defparam add_387_5.INIT1 = 16'haaa0;
    defparam add_387_5.INJECT1_0 = "NO";
    defparam add_387_5.INJECT1_1 = "NO";
    CCU2C add_387_3 (.A0(Count[1]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(n596), .B1(Count[19]), .C1(Count[2]), .D1(VCC_net), .CIN(n764), 
          .COUT(n765), .S0(n100), .S1(n97));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_3.INIT0 = 16'haaa0;
    defparam add_387_3.INIT1 = 16'h8787;
    defparam add_387_3.INJECT1_0 = "NO";
    defparam add_387_3.INJECT1_1 = "NO";
    CCU2C add_387_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(n596), .B1(Count[19]), .C1(GND_net), .D1(VCC_net), .COUT(n764));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam add_387_1.INIT0 = 16'h0000;
    defparam add_387_1.INIT1 = 16'h0008;
    defparam add_387_1.INJECT1_0 = "NO";
    defparam add_387_1.INJECT1_1 = "NO";
    GSR GSR_INST (.GSR(VCC_net));
    OB leds_pad_6 (.I(GND_net), .O(leds[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    OB leds_pad_5 (.I(GND_net), .O(leds[5]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    OB leds_pad_4 (.I(GND_net), .O(leds[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    OB leds_pad_3 (.I(GND_net), .O(leds[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    OB leds_pad_2 (.I(leds_c_2), .O(leds[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    OB leds_pad_1 (.I(leds_c_1), .O(leds[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    OB leds_pad_0 (.I(leds_c), .O(leds[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(13[3:7])
    IB Clk_pad (.I(Clk), .O(Clk_c));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(7[9:12])
    IB Rst_pad (.I(Rst), .O(Rst_c));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(8[9:12])
    IB Uart_Rx_pad (.I(Uart_Rx), .O(Uart_Rx_c_0));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(12[9:16])
    VLO i1 (.Z(GND_net));
    
endmodule
//
// Verilog Description of module \variable_clock_divider(32) 
//

module \variable_clock_divider(32)  (GND_net, VCC_net, leds_c_2, Clk_c, 
            Rst_c);
    input GND_net;
    input VCC_net;
    output leds_c_2;
    input Clk_c;
    input Rst_c;
    
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(7[9:12])
    
    wire n749;
    wire [31:0]counter;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(21[12:19])
    wire [31:0]n133;
    
    wire n750, clk_div_N_365, n751, n752, n748, n284, n956, n1010, 
        n897, n753, n754, n972, n755, n763, n762, n761, n760, 
        n759, n758, n757, n756, n964, n994, n996, n984, n1012, 
        n982, n966, n990, n50;
    
    CCU2C counter_179_add_4_5 (.A0(counter[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[4]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n749), .COUT(n750), .S0(n133[3]), .S1(n133[4]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_5.INIT0 = 16'haaa0;
    defparam counter_179_add_4_5.INIT1 = 16'haaa0;
    defparam counter_179_add_4_5.INJECT1_0 = "NO";
    defparam counter_179_add_4_5.INJECT1_1 = "NO";
    FD1S3IX clk_div_r_22 (.D(clk_div_N_365), .CK(Clk_c), .CD(Rst_c), .Q(leds_c_2)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=48, LSE_LLINE=65, LSE_RLINE=65 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(29[9] 47[16])
    defparam clk_div_r_22.GSR = "ENABLED";
    CCU2C counter_179_add_4_9 (.A0(counter[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[8]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n751), .COUT(n752), .S0(n133[7]), .S1(n133[8]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_9.INIT0 = 16'haaa0;
    defparam counter_179_add_4_9.INIT1 = 16'haaa0;
    defparam counter_179_add_4_9.INJECT1_0 = "NO";
    defparam counter_179_add_4_9.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[0]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .COUT(n748), .S1(n133[0]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_1.INIT0 = 16'h0000;
    defparam counter_179_add_4_1.INIT1 = 16'h555f;
    defparam counter_179_add_4_1.INJECT1_0 = "NO";
    defparam counter_179_add_4_1.INJECT1_1 = "NO";
    FD1S3IX counter_179__i31 (.D(n133[31]), .CK(Clk_c), .CD(n284), .Q(counter[31])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i31.GSR = "ENABLED";
    FD1S3IX counter_179__i30 (.D(n133[30]), .CK(Clk_c), .CD(n284), .Q(counter[30])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i30.GSR = "ENABLED";
    FD1S3IX counter_179__i29 (.D(n133[29]), .CK(Clk_c), .CD(n284), .Q(counter[29])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i29.GSR = "ENABLED";
    FD1S3IX counter_179__i28 (.D(n133[28]), .CK(Clk_c), .CD(n284), .Q(counter[28])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i28.GSR = "ENABLED";
    FD1S3IX counter_179__i27 (.D(n133[27]), .CK(Clk_c), .CD(n284), .Q(counter[27])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i27.GSR = "ENABLED";
    FD1S3IX counter_179__i26 (.D(n133[26]), .CK(Clk_c), .CD(n284), .Q(counter[26])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i26.GSR = "ENABLED";
    LUT4 i1_2_lut (.A(counter[23]), .B(counter[29]), .Z(n956)) /* synthesis lut_function=(A+(B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_2_lut.init = 16'heeee;
    FD1S3IX counter_179__i25 (.D(n133[25]), .CK(Clk_c), .CD(n284), .Q(counter[25])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i25.GSR = "ENABLED";
    FD1S3IX counter_179__i0 (.D(n133[0]), .CK(Clk_c), .CD(n284), .Q(counter[0])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i0.GSR = "ENABLED";
    FD1S3IX counter_179__i24 (.D(n133[24]), .CK(Clk_c), .CD(n284), .Q(counter[24])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i24.GSR = "ENABLED";
    CCU2C counter_179_add_4_3 (.A0(counter[1]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n748), .COUT(n749), .S0(n133[1]), .S1(n133[2]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_3.INIT0 = 16'haaa0;
    defparam counter_179_add_4_3.INIT1 = 16'haaa0;
    defparam counter_179_add_4_3.INJECT1_0 = "NO";
    defparam counter_179_add_4_3.INJECT1_1 = "NO";
    FD1S3IX counter_179__i23 (.D(n133[23]), .CK(Clk_c), .CD(n284), .Q(counter[23])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i23.GSR = "ENABLED";
    FD1S3IX counter_179__i22 (.D(n133[22]), .CK(Clk_c), .CD(n284), .Q(counter[22])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i22.GSR = "ENABLED";
    FD1S3IX counter_179__i21 (.D(n133[21]), .CK(Clk_c), .CD(n284), .Q(counter[21])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i21.GSR = "ENABLED";
    FD1S3IX counter_179__i20 (.D(n133[20]), .CK(Clk_c), .CD(n284), .Q(counter[20])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i20.GSR = "ENABLED";
    FD1S3IX counter_179__i19 (.D(n133[19]), .CK(Clk_c), .CD(n284), .Q(counter[19])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i19.GSR = "ENABLED";
    FD1S3IX counter_179__i18 (.D(n133[18]), .CK(Clk_c), .CD(n284), .Q(counter[18])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i18.GSR = "ENABLED";
    FD1S3IX counter_179__i17 (.D(n133[17]), .CK(Clk_c), .CD(n284), .Q(counter[17])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i17.GSR = "ENABLED";
    FD1S3IX counter_179__i16 (.D(n133[16]), .CK(Clk_c), .CD(n284), .Q(counter[16])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i16.GSR = "ENABLED";
    FD1S3IX counter_179__i15 (.D(n133[15]), .CK(Clk_c), .CD(n284), .Q(counter[15])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i15.GSR = "ENABLED";
    FD1S3IX counter_179__i14 (.D(n133[14]), .CK(Clk_c), .CD(n284), .Q(counter[14])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i14.GSR = "ENABLED";
    FD1S3IX counter_179__i13 (.D(n133[13]), .CK(Clk_c), .CD(n284), .Q(counter[13])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i13.GSR = "ENABLED";
    FD1S3IX counter_179__i12 (.D(n133[12]), .CK(Clk_c), .CD(n284), .Q(counter[12])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i12.GSR = "ENABLED";
    FD1S3IX counter_179__i11 (.D(n133[11]), .CK(Clk_c), .CD(n284), .Q(counter[11])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i11.GSR = "ENABLED";
    FD1S3IX counter_179__i10 (.D(n133[10]), .CK(Clk_c), .CD(n284), .Q(counter[10])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i10.GSR = "ENABLED";
    FD1S3IX counter_179__i9 (.D(n133[9]), .CK(Clk_c), .CD(n284), .Q(counter[9])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i9.GSR = "ENABLED";
    FD1S3IX counter_179__i8 (.D(n133[8]), .CK(Clk_c), .CD(n284), .Q(counter[8])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i8.GSR = "ENABLED";
    FD1S3IX counter_179__i7 (.D(n133[7]), .CK(Clk_c), .CD(n284), .Q(counter[7])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i7.GSR = "ENABLED";
    FD1S3IX counter_179__i6 (.D(n133[6]), .CK(Clk_c), .CD(n284), .Q(counter[6])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i6.GSR = "ENABLED";
    FD1S3IX counter_179__i5 (.D(n133[5]), .CK(Clk_c), .CD(n284), .Q(counter[5])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i5.GSR = "ENABLED";
    FD1S3IX counter_179__i4 (.D(n133[4]), .CK(Clk_c), .CD(n284), .Q(counter[4])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i4.GSR = "ENABLED";
    FD1S3IX counter_179__i3 (.D(n133[3]), .CK(Clk_c), .CD(n284), .Q(counter[3])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i3.GSR = "ENABLED";
    FD1S3IX counter_179__i2 (.D(n133[2]), .CK(Clk_c), .CD(n284), .Q(counter[2])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i2.GSR = "ENABLED";
    FD1S3IX counter_179__i1 (.D(n133[1]), .CK(Clk_c), .CD(n284), .Q(counter[1])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179__i1.GSR = "ENABLED";
    LUT4 i1_4_lut (.A(counter[6]), .B(counter[20]), .C(counter[28]), .D(counter[11]), 
         .Z(n1010)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut.init = 16'hfffe;
    LUT4 i119_2_lut (.A(n897), .B(Rst_c), .Z(n284)) /* synthesis lut_function=((B)+!A) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(30[13] 46[20])
    defparam i119_2_lut.init = 16'hdddd;
    CCU2C counter_179_add_4_13 (.A0(counter[11]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n753), .COUT(n754), .S0(n133[11]), .S1(n133[12]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_13.INIT0 = 16'haaa0;
    defparam counter_179_add_4_13.INIT1 = 16'haaa0;
    defparam counter_179_add_4_13.INJECT1_0 = "NO";
    defparam counter_179_add_4_13.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_7 (.A0(counter[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[6]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n750), .COUT(n751), .S0(n133[5]), .S1(n133[6]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_7.INIT0 = 16'haaa0;
    defparam counter_179_add_4_7.INIT1 = 16'haaa0;
    defparam counter_179_add_4_7.INJECT1_0 = "NO";
    defparam counter_179_add_4_7.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_11 (.A0(counter[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[10]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n752), .COUT(n753), .S0(n133[9]), .S1(n133[10]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_11.INIT0 = 16'haaa0;
    defparam counter_179_add_4_11.INIT1 = 16'haaa0;
    defparam counter_179_add_4_11.INJECT1_0 = "NO";
    defparam counter_179_add_4_11.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_13 (.A(counter[16]), .B(counter[21]), .Z(n972)) /* synthesis lut_function=(A+(B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_2_lut_adj_13.init = 16'heeee;
    CCU2C counter_179_add_4_15 (.A0(counter[13]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n754), .COUT(n755), .S0(n133[13]), .S1(n133[14]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_15.INIT0 = 16'haaa0;
    defparam counter_179_add_4_15.INIT1 = 16'haaa0;
    defparam counter_179_add_4_15.INJECT1_0 = "NO";
    defparam counter_179_add_4_15.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_33 (.A0(counter[31]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n763), .S0(n133[31]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_33.INIT0 = 16'haaa0;
    defparam counter_179_add_4_33.INIT1 = 16'h0000;
    defparam counter_179_add_4_33.INJECT1_0 = "NO";
    defparam counter_179_add_4_33.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_31 (.A0(counter[29]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[30]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n762), .COUT(n763), .S0(n133[29]), .S1(n133[30]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_31.INIT0 = 16'haaa0;
    defparam counter_179_add_4_31.INIT1 = 16'haaa0;
    defparam counter_179_add_4_31.INJECT1_0 = "NO";
    defparam counter_179_add_4_31.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_29 (.A0(counter[27]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[28]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n761), .COUT(n762), .S0(n133[27]), .S1(n133[28]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_29.INIT0 = 16'haaa0;
    defparam counter_179_add_4_29.INIT1 = 16'haaa0;
    defparam counter_179_add_4_29.INJECT1_0 = "NO";
    defparam counter_179_add_4_29.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_27 (.A0(counter[25]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[26]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n760), .COUT(n761), .S0(n133[25]), .S1(n133[26]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_27.INIT0 = 16'haaa0;
    defparam counter_179_add_4_27.INIT1 = 16'haaa0;
    defparam counter_179_add_4_27.INJECT1_0 = "NO";
    defparam counter_179_add_4_27.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_25 (.A0(counter[23]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[24]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n759), .COUT(n760), .S0(n133[23]), .S1(n133[24]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_25.INIT0 = 16'haaa0;
    defparam counter_179_add_4_25.INIT1 = 16'haaa0;
    defparam counter_179_add_4_25.INJECT1_0 = "NO";
    defparam counter_179_add_4_25.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_23 (.A0(counter[21]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[22]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n758), .COUT(n759), .S0(n133[21]), .S1(n133[22]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_23.INIT0 = 16'haaa0;
    defparam counter_179_add_4_23.INIT1 = 16'haaa0;
    defparam counter_179_add_4_23.INJECT1_0 = "NO";
    defparam counter_179_add_4_23.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_21 (.A0(counter[19]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[20]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n757), .COUT(n758), .S0(n133[19]), .S1(n133[20]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_21.INIT0 = 16'haaa0;
    defparam counter_179_add_4_21.INIT1 = 16'haaa0;
    defparam counter_179_add_4_21.INJECT1_0 = "NO";
    defparam counter_179_add_4_21.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_19 (.A0(counter[17]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[18]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n756), .COUT(n757), .S0(n133[17]), .S1(n133[18]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_19.INIT0 = 16'haaa0;
    defparam counter_179_add_4_19.INIT1 = 16'haaa0;
    defparam counter_179_add_4_19.INJECT1_0 = "NO";
    defparam counter_179_add_4_19.INJECT1_1 = "NO";
    CCU2C counter_179_add_4_17 (.A0(counter[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(counter[16]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n755), .COUT(n756), .S0(n133[15]), .S1(n133[16]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam counter_179_add_4_17.INIT0 = 16'haaa0;
    defparam counter_179_add_4_17.INIT1 = 16'haaa0;
    defparam counter_179_add_4_17.INJECT1_0 = "NO";
    defparam counter_179_add_4_17.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_14 (.A(leds_c_2), .B(n897), .Z(clk_div_N_365)) /* synthesis lut_function=(A (B)+!A !(B)) */ ;
    defparam i1_2_lut_adj_14.init = 16'h9999;
    LUT4 i1_2_lut_adj_15 (.A(counter[17]), .B(counter[18]), .Z(n964)) /* synthesis lut_function=(A+(B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_2_lut_adj_15.init = 16'heeee;
    LUT4 i1_4_lut_adj_16 (.A(n994), .B(n996), .C(n984), .D(n1012), .Z(n897)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut_adj_16.init = 16'hfffe;
    LUT4 i1_4_lut_adj_17 (.A(counter[4]), .B(n982), .C(counter[8]), .D(counter[0]), 
         .Z(n994)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut_adj_17.init = 16'hfffd;
    LUT4 i1_4_lut_adj_18 (.A(n966), .B(n990), .C(counter[3]), .D(n964), 
         .Z(n996)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut_adj_18.init = 16'hffef;
    LUT4 i1_4_lut_adj_19 (.A(counter[25]), .B(counter[12]), .C(counter[26]), 
         .D(counter[24]), .Z(n984)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut_adj_19.init = 16'hfffe;
    LUT4 i1_4_lut_adj_20 (.A(counter[2]), .B(n1010), .C(n972), .D(counter[9]), 
         .Z(n1012)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut_adj_20.init = 16'hfffe;
    LUT4 i1_4_lut_adj_21 (.A(counter[27]), .B(counter[5]), .C(counter[30]), 
         .D(counter[31]), .Z(n982)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut_adj_21.init = 16'hfffe;
    LUT4 i1_2_lut_adj_22 (.A(counter[1]), .B(counter[10]), .Z(n966)) /* synthesis lut_function=(A+(B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_2_lut_adj_22.init = 16'heeee;
    LUT4 i1_4_lut_adj_23 (.A(counter[13]), .B(n50), .C(n956), .D(counter[15]), 
         .Z(n990)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut_adj_23.init = 16'hfffe;
    LUT4 i1_4_lut_adj_24 (.A(counter[22]), .B(counter[14]), .C(counter[7]), 
         .D(counter[19]), .Z(n50)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/counter.vhd(39[23:51])
    defparam i1_4_lut_adj_24.init = 16'hfffe;
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module \olo_intf_uart(125000000.0,9600.0,8,"1","none")(1,1,1,4) 
//

module \olo_intf_uart(125000000.0,9600.0,8,"1","none")(1,1,1,4)  (Clk_c, leds_c, 
            Rst_c, leds_c_1, tx_valid, n131, \tx_data[7] , n1077, 
            Uart_Rx_c_0, \Count[17] , \Count[18] , n596, \Count[12] , 
            \Count[15] , \Count[14] , \Count[13] , \Count[16] , \Count[10] , 
            \Count[9] , \Count[11] , \Count[8] , \Count[7] , \Count[6] , 
            \Count[5] , \Count[1] , \Count[2] , \Count[3] , \Count[4] , 
            \Count[19] , n4, n46, n49, n52, n55, n58, n61, n64, 
            n67, n70, n73, n76, n79, n82, n85, n88, n91, n94, 
            n97, n100);
    input Clk_c;
    output leds_c;
    input Rst_c;
    output leds_c_1;
    input tx_valid;
    output n131;
    input \tx_data[7] ;
    input n1077;
    input Uart_Rx_c_0;
    output \Count[17] ;
    output \Count[18] ;
    output n596;
    output \Count[12] ;
    output \Count[15] ;
    output \Count[14] ;
    output \Count[13] ;
    output \Count[16] ;
    output \Count[10] ;
    output \Count[9] ;
    output \Count[11] ;
    output \Count[8] ;
    output \Count[7] ;
    output \Count[6] ;
    output \Count[5] ;
    output \Count[1] ;
    output \Count[2] ;
    output \Count[3] ;
    output \Count[4] ;
    output \Count[19] ;
    output n4;
    input n46;
    input n49;
    input n52;
    input n55;
    input n58;
    input n61;
    input n64;
    input n67;
    input n70;
    input n73;
    input n76;
    input n79;
    input n82;
    input n85;
    input n88;
    input n91;
    input n94;
    input n97;
    input n100;
    
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(7[9:12])
    
    wire n1097;
    wire [4:0]\r.TxCount ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    
    wire n940, Clk_c_enable_16, n626;
    wire [4:0]n25;
    
    wire n262, n1100;
    wire [3:0]n128;
    
    wire n585;
    wire [9:0]\r.TxShiftReg ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    
    wire Clk_c_enable_15, n628, n616, n902, n1096, TxStrobe, n1102, 
        n1101, \r.TxSyncLast , \r.TxSync , n954, n265;
    wire [8:0]n422;
    
    wire n950, n901, Clk_c_enable_11, n1103, n9, n573, n504, n1095, 
        n126, n575, n1, n1099, n1098, n12, n946;
    
    LUT4 i1_2_lut_3_lut (.A(n1097), .B(\r.TxCount [4]), .C(\r.TxCount [0]), 
         .Z(n940)) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;
    defparam i1_2_lut_3_lut.init = 16'hb0b0;
    FD1P3IX \r.TxCount_178__i1  (.D(n25[1]), .SP(Clk_c_enable_16), .CD(n626), 
            .CK(Clk_c), .Q(\r.TxCount [1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_178__i1 .GSR = "ENABLED";
    LUT4 i263_3_lut (.A(n262), .B(n1100), .C(n128[2]), .Z(n585)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i263_3_lut.init = 16'hcaca;
    FD1P3IX \r.TxCount_178__i2  (.D(n25[2]), .SP(Clk_c_enable_16), .CD(n626), 
            .CK(Clk_c), .Q(\r.TxCount [2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_178__i2 .GSR = "ENABLED";
    FD1P3IX \r.TxCount_178__i3  (.D(n25[3]), .SP(Clk_c_enable_16), .CD(n626), 
            .CK(Clk_c), .Q(\r.TxCount [3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_178__i3 .GSR = "ENABLED";
    FD1P3IX \r.TxCount_178__i4  (.D(n25[4]), .SP(Clk_c_enable_16), .CD(n626), 
            .CK(Clk_c), .Q(\r.TxCount [4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_178__i4 .GSR = "ENABLED";
    FD1P3IX \r.TxShiftReg__i2  (.D(\r.TxShiftReg [2]), .SP(Clk_c_enable_15), 
            .CD(n628), .CK(Clk_c), .Q(\r.TxShiftReg [1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i2 .GSR = "ENABLED";
    FD1S3JX \r.Uart_Tx_130  (.D(\r.TxShiftReg [0]), .CK(Clk_c), .PD(n616), 
            .Q(leds_c)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.Uart_Tx_130 .GSR = "ENABLED";
    FD1S3AX \r.StateTx_FSM_i0  (.D(Rst_c), .CK(Clk_c), .Q(n128[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i0 .GSR = "ENABLED";
    FD1P3IX \r.TxShiftReg__i3  (.D(\r.TxShiftReg [3]), .SP(Clk_c_enable_15), 
            .CD(n628), .CK(Clk_c), .Q(\r.TxShiftReg [2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i3 .GSR = "ENABLED";
    FD1P3IX \r.TxShiftReg__i5  (.D(\r.TxShiftReg [5]), .SP(Clk_c_enable_15), 
            .CD(n628), .CK(Clk_c), .Q(\r.TxShiftReg [4])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i5 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i9  (.D(n902), .SP(Clk_c_enable_15), .CK(Clk_c), 
            .Q(\r.TxShiftReg [8])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i9 .GSR = "ENABLED";
    LUT4 n1082_bdd_2_lut_then_3_lut (.A(n1096), .B(Rst_c), .C(TxStrobe), 
         .Z(n1102)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam n1082_bdd_2_lut_then_3_lut.init = 16'h1010;
    LUT4 n1082_bdd_2_lut_else_3_lut (.A(Rst_c), .B(leds_c_1), .C(tx_valid), 
         .D(n131), .Z(n1101)) /* synthesis lut_function=(!(A+(B (C (D))+!B (D)))) */ ;
    defparam n1082_bdd_2_lut_else_3_lut.init = 16'h0455;
    LUT4 i1_2_lut_4_lut (.A(\r.TxSyncLast ), .B(\r.TxSync ), .C(TxStrobe), 
         .D(n128[2]), .Z(n954)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i1_2_lut_4_lut.init = 16'h1000;
    LUT4 mux_149_i8_3_lut_4_lut (.A(tx_valid), .B(leds_c_1), .C(n265), 
         .D(\r.TxShiftReg [8]), .Z(n422[7])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(191[23:58])
    defparam mux_149_i8_3_lut_4_lut.init = 16'hf808;
    LUT4 i1_4_lut_4_lut (.A(n1096), .B(n128[3]), .C(TxStrobe), .D(n950), 
         .Z(n901)) /* synthesis lut_function=(A (D)+!A (B (C+(D))+!B (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(218[24:53])
    defparam i1_4_lut_4_lut.init = 16'hff40;
    LUT4 i1_3_lut_rep_13 (.A(n1097), .B(\r.TxCount [0]), .C(\r.TxCount [4]), 
         .Z(n1096)) /* synthesis lut_function=(A+((C)+!B)) */ ;
    defparam i1_3_lut_rep_13.init = 16'hfbfb;
    FD1P3IX \r.TxShiftReg__i1  (.D(\r.TxShiftReg [1]), .SP(Clk_c_enable_15), 
            .CD(n628), .CK(Clk_c), .Q(\r.TxShiftReg [0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i1 .GSR = "ENABLED";
    FD1P3AX \r.Tx_Ready_126  (.D(n1103), .SP(Clk_c_enable_11), .CK(Clk_c), 
            .Q(leds_c_1)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.Tx_Ready_126 .GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut_adj_11 (.A(n1097), .B(\r.TxCount [4]), .C(\r.TxCount [0]), 
         .Z(n9)) /* synthesis lut_function=(A+!(B (C))) */ ;
    defparam i1_2_lut_3_lut_adj_11.init = 16'hbfbf;
    FD1P3AX \r.TxShiftReg__i8  (.D(n422[7]), .SP(Clk_c_enable_15), .CK(Clk_c), 
            .Q(\r.TxShiftReg [7])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i8 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i7  (.D(n422[6]), .SP(Clk_c_enable_15), .CK(Clk_c), 
            .Q(\r.TxShiftReg [6])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i7 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i6  (.D(n422[5]), .SP(Clk_c_enable_15), .CK(Clk_c), 
            .Q(\r.TxShiftReg [5])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i6 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i4  (.D(n422[3]), .SP(Clk_c_enable_15), .CK(Clk_c), 
            .Q(\r.TxShiftReg [3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i4 .GSR = "ENABLED";
    FD1S3IX \r.StateTx_FSM_i3  (.D(n573), .CK(Clk_c), .CD(Rst_c), .Q(n128[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i3 .GSR = "ENABLED";
    LUT4 i153_4_lut (.A(n131), .B(n940), .C(n128[2]), .D(n1100), .Z(n504)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i153_4_lut.init = 16'hca0a;
    LUT4 i1_4_lut (.A(n1095), .B(n1100), .C(n128[2]), .D(\r.TxCount [0]), 
         .Z(n265)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(200[17] 212[24])
    defparam i1_4_lut.init = 16'h8000;
    LUT4 i297_1_lut (.A(n128[2]), .Z(n616)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i297_1_lut.init = 16'h5555;
    LUT4 i372_2_lut_3_lut_4_lut (.A(tx_valid), .B(leds_c_1), .C(n504), 
         .D(n265), .Z(Clk_c_enable_15)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (C (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(191[23:58])
    defparam i372_2_lut_3_lut_4_lut.init = 16'hf080;
    LUT4 i685_4_lut (.A(Rst_c), .B(n128[2]), .C(n126), .D(n128[3]), 
         .Z(Clk_c_enable_11)) /* synthesis lut_function=(A+!(B (C+!(D))+!B (C (D)))) */ ;
    defparam i685_4_lut.init = 16'hafbb;
    LUT4 i255_4_lut (.A(n128[3]), .B(n954), .C(n126), .D(n9), .Z(n573)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))+!A !((D)+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i255_4_lut.init = 16'ha0ec;
    LUT4 i257_4_lut (.A(n128[2]), .B(n262), .C(n1100), .D(n9), .Z(n575)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i257_4_lut.init = 16'heece;
    LUT4 i1_3_lut (.A(TxStrobe), .B(leds_c_1), .C(n131), .Z(n262)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(187[20:55])
    defparam i1_3_lut.init = 16'h2020;
    LUT4 i219_1_lut (.A(\r.TxCount [0]), .Z(n1)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(202[24:54])
    defparam i219_1_lut.init = 16'h5555;
    FD1S3IX \r.StateTx_FSM_i2  (.D(n575), .CK(Clk_c), .CD(Rst_c), .Q(n128[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i2 .GSR = "ENABLED";
    FD1S3IX \r.StateTx_FSM_i1  (.D(n901), .CK(Clk_c), .CD(Rst_c), .Q(n131));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i1 .GSR = "ENABLED";
    LUT4 mux_149_i6_3_lut_4_lut (.A(tx_valid), .B(leds_c_1), .C(n265), 
         .D(\r.TxShiftReg [6]), .Z(n422[5])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(191[23:58])
    defparam mux_149_i6_3_lut_4_lut.init = 16'hf808;
    LUT4 mux_149_i7_3_lut_4_lut (.A(n1099), .B(\tx_data[7] ), .C(n265), 
         .D(\r.TxShiftReg [7]), .Z(n422[6])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_149_i7_3_lut_4_lut.init = 16'hf808;
    LUT4 mux_149_i4_3_lut_4_lut (.A(tx_valid), .B(leds_c_1), .C(n265), 
         .D(\r.TxShiftReg [4]), .Z(n422[3])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(191[23:58])
    defparam mux_149_i4_3_lut_4_lut.init = 16'hf808;
    LUT4 i37_2_lut_4_lut (.A(n1097), .B(\r.TxCount [0]), .C(\r.TxCount [4]), 
         .D(TxStrobe), .Z(n126)) /* synthesis lut_function=(A+((C+!(D))+!B)) */ ;
    defparam i37_2_lut_4_lut.init = 16'hfbff;
    LUT4 i1_3_lut_rep_17 (.A(\r.TxSyncLast ), .B(\r.TxSync ), .C(TxStrobe), 
         .Z(n1100)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_3_lut_rep_17.init = 16'h1010;
    LUT4 n9_bdd_4_lut (.A(n1096), .B(TxStrobe), .C(n585), .D(n128[3]), 
         .Z(Clk_c_enable_16)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)) */ ;
    defparam n9_bdd_4_lut.init = 16'h88f0;
    FD1S3AX \r.TxSync_127  (.D(n1077), .CK(Clk_c), .Q(\r.TxSync )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxSync_127 .GSR = "ENABLED";
    LUT4 i419_3_lut_4_lut (.A(\r.TxCount [2]), .B(n1098), .C(\r.TxCount [3]), 
         .D(\r.TxCount [4]), .Z(n25[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i419_3_lut_4_lut.init = 16'h7f80;
    FD1P3IX \r.TxCount_178__i0  (.D(n1), .SP(Clk_c_enable_16), .CD(n626), 
            .CK(Clk_c), .Q(\r.TxCount [0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_178__i0 .GSR = "ENABLED";
    LUT4 i1_3_lut_rep_14 (.A(\r.TxCount [1]), .B(\r.TxCount [2]), .C(\r.TxCount [3]), 
         .Z(n1097)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_rep_14.init = 16'hfefe;
    LUT4 i401_2_lut_rep_15 (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .Z(n1098)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i401_2_lut_rep_15.init = 16'h8888;
    LUT4 i405_2_lut_3_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .C(\r.TxCount [2]), 
         .Z(n25[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i405_2_lut_3_lut.init = 16'h7878;
    LUT4 i1_2_lut_rep_12_4_lut (.A(\r.TxCount [1]), .B(\r.TxCount [2]), 
         .C(\r.TxCount [3]), .D(\r.TxCount [4]), .Z(n1095)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;
    defparam i1_2_lut_rep_12_4_lut.init = 16'hfeff;
    LUT4 i412_2_lut_3_lut_4_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), 
         .C(\r.TxCount [3]), .D(\r.TxCount [2]), .Z(n25[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i412_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i1_3_lut_4_lut (.A(leds_c_1), .B(TxStrobe), .C(n128[0]), .D(n131), 
         .Z(n950)) /* synthesis lut_function=(A (C+(D))+!A (B (C)+!B (C+(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(187[20:55])
    defparam i1_3_lut_4_lut.init = 16'hfbf0;
    LUT4 i683_3_lut (.A(Clk_c_enable_16), .B(TxStrobe), .C(n12), .Z(n626)) /* synthesis lut_function=(!((B (C))+!A)) */ ;
    defparam i683_3_lut.init = 16'h2a2a;
    LUT4 i1_2_lut_rep_16 (.A(tx_valid), .B(leds_c_1), .Z(n1099)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(191[23:58])
    defparam i1_2_lut_rep_16.init = 16'h8888;
    LUT4 i1_3_lut_adj_12 (.A(\r.TxSyncLast ), .B(\r.TxSync ), .C(n128[2]), 
         .Z(n946)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_3_lut_adj_12.init = 16'h1010;
    LUT4 i25_4_lut (.A(n946), .B(n1096), .C(n128[3]), .D(n9), .Z(n12)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;
    defparam i25_4_lut.init = 16'hcac0;
    LUT4 i398_2_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .Z(n25[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i398_2_lut.init = 16'h6666;
    LUT4 i1_2_lut_3_lut_4_lut (.A(tx_valid), .B(leds_c_1), .C(n265), .D(\tx_data[7] ), 
         .Z(n902)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(191[23:58])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i687_3_lut_3_lut_4_lut (.A(tx_valid), .B(leds_c_1), .C(n504), 
         .D(n265), .Z(n628)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(191[23:58])
    defparam i687_3_lut_3_lut_4_lut.init = 16'h0080;
    PFUMX i703 (.BLUT(n1101), .ALUT(n1102), .C0(n128[3]), .Z(n1103));
    \olo_intf_sync(1,'1',2)  i_sync (.Clk_c(Clk_c), .Rst_c(Rst_c), .Uart_Rx_c_0(Uart_Rx_c_0));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(431[14:39])
    \olo_base_strobe_gen(125000000.0,19200.0,true)  i_strb_tx (.\r.TxSyncLast (\r.TxSyncLast ), 
            .Clk_c(Clk_c), .Rst_c(Rst_c), .\r.TxSync (\r.TxSync ), .TxStrobe(TxStrobe), 
            .\Count[17] (\Count[17] ), .\Count[18] (\Count[18] ), .n596(n596), 
            .\Count[12] (\Count[12] ), .\Count[15] (\Count[15] ), .\Count[14] (\Count[14] ), 
            .\Count[13] (\Count[13] ), .\Count[16] (\Count[16] ), .\Count[10] (\Count[10] ), 
            .\Count[9] (\Count[9] ), .\Count[11] (\Count[11] ), .\Count[8] (\Count[8] ), 
            .\Count[7] (\Count[7] ), .\Count[6] (\Count[6] ), .\Count[5] (\Count[5] ), 
            .\Count[1] (\Count[1] ), .\Count[2] (\Count[2] ), .\Count[3] (\Count[3] ), 
            .\Count[4] (\Count[4] ), .\Count[19] (\Count[19] ), .n4(n4), 
            .n46(n46), .n49(n49), .n52(n52), .n55(n55), .n58(n58), 
            .n61(n61), .n64(n64), .n67(n67), .n70(n70), .n73(n73), 
            .n76(n76), .n79(n79), .n82(n82), .n85(n85), .n88(n88), 
            .n91(n91), .n94(n94), .n97(n97), .n100(n100));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(405[17:48])
    
endmodule
//
// Verilog Description of module \olo_intf_sync(1,'1',2) 
//

module \olo_intf_sync(1,'1',2)  (Clk_c, Rst_c, Uart_Rx_c_0);
    input Clk_c;
    input Rst_c;
    input Uart_Rx_c_0;
    
    wire [0:0]RegN_0__0__N_297 /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(136[12:21])
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(7[9:12])
    wire Reg0_0 /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(59[12:16])
    
    FD1S3JX \RegN_0[[0__12  (.D(Reg0_0), .CK(Clk_c), .PD(Rst_c), .Q(RegN_0__0__N_297[0])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=431, LSE_RLINE=431 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(91[9] 107[16])
    defparam \RegN_0[[0__12 .GSR = "ENABLED";
    FD1S3JX Reg0_0__11 (.D(Uart_Rx_c_0), .CK(Clk_c), .PD(Rst_c), .Q(Reg0_0)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=431, LSE_RLINE=431 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(91[9] 107[16])
    defparam Reg0_0__11.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module \olo_base_strobe_gen(125000000.0,19200.0,true) 
//

module \olo_base_strobe_gen(125000000.0,19200.0,true)  (\r.TxSyncLast , Clk_c, 
            Rst_c, \r.TxSync , TxStrobe, \Count[17] , \Count[18] , 
            n596, \Count[12] , \Count[15] , \Count[14] , \Count[13] , 
            \Count[16] , \Count[10] , \Count[9] , \Count[11] , \Count[8] , 
            \Count[7] , \Count[6] , \Count[5] , \Count[1] , \Count[2] , 
            \Count[3] , \Count[4] , \Count[19] , n4, n46, n49, n52, 
            n55, n58, n61, n64, n67, n70, n73, n76, n79, n82, 
            n85, n88, n91, n94, n97, n100);
    output \r.TxSyncLast ;
    input Clk_c;
    input Rst_c;
    input \r.TxSync ;
    output TxStrobe;
    output \Count[17] ;
    output \Count[18] ;
    output n596;
    output \Count[12] ;
    output \Count[15] ;
    output \Count[14] ;
    output \Count[13] ;
    output \Count[16] ;
    output \Count[10] ;
    output \Count[9] ;
    output \Count[11] ;
    output \Count[8] ;
    output \Count[7] ;
    output \Count[6] ;
    output \Count[5] ;
    output \Count[1] ;
    output \Count[2] ;
    output \Count[3] ;
    output \Count[4] ;
    output \Count[19] ;
    output n4;
    input n46;
    input n49;
    input n52;
    input n55;
    input n58;
    input n61;
    input n64;
    input n67;
    input n70;
    input n73;
    input n76;
    input n79;
    input n82;
    input n85;
    input n88;
    input n91;
    input n94;
    input n97;
    input n100;
    
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_send.vhd(7[9:12])
    
    wire Out_Valid_N_289, n780, n288, n916, n920, n18, n903, n906;
    
    FD1S3IX \r.TxSyncLast_128  (.D(\r.TxSync ), .CK(Clk_c), .CD(Rst_c), 
            .Q(\r.TxSyncLast )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=36, LSE_RLINE=36 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxSyncLast_128 .GSR = "ENABLED";
    FD1S3IX Out_Valid_25 (.D(Out_Valid_N_289), .CK(Clk_c), .CD(Rst_c), 
            .Q(TxStrobe)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Out_Valid_25.GSR = "ENABLED";
    LUT4 i1_3_lut (.A(\Count[17] ), .B(n780), .C(\Count[18] ), .Z(n596)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut.init = 16'hfefe;
    LUT4 i123_2_lut_3_lut (.A(\r.TxSync ), .B(\r.TxSyncLast ), .C(Rst_c), 
         .Z(n288)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam i123_2_lut_3_lut.init = 16'hf2f2;
    LUT4 i1_4_lut (.A(n916), .B(n920), .C(\Count[12] ), .D(n18), .Z(n780)) /* synthesis lut_function=(A (B (C+(D))+!B (C))) */ ;
    defparam i1_4_lut.init = 16'ha8a0;
    LUT4 i1_4_lut_adj_7 (.A(\Count[15] ), .B(\Count[14] ), .C(\Count[13] ), 
         .D(\Count[16] ), .Z(n916)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1_4_lut_adj_7.init = 16'h8000;
    LUT4 i1_3_lut_adj_8 (.A(\Count[10] ), .B(\Count[9] ), .C(\Count[11] ), 
         .Z(n920)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut_adj_8.init = 16'h8080;
    LUT4 i218_4_lut (.A(n903), .B(\Count[8] ), .C(\Count[7] ), .D(\Count[6] ), 
         .Z(n18)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i218_4_lut.init = 16'hfcec;
    LUT4 i1_4_lut_adj_9 (.A(\Count[5] ), .B(n906), .C(\Count[1] ), .D(\Count[2] ), 
         .Z(n903)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1_4_lut_adj_9.init = 16'h8000;
    LUT4 i1_2_lut (.A(\Count[3] ), .B(\Count[4] ), .Z(n906)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut.init = 16'h8888;
    LUT4 i346_3_lut_4_lut (.A(\r.TxSync ), .B(\r.TxSyncLast ), .C(\Count[19] ), 
         .D(n596), .Z(Out_Valid_N_289)) /* synthesis lut_function=(A ((C (D))+!B)+!A (C (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam i346_3_lut_4_lut.init = 16'hf222;
    LUT4 i1_2_lut_adj_10 (.A(n780), .B(\Count[18] ), .Z(n4)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_10.init = 16'heeee;
    FD1S3IX Count__i19 (.D(n46), .CK(Clk_c), .CD(n288), .Q(\Count[19] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i19.GSR = "ENABLED";
    FD1S3IX Count__i18 (.D(n49), .CK(Clk_c), .CD(n288), .Q(\Count[18] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i18.GSR = "ENABLED";
    FD1S3IX Count__i17 (.D(n52), .CK(Clk_c), .CD(n288), .Q(\Count[17] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i17.GSR = "ENABLED";
    FD1S3IX Count__i16 (.D(n55), .CK(Clk_c), .CD(n288), .Q(\Count[16] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i16.GSR = "ENABLED";
    FD1S3IX Count__i15 (.D(n58), .CK(Clk_c), .CD(n288), .Q(\Count[15] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i15.GSR = "ENABLED";
    FD1S3IX Count__i14 (.D(n61), .CK(Clk_c), .CD(n288), .Q(\Count[14] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i14.GSR = "ENABLED";
    FD1S3IX Count__i13 (.D(n64), .CK(Clk_c), .CD(n288), .Q(\Count[13] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i13.GSR = "ENABLED";
    FD1S3IX Count__i12 (.D(n67), .CK(Clk_c), .CD(n288), .Q(\Count[12] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i12.GSR = "ENABLED";
    FD1S3IX Count__i11 (.D(n70), .CK(Clk_c), .CD(n288), .Q(\Count[11] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i11.GSR = "ENABLED";
    FD1S3IX Count__i10 (.D(n73), .CK(Clk_c), .CD(n288), .Q(\Count[10] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i10.GSR = "ENABLED";
    FD1S3IX Count__i9 (.D(n76), .CK(Clk_c), .CD(n288), .Q(\Count[9] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i9.GSR = "ENABLED";
    FD1S3IX Count__i8 (.D(n79), .CK(Clk_c), .CD(n288), .Q(\Count[8] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i8.GSR = "ENABLED";
    FD1S3IX Count__i7 (.D(n82), .CK(Clk_c), .CD(n288), .Q(\Count[7] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i7.GSR = "ENABLED";
    FD1S3IX Count__i6 (.D(n85), .CK(Clk_c), .CD(n288), .Q(\Count[6] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i6.GSR = "ENABLED";
    FD1S3IX Count__i5 (.D(n88), .CK(Clk_c), .CD(n288), .Q(\Count[5] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i5.GSR = "ENABLED";
    FD1S3IX Count__i4 (.D(n91), .CK(Clk_c), .CD(n288), .Q(\Count[4] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i4.GSR = "ENABLED";
    FD1S3IX Count__i3 (.D(n94), .CK(Clk_c), .CD(n288), .Q(\Count[3] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i3.GSR = "ENABLED";
    FD1S3IX Count__i2 (.D(n97), .CK(Clk_c), .CD(n288), .Q(\Count[2] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i2.GSR = "ENABLED";
    FD1S3IX Count__i1 (.D(n100), .CK(Clk_c), .CD(n288), .Q(\Count[1] )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Count__i1.GSR = "ENABLED";
    
endmodule
