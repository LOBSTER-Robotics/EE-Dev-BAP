// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Thu May 28 12:19:00 2026
//
// Verilog Description of module top_tb_fpga
//

module top_tb_fpga (clk, rst, rgmii_txd, rgmii_txctl, rgmii_txc);   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(5[8:19])
    input clk;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    input rst;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(8[9:12])
    output [3:0]rgmii_txd;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(11[3:12])
    output rgmii_txctl;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(12[9:20])
    output rgmii_txc /* synthesis black_box_pad_pin=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(13[9:18])
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    
    wire GND_net, VCC_net, rst_c, fifo_empty, fifo_almostfull, next_fifo_almostfull_N_83, 
        next_fifo_almostfull;
    wire [7:0]cnt;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(27[9:12])
    wire [31:0]lenght_cnt;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(29[9:19])
    
    wire clk_c_enable_19, n4470, n4469, n4468;
    wire [7:0]next_cnt_7__N_9;
    
    wire n4467, n4466, n4465, n867;
    wire [31:0]frame_len;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(51[12:21])
    
    wire n165, n4464, n4463, n4462, n159, n399, n149, n164, 
        n163, n162, n161, n143, n6483, n6482, n160, n2447, n156, 
        n155, n154, n153, n152, n151, buf_clkout, buf_douto4, 
        buf_douto3, buf_douto2, buf_douto1, buf_douto0, n157, n158, 
        n145, n142, n141, n140, n139, n138, n137, n136, n135, 
        n134, n424, n148, n4493, n147, n4492, n4445, n146, n4444, 
        n4443, n4491, n4490, n4489, n4488, n144, n4442, n4487, 
        n4441, n4440, n4439, n4486, n23, n6475, n150, n4485, 
        n6470, n4484, n4438, n4483, n4437, n4482, n4481, n4480, 
        n4479, n4478, n4436, n4477, n4476, n4435, n4434, n4475, 
        n4433, n4474, n4473, n4472, n4471, n4432, n4431, clk_c_enable_16, 
        n6504, n6488;
    
    VHI i2 (.Z(VCC_net));
    LUT4 i277_1_lut (.A(rst_c), .Z(n867)) /* synthesis lut_function=(!(A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(8[9:12])
    defparam i277_1_lut.init = 16'h5555;
    FD1S3JX fifo_empty_25 (.D(next_fifo_almostfull_N_83), .CK(clk_c), .PD(rst_c), 
            .Q(fifo_empty));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam fifo_empty_25.GSR = "DISABLED";
    CCU2C lenght_cnt_456_add_4_13 (.A0(lenght_cnt[11]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4467), .COUT(n4468), .S0(n154), .S1(n153));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_13.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_13.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_13.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_13.INJECT1_1 = "NO";
    FD1S3IX cnt__i0 (.D(n23), .CK(clk_c), .CD(rst_c), .Q(cnt[0]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam cnt__i0.GSR = "DISABLED";
    LUT4 i506_2_lut_rep_96_3_lut_4_lut (.A(cnt[2]), .B(n6504), .C(cnt[4]), 
         .D(cnt[3]), .Z(n6470)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i506_2_lut_rep_96_3_lut_4_lut.init = 16'h8000;
    LUT4 i504_2_lut_3_lut_4_lut (.A(cnt[2]), .B(n6504), .C(cnt[4]), .D(cnt[3]), 
         .Z(next_cnt_7__N_9[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i504_2_lut_3_lut_4_lut.init = 16'h78f0;
    OB Inst2_OB (.I(buf_clkout), .O(rgmii_txc)) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/ddr_forrgmii.vhd(89[15:17])
    OB Inst1_OB4 (.I(buf_douto4), .O(rgmii_txctl)) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/ddr_forrgmii.vhd(92[16:18])
    OB Inst1_OB3 (.I(buf_douto3), .O(rgmii_txd[3])) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/ddr_forrgmii.vhd(95[16:18])
    OB Inst1_OB2 (.I(buf_douto2), .O(rgmii_txd[2])) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/ddr_forrgmii.vhd(98[16:18])
    OB Inst1_OB1 (.I(buf_douto1), .O(rgmii_txd[1])) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/ddr_forrgmii.vhd(101[16:18])
    OB Inst1_OB0 (.I(buf_douto0), .O(rgmii_txd[0])) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/ddr_forrgmii.vhd(104[16:18])
    top_ethernet_tx dut (.clk_c(clk_c), .rst_c(rst_c), .n6483(n6483), 
            .buf_douto3(buf_douto3), .buf_douto2(buf_douto2), .buf_douto1(buf_douto1), 
            .buf_douto0(buf_douto0), .GND_net(GND_net), .VCC_net(VCC_net), 
            .buf_clkout(buf_clkout), .buf_douto4(buf_douto4), .cnt({cnt}), 
            .fifo_almostfull(fifo_almostfull), .fifo_empty(fifo_empty), 
            .n424(n424), .\frame_len[3] (frame_len[3]), .\frame_len[4] (frame_len[4]), 
            .\frame_len[5] (frame_len[5]), .n6488(n6488), .\frame_len[1] (frame_len[1]), 
            .\frame_len[2] (frame_len[2]), .n399(n399), .clk_c_enable_19(clk_c_enable_19), 
            .\frame_len[31] (frame_len[31]), .\frame_len[29] (frame_len[29]), 
            .\frame_len[30] (frame_len[30]), .\frame_len[27] (frame_len[27]), 
            .\frame_len[28] (frame_len[28]), .\frame_len[25] (frame_len[25]), 
            .\frame_len[26] (frame_len[26]), .\frame_len[23] (frame_len[23]), 
            .\frame_len[24] (frame_len[24]), .\frame_len[21] (frame_len[21]), 
            .\frame_len[22] (frame_len[22]), .\frame_len[19] (frame_len[19]), 
            .\frame_len[20] (frame_len[20]), .\frame_len[17] (frame_len[17]), 
            .\frame_len[18] (frame_len[18]), .\frame_len[6] (frame_len[6]), 
            .\frame_len[7] (frame_len[7]), .\frame_len[8] (frame_len[8]), 
            .\frame_len[9] (frame_len[9]), .\frame_len[10] (frame_len[10]), 
            .\frame_len[11] (frame_len[11]), .\frame_len[12] (frame_len[12]), 
            .\frame_len[13] (frame_len[13]), .\frame_len[14] (frame_len[14]), 
            .\frame_len[15] (frame_len[15]), .\frame_len[16] (frame_len[16]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(32[7:34])
    LUT4 i464_2_lut_rep_77 (.A(next_fifo_almostfull), .B(rst_c), .Z(clk_c_enable_16)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i464_2_lut_rep_77.init = 16'heeee;
    CCU2C lenght_cnt_456_add_4_11 (.A0(lenght_cnt[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[10]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4466), .COUT(n4467), .S0(n156), .S1(n155));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_11.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_11.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_11.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_11.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_9 (.A0(lenght_cnt[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[8]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4465), .COUT(n4466), .S0(n158), .S1(n157));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_9.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_9.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_9.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_9.INJECT1_1 = "NO";
    FD1S3IX lenght_cnt_456__i0 (.D(n165), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[0])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i0.GSR = "DISABLED";
    CCU2C lenght_cnt_456_add_4_7 (.A0(lenght_cnt[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[6]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4464), .COUT(n4465), .S0(n160), .S1(n159));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_7.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_7.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_7.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_7.INJECT1_1 = "NO";
    GSR GSR_INST (.GSR(n867));
    LUT4 i790_2_lut_3_lut (.A(next_fifo_almostfull), .B(rst_c), .C(cnt[0]), 
         .Z(n23)) /* synthesis lut_function=(!(A (C)+!A (B (C)+!B !(C)))) */ ;
    defparam i790_2_lut_3_lut.init = 16'h1e1e;
    FD1S3IX fifo_almostfull_26 (.D(next_fifo_almostfull), .CK(clk_c), .CD(rst_c), 
            .Q(fifo_almostfull));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam fifo_almostfull_26.GSR = "DISABLED";
    CCU2C lenght_cnt_456_add_4_5 (.A0(lenght_cnt[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[4]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4463), .COUT(n4464), .S0(n162), .S1(n161));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_5.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_5.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_5.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_5.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_3 (.A0(lenght_cnt[1]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4462), .COUT(n4463), .S0(n164), .S1(n163));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_3.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_3.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_3.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_3.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(lenght_cnt[0]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .COUT(n4462), .S1(n165));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_1.INIT0 = 16'h0000;
    defparam lenght_cnt_456_add_4_1.INIT1 = 16'h555f;
    defparam lenght_cnt_456_add_4_1.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_1.INJECT1_1 = "NO";
    IB rst_pad (.I(rst), .O(rst_c));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(8[9:12])
    CCU2C _add_1_add_4_2 (.A0(frame_len[1]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .COUT(n4431));
    defparam _add_1_add_4_2.INIT0 = 16'h000a;
    defparam _add_1_add_4_2.INIT1 = 16'h555f;
    defparam _add_1_add_4_2.INJECT1_0 = "NO";
    defparam _add_1_add_4_2.INJECT1_1 = "NO";
    IB clk_pad (.I(clk), .O(clk_c));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    LUT4 i511_2_lut_3_lut_4_lut (.A(cnt[3]), .B(n6482), .C(cnt[5]), .D(cnt[4]), 
         .Z(next_cnt_7__N_9[5])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i511_2_lut_3_lut_4_lut.init = 16'h78f0;
    CCU2C _add_1_add_4_18 (.A0(frame_len[17]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[18]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4438), .COUT(n4439));
    defparam _add_1_add_4_18.INIT0 = 16'h555f;
    defparam _add_1_add_4_18.INIT1 = 16'h555f;
    defparam _add_1_add_4_18.INJECT1_0 = "NO";
    defparam _add_1_add_4_18.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_4 (.A0(frame_len[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[4]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4431), .COUT(n4432));
    defparam _add_1_add_4_4.INIT0 = 16'haaa0;
    defparam _add_1_add_4_4.INIT1 = 16'haaa0;
    defparam _add_1_add_4_4.INJECT1_0 = "NO";
    defparam _add_1_add_4_4.INJECT1_1 = "NO";
    LUT4 i1_4_lut (.A(rst_c), .B(n6483), .C(n6488), .D(n424), .Z(clk_c_enable_19)) /* synthesis lut_function=(A+!(B (C (D))+!B (C+!(D)))) */ ;
    defparam i1_4_lut.init = 16'hafee;
    CCU2C _add_1_add_4_16 (.A0(frame_len[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[16]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4437), .COUT(n4438));
    defparam _add_1_add_4_16.INIT0 = 16'h555f;
    defparam _add_1_add_4_16.INIT1 = 16'h555f;
    defparam _add_1_add_4_16.INJECT1_0 = "NO";
    defparam _add_1_add_4_16.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_14 (.A0(frame_len[13]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4436), .COUT(n4437));
    defparam _add_1_add_4_14.INIT0 = 16'h555f;
    defparam _add_1_add_4_14.INIT1 = 16'h555f;
    defparam _add_1_add_4_14.INJECT1_0 = "NO";
    defparam _add_1_add_4_14.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_12 (.A0(frame_len[11]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4435), .COUT(n4436));
    defparam _add_1_add_4_12.INIT0 = 16'h555f;
    defparam _add_1_add_4_12.INIT1 = 16'h555f;
    defparam _add_1_add_4_12.INJECT1_0 = "NO";
    defparam _add_1_add_4_12.INJECT1_1 = "NO";
    FD1P3IX cnt__i7 (.D(next_cnt_7__N_9[7]), .SP(clk_c_enable_16), .CD(rst_c), 
            .CK(clk_c), .Q(cnt[7]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam cnt__i7.GSR = "DISABLED";
    FD1P3IX cnt__i6 (.D(next_cnt_7__N_9[6]), .SP(clk_c_enable_16), .CD(rst_c), 
            .CK(clk_c), .Q(cnt[6]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam cnt__i6.GSR = "DISABLED";
    FD1P3IX cnt__i5 (.D(next_cnt_7__N_9[5]), .SP(clk_c_enable_16), .CD(rst_c), 
            .CK(clk_c), .Q(cnt[5]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam cnt__i5.GSR = "DISABLED";
    FD1P3IX cnt__i4 (.D(next_cnt_7__N_9[4]), .SP(clk_c_enable_16), .CD(rst_c), 
            .CK(clk_c), .Q(cnt[4]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam cnt__i4.GSR = "DISABLED";
    FD1P3IX cnt__i3 (.D(next_cnt_7__N_9[3]), .SP(clk_c_enable_16), .CD(rst_c), 
            .CK(clk_c), .Q(cnt[3]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam cnt__i3.GSR = "DISABLED";
    FD1P3IX cnt__i2 (.D(next_cnt_7__N_9[2]), .SP(clk_c_enable_16), .CD(rst_c), 
            .CK(clk_c), .Q(cnt[2]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam cnt__i2.GSR = "DISABLED";
    FD1P3IX cnt__i1 (.D(next_cnt_7__N_9[1]), .SP(clk_c_enable_16), .CD(rst_c), 
            .CK(clk_c), .Q(cnt[1]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(47[3] 63[10])
    defparam cnt__i1.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i1 (.D(n164), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[1])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i1.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i2 (.D(n163), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[2])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i2.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i3 (.D(n162), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[3])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i3.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i4 (.D(n161), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[4])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i4.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i5 (.D(n160), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[5])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i5.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i6 (.D(n159), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[6])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i6.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i7 (.D(n158), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[7])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i7.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i8 (.D(n157), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[8])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i8.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i9 (.D(n156), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[9])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i9.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i10 (.D(n155), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[10])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i10.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i11 (.D(n154), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[11])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i11.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i12 (.D(n153), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[12])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i12.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i13 (.D(n152), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[13])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i13.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i14 (.D(n151), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[14])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i14.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i15 (.D(n150), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[15])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i15.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i16 (.D(n149), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[16])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i16.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i17 (.D(n148), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[17])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i17.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i18 (.D(n147), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[18])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i18.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i19 (.D(n146), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[19])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i19.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i20 (.D(n145), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[20])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i20.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i21 (.D(n144), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[21])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i21.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i22 (.D(n143), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[22])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i22.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i23 (.D(n142), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[23])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i23.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i24 (.D(n141), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[24])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i24.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i25 (.D(n140), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[25])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i25.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i26 (.D(n139), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[26])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i26.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i27 (.D(n138), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[27])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i27.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i28 (.D(n137), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[28])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i28.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i29 (.D(n136), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[29])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i29.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i30 (.D(n135), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[30])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i30.GSR = "DISABLED";
    FD1S3IX lenght_cnt_456__i31 (.D(n134), .CK(clk_c), .CD(n2447), .Q(lenght_cnt[31])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456__i31.GSR = "DISABLED";
    CCU2C add_3294_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n4493), 
          .S0(next_fifo_almostfull));
    defparam add_3294_cout.INIT0 = 16'h0000;
    defparam add_3294_cout.INIT1 = 16'h0000;
    defparam add_3294_cout.INJECT1_0 = "NO";
    defparam add_3294_cout.INJECT1_1 = "NO";
    CCU2C add_3294_31 (.A0(lenght_cnt[30]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[31]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4492), .COUT(n4493));
    defparam add_3294_31.INIT0 = 16'h5555;
    defparam add_3294_31.INIT1 = 16'h555f;
    defparam add_3294_31.INJECT1_0 = "NO";
    defparam add_3294_31.INJECT1_1 = "NO";
    CCU2C add_3294_29 (.A0(lenght_cnt[28]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[29]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4491), .COUT(n4492));
    defparam add_3294_29.INIT0 = 16'h5555;
    defparam add_3294_29.INIT1 = 16'h5555;
    defparam add_3294_29.INJECT1_0 = "NO";
    defparam add_3294_29.INJECT1_1 = "NO";
    CCU2C add_3294_27 (.A0(lenght_cnt[26]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[27]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4490), .COUT(n4491));
    defparam add_3294_27.INIT0 = 16'h5555;
    defparam add_3294_27.INIT1 = 16'h5555;
    defparam add_3294_27.INJECT1_0 = "NO";
    defparam add_3294_27.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_10 (.A0(frame_len[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[10]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4434), .COUT(n4435));
    defparam _add_1_add_4_10.INIT0 = 16'h555f;
    defparam _add_1_add_4_10.INIT1 = 16'h555f;
    defparam _add_1_add_4_10.INJECT1_0 = "NO";
    defparam _add_1_add_4_10.INJECT1_1 = "NO";
    LUT4 i4800_2_lut (.A(next_fifo_almostfull), .B(rst_c), .Z(n2447)) /* synthesis lut_function=((B)+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(48[4] 62[11])
    defparam i4800_2_lut.init = 16'hdddd;
    CCU2C add_3294_25 (.A0(lenght_cnt[24]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[25]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4489), .COUT(n4490));
    defparam add_3294_25.INIT0 = 16'h5555;
    defparam add_3294_25.INIT1 = 16'h5555;
    defparam add_3294_25.INJECT1_0 = "NO";
    defparam add_3294_25.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_8 (.A0(frame_len[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[8]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4433), .COUT(n4434));
    defparam _add_1_add_4_8.INIT0 = 16'h555f;
    defparam _add_1_add_4_8.INIT1 = 16'h555f;
    defparam _add_1_add_4_8.INJECT1_0 = "NO";
    defparam _add_1_add_4_8.INJECT1_1 = "NO";
    LUT4 i485_2_lut_rep_130 (.A(cnt[1]), .B(cnt[0]), .Z(n6504)) /* synthesis lut_function=(A (B)) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i485_2_lut_rep_130.init = 16'h8888;
    CCU2C add_3294_23 (.A0(lenght_cnt[22]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[23]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4488), .COUT(n4489));
    defparam add_3294_23.INIT0 = 16'h5555;
    defparam add_3294_23.INIT1 = 16'h5555;
    defparam add_3294_23.INJECT1_0 = "NO";
    defparam add_3294_23.INJECT1_1 = "NO";
    CCU2C add_3294_21 (.A0(lenght_cnt[20]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[21]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4487), .COUT(n4488));
    defparam add_3294_21.INIT0 = 16'h5555;
    defparam add_3294_21.INIT1 = 16'h5555;
    defparam add_3294_21.INJECT1_0 = "NO";
    defparam add_3294_21.INJECT1_1 = "NO";
    LUT4 i492_2_lut_rep_108_3_lut (.A(cnt[1]), .B(cnt[0]), .C(cnt[2]), 
         .Z(n6482)) /* synthesis lut_function=(A (B (C))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i492_2_lut_rep_108_3_lut.init = 16'h8080;
    CCU2C add_3294_19 (.A0(lenght_cnt[18]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[19]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4486), .COUT(n4487));
    defparam add_3294_19.INIT0 = 16'h5555;
    defparam add_3294_19.INIT1 = 16'h5555;
    defparam add_3294_19.INJECT1_0 = "NO";
    defparam add_3294_19.INJECT1_1 = "NO";
    CCU2C add_3294_17 (.A0(lenght_cnt[16]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[17]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4485), .COUT(n4486));
    defparam add_3294_17.INIT0 = 16'h5555;
    defparam add_3294_17.INIT1 = 16'h5555;
    defparam add_3294_17.INJECT1_0 = "NO";
    defparam add_3294_17.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_6 (.A0(frame_len[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[6]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4432), .COUT(n4433));
    defparam _add_1_add_4_6.INIT0 = 16'haaa0;
    defparam _add_1_add_4_6.INIT1 = 16'h555f;
    defparam _add_1_add_4_6.INJECT1_0 = "NO";
    defparam _add_1_add_4_6.INJECT1_1 = "NO";
    CCU2C add_3294_15 (.A0(lenght_cnt[14]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[15]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4484), .COUT(n4485));
    defparam add_3294_15.INIT0 = 16'h5555;
    defparam add_3294_15.INIT1 = 16'h5555;
    defparam add_3294_15.INJECT1_0 = "NO";
    defparam add_3294_15.INJECT1_1 = "NO";
    LUT4 i490_2_lut_3_lut (.A(cnt[1]), .B(cnt[0]), .C(cnt[2]), .Z(next_cnt_7__N_9[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i490_2_lut_3_lut.init = 16'h7878;
    LUT4 i499_2_lut_rep_101_3_lut_4_lut (.A(cnt[1]), .B(cnt[0]), .C(cnt[3]), 
         .D(cnt[2]), .Z(n6475)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i499_2_lut_rep_101_3_lut_4_lut.init = 16'h8000;
    CCU2C add_3294_13 (.A0(lenght_cnt[12]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[13]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4483), .COUT(n4484));
    defparam add_3294_13.INIT0 = 16'h5555;
    defparam add_3294_13.INIT1 = 16'h5555;
    defparam add_3294_13.INJECT1_0 = "NO";
    defparam add_3294_13.INJECT1_1 = "NO";
    CCU2C add_3294_11 (.A0(lenght_cnt[10]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[11]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4482), .COUT(n4483));
    defparam add_3294_11.INIT0 = 16'h5555;
    defparam add_3294_11.INIT1 = 16'h5555;
    defparam add_3294_11.INJECT1_0 = "NO";
    defparam add_3294_11.INJECT1_1 = "NO";
    CCU2C add_3294_9 (.A0(lenght_cnt[8]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[9]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4481), .COUT(n4482));
    defparam add_3294_9.INIT0 = 16'h5555;
    defparam add_3294_9.INIT1 = 16'h5555;
    defparam add_3294_9.INJECT1_0 = "NO";
    defparam add_3294_9.INJECT1_1 = "NO";
    LUT4 i497_2_lut_3_lut_4_lut (.A(cnt[1]), .B(cnt[0]), .C(cnt[3]), .D(cnt[2]), 
         .Z(next_cnt_7__N_9[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i497_2_lut_3_lut_4_lut.init = 16'h78f0;
    CCU2C add_3294_7 (.A0(lenght_cnt[6]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[7]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4480), .COUT(n4481));
    defparam add_3294_7.INIT0 = 16'haaa5;
    defparam add_3294_7.INIT1 = 16'h5555;
    defparam add_3294_7.INJECT1_0 = "NO";
    defparam add_3294_7.INJECT1_1 = "NO";
    CCU2C add_3294_5 (.A0(lenght_cnt[4]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[5]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4479), .COUT(n4480));
    defparam add_3294_5.INIT0 = 16'haaa5;
    defparam add_3294_5.INIT1 = 16'h5555;
    defparam add_3294_5.INJECT1_0 = "NO";
    defparam add_3294_5.INJECT1_1 = "NO";
    CCU2C add_3294_3 (.A0(lenght_cnt[2]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[3]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4478), .COUT(n4479));
    defparam add_3294_3.INIT0 = 16'h5555;
    defparam add_3294_3.INIT1 = 16'h5555;
    defparam add_3294_3.INJECT1_0 = "NO";
    defparam add_3294_3.INJECT1_1 = "NO";
    CCU2C add_3294_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(lenght_cnt[1]), .B1(lenght_cnt[0]), .C1(GND_net), .D1(VCC_net), 
          .COUT(n4478));
    defparam add_3294_1.INIT0 = 16'h0000;
    defparam add_3294_1.INIT1 = 16'h6665;
    defparam add_3294_1.INJECT1_0 = "NO";
    defparam add_3294_1.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_33 (.A0(lenght_cnt[31]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n4477), .S0(n134));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_33.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_33.INIT1 = 16'h0000;
    defparam lenght_cnt_456_add_4_33.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_33.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_31 (.A0(lenght_cnt[29]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[30]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4476), .COUT(n4477), .S0(n136), .S1(n135));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_31.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_31.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_31.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_31.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_29 (.A0(lenght_cnt[27]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[28]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4475), .COUT(n4476), .S0(n138), .S1(n137));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_29.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_29.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_29.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_29.INJECT1_1 = "NO";
    LUT4 next_fifo_almostfull_I_0_1_lut (.A(next_fifo_almostfull), .Z(next_fifo_almostfull_N_83)) /* synthesis lut_function=(!(A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(68[3] 80[10])
    defparam next_fifo_almostfull_I_0_1_lut.init = 16'h5555;
    CCU2C _add_1_add_4_32 (.A0(frame_len[31]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n4445), .S1(n399));
    defparam _add_1_add_4_32.INIT0 = 16'h5555;
    defparam _add_1_add_4_32.INIT1 = 16'h0000;
    defparam _add_1_add_4_32.INJECT1_0 = "NO";
    defparam _add_1_add_4_32.INJECT1_1 = "NO";
    LUT4 i483_2_lut (.A(cnt[1]), .B(cnt[0]), .Z(next_cnt_7__N_9[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i483_2_lut.init = 16'h6666;
    CCU2C lenght_cnt_456_add_4_27 (.A0(lenght_cnt[25]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[26]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4474), .COUT(n4475), .S0(n140), .S1(n139));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_27.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_27.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_27.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_27.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_25 (.A0(lenght_cnt[23]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[24]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4473), .COUT(n4474), .S0(n142), .S1(n141));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_25.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_25.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_25.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_25.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_23 (.A0(lenght_cnt[21]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[22]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4472), .COUT(n4473), .S0(n144), .S1(n143));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_23.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_23.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_23.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_23.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_30 (.A0(frame_len[29]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[30]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4444), .COUT(n4445));
    defparam _add_1_add_4_30.INIT0 = 16'h555f;
    defparam _add_1_add_4_30.INIT1 = 16'h555f;
    defparam _add_1_add_4_30.INJECT1_0 = "NO";
    defparam _add_1_add_4_30.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_28 (.A0(frame_len[27]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[28]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4443), .COUT(n4444));
    defparam _add_1_add_4_28.INIT0 = 16'h555f;
    defparam _add_1_add_4_28.INIT1 = 16'h555f;
    defparam _add_1_add_4_28.INJECT1_0 = "NO";
    defparam _add_1_add_4_28.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_21 (.A0(lenght_cnt[19]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[20]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4471), .COUT(n4472), .S0(n146), .S1(n145));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_21.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_21.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_21.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_21.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_26 (.A0(frame_len[25]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[26]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4442), .COUT(n4443));
    defparam _add_1_add_4_26.INIT0 = 16'h555f;
    defparam _add_1_add_4_26.INIT1 = 16'h555f;
    defparam _add_1_add_4_26.INJECT1_0 = "NO";
    defparam _add_1_add_4_26.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_24 (.A0(frame_len[23]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[24]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4441), .COUT(n4442));
    defparam _add_1_add_4_24.INIT0 = 16'h555f;
    defparam _add_1_add_4_24.INIT1 = 16'h555f;
    defparam _add_1_add_4_24.INJECT1_0 = "NO";
    defparam _add_1_add_4_24.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_19 (.A0(lenght_cnt[17]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[18]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4470), .COUT(n4471), .S0(n148), .S1(n147));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_19.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_19.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_19.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_19.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_17 (.A0(lenght_cnt[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[16]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4469), .COUT(n4470), .S0(n150), .S1(n149));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_17.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_17.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_17.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_17.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_22 (.A0(frame_len[21]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[22]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4440), .COUT(n4441));
    defparam _add_1_add_4_22.INIT0 = 16'h555f;
    defparam _add_1_add_4_22.INIT1 = 16'h555f;
    defparam _add_1_add_4_22.INJECT1_0 = "NO";
    defparam _add_1_add_4_22.INJECT1_1 = "NO";
    CCU2C lenght_cnt_456_add_4_15 (.A0(lenght_cnt[13]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(lenght_cnt[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4468), .COUT(n4469), .S0(n152), .S1(n151));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(69[23:33])
    defparam lenght_cnt_456_add_4_15.INIT0 = 16'haaa0;
    defparam lenght_cnt_456_add_4_15.INIT1 = 16'haaa0;
    defparam lenght_cnt_456_add_4_15.INJECT1_0 = "NO";
    defparam lenght_cnt_456_add_4_15.INJECT1_1 = "NO";
    CCU2C _add_1_add_4_20 (.A0(frame_len[19]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[20]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4439), .COUT(n4440));
    defparam _add_1_add_4_20.INIT0 = 16'h555f;
    defparam _add_1_add_4_20.INIT1 = 16'h555f;
    defparam _add_1_add_4_20.INJECT1_0 = "NO";
    defparam _add_1_add_4_20.INJECT1_1 = "NO";
    LUT4 i525_3_lut_4_lut (.A(cnt[5]), .B(n6470), .C(cnt[6]), .D(cnt[7]), 
         .Z(next_cnt_7__N_9[7])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i525_3_lut_4_lut.init = 16'h7f80;
    LUT4 i518_2_lut_3_lut_4_lut (.A(cnt[4]), .B(n6475), .C(cnt[6]), .D(cnt[5]), 
         .Z(next_cnt_7__N_9[6])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam i518_2_lut_3_lut_4_lut.init = 16'h78f0;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VLO i1 (.Z(GND_net));
    
endmodule
//
// Verilog Description of module top_ethernet_tx
//

module top_ethernet_tx (clk_c, rst_c, n6483, buf_douto3, buf_douto2, 
            buf_douto1, buf_douto0, GND_net, VCC_net, buf_clkout, 
            buf_douto4, cnt, fifo_almostfull, fifo_empty, n424, \frame_len[3] , 
            \frame_len[4] , \frame_len[5] , n6488, \frame_len[1] , \frame_len[2] , 
            n399, clk_c_enable_19, \frame_len[31] , \frame_len[29] , 
            \frame_len[30] , \frame_len[27] , \frame_len[28] , \frame_len[25] , 
            \frame_len[26] , \frame_len[23] , \frame_len[24] , \frame_len[21] , 
            \frame_len[22] , \frame_len[19] , \frame_len[20] , \frame_len[17] , 
            \frame_len[18] , \frame_len[6] , \frame_len[7] , \frame_len[8] , 
            \frame_len[9] , \frame_len[10] , \frame_len[11] , \frame_len[12] , 
            \frame_len[13] , \frame_len[14] , \frame_len[15] , \frame_len[16] );
    input clk_c;
    input rst_c;
    output n6483;
    output buf_douto3;
    output buf_douto2;
    output buf_douto1;
    output buf_douto0;
    input GND_net;
    input VCC_net;
    output buf_clkout;
    output buf_douto4;
    input [7:0]cnt;
    input fifo_almostfull;
    input fifo_empty;
    output n424;
    output \frame_len[3] ;
    output \frame_len[4] ;
    output \frame_len[5] ;
    output n6488;
    output \frame_len[1] ;
    output \frame_len[2] ;
    input n399;
    input clk_c_enable_19;
    output \frame_len[31] ;
    output \frame_len[29] ;
    output \frame_len[30] ;
    output \frame_len[27] ;
    output \frame_len[28] ;
    output \frame_len[25] ;
    output \frame_len[26] ;
    output \frame_len[23] ;
    output \frame_len[24] ;
    output \frame_len[21] ;
    output \frame_len[22] ;
    output \frame_len[19] ;
    output \frame_len[20] ;
    output \frame_len[17] ;
    output \frame_len[18] ;
    output \frame_len[6] ;
    output \frame_len[7] ;
    output \frame_len[8] ;
    output \frame_len[9] ;
    output \frame_len[10] ;
    output \frame_len[11] ;
    output \frame_len[12] ;
    output \frame_len[13] ;
    output \frame_len[14] ;
    output \frame_len[15] ;
    output \frame_len[16] ;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    wire [7:0]idx;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(62[12:15])
    wire [7:0]n312;
    
    wire n15, n6472, n15_adj_721;
    wire [7:0]t_data_7__N_100;
    
    wire n6497;
    wire [7:0]reg_fifo_data;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx.vhd(44[9:22])
    wire [7:0]udp_tdata;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx.vhd(29[12:21])
    
    wire n6492, reg_fifo_almostfull;
    wire [7:0]t_data_7__N_84;
    
    wire n6468, n6484, n6464, n6493;
    wire [7:0]gmii_txd_7__N_210;
    
    wire n6469, n6467, reg_fifo_empty;
    wire [7:0]n417;
    
    wire n6479, n6461, n6457, n6460, n395;
    wire [31:0]crc_next;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(57[12:20])
    wire [31:0]crc_reg;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(55[12:19])
    wire [31:0]next_crc_reg_31__N_390;
    
    wire n5334, n6458, n5318, n6466, n6463, n6462, n6456;
    wire [7:0]gmii_txd;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx.vhd(37[12:20])
    wire [9:0]data;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/ddr_forrgmii.vhd(17[9:13])
    
    UDP_FIFO_AXI udp_inst (.idx({Open_0, Open_1, Open_2, Open_3, Open_4, 
            Open_5, Open_6, idx[0]}), .clk_c(clk_c), .rst_c(rst_c), 
            .n316(n312[4]), .\idx[2] (idx[2]), .n15(n15), .n6472(n6472), 
            .n15_adj_2(n15_adj_721), .n318(n312[2]), .\idx[3] (idx[3]), 
            .\idx[4] (idx[4]), .\idx[1] (idx[1]), .\t_data_7__N_100[3] (t_data_7__N_100[3]), 
            .n6497(n6497), .n317(n312[3]), .n319(n312[1]), .reg_fifo_data({reg_fifo_data}), 
            .\udp_tdata[0] (udp_tdata[0]), .n6492(n6492), .\udp_tdata[4] (udp_tdata[4]), 
            .reg_fifo_almostfull(reg_fifo_almostfull), .\t_data_7__N_84[5] (t_data_7__N_84[5]), 
            .n6468(n6468), .\udp_tdata[2] (udp_tdata[2]), .n6484(n6484), 
            .n6464(n6464), .n6493(n6493), .\gmii_txd_7__N_210[3] (gmii_txd_7__N_210[3]), 
            .n6469(n6469), .n6467(n6467), .reg_fifo_empty(reg_fifo_empty), 
            .n423(n417[2]), .n6479(n6479), .n6461(n6461), .\udp_tdata[1] (udp_tdata[1]), 
            .n6457(n6457), .\gmii_txd_7__N_210[1] (gmii_txd_7__N_210[1]), 
            .n6460(n6460), .n395(n395), .\crc_next[31] (crc_next[31]), 
            .\crc_reg[31] (crc_reg[31]), .\next_crc_reg_31__N_390[31] (next_crc_reg_31__N_390[31]), 
            .\gmii_txd_7__N_210[5] (gmii_txd_7__N_210[5]), .n425(n417[0]), 
            .n6483(n6483), .n5334(n5334), .n6458(n6458), .n5318(n5318), 
            .\crc_next[12] (crc_next[12]), .\crc_reg[12] (crc_reg[12]), 
            .\next_crc_reg_31__N_390[12] (next_crc_reg_31__N_390[12]), .n6466(n6466), 
            .n6463(n6463), .\crc_reg[9] (crc_reg[9]), .\next_crc_reg_31__N_390[9] (next_crc_reg_31__N_390[9]), 
            .n6462(n6462), .n6456(n6456));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx.vhd(71[16:40])
    rgmii_tx_ddr rgmii_inst (.clk_c(clk_c), .rst_c(rst_c), .gmii_txd({gmii_txd}), 
            .buf_douto3(buf_douto3), .buf_douto2(buf_douto2), .buf_douto1(buf_douto1), 
            .buf_douto0(buf_douto0), .GND_net(GND_net), .VCC_net(VCC_net), 
            .buf_clkout(buf_clkout), .ctl_reg(data[9]), .buf_douto4(buf_douto4));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx.vhd(122[18:42])
    fifo_udp_reg reg_inst (.reg_fifo_data({reg_fifo_data}), .clk_c(clk_c), 
            .cnt({cnt}), .reg_fifo_almostfull(reg_fifo_almostfull), .fifo_almostfull(fifo_almostfull), 
            .reg_fifo_empty(reg_fifo_empty), .fifo_empty(fifo_empty));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx.vhd(50[12:36])
    MAC_AXItoRGMII mac_inst (.n424(n424), .\udp_tdata[0] (udp_tdata[0]), 
            .n423(n417[2]), .n6493(n6493), .frame_len({\frame_len[31] , 
            Open_7, Open_8, Open_9, Open_10, Open_11, Open_12, Open_13, 
            Open_14, Open_15, Open_16, Open_17, Open_18, Open_19, 
            Open_20, Open_21, Open_22, Open_23, Open_24, Open_25, 
            Open_26, Open_27, Open_28, Open_29, Open_30, Open_31, 
            \frame_len[5] , \frame_len[4] , \frame_len[3] , \frame_len[2] , 
            \frame_len[1] , Open_32}), .clk_c(clk_c), .rst_c(rst_c), 
            .n425(n417[0]), .\udp_tdata[1] (udp_tdata[1]), .n6484(n6484), 
            .n6488(n6488), .\next_crc_reg_31__N_390[12] (next_crc_reg_31__N_390[12]), 
            .\crc_next[12] (crc_next[12]), .n6468(n6468), .n6462(n6462), 
            .\next_crc_reg_31__N_390[9] (next_crc_reg_31__N_390[9]), .\udp_tdata[2] (udp_tdata[2]), 
            .n6461(n6461), .\udp_tdata[4] (udp_tdata[4]), .n6479(n6479), 
            .n399(n399), .n6469(n6469), .clk_c_enable_19(clk_c_enable_19), 
            .GND_net(GND_net), .VCC_net(VCC_net), .\frame_len[29] (\frame_len[29] ), 
            .\frame_len[30] (\frame_len[30] ), .\crc_reg[9] (crc_reg[9]), 
            .n395(n395), .\crc_reg[12] (crc_reg[12]), .n6492(n6492), .\frame_len[27] (\frame_len[27] ), 
            .\frame_len[28] (\frame_len[28] ), .\frame_len[25] (\frame_len[25] ), 
            .\frame_len[26] (\frame_len[26] ), .\frame_len[23] (\frame_len[23] ), 
            .\frame_len[24] (\frame_len[24] ), .\frame_len[21] (\frame_len[21] ), 
            .\frame_len[22] (\frame_len[22] ), .\crc_reg[31] (crc_reg[31]), 
            .\frame_len[19] (\frame_len[19] ), .\frame_len[20] (\frame_len[20] ), 
            .ctl_reg(data[9]), .\frame_len[17] (\frame_len[17] ), .\frame_len[18] (\frame_len[18] ), 
            .\frame_len[6] (\frame_len[6] ), .\frame_len[7] (\frame_len[7] ), 
            .\frame_len[8] (\frame_len[8] ), .\frame_len[9] (\frame_len[9] ), 
            .\frame_len[10] (\frame_len[10] ), .\frame_len[11] (\frame_len[11] ), 
            .\frame_len[12] (\frame_len[12] ), .\frame_len[13] (\frame_len[13] ), 
            .\frame_len[14] (\frame_len[14] ), .\frame_len[15] (\frame_len[15] ), 
            .\frame_len[16] (\frame_len[16] ), .gmii_txd({gmii_txd}), .\gmii_txd_7__N_210[1] (gmii_txd_7__N_210[1]), 
            .\gmii_txd_7__N_210[5] (gmii_txd_7__N_210[5]), .\gmii_txd_7__N_210[3] (gmii_txd_7__N_210[3]), 
            .n6463(n6463), .n6472(n6472), .n319(n312[1]), .n15(n15_adj_721), 
            .n5318(n5318), .n318(n312[2]), .n15_adj_1(n15), .n5334(n5334), 
            .\next_crc_reg_31__N_390[31] (next_crc_reg_31__N_390[31]), .\crc_next[31] (crc_next[31]), 
            .n6456(n6456), .n6460(n6460), .n6457(n6457), .n6458(n6458), 
            .n6466(n6466), .n6464(n6464), .\idx[4] (idx[4]), .\idx[3] (idx[3]), 
            .\idx[2] (idx[2]), .\idx[1] (idx[1]), .n6467(n6467), .\reg_fifo_data[3] (reg_fifo_data[3]), 
            .n316(n312[4]), .n6497(n6497), .\t_data_7__N_84[5] (t_data_7__N_84[5]), 
            .n317(n312[3]), .\t_data_7__N_100[3] (t_data_7__N_100[3]), .\idx[0] (idx[0]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx.vhd(97[16:42])
    
endmodule
//
// Verilog Description of module UDP_FIFO_AXI
//

module UDP_FIFO_AXI (idx, clk_c, rst_c, n316, \idx[2] , n15, n6472, 
            n15_adj_2, n318, \idx[3] , \idx[4] , \idx[1] , \t_data_7__N_100[3] , 
            n6497, n317, n319, reg_fifo_data, \udp_tdata[0] , n6492, 
            \udp_tdata[4] , reg_fifo_almostfull, \t_data_7__N_84[5] , 
            n6468, \udp_tdata[2] , n6484, n6464, n6493, \gmii_txd_7__N_210[3] , 
            n6469, n6467, reg_fifo_empty, n423, n6479, n6461, \udp_tdata[1] , 
            n6457, \gmii_txd_7__N_210[1] , n6460, n395, \crc_next[31] , 
            \crc_reg[31] , \next_crc_reg_31__N_390[31] , \gmii_txd_7__N_210[5] , 
            n425, n6483, n5334, n6458, n5318, \crc_next[12] , \crc_reg[12] , 
            \next_crc_reg_31__N_390[12] , n6466, n6463, \crc_reg[9] , 
            \next_crc_reg_31__N_390[9] , n6462, n6456);
    output [7:0]idx;
    input clk_c;
    input rst_c;
    output n316;
    output \idx[2] ;
    output n15;
    input n6472;
    output n15_adj_2;
    output n318;
    output \idx[3] ;
    output \idx[4] ;
    output \idx[1] ;
    output \t_data_7__N_100[3] ;
    output n6497;
    output n317;
    output n319;
    input [7:0]reg_fifo_data;
    output \udp_tdata[0] ;
    output n6492;
    output \udp_tdata[4] ;
    input reg_fifo_almostfull;
    output \t_data_7__N_84[5] ;
    output n6468;
    output \udp_tdata[2] ;
    output n6484;
    output n6464;
    output n6493;
    output \gmii_txd_7__N_210[3] ;
    output n6469;
    output n6467;
    input reg_fifo_empty;
    input n423;
    output n6479;
    output n6461;
    output \udp_tdata[1] ;
    output n6457;
    output \gmii_txd_7__N_210[1] ;
    output n6460;
    output n395;
    input \crc_next[31] ;
    input \crc_reg[31] ;
    output \next_crc_reg_31__N_390[31] ;
    output \gmii_txd_7__N_210[5] ;
    input n425;
    output n6483;
    input n5334;
    output n6458;
    input n5318;
    input \crc_next[12] ;
    input \crc_reg[12] ;
    output \next_crc_reg_31__N_390[12] ;
    output n6466;
    input n6463;
    input \crc_reg[9] ;
    output \next_crc_reg_31__N_390[9] ;
    output n6462;
    output n6456;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    wire [7:0]next_idx;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(62[17:25])
    wire [7:0]n312;
    
    wire n1943;
    wire [7:0]idx_c;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(62[12:15])
    
    wire n2244, n926, n6494;
    wire [7:0]next_idx_7__N_142;
    wire [7:0]next_idx_7__N_150;
    
    wire n5787, n4, n6128, n6129;
    wire [7:0]t_data_7__N_100;
    
    wire n6517, n6516, n6490, n6524, n6446, n6523, n6522, n6485, 
        n6510, n6478;
    wire [7:0]next_idx_7__N_183;
    
    wire n6486, n6130;
    wire [7:0]t_data_7__N_84;
    
    wire n6447, n5107, n5095, n6511, n6152, n6437, n6502;
    wire [7:0]t_data_7__N_92;
    
    wire n6200, n6199, n6201, n6473, n1981, n6496, n5625;
    wire [7:0]n1215;
    
    wire n2, n5781;
    wire [7:0]next_idx_7__N_161;
    wire [7:0]next_idx_7__N_134;
    wire [7:0]n149;
    
    wire n1947, n1931, n1939, n1941, n5849, n5845, n2040, n6436, 
        n2_adj_716, n5789, n6508, n5835, n2_adj_717, n5801, n5831, 
        n5795, n4_adj_718, n6150, n5813, n4_adj_719, n6513, n6514, 
        n5809, n4_adj_720;
    wire [7:0]n1235;
    
    wire n2046, n2042, n6, n5951, n1946, n2038, n14, n2036, 
        n337, n6449;
    
    FD1S3IX idx__i0 (.D(next_idx[0]), .CK(clk_c), .CD(rst_c), .Q(idx[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=71, LSE_RLINE=71 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(67[13] 75[20])
    defparam idx__i0.GSR = "DISABLED";
    FD1S3JX state_FSM_i1 (.D(n1943), .CK(clk_c), .PD(rst_c), .Q(n312[0]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i1.GSR = "DISABLED";
    LUT4 i1_3_lut (.A(idx_c[6]), .B(idx_c[5]), .C(idx_c[7]), .Z(n2244)) /* synthesis lut_function=(A+(B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i1_3_lut.init = 16'hfefe;
    LUT4 i1_2_lut (.A(n312[5]), .B(n316), .Z(n926)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 mux_453_i3_4_lut_4_lut (.A(\idx[2] ), .B(n6494), .C(n15), .D(n6472), 
         .Z(next_idx_7__N_142[2])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam mux_453_i3_4_lut_4_lut.init = 16'h60aa;
    LUT4 mux_452_i3_4_lut_4_lut (.A(\idx[2] ), .B(n6494), .C(n15_adj_2), 
         .D(n6472), .Z(next_idx_7__N_150[2])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam mux_452_i3_4_lut_4_lut.init = 16'h60aa;
    LUT4 i1_4_lut (.A(n5787), .B(n4), .C(\idx[2] ), .D(n926), .Z(next_idx[2])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut.init = 16'hfeee;
    LUT4 n318_bdd_2_lut_4876 (.A(n318), .B(\idx[2] ), .Z(n6128)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam n318_bdd_2_lut_4876.init = 16'h1111;
    LUT4 n318_bdd_4_lut_4877 (.A(n318), .B(\idx[3] ), .C(\idx[2] ), .D(\idx[4] ), 
         .Z(n6129)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B (C+!(D)))+!A (B))) */ ;
    defparam n318_bdd_4_lut_4877.init = 16'h1391;
    LUT4 idx_3__I_0_Mux_3_i15_4_lut_4_lut_4_lut (.A(\idx[1] ), .B(\idx[2] ), 
         .C(\idx[3] ), .D(idx[0]), .Z(\t_data_7__N_100[3] )) /* synthesis lut_function=(!(A (B)+!A (B (C (D))+!B !((D)+!C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam idx_3__I_0_Mux_3_i15_4_lut_4_lut_4_lut.init = 16'h3767;
    LUT4 idx_3__I_0_Mux_2_i15_4_lut_4_lut (.A(\idx[2] ), .B(idx[0]), .C(\idx[1] ), 
         .D(\idx[3] ), .Z(t_data_7__N_100[2])) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A !(B (C+!(D))+!B !(C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam idx_3__I_0_Mux_2_i15_4_lut_4_lut.init = 16'h41df;
    LUT4 idx_4__I_0_Mux_2_i31_4_lut_4_lut_then_4_lut (.A(\idx[2] ), .B(\idx[3] ), 
         .C(idx[0]), .D(\idx[1] ), .Z(n6517)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam idx_4__I_0_Mux_2_i31_4_lut_4_lut_then_4_lut.init = 16'h1000;
    LUT4 idx_4__I_0_Mux_2_i31_4_lut_4_lut_else_4_lut (.A(\idx[2] ), .B(\idx[3] ), 
         .C(idx[0]), .D(\idx[1] ), .Z(n6516)) /* synthesis lut_function=(!(A+(B+!(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam idx_4__I_0_Mux_2_i31_4_lut_4_lut_else_4_lut.init = 16'h1001;
    LUT4 n3328_bdd_3_lut_3_lut (.A(n6490), .B(n318), .C(n6524), .Z(n6446)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam n3328_bdd_3_lut_3_lut.init = 16'h1d1d;
    LUT4 idx_4__I_0_Mux_6_i31_4_lut_then_4_lut (.A(\idx[4] ), .B(\idx[2] ), 
         .C(\idx[3] ), .D(\idx[1] ), .Z(n6523)) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_4__I_0_Mux_6_i31_4_lut_then_4_lut.init = 16'hfdff;
    LUT4 idx_4__I_0_Mux_6_i31_4_lut_else_4_lut (.A(\idx[4] ), .B(\idx[2] ), 
         .C(\idx[3] ), .D(\idx[1] ), .Z(n6522)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B ((D)+!C)+!B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_4__I_0_Mux_6_i31_4_lut_else_4_lut.init = 16'hffac;
    LUT4 mux_453_i4_4_lut_4_lut (.A(\idx[3] ), .B(n6485), .C(n15), .D(n6472), 
         .Z(next_idx_7__N_142[3])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam mux_453_i4_4_lut_4_lut.init = 16'h60aa;
    LUT4 i2135_2_lut_3_lut_4_lut (.A(\idx[3] ), .B(n6485), .C(n6510), 
         .D(n6478), .Z(next_idx_7__N_183[3])) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A !(B (C+(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i2135_2_lut_3_lut_4_lut.init = 16'h6660;
    LUT4 mux_452_i4_4_lut_4_lut (.A(\idx[3] ), .B(n6485), .C(n15_adj_2), 
         .D(n6472), .Z(next_idx_7__N_150[3])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam mux_452_i4_4_lut_4_lut.init = 16'h60aa;
    LUT4 mux_453_i5_4_lut_4_lut (.A(\idx[4] ), .B(n6486), .C(n15), .D(n6472), 
         .Z(next_idx_7__N_142[4])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam mux_453_i5_4_lut_4_lut.init = 16'h60aa;
    LUT4 n6130_bdd_4_lut (.A(n6130), .B(n6497), .C(t_data_7__N_84[6]), 
         .D(n317), .Z(n6447)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))+!A (C (D))) */ ;
    defparam n6130_bdd_4_lut.init = 16'hf088;
    LUT4 mux_452_i5_4_lut_4_lut (.A(\idx[4] ), .B(n6486), .C(n15_adj_2), 
         .D(n6472), .Z(next_idx_7__N_150[4])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam mux_452_i5_4_lut_4_lut.init = 16'h60aa;
    LUT4 i1_4_lut_adj_242 (.A(n5107), .B(n5095), .C(idx[0]), .D(n926), 
         .Z(next_idx[0])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;
    defparam i1_4_lut_adj_242.init = 16'hfeee;
    LUT4 i3906_4_lut (.A(n317), .B(n6472), .C(n318), .D(idx[0]), .Z(n5107)) /* synthesis lut_function=(!(A (B (D)+!B !(D))+!A (B ((D)+!C)+!B !(C (D))))) */ ;
    defparam i3906_4_lut.init = 16'h32c8;
    LUT4 i3894_4_lut (.A(idx[0]), .B(n319), .C(n6472), .D(n15_adj_2), 
         .Z(n5095)) /* synthesis lut_function=(!(A ((C)+!B)+!A !(B (C (D))))) */ ;
    defparam i3894_4_lut.init = 16'h4808;
    LUT4 i1_4_lut_adj_243 (.A(n6511), .B(n6510), .C(\idx[3] ), .D(n2244), 
         .Z(n15_adj_2)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i1_4_lut_adj_243.init = 16'hffef;
    LUT4 idx_4__bdd_4_lut_4886 (.A(\idx[4] ), .B(\idx[2] ), .C(\idx[3] ), 
         .D(\idx[1] ), .Z(n6152)) /* synthesis lut_function=(!(A (B+(C+(D)))+!A !(B (C)+!B !(C+!(D))))) */ ;
    defparam idx_4__bdd_4_lut_4886.init = 16'h4142;
    LUT4 idx_4__I_0_Mux_0_i31_4_lut (.A(n6437), .B(n6502), .C(n318), .D(\idx[3] ), 
         .Z(t_data_7__N_92[0])) /* synthesis lut_function=(A (B (C)+!B (C+!(D)))+!A !(B+(C+(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_4__I_0_Mux_0_i31_4_lut.init = 16'ha0a3;
    PFUMX i4884 (.BLUT(n6200), .ALUT(n6199), .C0(n317), .Z(n6201));
    LUT4 i1_2_lut_rep_99_4_lut (.A(n6494), .B(n2244), .C(\idx[3] ), .D(n6510), 
         .Z(n6473)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;
    defparam i1_2_lut_rep_99_4_lut.init = 16'hfffd;
    LUT4 i2082_4_lut (.A(idx[0]), .B(n1981), .C(n6496), .D(\idx[4] ), 
         .Z(t_data_7__N_92[5])) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i2082_4_lut.init = 16'ha088;
    LUT4 i823_4_lut (.A(n5625), .B(reg_fifo_data[0]), .C(n316), .D(n1215[0]), 
         .Z(\udp_tdata[0] )) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i823_4_lut.init = 16'hcac0;
    FD1S3IX state_FSM_i6 (.D(n6492), .CK(clk_c), .CD(rst_c), .Q(n312[5]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i6.GSR = "DISABLED";
    LUT4 i1_4_lut_adj_244 (.A(n2), .B(n5781), .C(next_idx_7__N_142[7]), 
         .D(n318), .Z(next_idx[7])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_244.init = 16'hfeee;
    LUT4 select_329_Select_7_i2_4_lut (.A(idx_c[7]), .B(n319), .C(next_idx_7__N_161[7]), 
         .D(n6472), .Z(n2)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam select_329_Select_7_i2_4_lut.init = 16'hc088;
    LUT4 i1_4_lut_adj_245 (.A(next_idx_7__N_134[7]), .B(idx_c[7]), .C(n317), 
         .D(n926), .Z(n5781)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_245.init = 16'heca0;
    LUT4 mux_453_i8_4_lut (.A(idx_c[7]), .B(n149[7]), .C(n6472), .D(n15), 
         .Z(next_idx_7__N_142[7])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(130[21] 135[28])
    defparam mux_453_i8_4_lut.init = 16'hca0a;
    LUT4 i2145_2_lut (.A(n149[7]), .B(n15_adj_2), .Z(next_idx_7__N_161[7])) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(113[21] 118[28])
    defparam i2145_2_lut.init = 16'h8888;
    FD1S3IX state_FSM_i5 (.D(n1947), .CK(clk_c), .CD(rst_c), .Q(n316));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i5.GSR = "DISABLED";
    FD1S3IX state_FSM_i4 (.D(n1931), .CK(clk_c), .CD(rst_c), .Q(n317));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i4.GSR = "DISABLED";
    FD1S3IX state_FSM_i3 (.D(n1939), .CK(clk_c), .CD(rst_c), .Q(n318));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i3.GSR = "DISABLED";
    FD1S3IX state_FSM_i2 (.D(n1941), .CK(clk_c), .CD(rst_c), .Q(n319));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i2.GSR = "DISABLED";
    LUT4 mux_454_i8_4_lut (.A(idx_c[7]), .B(n149[7]), .C(n6472), .D(n6473), 
         .Z(next_idx_7__N_134[7])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[21] 156[28])
    defparam mux_454_i8_4_lut.init = 16'hca0a;
    LUT4 i582_4_lut (.A(idx_c[7]), .B(n6494), .C(n5849), .D(n5845), 
         .Z(n149[7])) /* synthesis lut_function=(!(A (B (C (D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i582_4_lut.init = 16'h6aaa;
    LUT4 i919_3_lut (.A(n2040), .B(reg_fifo_data[4]), .C(n316), .Z(\udp_tdata[4] )) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i919_3_lut.init = 16'hcaca;
    FD1S3IX idx__i7 (.D(next_idx[7]), .CK(clk_c), .CD(rst_c), .Q(idx_c[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=71, LSE_RLINE=71 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(67[13] 75[20])
    defparam idx__i7.GSR = "DISABLED";
    FD1S3IX idx__i6 (.D(next_idx[6]), .CK(clk_c), .CD(rst_c), .Q(idx_c[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=71, LSE_RLINE=71 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(67[13] 75[20])
    defparam idx__i6.GSR = "DISABLED";
    FD1S3IX idx__i5 (.D(next_idx[5]), .CK(clk_c), .CD(rst_c), .Q(idx_c[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=71, LSE_RLINE=71 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(67[13] 75[20])
    defparam idx__i5.GSR = "DISABLED";
    FD1S3IX idx__i4 (.D(next_idx[4]), .CK(clk_c), .CD(rst_c), .Q(\idx[4] )) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=71, LSE_RLINE=71 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(67[13] 75[20])
    defparam idx__i4.GSR = "DISABLED";
    FD1S3IX idx__i3 (.D(next_idx[3]), .CK(clk_c), .CD(rst_c), .Q(\idx[3] )) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=71, LSE_RLINE=71 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(67[13] 75[20])
    defparam idx__i3.GSR = "DISABLED";
    FD1S3IX idx__i2 (.D(next_idx[2]), .CK(clk_c), .CD(rst_c), .Q(\idx[2] )) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=71, LSE_RLINE=71 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(67[13] 75[20])
    defparam idx__i2.GSR = "DISABLED";
    FD1S3IX idx__i1 (.D(next_idx[1]), .CK(clk_c), .CD(rst_c), .Q(\idx[1] )) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=71, LSE_RLINE=71 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(67[13] 75[20])
    defparam idx__i1.GSR = "DISABLED";
    LUT4 idx_4__bdd_4_lut_5055 (.A(\idx[4] ), .B(idx[0]), .C(\idx[1] ), 
         .D(\idx[3] ), .Z(n6436)) /* synthesis lut_function=(!(A (B+((D)+!C))+!A (B+(C)))) */ ;
    defparam idx_4__bdd_4_lut_5055.init = 16'h0121;
    LUT4 i1_3_lut_adj_246 (.A(idx_c[5]), .B(\idx[2] ), .C(idx_c[6]), .Z(n5849)) /* synthesis lut_function=(A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_3_lut_adj_246.init = 16'h8080;
    LUT4 i1_2_lut_adj_247 (.A(\idx[3] ), .B(\idx[4] ), .Z(n5845)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_2_lut_adj_247.init = 16'h8888;
    LUT4 i1_4_lut_adj_248 (.A(n2_adj_716), .B(n5789), .C(next_idx_7__N_142[6]), 
         .D(n318), .Z(next_idx[6])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_248.init = 16'hfeee;
    LUT4 i821_3_lut (.A(n312[0]), .B(n312[5]), .C(reg_fifo_almostfull), 
         .Z(n1943)) /* synthesis lut_function=(A (B+!(C))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i821_3_lut.init = 16'hcece;
    LUT4 n6436_bdd_2_lut (.A(n6436), .B(\idx[2] ), .Z(n6437)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam n6436_bdd_2_lut.init = 16'h2222;
    LUT4 select_329_Select_6_i2_4_lut (.A(idx_c[6]), .B(n319), .C(next_idx_7__N_161[6]), 
         .D(n6472), .Z(n2_adj_716)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam select_329_Select_6_i2_4_lut.init = 16'hc088;
    LUT4 i1_4_lut_adj_249 (.A(next_idx_7__N_134[6]), .B(idx_c[6]), .C(n317), 
         .D(n926), .Z(n5789)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_249.init = 16'heca0;
    LUT4 mux_453_i7_4_lut (.A(idx_c[6]), .B(n149[6]), .C(n6472), .D(n15), 
         .Z(next_idx_7__N_142[6])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(130[21] 135[28])
    defparam mux_453_i7_4_lut.init = 16'hca0a;
    LUT4 i2146_2_lut (.A(n149[6]), .B(n15_adj_2), .Z(next_idx_7__N_161[6])) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(113[21] 118[28])
    defparam i2146_2_lut.init = 16'h8888;
    LUT4 mux_454_i7_4_lut (.A(idx_c[6]), .B(n149[6]), .C(n6472), .D(n6473), 
         .Z(next_idx_7__N_134[6])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[21] 156[28])
    defparam mux_454_i7_4_lut.init = 16'hca0a;
    LUT4 i575_4_lut (.A(idx_c[6]), .B(n6508), .C(n6502), .D(n5835), 
         .Z(n149[6])) /* synthesis lut_function=(!(A (B (C (D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i575_4_lut.init = 16'h6aaa;
    LUT4 i1_2_lut_adj_250 (.A(\idx[4] ), .B(idx_c[5]), .Z(n5835)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_2_lut_adj_250.init = 16'h8888;
    LUT4 i1_4_lut_adj_251 (.A(n2_adj_717), .B(n5801), .C(next_idx_7__N_142[5]), 
         .D(n318), .Z(next_idx[5])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_251.init = 16'hfeee;
    LUT4 select_329_Select_5_i2_4_lut (.A(idx_c[5]), .B(n319), .C(next_idx_7__N_161[5]), 
         .D(n6472), .Z(n2_adj_717)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam select_329_Select_5_i2_4_lut.init = 16'hc088;
    LUT4 i1_4_lut_adj_252 (.A(next_idx_7__N_134[5]), .B(idx_c[5]), .C(n317), 
         .D(n926), .Z(n5801)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_252.init = 16'heca0;
    LUT4 mux_453_i6_4_lut (.A(idx_c[5]), .B(n149[5]), .C(n6472), .D(n15), 
         .Z(next_idx_7__N_142[5])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(130[21] 135[28])
    defparam mux_453_i6_4_lut.init = 16'hca0a;
    LUT4 i2147_2_lut (.A(n149[5]), .B(n15_adj_2), .Z(next_idx_7__N_161[5])) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(113[21] 118[28])
    defparam i2147_2_lut.init = 16'h8888;
    LUT4 mux_454_i6_4_lut (.A(idx_c[5]), .B(n149[5]), .C(n6472), .D(n6473), 
         .Z(next_idx_7__N_134[5])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[21] 156[28])
    defparam mux_454_i6_4_lut.init = 16'hca0a;
    LUT4 i568_4_lut (.A(idx_c[5]), .B(n5845), .C(n5831), .D(\idx[1] ), 
         .Z(n149[5])) /* synthesis lut_function=(!(A (B (C (D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i568_4_lut.init = 16'h6aaa;
    LUT4 i1_2_lut_adj_253 (.A(\idx[2] ), .B(idx[0]), .Z(n5831)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_2_lut_adj_253.init = 16'h8888;
    LUT4 i1_4_lut_adj_254 (.A(n5795), .B(n4_adj_718), .C(\idx[4] ), .D(n926), 
         .Z(next_idx[4])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_254.init = 16'hfeee;
    LUT4 i1_4_lut_adj_255 (.A(next_idx_7__N_150[4]), .B(next_idx_7__N_142[4]), 
         .C(n319), .D(n318), .Z(n5795)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_255.init = 16'heca0;
    LUT4 i1_4_lut_adj_256 (.A(next_idx_7__N_150[2]), .B(next_idx_7__N_142[2]), 
         .C(n319), .D(n318), .Z(n5787)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_256.init = 16'heca0;
    LUT4 i859_4_lut_4_lut_3_lut (.A(\idx[2] ), .B(\idx[3] ), .C(\idx[1] ), 
         .Z(n1981)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B+!(C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i859_4_lut_4_lut_3_lut.init = 16'h1818;
    LUT4 select_329_Select_4_i4_4_lut (.A(\idx[4] ), .B(n317), .C(next_idx_7__N_183[4]), 
         .D(n6472), .Z(n4_adj_718)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam select_329_Select_4_i4_4_lut.init = 16'hc088;
    LUT4 idx_0__bdd_4_lut_4864 (.A(idx[0]), .B(\idx[1] ), .C(\idx[3] ), 
         .D(\idx[2] ), .Z(n6150)) /* synthesis lut_function=(!(A (B (C+(D))+!B (C))+!A (C (D)))) */ ;
    defparam idx_0__bdd_4_lut_4864.init = 16'h075f;
    LUT4 i883_2_lut_rep_128 (.A(\idx[1] ), .B(\idx[2] ), .Z(n6502)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i883_2_lut_rep_128.init = 16'h8888;
    LUT4 idx_3__I_0_Mux_6_i15_3_lut_rep_116_4_lut_3_lut (.A(\idx[1] ), .B(\idx[2] ), 
         .C(\idx[3] ), .Z(n6490)) /* synthesis lut_function=(A (B+(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam idx_3__I_0_Mux_6_i15_3_lut_rep_116_4_lut_3_lut.init = 16'he8e8;
    LUT4 i1_4_lut_adj_257 (.A(n5813), .B(n4_adj_719), .C(\idx[3] ), .D(n926), 
         .Z(next_idx[3])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_257.init = 16'hfeee;
    LUT4 i1_4_lut_adj_258 (.A(next_idx_7__N_150[3]), .B(next_idx_7__N_142[3]), 
         .C(n319), .D(n318), .Z(n5813)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_258.init = 16'heca0;
    LUT4 select_329_Select_2_i4_4_lut (.A(\idx[2] ), .B(n317), .C(next_idx_7__N_183[2]), 
         .D(n6472), .Z(n4)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam select_329_Select_2_i4_4_lut.init = 16'hc088;
    PFUMX i5030 (.BLUT(n6513), .ALUT(n6514), .C0(\idx[1] ), .Z(t_data_7__N_92[4]));
    LUT4 idx_3__I_0_Mux_5_i15_4_lut_4_lut_4_lut (.A(\idx[2] ), .B(\idx[3] ), 
         .C(idx[0]), .D(\idx[1] ), .Z(t_data_7__N_100[5])) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A !((C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam idx_3__I_0_Mux_5_i15_4_lut_4_lut_4_lut.init = 16'h7173;
    LUT4 i1_4_lut_then_4_lut (.A(\idx[4] ), .B(\idx[2] ), .C(\idx[3] ), 
         .D(idx[0]), .Z(n6514)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i1_4_lut_then_4_lut.init = 16'h0100;
    LUT4 i1_2_lut_3_lut_3_lut (.A(\idx[2] ), .B(\idx[1] ), .C(idx[0]), 
         .Z(t_data_7__N_84[1])) /* synthesis lut_function=(!(A+!(B+(C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i1_2_lut_3_lut_3_lut.init = 16'h5454;
    LUT4 i1_4_lut_adj_259 (.A(n5809), .B(n4_adj_720), .C(\idx[1] ), .D(n926), 
         .Z(next_idx[1])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_259.init = 16'hfeee;
    LUT4 i1_4_lut_adj_260 (.A(next_idx_7__N_150[1]), .B(next_idx_7__N_142[1]), 
         .C(n319), .D(n318), .Z(n5809)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_4_lut_adj_260.init = 16'heca0;
    LUT4 select_329_Select_1_i4_4_lut (.A(\idx[1] ), .B(n317), .C(next_idx_7__N_183[1]), 
         .D(n6472), .Z(n4_adj_720)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam select_329_Select_1_i4_4_lut.init = 16'hc088;
    LUT4 select_329_Select_3_i4_4_lut (.A(\idx[3] ), .B(n317), .C(next_idx_7__N_183[3]), 
         .D(n6472), .Z(n4_adj_719)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam select_329_Select_3_i4_4_lut.init = 16'hc088;
    LUT4 i1_4_lut_else_4_lut (.A(\idx[4] ), .B(\idx[2] ), .C(\idx[3] ), 
         .D(idx[0]), .Z(n6513)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i1_4_lut_else_4_lut.init = 16'h1000;
    LUT4 mux_453_i2_4_lut_4_lut (.A(\idx[1] ), .B(idx[0]), .C(n15), .D(n6472), 
         .Z(next_idx_7__N_142[1])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(144[39:42])
    defparam mux_453_i2_4_lut_4_lut.init = 16'h60aa;
    LUT4 i2137_2_lut_3_lut_4_lut (.A(\idx[1] ), .B(idx[0]), .C(n6510), 
         .D(n6478), .Z(next_idx_7__N_183[1])) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A !(B (C+(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(144[39:42])
    defparam i2137_2_lut_3_lut_4_lut.init = 16'h6660;
    LUT4 mux_452_i2_4_lut_4_lut (.A(\idx[1] ), .B(idx[0]), .C(n15_adj_2), 
         .D(n6472), .Z(next_idx_7__N_150[1])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(144[39:42])
    defparam mux_452_i2_4_lut_4_lut.init = 16'h60aa;
    LUT4 i1_2_lut_2_lut_3_lut (.A(\idx[1] ), .B(idx[0]), .C(\idx[2] ), 
         .Z(t_data_7__N_84[4])) /* synthesis lut_function=(!(A (B+(C))+!A ((C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(144[39:42])
    defparam i1_2_lut_2_lut_3_lut.init = 16'h0606;
    PFUMX i924 (.BLUT(n1235[1]), .ALUT(t_data_7__N_84[1]), .C0(n317), 
          .Z(n2046));
    LUT4 i1_2_lut_rep_134 (.A(\idx[3] ), .B(idx[0]), .Z(n6508)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_2_lut_rep_134.init = 16'h8888;
    LUT4 i1_2_lut_rep_112_3_lut_4_lut (.A(\idx[3] ), .B(idx[0]), .C(\idx[2] ), 
         .D(\idx[1] ), .Z(n6486)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_2_lut_rep_112_3_lut_4_lut.init = 16'h8000;
    PFUMX i918 (.BLUT(n1235[4]), .ALUT(t_data_7__N_84[4]), .C0(n317), 
          .Z(n2040));
    LUT4 i920_4_lut (.A(n1215[3]), .B(\t_data_7__N_84[5] ), .C(n317), 
         .D(n6497), .Z(n2042)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i920_4_lut.init = 16'hcac0;
    LUT4 mux_383_i4_4_lut (.A(\t_data_7__N_100[3] ), .B(idx[0]), .C(n318), 
         .D(n6152), .Z(n1215[3])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam mux_383_i4_4_lut.init = 16'hca0a;
    LUT4 i1_2_lut_rep_136 (.A(\idx[4] ), .B(\idx[2] ), .Z(n6510)) /* synthesis lut_function=(A+!(B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i1_2_lut_rep_136.init = 16'hbbbb;
    LUT4 i2134_2_lut_3_lut_4_lut_4_lut (.A(\idx[4] ), .B(\idx[2] ), .C(n6478), 
         .D(n6486), .Z(next_idx_7__N_183[4])) /* synthesis lut_function=(!(A (D)+!A !(B (C (D))+!B (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i2134_2_lut_3_lut_4_lut_4_lut.init = 16'h51aa;
    LUT4 i2_2_lut (.A(\idx[3] ), .B(\idx[2] ), .Z(n6)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i2_2_lut.init = 16'h8888;
    LUT4 i2136_2_lut_3_lut_4_lut_4_lut (.A(\idx[4] ), .B(\idx[2] ), .C(n6478), 
         .D(n6494), .Z(next_idx_7__N_183[2])) /* synthesis lut_function=(!(A (B (D)+!B !(D))+!A (B ((D)+!C)+!B !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i2136_2_lut_3_lut_4_lut_4_lut.init = 16'h33c8;
    LUT4 equal_12_i9_2_lut_rep_137 (.A(idx[0]), .B(\idx[1] ), .Z(n6511)) /* synthesis lut_function=((B)+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(113[24:51])
    defparam equal_12_i9_2_lut_rep_137.init = 16'hdddd;
    PFUMX i4844 (.BLUT(n6129), .ALUT(n6128), .C0(\idx[1] ), .Z(n6130));
    LUT4 t_data_7__N_100_2__bdd_2_lut_4910_2_lut_3_lut (.A(idx[0]), .B(\idx[1] ), 
         .C(\idx[2] ), .Z(n6199)) /* synthesis lut_function=(!(A ((C)+!B)+!A (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(113[24:51])
    defparam t_data_7__N_100_2__bdd_2_lut_4910_2_lut_3_lut.init = 16'h0d0d;
    LUT4 i921_3_lut_rep_94 (.A(n2042), .B(reg_fifo_data[3]), .C(n316), 
         .Z(n6468)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i921_3_lut_rep_94.init = 16'hcaca;
    LUT4 n6201_bdd_3_lut (.A(n6201), .B(reg_fifo_data[2]), .C(n316), .Z(\udp_tdata[2] )) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam n6201_bdd_3_lut.init = 16'hcaca;
    LUT4 i2189_2_lut_rep_90_4_lut (.A(n2042), .B(reg_fifo_data[3]), .C(n316), 
         .D(n6484), .Z(n6464)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2189_2_lut_rep_90_4_lut.init = 16'h00ca;
    LUT4 i1_3_lut_adj_261 (.A(idx[0]), .B(\idx[2] ), .C(\idx[1] ), .Z(\t_data_7__N_84[5] )) /* synthesis lut_function=(!((B (C)+!B !(C))+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(144[39:42])
    defparam i1_3_lut_adj_261.init = 16'h2828;
    LUT4 i2128_2_lut_4_lut (.A(n2042), .B(reg_fifo_data[3]), .C(n316), 
         .D(n6493), .Z(\gmii_txd_7__N_210[3] )) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2128_2_lut_4_lut.init = 16'h00ca;
    LUT4 i913_3_lut_rep_95 (.A(n6447), .B(reg_fifo_data[7]), .C(n316), 
         .Z(n6469)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i913_3_lut_rep_95.init = 16'hcaca;
    LUT4 i2185_2_lut_rep_93_4_lut (.A(n6447), .B(reg_fifo_data[7]), .C(n316), 
         .D(n6484), .Z(n6467)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2185_2_lut_rep_93_4_lut.init = 16'h00ca;
    LUT4 i91_2_lut_rep_118 (.A(reg_fifo_empty), .B(n316), .Z(n6492)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i91_2_lut_rep_118.init = 16'h8888;
    LUT4 i1_3_lut_rep_105_4_lut (.A(reg_fifo_empty), .B(n316), .C(n423), 
         .D(n6493), .Z(n6479)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_3_lut_rep_105_4_lut.init = 16'h0080;
    LUT4 i4803_3_lut (.A(n318), .B(\idx[4] ), .C(\idx[3] ), .Z(n5951)) /* synthesis lut_function=((B+!(C))+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i4803_3_lut.init = 16'hdfdf;
    LUT4 reduce_nor_462_i1_2_lut_rep_119 (.A(n312[0]), .B(n312[5]), .Z(n6493)) /* synthesis lut_function=(A+(B)) */ ;
    defparam reduce_nor_462_i1_2_lut_rep_119.init = 16'heeee;
    LUT4 i825_4_lut (.A(n1946), .B(n6472), .C(n6473), .D(n317), .Z(n1947)) /* synthesis lut_function=(A+!((C+!(D))+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i825_4_lut.init = 16'haeaa;
    LUT4 i824_2_lut (.A(n316), .B(reg_fifo_empty), .Z(n1946)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i824_2_lut.init = 16'h2222;
    PFUMX mux_383_i6 (.BLUT(t_data_7__N_100[5]), .ALUT(t_data_7__N_92[5]), 
          .C0(n318), .Z(n1215[5]));
    LUT4 i917_3_lut_rep_87 (.A(n2038), .B(reg_fifo_data[5]), .C(n316), 
         .Z(n6461)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i917_3_lut_rep_87.init = 16'hcaca;
    LUT4 i2191_2_lut_rep_83_3_lut_4_lut (.A(n312[0]), .B(n312[5]), .C(\udp_tdata[1] ), 
         .D(n423), .Z(n6457)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2191_2_lut_rep_83_3_lut_4_lut.init = 16'h1000;
    LUT4 i2130_2_lut_3_lut (.A(n312[0]), .B(n312[5]), .C(\udp_tdata[1] ), 
         .Z(\gmii_txd_7__N_210[1] )) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i2130_2_lut_3_lut.init = 16'h1010;
    LUT4 i2187_2_lut_rep_86_4_lut (.A(n2038), .B(reg_fifo_data[5]), .C(n316), 
         .D(n6484), .Z(n6460)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2187_2_lut_rep_86_4_lut.init = 16'h00ca;
    LUT4 i119_2_lut_3_lut_4_lut (.A(n312[0]), .B(n312[5]), .C(n316), .D(reg_fifo_empty), 
         .Z(n395)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;
    defparam i119_2_lut_3_lut_4_lut.init = 16'hefff;
    LUT4 crc_reg_31__I_0_i32_3_lut_4_lut (.A(n312[0]), .B(n312[5]), .C(\crc_next[31] ), 
         .D(\crc_reg[31] ), .Z(\next_crc_reg_31__N_390[31] )) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C))) */ ;
    defparam crc_reg_31__I_0_i32_3_lut_4_lut.init = 16'hfe10;
    LUT4 i2126_2_lut_4_lut (.A(n2038), .B(reg_fifo_data[5]), .C(n316), 
         .D(n6493), .Z(\gmii_txd_7__N_210[5] )) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2126_2_lut_4_lut.init = 16'h00ca;
    PFUMX mux_383_i1 (.BLUT(n14), .ALUT(t_data_7__N_92[0]), .C0(n5951), 
          .Z(n1215[0]));
    LUT4 i148_2_lut_rep_109_3_lut (.A(n312[0]), .B(n312[5]), .C(n425), 
         .Z(n6483)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i148_2_lut_rep_109_3_lut.init = 16'h1010;
    LUT4 i809_4_lut (.A(n317), .B(n5334), .C(n6472), .D(n6473), .Z(n1931)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i809_4_lut.init = 16'heece;
    LUT4 i841_2_lut_rep_110_3_lut (.A(n312[0]), .B(n312[5]), .C(n423), 
         .Z(n6484)) /* synthesis lut_function=(A+(B+!(C))) */ ;
    defparam i841_2_lut_rep_110_3_lut.init = 16'hefef;
    LUT4 i914_4_lut (.A(n6446), .B(t_data_7__N_84[6]), .C(n317), .D(n6497), 
         .Z(n2036)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i914_4_lut.init = 16'hcac0;
    LUT4 i2190_2_lut_rep_84_3_lut_4_lut (.A(n312[0]), .B(n312[5]), .C(\udp_tdata[2] ), 
         .D(n423), .Z(n6458)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2190_2_lut_rep_84_3_lut_4_lut.init = 16'h1000;
    LUT4 i1_3_lut_adj_262 (.A(\idx[4] ), .B(n6478), .C(\idx[2] ), .Z(n15)) /* synthesis lut_function=((B+(C))+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i1_3_lut_adj_262.init = 16'hfdfd;
    LUT4 i817_4_lut (.A(n318), .B(n5318), .C(n6472), .D(n15), .Z(n1939)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i817_4_lut.init = 16'heece;
    LUT4 crc_reg_31__I_0_i13_3_lut_4_lut (.A(n312[0]), .B(n312[5]), .C(\crc_next[12] ), 
         .D(\crc_reg[12] ), .Z(\next_crc_reg_31__N_390[12] )) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C))) */ ;
    defparam crc_reg_31__I_0_i13_3_lut_4_lut.init = 16'hfe10;
    LUT4 i819_4_lut (.A(n319), .B(n337), .C(n6472), .D(n15_adj_2), .Z(n1941)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i819_4_lut.init = 16'heece;
    LUT4 i79_2_lut (.A(reg_fifo_almostfull), .B(n312[0]), .Z(n337)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i79_2_lut.init = 16'h8888;
    LUT4 i2072_2_lut_rep_92_3_lut_4_lut (.A(n312[0]), .B(n312[5]), .C(\udp_tdata[0] ), 
         .D(n423), .Z(n6466)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2072_2_lut_rep_92_3_lut_4_lut.init = 16'h1000;
    LUT4 crc_reg_31__I_0_i10_3_lut_4_lut (.A(n312[0]), .B(n312[5]), .C(n6463), 
         .D(\crc_reg[9] ), .Z(\next_crc_reg_31__N_390[9] )) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C))) */ ;
    defparam crc_reg_31__I_0_i10_3_lut_4_lut.init = 16'hfe10;
    LUT4 i542_2_lut_rep_120 (.A(\idx[1] ), .B(idx[0]), .Z(n6494)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i542_2_lut_rep_120.init = 16'h8888;
    LUT4 i925_3_lut (.A(n2046), .B(reg_fifo_data[1]), .C(n316), .Z(\udp_tdata[1] )) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i925_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_rep_104_4_lut (.A(\idx[1] ), .B(idx[0]), .C(\idx[3] ), 
         .D(n2244), .Z(n6478)) /* synthesis lut_function=(((C+(D))+!B)+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_3_lut_rep_104_4_lut.init = 16'hfff7;
    LUT4 i915_3_lut_rep_88 (.A(n2036), .B(reg_fifo_data[6]), .C(n316), 
         .Z(n6462)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i915_3_lut_rep_88.init = 16'hcaca;
    LUT4 i1_2_lut_rep_111_3_lut (.A(\idx[1] ), .B(idx[0]), .C(\idx[2] ), 
         .Z(n6485)) /* synthesis lut_function=(A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_2_lut_rep_111_3_lut.init = 16'h8080;
    LUT4 n5280_bdd_4_lut_4_lut (.A(\idx[4] ), .B(n318), .C(n6150), .D(n6486), 
         .Z(n6449)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(130[24:50])
    defparam n5280_bdd_4_lut_4_lut.init = 16'h7430;
    LUT4 i4798_2_lut_rep_122 (.A(\idx[2] ), .B(\idx[3] ), .Z(n6496)) /* synthesis lut_function=(!(A+(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i4798_2_lut_rep_122.init = 16'h1111;
    LUT4 i1_2_lut_3_lut (.A(idx[0]), .B(\idx[1] ), .C(\idx[2] ), .Z(t_data_7__N_84[6])) /* synthesis lut_function=(!((B+(C))+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i1_2_lut_3_lut.init = 16'h0202;
    LUT4 idx_4__I_0_Mux_0_i14_4_lut_4_lut_3_lut (.A(idx[0]), .B(\idx[1] ), 
         .C(\idx[2] ), .Z(n14)) /* synthesis lut_function=(!(A (B+(C))+!A !(B (C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_4__I_0_Mux_0_i14_4_lut_4_lut_3_lut.init = 16'h4242;
    LUT4 i385_2_lut_rep_123 (.A(n319), .B(n318), .Z(n6497)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i385_2_lut_rep_123.init = 16'heeee;
    LUT4 i2186_2_lut_rep_82_4_lut (.A(n2036), .B(reg_fifo_data[6]), .C(n316), 
         .D(n6484), .Z(n6456)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2186_2_lut_rep_82_4_lut.init = 16'h00ca;
    LUT4 t_data_7__N_100_2__bdd_4_lut_4911_4_lut (.A(n319), .B(n318), .C(t_data_7__N_92[2]), 
         .D(t_data_7__N_100[2]), .Z(n6200)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (B (C))) */ ;
    defparam t_data_7__N_100_2__bdd_4_lut_4911_4_lut.init = 16'he2c0;
    LUT4 i1_2_lut_3_lut_adj_263 (.A(n319), .B(n318), .C(n317), .Z(n5625)) /* synthesis lut_function=(!(A (C)+!A ((C)+!B))) */ ;
    defparam i1_2_lut_3_lut_adj_263.init = 16'h0e0e;
    LUT4 i2120_4_lut_4_lut (.A(n319), .B(n318), .C(t_data_7__N_92[4]), 
         .D(n6), .Z(n1235[4])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A (B (C))) */ ;
    defparam i2120_4_lut_4_lut.init = 16'hc0e2;
    LUT4 i2123_2_lut_3_lut (.A(n319), .B(n318), .C(n6449), .Z(n1235[1])) /* synthesis lut_function=(A (C)+!A (B (C))) */ ;
    defparam i2123_2_lut_3_lut.init = 16'he0e0;
    LUT4 i916_4_lut (.A(n1215[5]), .B(\t_data_7__N_84[5] ), .C(n317), 
         .D(n6497), .Z(n2038)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i916_4_lut.init = 16'hcac0;
    PFUMX i5036 (.BLUT(n6522), .ALUT(n6523), .C0(idx[0]), .Z(n6524));
    PFUMX i5032 (.BLUT(n6516), .ALUT(n6517), .C0(\idx[4] ), .Z(t_data_7__N_92[2]));
    
endmodule
//
// Verilog Description of module rgmii_tx_ddr
//

module rgmii_tx_ddr (clk_c, rst_c, gmii_txd, buf_douto3, buf_douto2, 
            buf_douto1, buf_douto0, GND_net, VCC_net, buf_clkout, 
            ctl_reg, buf_douto4);
    input clk_c;
    input rst_c;
    input [7:0]gmii_txd;
    output buf_douto3;
    output buf_douto2;
    output buf_douto1;
    output buf_douto0;
    input GND_net;
    input VCC_net;
    output buf_clkout;
    input ctl_reg;
    output buf_douto4;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    
    DDR_forRGMII DDR_TX (.clk_c(clk_c), .rst_c(rst_c), .gmii_txd({gmii_txd}), 
            .buf_douto3(buf_douto3), .buf_douto2(buf_douto2), .buf_douto1(buf_douto1), 
            .buf_douto0(buf_douto0), .GND_net(GND_net), .VCC_net(VCC_net), 
            .buf_clkout(buf_clkout), .ctl_reg(ctl_reg), .buf_douto4(buf_douto4)) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/rgmii_withddr.vhd(35[13:37])
    
endmodule
//
// Verilog Description of module DDR_forRGMII
//

module DDR_forRGMII (clk_c, rst_c, gmii_txd, buf_douto3, buf_douto2, 
            buf_douto1, buf_douto0, GND_net, VCC_net, buf_clkout, 
            ctl_reg, buf_douto4) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    input rst_c;
    input [7:0]gmii_txd;
    output buf_douto3;
    output buf_douto2;
    output buf_douto1;
    output buf_douto0;
    input GND_net;
    input VCC_net;
    output buf_clkout;
    input ctl_reg;
    output buf_douto4;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    
    ODDRX1F Inst4_ODDRX1F3 (.D0(gmii_txd[3]), .D1(gmii_txd[7]), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto3)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F3.GSR = "ENABLED";
    ODDRX1F Inst4_ODDRX1F2 (.D0(gmii_txd[2]), .D1(gmii_txd[6]), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto2)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F2.GSR = "ENABLED";
    ODDRX1F Inst4_ODDRX1F1 (.D0(gmii_txd[1]), .D1(gmii_txd[5]), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto1)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F1.GSR = "ENABLED";
    ODDRX1F Inst4_ODDRX1F0 (.D0(gmii_txd[0]), .D1(gmii_txd[4]), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto0)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F0.GSR = "ENABLED";
    ODDRX1F Inst3_ODDRX1F (.D0(VCC_net), .D1(GND_net), .SCLK(clk_c), .RST(rst_c), 
            .Q(buf_clkout)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/rgmii_withddr.vhd(35[13:37])
    defparam Inst3_ODDRX1F.GSR = "ENABLED";
    ODDRX1F Inst4_ODDRX1F4 (.D0(ctl_reg), .D1(ctl_reg), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto4)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=39, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F4.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module fifo_udp_reg
//

module fifo_udp_reg (reg_fifo_data, clk_c, cnt, reg_fifo_almostfull, 
            fifo_almostfull, reg_fifo_empty, fifo_empty);
    output [7:0]reg_fifo_data;
    input clk_c;
    input [7:0]cnt;
    output reg_fifo_almostfull;
    input fifo_almostfull;
    output reg_fifo_empty;
    input fifo_empty;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    
    FD1S3AX data_reg_i0 (.D(cnt[0]), .CK(clk_c), .Q(reg_fifo_data[0])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i0.GSR = "ENABLED";
    FD1S3AX almostfull_reg_14 (.D(fifo_almostfull), .CK(clk_c), .Q(reg_fifo_almostfull)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam almostfull_reg_14.GSR = "ENABLED";
    FD1S3AY empty_reg_13 (.D(fifo_empty), .CK(clk_c), .Q(reg_fifo_empty)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam empty_reg_13.GSR = "ENABLED";
    FD1S3AX data_reg_i7 (.D(cnt[7]), .CK(clk_c), .Q(reg_fifo_data[7])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i7.GSR = "ENABLED";
    FD1S3AX data_reg_i6 (.D(cnt[6]), .CK(clk_c), .Q(reg_fifo_data[6])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i6.GSR = "ENABLED";
    FD1S3AX data_reg_i5 (.D(cnt[5]), .CK(clk_c), .Q(reg_fifo_data[5])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i5.GSR = "ENABLED";
    FD1S3AX data_reg_i4 (.D(cnt[4]), .CK(clk_c), .Q(reg_fifo_data[4])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i4.GSR = "ENABLED";
    FD1S3AX data_reg_i3 (.D(cnt[3]), .CK(clk_c), .Q(reg_fifo_data[3])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i3.GSR = "ENABLED";
    FD1S3AX data_reg_i2 (.D(cnt[2]), .CK(clk_c), .Q(reg_fifo_data[2])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i2.GSR = "ENABLED";
    FD1S3AX data_reg_i1 (.D(cnt[1]), .CK(clk_c), .Q(reg_fifo_data[1])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=50, LSE_RLINE=50 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i1.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module MAC_AXItoRGMII
//

module MAC_AXItoRGMII (n424, \udp_tdata[0] , n423, n6493, frame_len, 
            clk_c, rst_c, n425, \udp_tdata[1] , n6484, n6488, \next_crc_reg_31__N_390[12] , 
            \crc_next[12] , n6468, n6462, \next_crc_reg_31__N_390[9] , 
            \udp_tdata[2] , n6461, \udp_tdata[4] , n6479, n399, n6469, 
            clk_c_enable_19, GND_net, VCC_net, \frame_len[29] , \frame_len[30] , 
            \crc_reg[9] , n395, \crc_reg[12] , n6492, \frame_len[27] , 
            \frame_len[28] , \frame_len[25] , \frame_len[26] , \frame_len[23] , 
            \frame_len[24] , \frame_len[21] , \frame_len[22] , \crc_reg[31] , 
            \frame_len[19] , \frame_len[20] , ctl_reg, \frame_len[17] , 
            \frame_len[18] , \frame_len[6] , \frame_len[7] , \frame_len[8] , 
            \frame_len[9] , \frame_len[10] , \frame_len[11] , \frame_len[12] , 
            \frame_len[13] , \frame_len[14] , \frame_len[15] , \frame_len[16] , 
            gmii_txd, \gmii_txd_7__N_210[1] , \gmii_txd_7__N_210[5] , 
            \gmii_txd_7__N_210[3] , n6463, n6472, n319, n15, n5318, 
            n318, n15_adj_1, n5334, \next_crc_reg_31__N_390[31] , \crc_next[31] , 
            n6456, n6460, n6457, n6458, n6466, n6464, \idx[4] , 
            \idx[3] , \idx[2] , \idx[1] , n6467, \reg_fifo_data[3] , 
            n316, n6497, \t_data_7__N_84[5] , n317, \t_data_7__N_100[3] , 
            \idx[0] );
    output n424;
    input \udp_tdata[0] ;
    output n423;
    input n6493;
    output [31:0]frame_len;
    input clk_c;
    input rst_c;
    output n425;
    input \udp_tdata[1] ;
    input n6484;
    output n6488;
    input \next_crc_reg_31__N_390[12] ;
    output \crc_next[12] ;
    input n6468;
    input n6462;
    input \next_crc_reg_31__N_390[9] ;
    input \udp_tdata[2] ;
    input n6461;
    input \udp_tdata[4] ;
    input n6479;
    input n399;
    input n6469;
    input clk_c_enable_19;
    input GND_net;
    input VCC_net;
    output \frame_len[29] ;
    output \frame_len[30] ;
    output \crc_reg[9] ;
    input n395;
    output \crc_reg[12] ;
    input n6492;
    output \frame_len[27] ;
    output \frame_len[28] ;
    output \frame_len[25] ;
    output \frame_len[26] ;
    output \frame_len[23] ;
    output \frame_len[24] ;
    output \frame_len[21] ;
    output \frame_len[22] ;
    output \crc_reg[31] ;
    output \frame_len[19] ;
    output \frame_len[20] ;
    output ctl_reg;
    output \frame_len[17] ;
    output \frame_len[18] ;
    output \frame_len[6] ;
    output \frame_len[7] ;
    output \frame_len[8] ;
    output \frame_len[9] ;
    output \frame_len[10] ;
    output \frame_len[11] ;
    output \frame_len[12] ;
    output \frame_len[13] ;
    output \frame_len[14] ;
    output \frame_len[15] ;
    output \frame_len[16] ;
    output [7:0]gmii_txd;
    input \gmii_txd_7__N_210[1] ;
    input \gmii_txd_7__N_210[5] ;
    input \gmii_txd_7__N_210[3] ;
    output n6463;
    output n6472;
    input n319;
    input n15;
    output n5318;
    input n318;
    input n15_adj_1;
    output n5334;
    input \next_crc_reg_31__N_390[31] ;
    output \crc_next[31] ;
    input n6456;
    input n6460;
    input n6457;
    input n6458;
    input n6466;
    input n6464;
    input \idx[4] ;
    input \idx[3] ;
    input \idx[2] ;
    input \idx[1] ;
    input n6467;
    input \reg_fifo_data[3] ;
    input n316;
    input n6497;
    input \t_data_7__N_84[5] ;
    input n317;
    input \t_data_7__N_100[3] ;
    input \idx[0] ;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/top_ethernet_tx_tbfpga.vhd(7[9:12])
    
    wire n1965;
    wire [31:0]crc_reg;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(55[12:19])
    wire [31:0]crc_next;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(57[12:20])
    
    wire n2, n6500, n6297;
    wire [1:0]crc_cnt;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(48[12:19])
    
    wire n6117, n2_adj_683, n5419;
    wire [7:0]n417;
    wire [31:0]next_crc_reg;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(55[21:33])
    
    wire n6377;
    wire [1:0]next_crc_cnt;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(48[21:33])
    
    wire n1952;
    wire [3:0]ifg_cnt;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(49[12:19])
    wire [3:0]next_ifg_cnt_3__N_513;
    
    wire n6495, n5439, n6118, n2_adj_684, n5519, n6491, n5705, 
        n6296;
    wire [5:0]next_pad_cnt;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(47[21:33])
    
    wire n2_adj_685, n5395, n1954, n2_adj_686, n5653, clk_c_enable_17, 
        n1334, n2_adj_687, n5675, n5643, n5567, n2_adj_688, n5721, 
        n2_adj_689, n5415, n6393, n6392, n5499, n3, n5691, n6455, 
        n2_adj_690, n5697, n2_adj_691, n5741, n2_adj_692, n5737, 
        n3_adj_693, n5749, n6453, n2_adj_694, n5539, n2_adj_695, 
        n5405, n2_adj_696, n5547;
    wire [5:0]pad_cnt;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(47[12:19])
    
    wire n6520, n2400, n9, n6519, n2265, n2_adj_697, n5617, n6339, 
        n6338, n11, n5777, n6465, n2_adj_698, n5543, n1958, n5399, 
        n6474, n6332, n2250, n2_adj_699, n5627, n6452, clk_c_enable_8;
    wire [2:0]pre_cnt;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(46[12:19])
    
    wire n4899, n4461, n1312;
    wire [31:0]n133;
    
    wire n6481, n2_adj_700, n5559, n6349, n6350, n2_adj_701, n5391;
    wire [3:0]n1;
    
    wire n2_adj_703, n5463, n6487, n3184, n2_adj_704, n5467;
    wire [31:0]frame_len_c;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(51[12:21])
    
    wire n6385, n4460, n6454, n2_adj_705, n5609, n2_adj_706, n5575, 
        n1962, n6352, n6353, n2_adj_707, n5487, n1956, n6221, 
        n6220;
    wire [7:0]gmii_txd_7__N_202;
    
    wire n6378, n6506, n2_adj_708, n5683, n2_adj_709, n2_adj_710, 
        n5671, n2_adj_711, n5579, n4459, n4458, n5287, n4457, 
        n4456, n4455, clk_c_enable_9, n4923, n4907, n4, n6438, 
        n4454, n5701, n6507, n6439, n5757, n4453, n4452, n4451, 
        n2012, n6477, n4450, n4449, n4448, n4447, n4446, n1959, 
        n6476, n6509, n5553, n5124, n5379, n5, n5881, n5891, 
        n5889, n2014, n2018, n3_adj_713, n5867, n5865, n2_adj_714, 
        n2016;
    
    LUT4 i843_4_lut (.A(n424), .B(\udp_tdata[0] ), .C(n423), .D(n6493), 
         .Z(n1965)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i843_4_lut.init = 16'h0aca;
    LUT4 select_339_Select_20_i2_4_lut (.A(crc_reg[20]), .B(n423), .C(crc_next[20]), 
         .D(n6493), .Z(n2)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_20_i2_4_lut.init = 16'h88c0;
    LUT4 n8_bdd_3_lut_4_lut (.A(frame_len[3]), .B(n6500), .C(frame_len[4]), 
         .D(frame_len[5]), .Z(n6297)) /* synthesis lut_function=(A (B (C (D)+!C !(D))+!B !(D))+!A !(D)) */ ;
    defparam n8_bdd_3_lut_4_lut.init = 16'h807f;
    LUT4 crc_reg_18__bdd_3_lut_4839 (.A(crc_reg[18]), .B(crc_cnt[0]), .C(crc_reg[26]), 
         .Z(n6117)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_18__bdd_3_lut_4839.init = 16'h1d1d;
    LUT4 i1_4_lut (.A(crc_next[19]), .B(n2_adj_683), .C(n5419), .D(n417[3]), 
         .Z(next_crc_reg[19])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut.init = 16'hfefc;
    LUT4 crc_reg_20__bdd_3_lut_4984 (.A(crc_reg[20]), .B(crc_cnt[0]), .C(crc_reg[28]), 
         .Z(n6377)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_20__bdd_3_lut_4984.init = 16'h1d1d;
    FD1S3IX crc_cnt__i0 (.D(next_crc_cnt[0]), .CK(clk_c), .CD(rst_c), 
            .Q(crc_cnt[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_cnt__i0.GSR = "DISABLED";
    LUT4 select_339_Select_19_i2_4_lut (.A(crc_reg[19]), .B(n423), .C(crc_next[19]), 
         .D(n6493), .Z(n2_adj_683)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_19_i2_4_lut.init = 16'h88c0;
    FD1S3JX crc_reg_i0 (.D(next_crc_reg[0]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[0])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i0.GSR = "DISABLED";
    FD1S3JX state_FSM_i1 (.D(n1952), .CK(clk_c), .PD(rst_c), .Q(n425));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i1.GSR = "DISABLED";
    LUT4 i667_2_lut (.A(ifg_cnt[1]), .B(ifg_cnt[0]), .Z(next_ifg_cnt_3__N_513[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(246[37:44])
    defparam i667_2_lut.init = 16'h6666;
    LUT4 i1_3_lut_4_lut (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[22]), 
         .Z(n5439)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut.init = 16'hfef0;
    LUT4 crc_reg_18__bdd_3_lut (.A(crc_reg[2]), .B(crc_reg[10]), .C(crc_cnt[0]), 
         .Z(n6118)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_18__bdd_3_lut.init = 16'h3535;
    LUT4 i1_4_lut_adj_157 (.A(crc_next[18]), .B(n2_adj_684), .C(n5519), 
         .D(n417[3]), .Z(next_crc_reg[18])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_157.init = 16'hfefc;
    LUT4 select_339_Select_18_i2_4_lut (.A(crc_reg[18]), .B(n423), .C(crc_next[18]), 
         .D(n6493), .Z(n2_adj_684)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_18_i2_4_lut.init = 16'h88c0;
    LUT4 i1_2_lut_3_lut_4_lut (.A(\udp_tdata[1] ), .B(n6484), .C(crc_reg[6]), 
         .D(n6491), .Z(n5705)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h2dd2;
    PFUMX i4936 (.BLUT(n6297), .ALUT(n6296), .C0(n417[3]), .Z(next_pad_cnt[5]));
    LUT4 i1_4_lut_adj_158 (.A(crc_next[17]), .B(n2_adj_685), .C(n5395), 
         .D(n417[3]), .Z(next_crc_reg[17])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_158.init = 16'hfefc;
    LUT4 select_339_Select_17_i2_4_lut (.A(crc_reg[17]), .B(n423), .C(crc_next[17]), 
         .D(n6493), .Z(n2_adj_685)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_17_i2_4_lut.init = 16'h88c0;
    LUT4 i832_3_lut_4_lut (.A(n6493), .B(n425), .C(n6488), .D(n424), 
         .Z(n1954)) /* synthesis lut_function=(!(A (C+!(D))+!A !(B+!(C+!(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i832_3_lut_4_lut.init = 16'h4f44;
    LUT4 i1_4_lut_adj_159 (.A(crc_next[16]), .B(n2_adj_686), .C(n5653), 
         .D(n417[3]), .Z(next_crc_reg[16])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_159.init = 16'hfefc;
    FD1P3IX ifg_cnt__i2 (.D(next_ifg_cnt_3__N_513[2]), .SP(clk_c_enable_17), 
            .CD(n1334), .CK(clk_c), .Q(ifg_cnt[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam ifg_cnt__i2.GSR = "DISABLED";
    LUT4 select_339_Select_16_i2_4_lut (.A(crc_reg[16]), .B(n423), .C(crc_next[16]), 
         .D(n6493), .Z(n2_adj_686)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_16_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_160 (.A(crc_next[15]), .B(n2_adj_687), .C(n5675), 
         .D(n417[3]), .Z(next_crc_reg[15])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_160.init = 16'hfefc;
    LUT4 select_339_Select_15_i2_4_lut (.A(crc_reg[15]), .B(n423), .C(crc_next[15]), 
         .D(n6493), .Z(n2_adj_687)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_15_i2_4_lut.init = 16'h88c0;
    LUT4 i1_3_lut_4_lut_adj_161 (.A(\udp_tdata[1] ), .B(n6484), .C(crc_reg[5]), 
         .D(n5643), .Z(n5567)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_161.init = 16'h2dd2;
    LUT4 i1_4_lut_adj_162 (.A(crc_next[14]), .B(n2_adj_688), .C(n5721), 
         .D(n417[3]), .Z(next_crc_reg[14])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_162.init = 16'hfefc;
    LUT4 select_339_Select_14_i2_4_lut (.A(crc_reg[14]), .B(n423), .C(crc_next[14]), 
         .D(n6493), .Z(n2_adj_688)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_14_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_163 (.A(crc_next[13]), .B(n2_adj_689), .C(n5415), 
         .D(n417[3]), .Z(next_crc_reg[13])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_163.init = 16'hfefc;
    LUT4 select_339_Select_13_i2_4_lut (.A(crc_reg[13]), .B(n423), .C(crc_next[13]), 
         .D(n6493), .Z(n2_adj_689)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_13_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_16__bdd_3_lut (.A(crc_reg[0]), .B(crc_reg[8]), .C(crc_cnt[0]), 
         .Z(n6393)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_16__bdd_3_lut.init = 16'h3535;
    LUT4 crc_reg_16__bdd_3_lut_4994 (.A(crc_reg[16]), .B(crc_cnt[0]), .C(crc_reg[24]), 
         .Z(n6392)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_16__bdd_3_lut_4994.init = 16'h1d1d;
    LUT4 i1_3_lut_4_lut_adj_164 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[20]), 
         .Z(n5499)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_164.init = 16'hfef0;
    LUT4 i1_4_lut_adj_165 (.A(n3), .B(\next_crc_reg_31__N_390[12] ), .C(n5691), 
         .D(n423), .Z(next_crc_reg[12])) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_165.init = 16'hfefa;
    LUT4 select_339_Select_12_i3_2_lut (.A(\crc_next[12] ), .B(n417[3]), 
         .Z(n3)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_12_i3_2_lut.init = 16'h8888;
    LUT4 i1_3_lut_4_lut_adj_166 (.A(n6468), .B(n6484), .C(crc_reg[19]), 
         .D(crc_reg[3]), .Z(crc_next[11])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_166.init = 16'h2dd2;
    LUT4 i1_2_lut_rep_81_3_lut_4_lut (.A(n6493), .B(n423), .C(crc_reg[6]), 
         .D(n6462), .Z(n6455)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_81_3_lut_4_lut.init = 16'hb4f0;
    LUT4 i1_4_lut_adj_167 (.A(crc_next[11]), .B(n2_adj_690), .C(n5697), 
         .D(n417[3]), .Z(next_crc_reg[11])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_167.init = 16'hfefc;
    LUT4 select_339_Select_11_i2_4_lut (.A(crc_reg[11]), .B(n423), .C(crc_next[11]), 
         .D(n6493), .Z(n2_adj_690)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_11_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_168 (.A(crc_next[0]), .B(n2_adj_691), .C(n5741), 
         .D(n417[3]), .Z(next_crc_reg[0])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_168.init = 16'hfefc;
    LUT4 i1_4_lut_adj_169 (.A(crc_next[10]), .B(n2_adj_692), .C(n5737), 
         .D(n417[3]), .Z(next_crc_reg[10])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_169.init = 16'hfefc;
    LUT4 select_339_Select_10_i2_4_lut (.A(crc_reg[10]), .B(n423), .C(crc_next[10]), 
         .D(n6493), .Z(n2_adj_692)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_10_i2_4_lut.init = 16'h88c0;
    LUT4 select_339_Select_0_i2_4_lut (.A(crc_reg[0]), .B(n423), .C(crc_next[0]), 
         .D(n6493), .Z(n2_adj_691)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_0_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_170 (.A(n3_adj_693), .B(\next_crc_reg_31__N_390[9] ), 
         .C(n5749), .D(n423), .Z(next_crc_reg[9])) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_170.init = 16'hfefa;
    LUT4 i1_2_lut_rep_79_3_lut_4_lut (.A(n6493), .B(n423), .C(n6491), 
         .D(\udp_tdata[1] ), .Z(n6453)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_79_3_lut_4_lut.init = 16'hb4f0;
    LUT4 i1_4_lut_adj_171 (.A(crc_next[8]), .B(n2_adj_694), .C(n5539), 
         .D(n417[3]), .Z(next_crc_reg[8])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_171.init = 16'hfefc;
    LUT4 select_339_Select_8_i2_4_lut (.A(crc_reg[8]), .B(n423), .C(crc_next[8]), 
         .D(n6493), .Z(n2_adj_694)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_8_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_172 (.A(crc_next[29]), .B(n2_adj_695), .C(n5405), 
         .D(n417[3]), .Z(next_crc_reg[29])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_172.init = 16'hfefc;
    LUT4 select_339_Select_29_i2_4_lut (.A(crc_reg[29]), .B(n423), .C(crc_next[29]), 
         .D(n6493), .Z(n2_adj_695)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_29_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_173 (.A(crc_next[7]), .B(n2_adj_696), .C(n5547), 
         .D(n417[3]), .Z(next_crc_reg[7])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_173.init = 16'hfefc;
    LUT4 select_339_Select_7_i2_4_lut (.A(crc_reg[7]), .B(n423), .C(crc_next[7]), 
         .D(n6493), .Z(n2_adj_696)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_7_i2_4_lut.init = 16'h88c0;
    LUT4 pad_cnt_2__bdd_4_lut_then_3_lut (.A(pad_cnt[2]), .B(pad_cnt[0]), 
         .C(pad_cnt[1]), .Z(n6520)) /* synthesis lut_function=(A (B+(C))+!A !(B+(C))) */ ;
    defparam pad_cnt_2__bdd_4_lut_then_3_lut.init = 16'ha9a9;
    LUT4 i1278_3_lut_4_lut (.A(n6493), .B(n423), .C(\udp_tdata[0] ), .D(\udp_tdata[2] ), 
         .Z(n2400)) /* synthesis lut_function=(!(A+((C (D)+!C !(D))+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1278_3_lut_4_lut.init = 16'h0440;
    LUT4 i3_2_lut_3_lut_4_lut (.A(n6493), .B(n423), .C(crc_reg[5]), .D(n6461), 
         .Z(n9)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i3_2_lut_3_lut_4_lut.init = 16'hb4f0;
    LUT4 pad_cnt_2__bdd_4_lut_else_3_lut (.A(frame_len[1]), .B(frame_len[2]), 
         .Z(n6519)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam pad_cnt_2__bdd_4_lut_else_3_lut.init = 16'h6666;
    LUT4 i1_2_lut_3_lut_4_lut_adj_174 (.A(n6493), .B(n423), .C(crc_reg[3]), 
         .D(n6468), .Z(n2265)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_3_lut_4_lut_adj_174.init = 16'hb4f0;
    LUT4 i1_4_lut_adj_175 (.A(crc_next[6]), .B(n2_adj_697), .C(n5617), 
         .D(n417[3]), .Z(next_crc_reg[6])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_175.init = 16'hfefc;
    LUT4 select_339_Select_6_i2_4_lut (.A(crc_reg[6]), .B(n423), .C(crc_next[6]), 
         .D(n6493), .Z(n2_adj_697)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_6_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_19__bdd_3_lut (.A(crc_reg[3]), .B(crc_reg[11]), .C(crc_cnt[0]), 
         .Z(n6339)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_19__bdd_3_lut.init = 16'h3535;
    LUT4 crc_reg_19__bdd_3_lut_4961 (.A(crc_reg[19]), .B(crc_cnt[0]), .C(crc_reg[27]), 
         .Z(n6338)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_19__bdd_3_lut_4961.init = 16'h1d1d;
    LUT4 i1_3_lut_4_lut_adj_176 (.A(n417[3]), .B(n11), .C(n425), .D(n6495), 
         .Z(n5777)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_176.init = 16'hfff8;
    LUT4 i1_3_lut_rep_91_4_lut (.A(n6493), .B(n423), .C(\udp_tdata[4] ), 
         .D(crc_reg[4]), .Z(n6465)) /* synthesis lut_function=(A (D)+!A !(B (C (D)+!C !(D))+!B !(D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_rep_91_4_lut.init = 16'hbf40;
    LUT4 i1_4_lut_adj_177 (.A(crc_next[28]), .B(n2_adj_698), .C(n5543), 
         .D(n417[3]), .Z(next_crc_reg[28])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_177.init = 16'hfefc;
    LUT4 select_339_Select_28_i2_4_lut (.A(crc_reg[28]), .B(n423), .C(crc_next[28]), 
         .D(n6493), .Z(n2_adj_698)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_28_i2_4_lut.init = 16'h88c0;
    LUT4 i836_2_lut_3_lut_4_lut (.A(n417[3]), .B(n11), .C(n6479), .D(n399), 
         .Z(n1958)) /* synthesis lut_function=(A (B+!((D)+!C))+!A !((D)+!C)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i836_2_lut_3_lut_4_lut.init = 16'h88f8;
    LUT4 i1_2_lut_3_lut_4_lut_adj_178 (.A(n6493), .B(n423), .C(crc_reg[6]), 
         .D(\udp_tdata[0] ), .Z(n5399)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_3_lut_4_lut_adj_178.init = 16'hb4f0;
    LUT4 n8_bdd_4_lut (.A(n6474), .B(pad_cnt[4]), .C(n6332), .D(n417[3]), 
         .Z(next_pad_cnt[4])) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !(B ((D)+!C)+!B !(C+(D)))) */ ;
    defparam n8_bdd_4_lut.init = 16'h99f0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_179 (.A(n6493), .B(n423), .C(crc_reg[7]), 
         .D(n6469), .Z(n2250)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_3_lut_4_lut_adj_179.init = 16'hb4f0;
    FD1P3IX ifg_cnt__i1 (.D(next_ifg_cnt_3__N_513[1]), .SP(clk_c_enable_17), 
            .CD(n1334), .CK(clk_c), .Q(ifg_cnt[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam ifg_cnt__i1.GSR = "DISABLED";
    LUT4 i1_4_lut_adj_180 (.A(crc_next[5]), .B(n2_adj_699), .C(n5627), 
         .D(n417[3]), .Z(next_crc_reg[5])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_180.init = 16'hfefc;
    LUT4 i1310_4_lut_4_lut (.A(n6452), .B(n417[3]), .C(n11), .D(rst_c), 
         .Z(clk_c_enable_8)) /* synthesis lut_function=(A ((C+(D))+!B)+!A (B (C+(D))+!B (D))) */ ;
    defparam i1310_4_lut_4_lut.init = 16'hffe2;
    FD1P3IX pre_cnt__i0 (.D(n4899), .SP(clk_c_enable_19), .CD(rst_c), 
            .CK(clk_c), .Q(pre_cnt[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pre_cnt__i0.GSR = "DISABLED";
    LUT4 select_339_Select_5_i2_4_lut (.A(crc_reg[5]), .B(n423), .C(crc_next[5]), 
         .D(n6493), .Z(n2_adj_699)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_5_i2_4_lut.init = 16'h88c0;
    CCU2C frame_len_457_add_4_33 (.A0(frame_len[31]), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n4461), .S0(n133[31]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_33.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_33.INIT1 = 16'h0000;
    defparam frame_len_457_add_4_33.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_33.INJECT1_1 = "NO";
    LUT4 n8_bdd_3_lut_4935_4_lut (.A(pad_cnt[3]), .B(n6481), .C(pad_cnt[4]), 
         .D(pad_cnt[5]), .Z(n6296)) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(211[37:44])
    defparam n8_bdd_3_lut_4935_4_lut.init = 16'hfe01;
    LUT4 i1_4_lut_adj_181 (.A(crc_next[27]), .B(n2_adj_700), .C(n5559), 
         .D(n417[3]), .Z(next_crc_reg[27])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_181.init = 16'hfefc;
    LUT4 select_339_Select_27_i2_4_lut (.A(crc_reg[27]), .B(n423), .C(crc_next[27]), 
         .D(n6493), .Z(n2_adj_700)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_27_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_21__bdd_3_lut_4968 (.A(crc_reg[21]), .B(crc_cnt[0]), .C(crc_reg[29]), 
         .Z(n6349)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_21__bdd_3_lut_4968.init = 16'h1d1d;
    LUT4 crc_reg_21__bdd_3_lut (.A(crc_reg[5]), .B(crc_reg[13]), .C(crc_cnt[0]), 
         .Z(n6350)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_21__bdd_3_lut.init = 16'h3535;
    LUT4 i1_4_lut_adj_182 (.A(crc_next[26]), .B(n2_adj_701), .C(n5391), 
         .D(n417[3]), .Z(next_crc_reg[26])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_182.init = 16'hfefc;
    LUT4 select_339_Select_26_i2_4_lut (.A(crc_reg[26]), .B(n423), .C(crc_next[26]), 
         .D(n6493), .Z(n2_adj_701)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_26_i2_4_lut.init = 16'h88c0;
    FD1S3IX ifg_cnt__i0 (.D(n1[0]), .CK(clk_c), .CD(n1334), .Q(ifg_cnt[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam ifg_cnt__i0.GSR = "DISABLED";
    LUT4 i1_4_lut_adj_183 (.A(crc_next[25]), .B(n2_adj_703), .C(n5463), 
         .D(n417[3]), .Z(next_crc_reg[25])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_183.init = 16'hfefc;
    LUT4 select_339_Select_25_i2_4_lut (.A(crc_reg[25]), .B(n423), .C(crc_next[25]), 
         .D(n6493), .Z(n2_adj_703)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_25_i2_4_lut.init = 16'h88c0;
    LUT4 i1_3_lut_rep_97_4_lut (.A(n6487), .B(n417[5]), .C(rst_c), .D(n3184), 
         .Z(clk_c_enable_17)) /* synthesis lut_function=(A ((C+(D))+!B)+!A (C+(D))) */ ;
    defparam i1_3_lut_rep_97_4_lut.init = 16'hfff2;
    LUT4 i1_4_lut_adj_184 (.A(crc_next[4]), .B(n2_adj_704), .C(n5467), 
         .D(n417[3]), .Z(next_crc_reg[4])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_184.init = 16'hfefc;
    FD1S3IX frame_len_457__i0 (.D(n133[0]), .CK(clk_c), .CD(rst_c), .Q(frame_len_c[0])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i0.GSR = "DISABLED";
    LUT4 n6_bdd_4_lut (.A(n6481), .B(pad_cnt[3]), .C(n6385), .D(n417[3]), 
         .Z(next_pad_cnt[3])) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !(B ((D)+!C)+!B !(C+(D)))) */ ;
    defparam n6_bdd_4_lut.init = 16'h99f0;
    LUT4 i1_3_lut_4_lut_adj_185 (.A(\udp_tdata[2] ), .B(n6484), .C(crc_reg[8]), 
         .D(crc_reg[2]), .Z(crc_next[0])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_185.init = 16'h2dd2;
    LUT4 select_339_Select_4_i2_4_lut (.A(crc_reg[4]), .B(n423), .C(crc_next[4]), 
         .D(n6493), .Z(n2_adj_704)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_4_i2_4_lut.init = 16'h88c0;
    CCU2C frame_len_457_add_4_31 (.A0(\frame_len[29] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[30] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4460), .COUT(n4461), .S0(n133[29]), .S1(n133[30]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_31.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_31.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_31.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_31.INJECT1_1 = "NO";
    LUT4 i1_3_lut_rep_80_4_lut (.A(\udp_tdata[2] ), .B(n6484), .C(crc_reg[1]), 
         .D(crc_reg[2]), .Z(n6454)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_rep_80_4_lut.init = 16'h2dd2;
    LUT4 i1_3_lut_4_lut_adj_186 (.A(\udp_tdata[2] ), .B(n6484), .C(crc_reg[18]), 
         .D(crc_reg[2]), .Z(crc_next[10])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_186.init = 16'h2dd2;
    LUT4 i1_4_lut_adj_187 (.A(crc_next[3]), .B(n2_adj_705), .C(n5609), 
         .D(n417[3]), .Z(next_crc_reg[3])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_187.init = 16'hfefc;
    LUT4 i1_4_lut_adj_188 (.A(crc_next[24]), .B(n2_adj_706), .C(n5575), 
         .D(n417[3]), .Z(next_crc_reg[24])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_188.init = 16'hfefc;
    FD1S3IX state_FSM_i6 (.D(n1962), .CK(clk_c), .CD(rst_c), .Q(n417[5]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i6.GSR = "DISABLED";
    LUT4 select_339_Select_24_i2_4_lut (.A(crc_reg[24]), .B(n423), .C(crc_next[24]), 
         .D(n6493), .Z(n2_adj_706)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_24_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_17__bdd_3_lut_4971 (.A(crc_reg[17]), .B(crc_cnt[0]), .C(crc_reg[25]), 
         .Z(n6352)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_17__bdd_3_lut_4971.init = 16'h1d1d;
    LUT4 select_339_Select_3_i2_4_lut (.A(crc_reg[3]), .B(n423), .C(crc_next[3]), 
         .D(n6493), .Z(n2_adj_705)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_3_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_17__bdd_3_lut (.A(crc_reg[1]), .B(\crc_reg[9] ), .C(crc_cnt[0]), 
         .Z(n6353)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_17__bdd_3_lut.init = 16'h3535;
    LUT4 i1_4_lut_adj_189 (.A(crc_next[23]), .B(n2_adj_707), .C(n5487), 
         .D(n417[3]), .Z(next_crc_reg[23])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_189.init = 16'hfefc;
    LUT4 i834_3_lut_4_lut (.A(n6488), .B(n424), .C(n395), .D(n423), 
         .Z(n1956)) /* synthesis lut_function=(A (B+(C (D)))+!A (C (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i834_3_lut_4_lut.init = 16'hf888;
    PFUMX i4895 (.BLUT(n6221), .ALUT(n6220), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_202[6]));
    LUT4 select_339_Select_23_i2_4_lut (.A(crc_reg[23]), .B(n423), .C(crc_next[23]), 
         .D(n6493), .Z(n2_adj_707)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_23_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_20__bdd_3_lut (.A(crc_reg[4]), .B(\crc_reg[12] ), .C(crc_cnt[0]), 
         .Z(n6378)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_20__bdd_3_lut.init = 16'h3535;
    LUT4 i433_2_lut_3_lut_4_lut (.A(n6506), .B(n417[4]), .C(rst_c), .D(n417[5]), 
         .Z(n1334)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))+!A (C)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i433_2_lut_3_lut_4_lut.init = 16'hf0f8;
    LUT4 i1_4_lut_adj_190 (.A(crc_next[2]), .B(n2_adj_708), .C(n5683), 
         .D(n417[3]), .Z(next_crc_reg[2])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_190.init = 16'hfefc;
    LUT4 i1_4_lut_adj_191 (.A(crc_next[22]), .B(n2_adj_709), .C(n5439), 
         .D(n417[3]), .Z(next_crc_reg[22])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_191.init = 16'hfefc;
    LUT4 select_339_Select_22_i2_4_lut (.A(crc_reg[22]), .B(n423), .C(crc_next[22]), 
         .D(n6493), .Z(n2_adj_709)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_22_i2_4_lut.init = 16'h88c0;
    LUT4 select_339_Select_2_i2_4_lut (.A(crc_reg[2]), .B(n423), .C(crc_next[2]), 
         .D(n6493), .Z(n2_adj_708)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_2_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_192 (.A(crc_next[1]), .B(n2_adj_710), .C(n5671), 
         .D(n417[3]), .Z(next_crc_reg[1])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_192.init = 16'hfefc;
    LUT4 i1_4_lut_adj_193 (.A(crc_next[21]), .B(n2_adj_711), .C(n5579), 
         .D(n417[3]), .Z(next_crc_reg[21])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_193.init = 16'hfefc;
    LUT4 i1_3_lut_4_lut_adj_194 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[26]), 
         .Z(n5391)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_194.init = 16'hfef0;
    LUT4 select_339_Select_1_i2_4_lut (.A(crc_reg[1]), .B(n423), .C(crc_next[1]), 
         .D(n6493), .Z(n2_adj_710)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_1_i2_4_lut.init = 16'h88c0;
    LUT4 select_339_Select_21_i2_4_lut (.A(crc_reg[21]), .B(n423), .C(crc_next[21]), 
         .D(n6493), .Z(n2_adj_711)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_21_i2_4_lut.init = 16'h88c0;
    LUT4 i1_3_lut_4_lut_adj_195 (.A(n417[4]), .B(n6495), .C(n425), .D(\crc_reg[12] ), 
         .Z(n5691)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_195.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_196 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[8]), 
         .Z(n5539)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_196.init = 16'hfef0;
    LUT4 i1_2_lut_rep_78_4_lut (.A(n6492), .B(n6493), .C(n423), .D(n399), 
         .Z(n6452)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_78_4_lut.init = 16'h0020;
    LUT4 i1_3_lut_4_lut_adj_197 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[6]), 
         .Z(n5617)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_197.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_198 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[5]), 
         .Z(n5627)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_198.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_199 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[19]), 
         .Z(n5419)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_199.init = 16'hfef0;
    LUT4 i1_4_lut_adj_200 (.A(crc_next[20]), .B(n2), .C(n5499), .D(n417[3]), 
         .Z(next_crc_reg[20])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_200.init = 16'hfefc;
    CCU2C frame_len_457_add_4_29 (.A0(\frame_len[27] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[28] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4459), .COUT(n4460), .S0(n133[27]), .S1(n133[28]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_29.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_29.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_29.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_29.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_adj_201 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[27]), 
         .Z(n5559)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_201.init = 16'hfef0;
    CCU2C frame_len_457_add_4_27 (.A0(\frame_len[25] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[26] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4458), .COUT(n4459), .S0(n133[25]), .S1(n133[26]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_27.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_27.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_27.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_27.INJECT1_1 = "NO";
    FD1S3IX state_FSM_i5 (.D(n5287), .CK(clk_c), .CD(rst_c), .Q(n417[4]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i5.GSR = "DISABLED";
    FD1S3IX state_FSM_i4 (.D(n1958), .CK(clk_c), .CD(rst_c), .Q(n417[3]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i4.GSR = "DISABLED";
    FD1S3IX state_FSM_i3 (.D(n1956), .CK(clk_c), .CD(rst_c), .Q(n423));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i3.GSR = "DISABLED";
    FD1S3IX state_FSM_i2 (.D(n1954), .CK(clk_c), .CD(rst_c), .Q(n424));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i2.GSR = "DISABLED";
    LUT4 i1_3_lut_4_lut_adj_202 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[15]), 
         .Z(n5675)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_202.init = 16'hfef0;
    CCU2C frame_len_457_add_4_25 (.A0(\frame_len[23] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[24] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4457), .COUT(n4458), .S0(n133[23]), .S1(n133[24]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_25.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_25.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_25.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_25.INJECT1_1 = "NO";
    CCU2C frame_len_457_add_4_23 (.A0(\frame_len[21] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[22] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4456), .COUT(n4457), .S0(n133[21]), .S1(n133[22]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_23.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_23.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_23.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_23.INJECT1_1 = "NO";
    FD1S3JX crc_reg_i31 (.D(next_crc_reg[31]), .CK(clk_c), .PD(rst_c), 
            .Q(\crc_reg[31] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i31.GSR = "DISABLED";
    CCU2C frame_len_457_add_4_21 (.A0(\frame_len[19] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[20] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4455), .COUT(n4456), .S0(n133[19]), .S1(n133[20]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_21.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_21.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_21.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_21.INJECT1_1 = "NO";
    FD1P3IX pad_cnt__i1 (.D(next_pad_cnt[1]), .SP(clk_c_enable_8), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i1.GSR = "DISABLED";
    FD1P3IX pad_cnt__i2 (.D(next_pad_cnt[2]), .SP(clk_c_enable_8), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i2.GSR = "DISABLED";
    FD1P3IX pad_cnt__i3 (.D(next_pad_cnt[3]), .SP(clk_c_enable_8), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i3.GSR = "DISABLED";
    FD1P3IX pad_cnt__i4 (.D(next_pad_cnt[4]), .SP(clk_c_enable_8), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i4.GSR = "DISABLED";
    FD1P3IX pad_cnt__i5 (.D(next_pad_cnt[5]), .SP(clk_c_enable_8), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i5.GSR = "DISABLED";
    FD1P3IX pad_cnt__i0 (.D(next_pad_cnt[0]), .SP(clk_c_enable_9), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i0.GSR = "DISABLED";
    FD1S3JX crc_reg_i30 (.D(next_crc_reg[30]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[30])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i30.GSR = "DISABLED";
    FD1S3JX crc_reg_i29 (.D(next_crc_reg[29]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[29])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i29.GSR = "DISABLED";
    FD1S3JX crc_reg_i28 (.D(next_crc_reg[28]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[28])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i28.GSR = "DISABLED";
    FD1S3JX crc_reg_i27 (.D(next_crc_reg[27]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[27])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i27.GSR = "DISABLED";
    FD1S3JX crc_reg_i26 (.D(next_crc_reg[26]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[26])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i26.GSR = "DISABLED";
    FD1S3JX crc_reg_i25 (.D(next_crc_reg[25]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[25])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i25.GSR = "DISABLED";
    FD1S3JX crc_reg_i24 (.D(next_crc_reg[24]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[24])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i24.GSR = "DISABLED";
    FD1S3JX crc_reg_i23 (.D(next_crc_reg[23]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[23])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i23.GSR = "DISABLED";
    FD1S3JX crc_reg_i22 (.D(next_crc_reg[22]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[22])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i22.GSR = "DISABLED";
    FD1S3JX crc_reg_i21 (.D(next_crc_reg[21]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[21])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i21.GSR = "DISABLED";
    FD1S3JX crc_reg_i20 (.D(next_crc_reg[20]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[20])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i20.GSR = "DISABLED";
    FD1S3JX crc_reg_i19 (.D(next_crc_reg[19]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[19])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i19.GSR = "DISABLED";
    FD1S3JX crc_reg_i18 (.D(next_crc_reg[18]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[18])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i18.GSR = "DISABLED";
    FD1S3JX crc_reg_i17 (.D(next_crc_reg[17]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[17])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i17.GSR = "DISABLED";
    FD1S3JX crc_reg_i16 (.D(next_crc_reg[16]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[16])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i16.GSR = "DISABLED";
    FD1S3JX crc_reg_i15 (.D(next_crc_reg[15]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[15])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i15.GSR = "DISABLED";
    FD1S3JX crc_reg_i14 (.D(next_crc_reg[14]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[14])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i14.GSR = "DISABLED";
    FD1S3JX crc_reg_i13 (.D(next_crc_reg[13]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[13])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i13.GSR = "DISABLED";
    FD1S3JX crc_reg_i12 (.D(next_crc_reg[12]), .CK(clk_c), .PD(rst_c), 
            .Q(\crc_reg[12] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i12.GSR = "DISABLED";
    FD1S3JX crc_reg_i11 (.D(next_crc_reg[11]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[11])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i11.GSR = "DISABLED";
    FD1S3JX crc_reg_i10 (.D(next_crc_reg[10]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[10])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i10.GSR = "DISABLED";
    FD1S3JX crc_reg_i9 (.D(next_crc_reg[9]), .CK(clk_c), .PD(rst_c), .Q(\crc_reg[9] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i9.GSR = "DISABLED";
    FD1S3JX crc_reg_i8 (.D(next_crc_reg[8]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[8])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i8.GSR = "DISABLED";
    FD1S3JX crc_reg_i7 (.D(next_crc_reg[7]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[7])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i7.GSR = "DISABLED";
    FD1S3JX crc_reg_i6 (.D(next_crc_reg[6]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[6])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i6.GSR = "DISABLED";
    FD1S3JX crc_reg_i5 (.D(next_crc_reg[5]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[5])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i5.GSR = "DISABLED";
    FD1S3JX crc_reg_i4 (.D(next_crc_reg[4]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[4])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i4.GSR = "DISABLED";
    FD1S3JX crc_reg_i3 (.D(next_crc_reg[3]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[3])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i3.GSR = "DISABLED";
    FD1S3JX crc_reg_i2 (.D(next_crc_reg[2]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[2])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i2.GSR = "DISABLED";
    FD1S3JX crc_reg_i1 (.D(next_crc_reg[1]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[1])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i1.GSR = "DISABLED";
    FD1S3IX crc_cnt__i1 (.D(next_crc_cnt[1]), .CK(clk_c), .CD(rst_c), 
            .Q(crc_cnt[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_cnt__i1.GSR = "DISABLED";
    LUT4 i1_3_lut_4_lut_adj_203 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[11]), 
         .Z(n5697)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_203.init = 16'hfef0;
    FD1P3IX ifg_cnt__i3 (.D(next_ifg_cnt_3__N_513[3]), .SP(clk_c_enable_17), 
            .CD(n1334), .CK(clk_c), .Q(ifg_cnt[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam ifg_cnt__i3.GSR = "DISABLED";
    FD1P3IX pre_cnt__i1 (.D(n4923), .SP(clk_c_enable_19), .CD(rst_c), 
            .CK(clk_c), .Q(pre_cnt[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pre_cnt__i1.GSR = "DISABLED";
    FD1P3IX pre_cnt__i2 (.D(n4907), .SP(clk_c_enable_19), .CD(rst_c), 
            .CK(clk_c), .Q(pre_cnt[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=97, LSE_RLINE=97 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pre_cnt__i2.GSR = "DISABLED";
    FD1S3IX frame_len_457__i1 (.D(n133[1]), .CK(clk_c), .CD(rst_c), .Q(frame_len[1])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i1.GSR = "DISABLED";
    LUT4 i200_4_lut (.A(n417[4]), .B(n6493), .C(n423), .D(n4), .Z(ctl_reg)) /* synthesis lut_function=(!(A (B (C))+!A (B (C+!(D))+!B !(C+(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i200_4_lut.init = 16'h3f3a;
    LUT4 i1_2_lut (.A(n424), .B(n417[3]), .Z(n4)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 crc_reg_23__bdd_3_lut_5025 (.A(crc_reg[23]), .B(crc_cnt[0]), .C(\crc_reg[31] ), 
         .Z(n6438)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_23__bdd_3_lut_5025.init = 16'h1d1d;
    CCU2C frame_len_457_add_4_19 (.A0(\frame_len[17] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[18] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4454), .COUT(n4455), .S0(n133[17]), .S1(n133[18]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_19.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_19.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_19.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_19.INJECT1_1 = "NO";
    FD1S3IX frame_len_457__i2 (.D(n133[2]), .CK(clk_c), .CD(rst_c), .Q(frame_len[2])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i2.GSR = "DISABLED";
    FD1S3IX frame_len_457__i3 (.D(n133[3]), .CK(clk_c), .CD(rst_c), .Q(frame_len[3])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i3.GSR = "DISABLED";
    FD1S3IX frame_len_457__i4 (.D(n133[4]), .CK(clk_c), .CD(rst_c), .Q(frame_len[4])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i4.GSR = "DISABLED";
    FD1S3IX frame_len_457__i5 (.D(n133[5]), .CK(clk_c), .CD(rst_c), .Q(frame_len[5])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i5.GSR = "DISABLED";
    FD1S3IX frame_len_457__i6 (.D(n133[6]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[6] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i6.GSR = "DISABLED";
    FD1S3IX frame_len_457__i7 (.D(n133[7]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[7] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i7.GSR = "DISABLED";
    FD1S3IX frame_len_457__i8 (.D(n133[8]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[8] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i8.GSR = "DISABLED";
    FD1S3IX frame_len_457__i9 (.D(n133[9]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[9] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i9.GSR = "DISABLED";
    FD1S3IX frame_len_457__i10 (.D(n133[10]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[10] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i10.GSR = "DISABLED";
    FD1S3IX frame_len_457__i11 (.D(n133[11]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[11] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i11.GSR = "DISABLED";
    FD1S3IX frame_len_457__i12 (.D(n133[12]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[12] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i12.GSR = "DISABLED";
    FD1S3IX frame_len_457__i13 (.D(n133[13]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[13] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i13.GSR = "DISABLED";
    FD1S3IX frame_len_457__i14 (.D(n133[14]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[14] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i14.GSR = "DISABLED";
    FD1S3IX frame_len_457__i15 (.D(n133[15]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[15] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i15.GSR = "DISABLED";
    FD1S3IX frame_len_457__i16 (.D(n133[16]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[16] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i16.GSR = "DISABLED";
    FD1S3IX frame_len_457__i17 (.D(n133[17]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[17] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i17.GSR = "DISABLED";
    FD1S3IX frame_len_457__i18 (.D(n133[18]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[18] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i18.GSR = "DISABLED";
    FD1S3IX frame_len_457__i19 (.D(n133[19]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[19] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i19.GSR = "DISABLED";
    FD1S3IX frame_len_457__i20 (.D(n133[20]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[20] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i20.GSR = "DISABLED";
    FD1S3IX frame_len_457__i21 (.D(n133[21]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[21] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i21.GSR = "DISABLED";
    FD1S3IX frame_len_457__i22 (.D(n133[22]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[22] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i22.GSR = "DISABLED";
    FD1S3IX frame_len_457__i23 (.D(n133[23]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[23] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i23.GSR = "DISABLED";
    FD1S3IX frame_len_457__i24 (.D(n133[24]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[24] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i24.GSR = "DISABLED";
    FD1S3IX frame_len_457__i25 (.D(n133[25]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[25] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i25.GSR = "DISABLED";
    FD1S3IX frame_len_457__i26 (.D(n133[26]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[26] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i26.GSR = "DISABLED";
    FD1S3IX frame_len_457__i27 (.D(n133[27]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[27] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i27.GSR = "DISABLED";
    FD1S3IX frame_len_457__i28 (.D(n133[28]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[28] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i28.GSR = "DISABLED";
    FD1S3IX frame_len_457__i29 (.D(n133[29]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[29] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i29.GSR = "DISABLED";
    FD1S3IX frame_len_457__i30 (.D(n133[30]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[30] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i30.GSR = "DISABLED";
    FD1S3IX frame_len_457__i31 (.D(n133[31]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[31])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457__i31.GSR = "DISABLED";
    LUT4 i1_3_lut_4_lut_adj_204 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[30]), 
         .Z(n5701)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_204.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_205 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[28]), 
         .Z(n5543)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_205.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_206 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[23]), 
         .Z(n5487)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_206.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_207 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[21]), 
         .Z(n5579)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_207.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_208 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[18]), 
         .Z(n5519)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_208.init = 16'hfef0;
    LUT4 i2065_4_lut (.A(n6507), .B(n417[5]), .C(ifg_cnt[3]), .D(ifg_cnt[2]), 
         .Z(n3184)) /* synthesis lut_function=(A (B ((D)+!C))+!A (B)) */ ;
    defparam i2065_4_lut.init = 16'hcc4c;
    LUT4 i1_3_lut_4_lut_adj_209 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[17]), 
         .Z(n5395)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_209.init = 16'hfef0;
    LUT4 crc_reg_23__bdd_3_lut (.A(crc_reg[7]), .B(crc_reg[15]), .C(crc_cnt[0]), 
         .Z(n6439)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_23__bdd_3_lut.init = 16'h3535;
    LUT4 i1_3_lut_4_lut_adj_210 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[13]), 
         .Z(n5415)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_210.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_211 (.A(n417[4]), .B(n6495), .C(n425), .D(\crc_reg[9] ), 
         .Z(n5749)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_211.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_212 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[25]), 
         .Z(n5463)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_212.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_213 (.A(n417[4]), .B(n6495), .C(n425), .D(\crc_reg[31] ), 
         .Z(n5757)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_213.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_214 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[24]), 
         .Z(n5575)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_214.init = 16'hfef0;
    CCU2C frame_len_457_add_4_17 (.A0(\frame_len[15] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[16] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4453), .COUT(n4454), .S0(n133[15]), .S1(n133[16]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_17.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_17.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_17.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_17.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_adj_215 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[16]), 
         .Z(n5653)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_215.init = 16'hfef0;
    CCU2C frame_len_457_add_4_15 (.A0(\frame_len[13] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[14] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4452), .COUT(n4453), .S0(n133[13]), .S1(n133[14]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_15.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_15.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_15.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_15.INJECT1_1 = "NO";
    CCU2C frame_len_457_add_4_13 (.A0(\frame_len[11] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[12] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4451), .COUT(n4452), .S0(n133[11]), .S1(n133[12]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_13.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_13.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_13.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_13.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_adj_216 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[29]), 
         .Z(n5405)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_216.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_217 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[14]), 
         .Z(n5721)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_217.init = 16'hfef0;
    LUT4 i891_3_lut (.A(n2012), .B(gmii_txd_7__N_202[7]), .C(n417[4]), 
         .Z(gmii_txd[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i891_3_lut.init = 16'hcaca;
    LUT4 i890_4_lut (.A(n6477), .B(n6469), .C(n423), .D(n6493), .Z(n2012)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i890_4_lut.init = 16'h0aca;
    CCU2C frame_len_457_add_4_11 (.A0(\frame_len[9] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[10] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4450), .COUT(n4451), .S0(n133[9]), .S1(n133[10]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_11.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_11.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_11.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_11.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_218 (.A(pre_cnt[0]), .B(n424), .Z(n4899)) /* synthesis lut_function=(!(A+!(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_adj_218.init = 16'h4444;
    PFUMX i5026 (.BLUT(n6439), .ALUT(n6438), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_202[7]));
    CCU2C frame_len_457_add_4_9 (.A0(\frame_len[7] ), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[8] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4449), .COUT(n4450), .S0(n133[7]), .S1(n133[8]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_9.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_9.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_9.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_9.INJECT1_1 = "NO";
    CCU2C frame_len_457_add_4_7 (.A0(frame_len[5]), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[6] ), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4448), .COUT(n4449), .S0(n133[5]), .S1(n133[6]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_7.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_7.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_7.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_7.INJECT1_1 = "NO";
    CCU2C frame_len_457_add_4_5 (.A0(frame_len[3]), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[4]), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4447), .COUT(n4448), .S0(n133[3]), .S1(n133[4]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_5.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_5.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_5.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_5.INJECT1_1 = "NO";
    CCU2C frame_len_457_add_4_3 (.A0(frame_len[1]), .B0(n1312), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[2]), .B1(n1312), .C1(GND_net), 
          .D1(VCC_net), .CIN(n4446), .COUT(n4447), .S0(n133[1]), .S1(n133[2]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_3.INIT0 = 16'h2222;
    defparam frame_len_457_add_4_3.INIT1 = 16'h2222;
    defparam frame_len_457_add_4_3.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_3.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_adj_219 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[10]), 
         .Z(n5737)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_219.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_220 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[7]), 
         .Z(n5547)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_220.init = 16'hfef0;
    CCU2C frame_len_457_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n423), .B1(n6493), .C1(n425), .D1(frame_len_c[0]), 
          .COUT(n4446), .S1(n133[0]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_457_add_4_1.INIT0 = 16'h0000;
    defparam frame_len_457_add_4_1.INIT1 = 16'h8d22;
    defparam frame_len_457_add_4_1.INJECT1_0 = "NO";
    defparam frame_len_457_add_4_1.INJECT1_1 = "NO";
    LUT4 i2114_4_lut_4_lut (.A(n423), .B(n417[4]), .C(gmii_txd_7__N_202[1]), 
         .D(\gmii_txd_7__N_210[1] ), .Z(gmii_txd[1])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2114_4_lut_4_lut.init = 16'he2c0;
    LUT4 i2112_4_lut_4_lut (.A(n423), .B(n417[4]), .C(gmii_txd_7__N_202[5]), 
         .D(\gmii_txd_7__N_210[5] ), .Z(gmii_txd[5])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2112_4_lut_4_lut.init = 16'he2c0;
    LUT4 i2113_4_lut_4_lut (.A(n423), .B(n417[4]), .C(gmii_txd_7__N_202[3]), 
         .D(\gmii_txd_7__N_210[3] ), .Z(gmii_txd[3])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2113_4_lut_4_lut.init = 16'he2c0;
    LUT4 i2089_2_lut_rep_132 (.A(crc_cnt[0]), .B(crc_cnt[1]), .Z(n6506)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2089_2_lut_rep_132.init = 16'h8888;
    LUT4 i840_2_lut_3_lut_4_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n3184), 
         .D(n417[4]), .Z(n1962)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;
    defparam i840_2_lut_3_lut_4_lut.init = 16'hf8f0;
    LUT4 i837_2_lut_3_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n417[4]), 
         .Z(n1959)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam i837_2_lut_3_lut.init = 16'h7070;
    LUT4 i770_2_lut_rep_102_3_lut_4_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), 
         .C(n417[5]), .D(n417[4]), .Z(n6476)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i770_2_lut_rep_102_3_lut_4_lut.init = 16'h0800;
    LUT4 i162_2_lut_rep_113_3_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n417[4]), 
         .Z(n6487)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i162_2_lut_rep_113_3_lut.init = 16'h8080;
    LUT4 i669_2_lut_rep_133 (.A(ifg_cnt[1]), .B(ifg_cnt[0]), .Z(n6507)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(246[37:44])
    defparam i669_2_lut_rep_133.init = 16'h8888;
    LUT4 i674_2_lut_3_lut (.A(ifg_cnt[1]), .B(ifg_cnt[0]), .C(ifg_cnt[2]), 
         .Z(next_ifg_cnt_3__N_513[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(246[37:44])
    defparam i674_2_lut_3_lut.init = 16'h7878;
    LUT4 i681_3_lut_4_lut (.A(ifg_cnt[1]), .B(ifg_cnt[0]), .C(ifg_cnt[2]), 
         .D(ifg_cnt[3]), .Z(next_ifg_cnt_3__N_513[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(246[37:44])
    defparam i681_3_lut_4_lut.init = 16'h7f80;
    LUT4 i449_2_lut (.A(n425), .B(n423), .Z(n1312)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i449_2_lut.init = 16'h2222;
    LUT4 i1_3_lut (.A(n424), .B(pre_cnt[0]), .C(pre_cnt[1]), .Z(n4923)) /* synthesis lut_function=(!((B (C)+!B !(C))+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut.init = 16'h2828;
    LUT4 i1_2_lut_rep_135 (.A(pre_cnt[1]), .B(pre_cnt[0]), .Z(n6509)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_135.init = 16'h8888;
    LUT4 i1_3_lut_4_lut_adj_221 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[0]), 
         .Z(n5741)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_221.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_222 (.A(\udp_tdata[0] ), .B(n6484), .C(crc_reg[0]), 
         .D(crc_reg[5]), .Z(n5553)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_222.init = 16'h2dd2;
    LUT4 i1_3_lut_4_lut_adj_223 (.A(\udp_tdata[0] ), .B(n6484), .C(crc_reg[21]), 
         .D(n5124), .Z(crc_next[13])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_223.init = 16'h2dd2;
    LUT4 i1_3_lut_4_lut_adj_224 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[4]), 
         .Z(n5467)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_224.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_225 (.A(pre_cnt[1]), .B(pre_cnt[0]), .C(pre_cnt[2]), 
         .D(n424), .Z(n4907)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C (D)))+!A !(C (D)))) */ ;
    defparam i1_3_lut_4_lut_adj_225.init = 16'h7800;
    PFUMX i4995 (.BLUT(n6393), .ALUT(n6392), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_202[0]));
    LUT4 i1_2_lut_rep_114_3_lut (.A(pre_cnt[1]), .B(pre_cnt[0]), .C(pre_cnt[2]), 
         .Z(n6488)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_rep_114_3_lut.init = 16'h8080;
    LUT4 i151_2_lut_rep_103_3_lut_4_lut (.A(pre_cnt[1]), .B(pre_cnt[0]), 
         .C(n424), .D(pre_cnt[2]), .Z(n6477)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i151_2_lut_rep_103_3_lut_4_lut.init = 16'h8000;
    LUT4 i1_3_lut_4_lut_adj_226 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[3]), 
         .Z(n5609)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_226.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_227 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[2]), 
         .Z(n5683)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_227.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_228 (.A(n417[4]), .B(n6495), .C(n425), .D(crc_reg[1]), 
         .Z(n5671)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_228.init = 16'hfef0;
    LUT4 i1_3_lut_rep_89_4_lut (.A(n6469), .B(n6484), .C(crc_reg[17]), 
         .D(crc_reg[7]), .Z(n6463)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_rep_89_4_lut.init = 16'h2dd2;
    LUT4 i2074_2_lut_rep_98_3_lut_4_lut (.A(pre_cnt[2]), .B(n6509), .C(n423), 
         .D(n424), .Z(n6472)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;
    defparam i2074_2_lut_rep_98_3_lut_4_lut.init = 16'hf8f0;
    LUT4 i1_4_lut_adj_229 (.A(n1959), .B(n399), .C(n5379), .D(n6479), 
         .Z(n5287)) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_229.init = 16'hfefa;
    LUT4 i1_4_lut_adj_230 (.A(n5777), .B(n423), .C(n395), .D(n399), 
         .Z(n5)) /* synthesis lut_function=(A+(B (C+!(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_230.init = 16'heaee;
    LUT4 i1_4_lut_adj_231 (.A(pad_cnt[3]), .B(n5881), .C(n5891), .D(pad_cnt[2]), 
         .Z(n5379)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;
    defparam i1_4_lut_adj_231.init = 16'h0004;
    LUT4 i1_3_lut_adj_232 (.A(pad_cnt[5]), .B(pad_cnt[0]), .C(n417[3]), 
         .Z(n5881)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_3_lut_adj_232.init = 16'h1010;
    LUT4 i4689_2_lut (.A(pad_cnt[1]), .B(pad_cnt[4]), .Z(n5891)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i4689_2_lut.init = 16'heeee;
    LUT4 i830_4_lut (.A(n425), .B(n5889), .C(n6493), .D(ifg_cnt[2]), 
         .Z(n1952)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))+!A !((D)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i830_4_lut.init = 16'ha0ec;
    LUT4 crc_reg_22__bdd_3_lut (.A(crc_reg[6]), .B(crc_reg[14]), .C(crc_cnt[0]), 
         .Z(n6221)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_22__bdd_3_lut.init = 16'h3535;
    LUT4 i1_4_lut_adj_233 (.A(ifg_cnt[0]), .B(ifg_cnt[1]), .C(n417[5]), 
         .D(ifg_cnt[3]), .Z(n5889)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_233.init = 16'h8000;
    LUT4 crc_reg_22__bdd_3_lut_4894 (.A(crc_reg[22]), .B(crc_cnt[0]), .C(crc_reg[30]), 
         .Z(n6220)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_22__bdd_3_lut_4894.init = 16'h1d1d;
    PFUMX i4985 (.BLUT(n6378), .ALUT(n6377), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_202[4]));
    LUT4 i893_3_lut (.A(n2014), .B(gmii_txd_7__N_202[6]), .C(n417[4]), 
         .Z(gmii_txd[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i893_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut_4_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n5), .D(n417[4]), 
         .Z(next_crc_cnt[0])) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (D)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(229[17] 234[24])
    defparam i1_4_lut_4_lut.init = 16'hfda0;
    LUT4 i1_4_lut_4_lut_adj_234 (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n417[4]), 
         .D(n5), .Z(next_crc_cnt[1])) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (C+(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(229[17] 234[24])
    defparam i1_4_lut_4_lut_adj_234.init = 16'hece0;
    LUT4 i2093_2_lut_rep_126 (.A(frame_len[2]), .B(frame_len[1]), .Z(n6500)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2093_2_lut_rep_126.init = 16'heeee;
    LUT4 i791_2_lut_4_lut (.A(n3184), .B(n6476), .C(rst_c), .D(ifg_cnt[0]), 
         .Z(n1[0])) /* synthesis lut_function=(!(A (D)+!A (B (D)+!B (C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(77[17] 97[24])
    defparam i791_2_lut_4_lut.init = 16'h01fe;
    LUT4 n6_bdd_2_lut_3_lut (.A(frame_len[2]), .B(frame_len[1]), .C(frame_len[3]), 
         .Z(n6385)) /* synthesis lut_function=(A (C)+!A (B (C)+!B !(C))) */ ;
    defparam n6_bdd_2_lut_3_lut.init = 16'he1e1;
    LUT4 n8_bdd_2_lut_3_lut_4_lut (.A(frame_len[2]), .B(frame_len[1]), .C(frame_len[4]), 
         .D(frame_len[3]), .Z(n6332)) /* synthesis lut_function=(A (C (D)+!C !(D))+!A (B (C (D)+!C !(D))+!B !(C))) */ ;
    defparam n8_bdd_2_lut_3_lut_4_lut.init = 16'he10f;
    PFUMX i4840 (.BLUT(n6118), .ALUT(n6117), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_202[2]));
    LUT4 i1_3_lut_4_lut_adj_235 (.A(n6477), .B(n423), .C(n319), .D(n15), 
         .Z(n5318)) /* synthesis lut_function=(!(A ((D)+!C)+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_235.init = 16'h00e0;
    LUT4 i892_4_lut (.A(n424), .B(n6462), .C(n423), .D(n6493), .Z(n2014)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i892_4_lut.init = 16'h0aca;
    LUT4 i844_3_lut (.A(n1965), .B(gmii_txd_7__N_202[0]), .C(n417[4]), 
         .Z(gmii_txd[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i844_3_lut.init = 16'hcaca;
    LUT4 i897_3_lut (.A(n2018), .B(gmii_txd_7__N_202[2]), .C(n417[4]), 
         .Z(gmii_txd[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i897_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_4_lut_adj_236 (.A(n6477), .B(n423), .C(n318), .D(n15_adj_1), 
         .Z(n5334)) /* synthesis lut_function=(!(A ((D)+!C)+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_236.init = 16'h00e0;
    LUT4 i896_4_lut (.A(n424), .B(\udp_tdata[2] ), .C(n423), .D(n6493), 
         .Z(n2018)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i896_4_lut.init = 16'h0aca;
    PFUMX i4972 (.BLUT(n6353), .ALUT(n6352), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_202[1]));
    PFUMX i4969 (.BLUT(n6350), .ALUT(n6349), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_202[5]));
    LUT4 i1_4_lut_adj_237 (.A(n3_adj_713), .B(\next_crc_reg_31__N_390[31] ), 
         .C(n5757), .D(n423), .Z(next_crc_reg[31])) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_237.init = 16'hfefa;
    LUT4 select_339_Select_31_i3_2_lut (.A(\crc_next[31] ), .B(n417[3]), 
         .Z(n3_adj_713)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_31_i3_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_rep_121 (.A(n424), .B(n417[5]), .Z(n6495)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_121.init = 16'heeee;
    LUT4 i1_4_lut_adj_238 (.A(pad_cnt[4]), .B(n5867), .C(n5865), .D(pad_cnt[5]), 
         .Z(n11)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(207[20:31])
    defparam i1_4_lut_adj_238.init = 16'hfffe;
    LUT4 i1_2_lut_adj_239 (.A(pad_cnt[0]), .B(pad_cnt[3]), .Z(n5867)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(207[20:31])
    defparam i1_2_lut_adj_239.init = 16'heeee;
    LUT4 i1_2_lut_adj_240 (.A(pad_cnt[2]), .B(pad_cnt[1]), .Z(n5865)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(207[20:31])
    defparam i1_2_lut_adj_240.init = 16'heeee;
    PFUMX i4962 (.BLUT(n6339), .ALUT(n6338), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_202[3]));
    LUT4 i2_2_lut_3_lut_4_lut (.A(n399), .B(n6479), .C(rst_c), .D(n417[3]), 
         .Z(clk_c_enable_9)) /* synthesis lut_function=(A (C+(D))+!A (B+(C+(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2_2_lut_3_lut_4_lut.init = 16'hfff4;
    LUT4 i1319_4_lut (.A(frame_len[1]), .B(pad_cnt[1]), .C(n417[3]), .D(pad_cnt[0]), 
         .Z(next_pad_cnt[1])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C (D)))+!A (B (C (D))+!B !((D)+!C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1319_4_lut.init = 16'hca3a;
    LUT4 mux_188_i1_4_lut (.A(frame_len_c[0]), .B(pad_cnt[0]), .C(n417[3]), 
         .D(n11), .Z(next_pad_cnt[0])) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C (D)))+!A (B (C (D))+!B !((D)+!C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam mux_188_i1_4_lut.init = 16'h35c5;
    LUT4 i1_4_lut_adj_241 (.A(crc_next[30]), .B(n2_adj_714), .C(n5701), 
         .D(n417[3]), .Z(next_crc_reg[30])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_241.init = 16'hfefc;
    LUT4 select_339_Select_30_i2_4_lut (.A(crc_reg[30]), .B(n423), .C(crc_next[30]), 
         .D(n6493), .Z(n2_adj_714)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_339_Select_30_i2_4_lut.init = 16'h88c0;
    LUT4 i895_3_lut (.A(n2016), .B(gmii_txd_7__N_202[4]), .C(n417[4]), 
         .Z(gmii_txd[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i895_3_lut.init = 16'hcaca;
    LUT4 i894_4_lut (.A(n424), .B(\udp_tdata[4] ), .C(n423), .D(n6493), 
         .Z(n2016)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i894_4_lut.init = 16'h0aca;
    PFUMX i5034 (.BLUT(n6519), .ALUT(n6520), .C0(n417[3]), .Z(next_pad_cnt[2]));
    LUT4 i632_2_lut_rep_107_3_lut (.A(pad_cnt[1]), .B(pad_cnt[0]), .C(pad_cnt[2]), 
         .Z(n6481)) /* synthesis lut_function=(A+(B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(211[37:44])
    defparam i632_2_lut_rep_107_3_lut.init = 16'hfefe;
    LUT4 i640_2_lut_rep_100_3_lut_4_lut (.A(pad_cnt[1]), .B(pad_cnt[0]), 
         .C(pad_cnt[3]), .D(pad_cnt[2]), .Z(n6474)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(211[37:44])
    defparam i640_2_lut_rep_100_3_lut_4_lut.init = 16'hfffe;
    crc32_8 crc_inst (.n6456(n6456), .\crc_reg[6] (crc_reg[6]), .\crc_reg[28] (crc_reg[28]), 
            .\crc_next[20] (crc_next[20]), .n6460(n6460), .n2265(n2265), 
            .\crc_next[19] (crc_next[19]), .n6457(n6457), .\crc_reg[5] (crc_reg[5]), 
            .\crc_reg[27] (crc_reg[27]), .n6455(n6455), .n6465(n6465), 
            .\crc_next[18] (crc_next[18]), .n6458(n6458), .n6466(n6466), 
            .n9(n9), .\crc_next[17] (crc_next[17]), .n6464(n6464), .\crc_next[16] (crc_next[16]), 
            .\crc_reg[3] (crc_reg[3]), .\crc_reg[24] (crc_reg[24]), .n2250(n2250), 
            .\crc_next[15] (crc_next[15]), .\crc_reg[2] (crc_reg[2]), .\crc_reg[23] (crc_reg[23]), 
            .\crc_next[14] (crc_next[14]), .\crc_reg[1] (crc_reg[1]), .\crc_reg[22] (crc_reg[22]), 
            .\crc_reg[0] (crc_reg[0]), .\crc_reg[20] (crc_reg[20]), .\crc_next[12] (\crc_next[12] ), 
            .\idx[4] (\idx[4] ), .\idx[3] (\idx[3] ), .\idx[2] (\idx[2] ), 
            .\idx[1] (\idx[1] ), .n6467(n6467), .\crc_next[8] (crc_next[8]), 
            .n5124(n5124), .n5399(n5399), .\crc_next[29] (crc_next[29]), 
            .\crc_reg[7] (crc_reg[7]), .\crc_reg[16] (crc_reg[16]), .n6491(n6491), 
            .\crc_next[7] (crc_next[7]), .\crc_reg[15] (crc_reg[15]), .\crc_reg[14] (crc_reg[14]), 
            .\crc_next[6] (crc_next[6]), .n5553(n5553), .\crc_next[28] (crc_next[28]), 
            .\crc_reg[17] (crc_reg[17]), .n422(n417[3]), .n3(n3_adj_693), 
            .\crc_next[5] (crc_next[5]), .n5643(n5643), .\crc_reg[13] (crc_reg[13]), 
            .n5567(n5567), .\crc_next[27] (crc_next[27]), .\crc_next[26] (crc_next[26]), 
            .n6484(n6484), .\reg_fifo_data[3] (\reg_fifo_data[3] ), .n316(n316), 
            .n6497(n6497), .\t_data_7__N_84[5] (\t_data_7__N_84[5] ), .n317(n317), 
            .\t_data_7__N_100[3] (\t_data_7__N_100[3] ), .\idx[0] (\idx[0] ), 
            .n318(n318), .\crc_next[25] (crc_next[25]), .n2400(n2400), 
            .\crc_next[4] (crc_next[4]), .n6454(n6454), .\crc_next[3] (crc_next[3]), 
            .\crc_reg[11] (crc_reg[11]), .\crc_next[24] (crc_next[24]), 
            .\crc_reg[31] (\crc_reg[31] ), .\crc_next[23] (crc_next[23]), 
            .\crc_next[22] (crc_next[22]), .\crc_reg[4] (crc_reg[4]), .\udp_tdata[4] (\udp_tdata[4] ), 
            .n6468(n6468), .\crc_reg[30] (crc_reg[30]), .n6453(n6453), 
            .\crc_reg[10] (crc_reg[10]), .\crc_next[2] (crc_next[2]), .\crc_next[1] (crc_next[1]), 
            .\crc_next[21] (crc_next[21]), .\crc_reg[29] (crc_reg[29]), 
            .\crc_reg[9] (\crc_reg[9] ), .\crc_reg[12] (\crc_reg[12] ), 
            .\crc_reg[26] (crc_reg[26]), .\crc_reg[25] (crc_reg[25]), .\crc_next[31] (\crc_next[31] ), 
            .n5705(n5705), .\crc_next[30] (crc_next[30]));   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/mac_axitorgmii.vhd(67[16:35])
    
endmodule
//
// Verilog Description of module crc32_8
//

module crc32_8 (n6456, \crc_reg[6] , \crc_reg[28] , \crc_next[20] , 
            n6460, n2265, \crc_next[19] , n6457, \crc_reg[5] , \crc_reg[27] , 
            n6455, n6465, \crc_next[18] , n6458, n6466, n9, \crc_next[17] , 
            n6464, \crc_next[16] , \crc_reg[3] , \crc_reg[24] , n2250, 
            \crc_next[15] , \crc_reg[2] , \crc_reg[23] , \crc_next[14] , 
            \crc_reg[1] , \crc_reg[22] , \crc_reg[0] , \crc_reg[20] , 
            \crc_next[12] , \idx[4] , \idx[3] , \idx[2] , \idx[1] , 
            n6467, \crc_next[8] , n5124, n5399, \crc_next[29] , \crc_reg[7] , 
            \crc_reg[16] , n6491, \crc_next[7] , \crc_reg[15] , \crc_reg[14] , 
            \crc_next[6] , n5553, \crc_next[28] , \crc_reg[17] , n422, 
            n3, \crc_next[5] , n5643, \crc_reg[13] , n5567, \crc_next[27] , 
            \crc_next[26] , n6484, \reg_fifo_data[3] , n316, n6497, 
            \t_data_7__N_84[5] , n317, \t_data_7__N_100[3] , \idx[0] , 
            n318, \crc_next[25] , n2400, \crc_next[4] , n6454, \crc_next[3] , 
            \crc_reg[11] , \crc_next[24] , \crc_reg[31] , \crc_next[23] , 
            \crc_next[22] , \crc_reg[4] , \udp_tdata[4] , n6468, \crc_reg[30] , 
            n6453, \crc_reg[10] , \crc_next[2] , \crc_next[1] , \crc_next[21] , 
            \crc_reg[29] , \crc_reg[9] , \crc_reg[12] , \crc_reg[26] , 
            \crc_reg[25] , \crc_next[31] , n5705, \crc_next[30] );
    input n6456;
    input \crc_reg[6] ;
    input \crc_reg[28] ;
    output \crc_next[20] ;
    input n6460;
    input n2265;
    output \crc_next[19] ;
    input n6457;
    input \crc_reg[5] ;
    input \crc_reg[27] ;
    input n6455;
    input n6465;
    output \crc_next[18] ;
    input n6458;
    input n6466;
    input n9;
    output \crc_next[17] ;
    input n6464;
    output \crc_next[16] ;
    input \crc_reg[3] ;
    input \crc_reg[24] ;
    input n2250;
    output \crc_next[15] ;
    input \crc_reg[2] ;
    input \crc_reg[23] ;
    output \crc_next[14] ;
    input \crc_reg[1] ;
    input \crc_reg[22] ;
    input \crc_reg[0] ;
    input \crc_reg[20] ;
    output \crc_next[12] ;
    input \idx[4] ;
    input \idx[3] ;
    input \idx[2] ;
    input \idx[1] ;
    input n6467;
    output \crc_next[8] ;
    output n5124;
    input n5399;
    output \crc_next[29] ;
    input \crc_reg[7] ;
    input \crc_reg[16] ;
    output n6491;
    output \crc_next[7] ;
    input \crc_reg[15] ;
    input \crc_reg[14] ;
    output \crc_next[6] ;
    input n5553;
    output \crc_next[28] ;
    input \crc_reg[17] ;
    input n422;
    output n3;
    output \crc_next[5] ;
    output n5643;
    input \crc_reg[13] ;
    input n5567;
    output \crc_next[27] ;
    output \crc_next[26] ;
    input n6484;
    input \reg_fifo_data[3] ;
    input n316;
    input n6497;
    input \t_data_7__N_84[5] ;
    input n317;
    input \t_data_7__N_100[3] ;
    input \idx[0] ;
    input n318;
    output \crc_next[25] ;
    input n2400;
    output \crc_next[4] ;
    input n6454;
    output \crc_next[3] ;
    input \crc_reg[11] ;
    output \crc_next[24] ;
    input \crc_reg[31] ;
    output \crc_next[23] ;
    output \crc_next[22] ;
    input \crc_reg[4] ;
    input \udp_tdata[4] ;
    input n6468;
    input \crc_reg[30] ;
    input n6453;
    input \crc_reg[10] ;
    output \crc_next[2] ;
    output \crc_next[1] ;
    output \crc_next[21] ;
    input \crc_reg[29] ;
    input \crc_reg[9] ;
    input \crc_reg[12] ;
    input \crc_reg[26] ;
    input \crc_reg[25] ;
    output \crc_next[31] ;
    input n5705;
    output \crc_next[30] ;
    
    
    wire n5141, n5431, n5429, n5423, n5513, n5507, n8, n8_adj_682, 
        n5635, n6512, n5659, n5715, n6403, n5533, n5525, n5647, 
        n6459, n12, n6489, n14, n18, n5917, n5477, n5471, n5445, 
        n5603, n5587, n5457, n5665, n5597;
    
    LUT4 i1_4_lut (.A(n6456), .B(n5141), .C(\crc_reg[6] ), .D(\crc_reg[28] ), 
         .Z(\crc_next[20] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut.init = 16'h6996;
    LUT4 i1_4_lut_adj_114 (.A(n6460), .B(n2265), .C(n5431), .D(n5429), 
         .Z(\crc_next[19] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_114.init = 16'h6996;
    LUT4 i1_4_lut_adj_115 (.A(n6456), .B(n6457), .C(n5423), .D(\crc_reg[5] ), 
         .Z(n5429)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_115.init = 16'h6996;
    LUT4 i1_2_lut (.A(\crc_reg[6] ), .B(\crc_reg[27] ), .Z(n5423)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut.init = 16'h6666;
    LUT4 i1_4_lut_adj_116 (.A(n6460), .B(n6455), .C(n6465), .D(n5513), 
         .Z(\crc_next[18] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_116.init = 16'h6996;
    LUT4 i1_4_lut_adj_117 (.A(n6458), .B(n6466), .C(n6457), .D(n5507), 
         .Z(n5513)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_117.init = 16'h6996;
    LUT4 i5_4_lut (.A(n9), .B(n8), .C(n6457), .D(n8_adj_682), .Z(\crc_next[17] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i5_4_lut.init = 16'h6996;
    LUT4 i1_4_lut_adj_118 (.A(n6464), .B(n6465), .C(n5635), .D(n6466), 
         .Z(\crc_next[16] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_118.init = 16'h6996;
    LUT4 i1_4_lut_adj_119 (.A(n6458), .B(n6512), .C(\crc_reg[3] ), .D(\crc_reg[24] ), 
         .Z(n5635)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_119.init = 16'h6996;
    LUT4 i1_4_lut_adj_120 (.A(n2250), .B(n6464), .C(n6458), .D(n5659), 
         .Z(\crc_next[15] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_120.init = 16'h6996;
    LUT4 i1_3_lut (.A(\crc_reg[3] ), .B(\crc_reg[2] ), .C(\crc_reg[23] ), 
         .Z(n5659)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_3_lut.init = 16'h9696;
    LUT4 i1_4_lut_adj_121 (.A(n6458), .B(n6456), .C(n6457), .D(n5715), 
         .Z(\crc_next[14] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_121.init = 16'h6996;
    LUT4 i1_4_lut_adj_122 (.A(\crc_reg[6] ), .B(\crc_reg[1] ), .C(\crc_reg[2] ), 
         .D(\crc_reg[22] ), .Z(n5715)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_122.init = 16'h6996;
    LUT4 i1_4_lut_adj_123 (.A(n6466), .B(n6465), .C(\crc_reg[0] ), .D(\crc_reg[20] ), 
         .Z(\crc_next[12] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_123.init = 16'h6996;
    LUT4 idx_4__bdd_4_lut_5024 (.A(\idx[4] ), .B(\idx[3] ), .C(\idx[2] ), 
         .D(\idx[1] ), .Z(n6403)) /* synthesis lut_function=(!(A (B+(C+(D)))+!A !(B (C)+!B !(C+!(D))))) */ ;
    defparam idx_4__bdd_4_lut_5024.init = 16'h4142;
    LUT4 i1_4_lut_adj_124 (.A(n6467), .B(n6455), .C(n6457), .D(n5533), 
         .Z(\crc_next[8] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_124.init = 16'h6996;
    LUT4 i1_4_lut_adj_125 (.A(n6456), .B(n5124), .C(n2250), .D(n5399), 
         .Z(\crc_next[29] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_125.init = 16'h6996;
    LUT4 i1_3_lut_adj_126 (.A(\crc_reg[7] ), .B(\crc_reg[1] ), .C(\crc_reg[16] ), 
         .Z(n5533)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_3_lut_adj_126.init = 16'h9696;
    LUT4 i1_4_lut_adj_127 (.A(n6457), .B(n6460), .C(n6491), .D(\crc_reg[5] ), 
         .Z(n5124)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_127.init = 16'h6996;
    LUT4 i1_4_lut_adj_128 (.A(n6460), .B(n6455), .C(n6466), .D(n5525), 
         .Z(\crc_next[7] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_128.init = 16'h6996;
    LUT4 i1_3_lut_adj_129 (.A(\crc_reg[0] ), .B(\crc_reg[5] ), .C(\crc_reg[15] ), 
         .Z(n5525)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_3_lut_adj_129.init = 16'h9696;
    LUT4 i1_4_lut_adj_130 (.A(n6465), .B(n6460), .C(\crc_reg[5] ), .D(\crc_reg[14] ), 
         .Z(\crc_next[6] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_130.init = 16'h6996;
    LUT4 i1_4_lut_adj_131 (.A(n6460), .B(n6455), .C(n6465), .D(n5553), 
         .Z(\crc_next[28] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_131.init = 16'h6996;
    LUT4 select_339_Select_9_i3_2_lut_4_lut (.A(\crc_reg[7] ), .B(n6467), 
         .C(\crc_reg[17] ), .D(n422), .Z(n3)) /* synthesis lut_function=(A (B (C (D))+!B !(C+!(D)))+!A !(B (C+!(D))+!B !(C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam select_339_Select_9_i3_2_lut_4_lut.init = 16'h9600;
    LUT4 i1_4_lut_adj_132 (.A(n6464), .B(n6465), .C(n6467), .D(n5647), 
         .Z(\crc_next[5] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_132.init = 16'h6996;
    LUT4 i1_4_lut_adj_133 (.A(n6457), .B(n5643), .C(\crc_reg[7] ), .D(\crc_reg[13] ), 
         .Z(n5647)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_133.init = 16'h6996;
    LUT4 i1_4_lut_adj_134 (.A(n6459), .B(n6460), .C(n2250), .D(n5567), 
         .Z(\crc_next[27] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_134.init = 16'h6996;
    LUT4 i1_2_lut_adj_135 (.A(\crc_reg[3] ), .B(\crc_reg[1] ), .Z(n5643)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut_adj_135.init = 16'h6666;
    LUT4 i5_4_lut_adj_136 (.A(n12), .B(n6458), .C(n6489), .D(n8_adj_682), 
         .Z(\crc_next[26] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i5_4_lut_adj_136.init = 16'h6996;
    LUT4 i8_4_lut (.A(n6465), .B(n6466), .C(\crc_reg[3] ), .D(n14), 
         .Z(n8_adj_682)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i8_4_lut.init = 16'h6996;
    LUT4 i11_4_lut (.A(n6484), .B(n18), .C(\reg_fifo_data[3] ), .D(n316), 
         .Z(n14)) /* synthesis lut_function=(!(A+!(B (C+!(D))+!B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i11_4_lut.init = 16'h5044;
    LUT4 i15_4_lut (.A(n6497), .B(\t_data_7__N_84[5] ), .C(n317), .D(n5917), 
         .Z(n18)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i15_4_lut.init = 16'hcac0;
    LUT4 i4712_4_lut (.A(\t_data_7__N_100[3] ), .B(\idx[0] ), .C(n318), 
         .D(n6403), .Z(n5917)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i4712_4_lut.init = 16'hca0a;
    LUT4 i1_4_lut_adj_137 (.A(n6460), .B(n2265), .C(n5477), .D(n6456), 
         .Z(\crc_next[25] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_137.init = 16'h6996;
    LUT4 i1_4_lut_adj_138 (.A(n2400), .B(n6457), .C(n6489), .D(n5471), 
         .Z(n5477)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_138.init = 16'h6996;
    LUT4 i1_2_lut_adj_139 (.A(\crc_reg[5] ), .B(\crc_reg[6] ), .Z(n5471)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_2_lut_adj_139.init = 16'h6666;
    LUT4 i1_4_lut_adj_140 (.A(n2400), .B(n2265), .C(n6456), .D(n5445), 
         .Z(\crc_next[4] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(53[19:53])
    defparam i1_4_lut_adj_140.init = 16'h6996;
    LUT4 i1_4_lut_adj_141 (.A(n6454), .B(n6460), .C(n6457), .D(n5603), 
         .Z(\crc_next[3] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_141.init = 16'h6996;
    LUT4 i1_2_lut_adj_142 (.A(\crc_reg[5] ), .B(\crc_reg[11] ), .Z(n5603)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_2_lut_adj_142.init = 16'h6666;
    LUT4 i1_4_lut_adj_143 (.A(n2250), .B(n6460), .C(n6465), .D(n5587), 
         .Z(\crc_next[24] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_143.init = 16'h6996;
    LUT4 i1_4_lut_adj_144 (.A(n6458), .B(n6466), .C(n6512), .D(\crc_reg[5] ), 
         .Z(n5587)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_144.init = 16'h6996;
    LUT4 i1_4_lut_adj_145 (.A(n6456), .B(n5141), .C(\crc_reg[6] ), .D(\crc_reg[31] ), 
         .Z(\crc_next[23] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_145.init = 16'h6996;
    LUT4 i1_4_lut_adj_146 (.A(n6460), .B(n2265), .C(n6456), .D(n5457), 
         .Z(\crc_next[22] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_146.init = 16'h6996;
    LUT4 i1_2_lut_rep_85_3_lut_4_lut (.A(\crc_reg[4] ), .B(\udp_tdata[4] ), 
         .C(n6484), .D(n6468), .Z(n6459)) /* synthesis lut_function=(A (B (C+(D))+!B (C+!(D)))+!A !(B (C+(D))+!B (C+!(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(64[19:53])
    defparam i1_2_lut_rep_85_3_lut_4_lut.init = 16'ha9a6;
    LUT4 i1_4_lut_adj_147 (.A(n6458), .B(n5471), .C(\crc_reg[2] ), .D(\crc_reg[30] ), 
         .Z(n5457)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_147.init = 16'h6996;
    LUT4 i1_4_lut_adj_148 (.A(n6453), .B(n6465), .C(n6466), .D(\crc_reg[10] ), 
         .Z(\crc_next[2] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_148.init = 16'h6996;
    LUT4 i5_3_lut_4_lut (.A(\crc_reg[6] ), .B(n6456), .C(n2250), .D(n6457), 
         .Z(n12)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i5_3_lut_4_lut.init = 16'h6996;
    LUT4 i1_4_lut_adj_149 (.A(n6466), .B(n6464), .C(n5665), .D(\crc_reg[3] ), 
         .Z(\crc_next[1] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_149.init = 16'h6996;
    LUT4 i1_4_lut_adj_150 (.A(n2250), .B(n6460), .C(n6465), .D(n5597), 
         .Z(\crc_next[21] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_150.init = 16'h6996;
    LUT4 i1_4_lut_adj_151 (.A(n6458), .B(\crc_reg[2] ), .C(\crc_reg[5] ), 
         .D(\crc_reg[29] ), .Z(n5597)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(59[19:40])
    defparam i1_4_lut_adj_151.init = 16'h6996;
    LUT4 i1_2_lut_adj_152 (.A(\crc_reg[0] ), .B(\crc_reg[9] ), .Z(n5665)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut_adj_152.init = 16'h6666;
    LUT4 i1_3_lut_4_lut (.A(n6465), .B(n6464), .C(\crc_reg[3] ), .D(n2250), 
         .Z(n5141)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_3_lut_4_lut.init = 16'h6996;
    LUT4 crcIn_0__I_0_234_2_lut_rep_138 (.A(\crc_reg[0] ), .B(\crc_reg[2] ), 
         .Z(n6512)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(61[19:40])
    defparam crcIn_0__I_0_234_2_lut_rep_138.init = 16'h6666;
    LUT4 i1_3_lut_4_lut_adj_153 (.A(\crc_reg[0] ), .B(\crc_reg[2] ), .C(\crc_reg[12] ), 
         .D(\crc_reg[6] ), .Z(n5445)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(61[19:40])
    defparam i1_3_lut_4_lut_adj_153.init = 16'h6996;
    LUT4 i1_3_lut_4_lut_adj_154 (.A(n6491), .B(\crc_reg[2] ), .C(\crc_reg[26] ), 
         .D(\crc_reg[5] ), .Z(n5507)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(63[19:53])
    defparam i1_3_lut_4_lut_adj_154.init = 16'h6996;
    LUT4 crcIn_0__I_0_226_2_lut_rep_117 (.A(\crc_reg[0] ), .B(\crc_reg[1] ), 
         .Z(n6491)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(67[19:40])
    defparam crcIn_0__I_0_226_2_lut_rep_117.init = 16'h6666;
    LUT4 i2_2_lut_3_lut (.A(\crc_reg[0] ), .B(\crc_reg[1] ), .C(\crc_reg[25] ), 
         .Z(n8)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(67[19:40])
    defparam i2_2_lut_3_lut.init = 16'h9696;
    LUT4 crcOut_31__N_554_I_0_232_2_lut_rep_115_3_lut (.A(\crc_reg[0] ), .B(\crc_reg[1] ), 
         .C(\crc_reg[2] ), .Z(n6489)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(67[19:40])
    defparam crcOut_31__N_554_I_0_232_2_lut_rep_115_3_lut.init = 16'h9696;
    LUT4 i1_2_lut_4_lut (.A(\crc_reg[2] ), .B(n6458), .C(\crc_reg[1] ), 
         .D(n2250), .Z(n5431)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut_4_lut.init = 16'h6996;
    LUT4 i1_4_lut_adj_155 (.A(n6457), .B(n6467), .C(\crc_reg[1] ), .D(\crc_reg[7] ), 
         .Z(\crc_next[31] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_155.init = 16'h6996;
    LUT4 i1_4_lut_adj_156 (.A(n6456), .B(n2250), .C(n5705), .D(n6466), 
         .Z(\crc_next[30] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/lattice_tx_path/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_156.init = 16'h6996;
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

