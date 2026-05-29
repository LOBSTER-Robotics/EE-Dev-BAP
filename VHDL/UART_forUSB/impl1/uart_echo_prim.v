// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Fri May 29 13:46:55 2026
//
// Verilog Description of module uart_echo
//

module uart_echo (Clk, Rst, Uart_Tx, Uart_Rx, leds);   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(5[8:17])
    input Clk;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    input Rst;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(8[9:12])
    output Uart_Tx;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(10[9:16])
    input Uart_Rx;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(11[9:16])
    output [7:0]leds;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(43[9:18])
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(44[9:18])
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    
    wire Rst_c, Uart_Tx_c, Uart_Rx_c_0, leds_0_6, leds_0_5, leds_0_4, 
        leds_0_3, leds_0_2, leds_0_1, leds_0_0, tx_valid, tx_ready;
    wire [7:0]tx_data;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(20[12:19])
    
    wire rx_valid;
    wire [7:0]rx_data;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(23[12:19])
    
    wire echo_pending;
    wire [7:0]echo_data;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(27[12:21])
    
    wire n1056, tx_valid_N_34, Clk_c_enable_25, Clk_c_enable_32, n967, 
        n146, n1695;
    
    VHI i2 (.Z(VCC_net));
    FD1S3IX tx_valid_24 (.D(tx_valid_N_34), .CK(Clk_c), .CD(Rst_c), .Q(tx_valid)) /* synthesis lse_init_val=0 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_valid_24.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i0 (.D(rx_data[0]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(echo_data[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_data_i0_i0.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i0 (.D(echo_data[0]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(tx_data[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_data_i0_i0.GSR = "ENABLED";
    FD1P3IX echo_pending_25 (.D(VCC_net), .SP(rx_valid), .CD(n967), .CK(Clk_c), 
            .Q(echo_pending)) /* synthesis lse_init_val=0 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_pending_25.GSR = "ENABLED";
    OB leds_pad_4 (.I(leds_0_4), .O(leds[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    OB leds_pad_5 (.I(leds_0_5), .O(leds[5]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    OB leds_pad_6 (.I(leds_0_6), .O(leds[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    GSR GSR_INST (.GSR(VCC_net));
    OB leds_pad_7 (.I(VCC_net), .O(leds[7]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    LUT4 i176_2_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(Rst_c), 
         .Z(Clk_c_enable_25)) /* synthesis lut_function=(!((B+(C))+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(84[20:57])
    defparam i176_2_lut_3_lut.init = 16'h0202;
    LUT4 i544_3_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(tx_ready), 
         .Z(tx_valid_N_34)) /* synthesis lut_function=(!(A (B (C))+!A ((C)+!B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(84[20:57])
    defparam i544_3_lut_3_lut.init = 16'h2e2e;
    LUT4 tx_valid_I_0_30_2_lut_rep_34 (.A(tx_valid), .B(tx_ready), .Z(n1695)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(73[20:53])
    defparam tx_valid_I_0_30_2_lut_rep_34.init = 16'h8888;
    LUT4 i420_2_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(Rst_c), 
         .Z(n967)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(84[20:57])
    defparam i420_2_lut_3_lut.init = 16'hf2f2;
    OB Uart_Tx_pad (.I(Uart_Tx_c), .O(Uart_Tx));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(10[9:16])
    LUT4 i507_3_lut_3_lut_4_lut (.A(tx_valid), .B(tx_ready), .C(leds_0_3), 
         .D(n146), .Z(n1056)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(73[20:53])
    defparam i507_3_lut_3_lut_4_lut.init = 16'h0080;
    LUT4 i174_2_lut (.A(rx_valid), .B(Rst_c), .Z(Clk_c_enable_32)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(66[13] 90[20])
    defparam i174_2_lut.init = 16'h2222;
    FD1P3AX tx_data_i0_i7 (.D(echo_data[7]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(tx_data[7]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_data_i0_i7.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i6 (.D(echo_data[6]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(tx_data[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_data_i0_i6.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i5 (.D(echo_data[5]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(tx_data[5]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_data_i0_i5.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i4 (.D(echo_data[4]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(tx_data[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_data_i0_i4.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i3 (.D(echo_data[3]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(tx_data[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_data_i0_i3.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i2 (.D(echo_data[2]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(tx_data[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_data_i0_i2.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i1 (.D(echo_data[1]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(tx_data[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam tx_data_i0_i1.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i7 (.D(rx_data[7]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(echo_data[7]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_data_i0_i7.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i6 (.D(rx_data[6]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(echo_data[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_data_i0_i6.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i5 (.D(rx_data[5]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(echo_data[5]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_data_i0_i5.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i4 (.D(rx_data[4]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(echo_data[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_data_i0_i4.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i3 (.D(rx_data[3]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(echo_data[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_data_i0_i3.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i2 (.D(rx_data[2]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(echo_data[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_data_i0_i2.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i1 (.D(rx_data[1]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(echo_data[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[9] 92[16])
    defparam echo_data_i0_i1.GSR = "ENABLED";
    OB leds_pad_3 (.I(leds_0_3), .O(leds[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    OB leds_pad_2 (.I(leds_0_2), .O(leds[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    OB leds_pad_1 (.I(leds_0_1), .O(leds[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    OB leds_pad_0 (.I(leds_0_0), .O(leds[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[3:7])
    IB Clk_pad (.I(Clk), .O(Clk_c));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    IB Rst_pad (.I(Rst), .O(Rst_c));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(8[9:12])
    IB Uart_Rx_pad (.I(Uart_Rx), .O(Uart_Rx_c_0));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(11[9:16])
    \olo_intf_uart(125000000.0,115200.0,8,"1","none")(1,1,1,4)  u_uart (.GND_net(GND_net), 
            .VCC_net(VCC_net), .Clk_c(Clk_c), .n146(n146), .leds_0_4(leds_0_4), 
            .n1056(n1056), .tx_ready(tx_ready), .Rst_c(Rst_c), .leds_0_3(leds_0_3), 
            .rx_data({rx_data}), .tx_data({tx_data}), .n1695(n1695), .rx_valid(rx_valid), 
            .Uart_Tx_c(Uart_Tx_c), .tx_valid(tx_valid), .leds_0_5(leds_0_5), 
            .leds_0_2(leds_0_2), .Uart_Rx_c_0(Uart_Rx_c_0), .leds_0_6(leds_0_6), 
            .leds_0_1(leds_0_1), .leds_0_0(leds_0_0));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(34[14:39])
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VLO i1 (.Z(GND_net));
    
endmodule
//
// Verilog Description of module \olo_intf_uart(125000000.0,115200.0,8,"1","none")(1,1,1,4) 
//

module \olo_intf_uart(125000000.0,115200.0,8,"1","none")(1,1,1,4)  (GND_net, 
            VCC_net, Clk_c, n146, leds_0_4, n1056, tx_ready, Rst_c, 
            leds_0_3, rx_data, tx_data, n1695, rx_valid, Uart_Tx_c, 
            tx_valid, leds_0_5, leds_0_2, Uart_Rx_c_0, leds_0_6, leds_0_1, 
            leds_0_0);
    input GND_net;
    input VCC_net;
    input Clk_c;
    output n146;
    output leds_0_4;
    input n1056;
    output tx_ready;
    input Rst_c;
    output leds_0_3;
    output [7:0]rx_data;
    input [7:0]tx_data;
    input n1695;
    output rx_valid;
    output Uart_Tx_c;
    input tx_valid;
    output leds_0_5;
    output leds_0_2;
    input Uart_Rx_c_0;
    output leds_0_6;
    output leds_0_1;
    output leds_0_0;
    
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(43[9:18])
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(44[9:18])
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire \r_next.Rx_ParityError_N_268  /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[15:21])
    
    wire n1215;
    wire [25:0]heartbeat_cnt;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(137[9:22])
    wire [25:0]n109;
    wire [4:0]\r.TxCount ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    
    wire Clk_c_enable_11, n1062;
    wire [4:0]n1;
    
    wire \r_next.StateTx_1__N_170 , n1599, n1415, n1214;
    wire [25:0]n191;
    
    wire \r.RxSync , n1057, UartRxInt_N_200, n1213;
    wire [9:0]\r.TxShiftReg ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    
    wire Clk_c_enable_39, n1212, n1211, Clk_c_enable_6, \r_next.Tx_Ready , 
        \r.TxSync , n1536, n1601, n9_adj_316, n977, n1210, n999;
    wire [3:0]n144;
    
    wire n1612, n1421;
    wire [3:0]\r.RxCount ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    wire [3:0]\r_next.RxCount ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[15:21])
    
    wire Clk_c_enable_18, n1571;
    wire [7:0]n273;
    
    wire n1572, n411;
    wire [8:0]n647;
    
    wire RxStrobe, n394, \r.TxSyncLast , TxStrobe, n1598, n1209, 
        n2_adj_317, n6_adj_318;
    wire [3:0]\r_next.RxCount_3__N_108 ;
    
    wire n253;
    wire [2:0]\r.StateRx ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    wire [3:0]\r_next.RxCount_3__N_207 ;
    
    wire n1605, n1455, n9_adj_319, n1208, n1207, n1610, n1615, 
        n1058, n1206, n1122, n1593, n1205, n1204, n1049, n982, 
        n1604, n1595, n1600, n1047, n1618, n1608, n1617, n1065, 
        n1613, n1361, n989, n1603, n1578, n1203, n1607, n1580, 
        n1602, n979, n1511, n2_adj_320, n1594, n1596, n2_adj_321, 
        n1579, n3_adj_322, n1614;
    
    CCU2C heartbeat_cnt_290_add_4_27 (.A0(heartbeat_cnt[25]), .B0(GND_net), 
          .C0(GND_net), .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n1215), .S0(n109[25]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_27.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_27.INIT1 = 16'h0000;
    defparam heartbeat_cnt_290_add_4_27.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_27.INJECT1_1 = "NO";
    FD1P3IX \r.TxCount_288__i3  (.D(n1[3]), .SP(Clk_c_enable_11), .CD(n1062), 
            .CK(Clk_c), .Q(\r.TxCount [3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i3 .GSR = "ENABLED";
    LUT4 i1_4_lut (.A(\r_next.StateTx_1__N_170 ), .B(n1599), .C(n146), 
         .D(\r.TxCount [4]), .Z(n1415)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam i1_4_lut.init = 16'h2000;
    CCU2C heartbeat_cnt_290_add_4_25 (.A0(n191[23]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[24]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1214), .COUT(n1215), .S0(n109[23]), .S1(n109[24]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_25.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_25.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_25.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_25.INJECT1_1 = "NO";
    FD1P3IX \r.TxCount_288__i4  (.D(n1[4]), .SP(Clk_c_enable_11), .CD(n1062), 
            .CK(Clk_c), .Q(\r.TxCount [4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i4 .GSR = "ENABLED";
    FD1S3IX \r.RxSync_133  (.D(UartRxInt_N_200), .CK(Clk_c), .CD(n1057), 
            .Q(\r.RxSync )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxSync_133 .GSR = "ENABLED";
    LUT4 i508_1_lut (.A(leds_0_4), .Z(n1057)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i508_1_lut.init = 16'h5555;
    CCU2C heartbeat_cnt_290_add_4_23 (.A0(n191[21]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[22]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1213), .COUT(n1214), .S0(n109[21]), .S1(n109[22]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_23.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_23.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_23.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_23.INJECT1_1 = "NO";
    FD1P3IX \r.TxShiftReg__i1  (.D(\r.TxShiftReg [1]), .SP(Clk_c_enable_39), 
            .CD(n1056), .CK(Clk_c), .Q(\r.TxShiftReg [0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i1 .GSR = "ENABLED";
    CCU2C heartbeat_cnt_290_add_4_21 (.A0(n191[19]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[20]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1212), .COUT(n1213), .S0(n109[19]), .S1(n109[20]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_21.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_21.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_21.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_21.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_19 (.A0(n191[17]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[18]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1211), .COUT(n1212), .S0(n109[17]), .S1(n109[18]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_19.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_19.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_19.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_19.INJECT1_1 = "NO";
    FD1P3IX \r.Tx_Ready_126  (.D(\r_next.Tx_Ready ), .SP(Clk_c_enable_6), 
            .CD(Rst_c), .CK(Clk_c), .Q(tx_ready)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.Tx_Ready_126 .GSR = "ENABLED";
    LUT4 UartRxInt_I_0_1_lut (.A(\r_next.Rx_ParityError_N_268 ), .Z(UartRxInt_N_200)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(243[20:35])
    defparam UartRxInt_I_0_1_lut.init = 16'h5555;
    FD1S3AX \r.TxSync_127  (.D(n1536), .CK(Clk_c), .Q(\r.TxSync )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxSync_127 .GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i0 (.D(n109[0]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[0])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i0.GSR = "ENABLED";
    LUT4 i430_4_lut (.A(n146), .B(n1601), .C(\r_next.StateTx_1__N_170 ), 
         .D(n9_adj_316), .Z(n977)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i430_4_lut.init = 16'heece;
    CCU2C heartbeat_cnt_290_add_4_17 (.A0(n191[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[16]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1210), .COUT(n1211), .S0(n109[15]), .S1(n109[16]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_17.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_17.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_17.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_17.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_13 (.A(n999), .B(leds_0_3), .C(n144[0]), .D(n1612), 
         .Z(n1421)) /* synthesis lut_function=(A+(B (C+!(D))+!B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i1_4_lut_adj_13.init = 16'hfafe;
    FD1S3AX \r.RxCount_i0  (.D(\r_next.RxCount [0]), .CK(Clk_c), .Q(\r.RxCount [0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxCount_i0 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i0  (.D(rx_data[1]), .SP(Clk_c_enable_18), .CK(Clk_c), 
            .Q(rx_data[0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i0 .GSR = "ENABLED";
    LUT4 n122_bdd_2_lut_968 (.A(n1571), .B(n273[2]), .Z(n1572)) /* synthesis lut_function=(A (B)) */ ;
    defparam n122_bdd_2_lut_968.init = 16'h8888;
    FD1S3AX \r.StateTx_FSM_i0  (.D(Rst_c), .CK(Clk_c), .Q(n144[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i0 .GSR = "ENABLED";
    LUT4 mux_261_i6_3_lut (.A(tx_data[4]), .B(\r.TxShiftReg [6]), .C(n411), 
         .Z(n647[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_261_i6_3_lut.init = 16'hcaca;
    LUT4 n279_bdd_4_lut_998 (.A(\r.RxCount [2]), .B(RxStrobe), .C(\r.RxCount [1]), 
         .D(\r.RxCount [0]), .Z(n1571)) /* synthesis lut_function=(!(A (B (C (D)))+!A !(B (C (D))))) */ ;
    defparam n279_bdd_4_lut_998.init = 16'h6aaa;
    LUT4 i269_4_lut_rep_17 (.A(n1695), .B(n394), .C(n146), .D(leds_0_3), 
         .Z(Clk_c_enable_39)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i269_4_lut_rep_17.init = 16'hcac0;
    LUT4 i1_3_lut (.A(\r.TxSyncLast ), .B(\r.TxSync ), .C(TxStrobe), .Z(\r_next.StateTx_1__N_170 )) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(200[20:78])
    defparam i1_3_lut.init = 16'h1010;
    LUT4 i1_4_lut_adj_14 (.A(\r_next.StateTx_1__N_170 ), .B(n1598), .C(n146), 
         .D(\r.TxCount [0]), .Z(n411)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(200[17] 212[24])
    defparam i1_4_lut_adj_14.init = 16'h8000;
    CCU2C heartbeat_cnt_290_add_4_15 (.A0(n191[13]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[14]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1209), .COUT(n1210), .S0(n109[13]), .S1(n109[14]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_15.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_15.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_15.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_15.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_15 (.A(n273[2]), .B(n2_adj_317), .C(n6_adj_318), 
         .D(\r_next.RxCount_3__N_108 [3]), .Z(\r_next.RxCount [3])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_15.init = 16'hfefc;
    FD1S3IX \r.Rx_Valid_136  (.D(\r.StateRx [2]), .CK(Clk_c), .CD(n253), 
            .Q(rx_valid)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.Rx_Valid_136 .GSR = "ENABLED";
    LUT4 i570_2_lut_4_lut_4_lut_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [1]), 
         .C(\r.RxCount [0]), .Z(\r_next.RxCount_3__N_207 [2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(290[38:47])
    defparam i570_2_lut_4_lut_4_lut_4_lut.init = 16'h6a6a;
    LUT4 select_156_Select_3_i2_4_lut (.A(\r.RxCount [3]), .B(n273[1]), 
         .C(\r_next.RxCount_3__N_207 [3]), .D(n1605), .Z(n2_adj_317)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam select_156_Select_3_i2_4_lut.init = 16'h88c0;
    LUT4 i1_3_lut_4_lut (.A(n146), .B(n144[3]), .C(Rst_c), .D(n999), 
         .Z(Clk_c_enable_6)) /* synthesis lut_function=(A (C+(D))+!A ((C+(D))+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i1_3_lut_4_lut.init = 16'hfff1;
    LUT4 i1_4_lut_adj_16 (.A(\r.TxCount [3]), .B(\r.TxCount [0]), .C(n1455), 
         .D(\r.TxCount [1]), .Z(n9_adj_319)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;
    defparam i1_4_lut_adj_16.init = 16'hfffb;
    LUT4 i571_2_lut_4_lut_3_lut_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [0]), 
         .C(\r.RxCount [2]), .D(\r.RxCount [3]), .Z(\r_next.RxCount_3__N_207 [1])) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A !(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(290[38:47])
    defparam i571_2_lut_4_lut_3_lut_4_lut.init = 16'h6664;
    CCU2C heartbeat_cnt_290_add_4_13 (.A0(n191[11]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[12]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1208), .COUT(n1209), .S0(n109[11]), .S1(n109[12]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_13.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_13.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_13.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_13.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_11 (.A0(n191[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[10]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1207), .COUT(n1208), .S0(n109[9]), .S1(n109[10]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_11.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_11.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_11.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_11.INJECT1_1 = "NO";
    LUT4 i621_2_lut_rep_30 (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .Z(n1610)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i621_2_lut_rep_30.init = 16'h8888;
    LUT4 mux_287_i4_4_lut_then_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [2]), 
         .C(RxStrobe), .D(\r.RxCount [0]), .Z(n1615)) /* synthesis lut_function=(!(A (B (C (D))))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(272[21] 281[28])
    defparam mux_287_i4_4_lut_then_4_lut.init = 16'h7fff;
    LUT4 i1_2_lut (.A(\r.TxCount [2]), .B(\r.TxCount [4]), .Z(n1455)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    FD1S3JX \r.Uart_Tx_130  (.D(\r.TxShiftReg [0]), .CK(Clk_c), .PD(n1058), 
            .Q(Uart_Tx_c)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.Uart_Tx_130 .GSR = "ENABLED";
    CCU2C heartbeat_cnt_290_add_4_9 (.A0(n191[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[8]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1206), .COUT(n1207), .S0(n109[7]), .S1(n109[8]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_9.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_9.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_9.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_9.INJECT1_1 = "NO";
    LUT4 i618_2_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .Z(n1[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i618_2_lut.init = 16'h6666;
    LUT4 i632_2_lut_3_lut_4_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), 
         .C(\r.TxCount [3]), .D(\r.TxCount [2]), .Z(n1[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i632_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 \r.StateRx_2__bdd_4_lut  (.A(\r.StateRx [2]), .B(n1122), .C(n273[2]), 
         .D(RxStrobe), .Z(n1593)) /* synthesis lut_function=(A (B (C+!(D))+!B !(D))+!A (B (C (D)))) */ ;
    defparam \r.StateRx_2__bdd_4_lut .init = 16'hc0aa;
    LUT4 i569_2_lut_4_lut_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [3]), 
         .C(\r.RxCount [1]), .D(\r.RxCount [0]), .Z(\r_next.RxCount_3__N_207 [3])) /* synthesis lut_function=(!(A (B (C (D))+!B !(C (D)))+!A !(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(252[24:37])
    defparam i569_2_lut_4_lut_4_lut.init = 16'h6ccc;
    CCU2C heartbeat_cnt_290_add_4_7 (.A0(n191[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1205), .COUT(n1206), .S0(n109[5]), .S1(n109[6]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_7.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_7.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_7.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_7.INJECT1_1 = "NO";
    LUT4 i625_2_lut_3_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .C(\r.TxCount [2]), 
         .Z(n1[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i625_2_lut_3_lut.init = 16'h7878;
    CCU2C heartbeat_cnt_290_add_4_5 (.A0(n191[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[4]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1204), .COUT(n1205), .S0(n109[3]), .S1(n109[4]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_5.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_5.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_5.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_5.INJECT1_1 = "NO";
    FD1S3JX \r.StateRx_FSM_i1  (.D(n1049), .CK(Clk_c), .PD(Rst_c), .Q(leds_0_4));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam \r.StateRx_FSM_i1 .GSR = "ENABLED";
    LUT4 i423_3_lut_4_lut (.A(n9_adj_319), .B(TxStrobe), .C(n144[3]), 
         .D(n982), .Z(Clk_c_enable_11)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A !(C+!(D))) */ ;
    defparam i423_3_lut_4_lut.init = 16'h8f80;
    LUT4 n5_bdd_4_lut (.A(n1604), .B(n1605), .C(n273[1]), .D(\r.RxCount [1]), 
         .Z(n1595)) /* synthesis lut_function=(!(A (B+!(C))+!A (B+((D)+!C)))) */ ;
    defparam n5_bdd_4_lut.init = 16'h2030;
    LUT4 i2_3_lut_4_lut (.A(n273[1]), .B(n1605), .C(leds_0_4), .D(n1600), 
         .Z(n1047)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i2_3_lut_4_lut.init = 16'hf2f0;
    LUT4 i515_4_lut_then_4_lut (.A(n144[3]), .B(\r_next.StateTx_1__N_170 ), 
         .C(n146), .D(n982), .Z(n1618)) /* synthesis lut_function=(!(A+(B (C+!(D))+!B !(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i515_4_lut_then_4_lut.init = 16'h1500;
    LUT4 i1_2_lut_rep_28 (.A(\r.TxCount [1]), .B(\r.TxCount [2]), .Z(n1608)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_28.init = 16'heeee;
    LUT4 i515_4_lut_else_4_lut (.A(n144[3]), .B(n982), .Z(n1617)) /* synthesis lut_function=(!(A+!(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i515_4_lut_else_4_lut.init = 16'h4444;
    FD1P3IX \r.TxShiftReg__i9  (.D(tx_data[7]), .SP(Clk_c_enable_39), .CD(n1065), 
            .CK(Clk_c), .Q(\r.TxShiftReg [8])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i9 .GSR = "ENABLED";
    FD1P3IX \r.TxCount_288__i0  (.D(n1613), .SP(Clk_c_enable_11), .CD(n1062), 
            .CK(Clk_c), .Q(\r.TxCount [0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i0 .GSR = "ENABLED";
    LUT4 i441_4_lut (.A(n273[2]), .B(n1361), .C(RxStrobe), .D(n1122), 
         .Z(n989)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i441_4_lut.init = 16'hceee;
    FD1P3IX \r.TxCount_288__i1  (.D(n1[1]), .SP(Clk_c_enable_11), .CD(n1062), 
            .CK(Clk_c), .Q(\r.TxCount [1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i1 .GSR = "ENABLED";
    LUT4 i1_2_lut_rep_23_3_lut (.A(\r.TxCount [1]), .B(\r.TxCount [2]), 
         .C(\r.TxCount [3]), .Z(n1603)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_rep_23_3_lut.init = 16'hfefe;
    FD1P3IX \r.TxCount_288__i2  (.D(n1[2]), .SP(Clk_c_enable_11), .CD(n1062), 
            .CK(Clk_c), .Q(\r.TxCount [2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i2 .GSR = "ENABLED";
    LUT4 n280_bdd_4_lut_993 (.A(n1600), .B(n1605), .C(\r_next.Rx_ParityError_N_268 ), 
         .D(leds_0_4), .Z(n1578)) /* synthesis lut_function=(A (B+!(C))+!A (B+!(C+!(D)))) */ ;
    defparam n280_bdd_4_lut_993.init = 16'hcfce;
    CCU2C heartbeat_cnt_290_add_4_3 (.A0(n191[1]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[2]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1203), .COUT(n1204), .S0(n109[1]), .S1(n109[2]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_3.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_3.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_3.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_3.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n191[0]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .COUT(n1203), .S1(n109[0]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_1.INIT0 = 16'h0000;
    defparam heartbeat_cnt_290_add_4_1.INIT1 = 16'h555f;
    defparam heartbeat_cnt_290_add_4_1.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_1.INJECT1_1 = "NO";
    FD1S3IX \r.StateRx_FSM_i4  (.D(n1593), .CK(Clk_c), .CD(Rst_c), .Q(\r.StateRx [2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam \r.StateRx_FSM_i4 .GSR = "ENABLED";
    LUT4 i1_2_lut_rep_18_3_lut_4_lut (.A(\r.TxCount [1]), .B(\r.TxCount [2]), 
         .C(\r.TxCount [4]), .D(\r.TxCount [3]), .Z(n1598)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;
    defparam i1_2_lut_rep_18_3_lut_4_lut.init = 16'hffef;
    LUT4 i1_4_lut_adj_17 (.A(n1607), .B(tx_valid), .C(leds_0_3), .D(tx_ready), 
         .Z(\r_next.Tx_Ready )) /* synthesis lut_function=(A+!(B (C)+!B !((D)+!C))) */ ;
    defparam i1_4_lut_adj_17.init = 16'hbfaf;
    LUT4 \r_next.StateTx_1__I_0_161_2_lut_rep_32  (.A(tx_ready), .B(TxStrobe), 
         .Z(n1612)) /* synthesis lut_function=(!(A+!(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(187[20:55])
    defparam \r_next.StateTx_1__I_0_161_2_lut_rep_32 .init = 16'h4444;
    LUT4 i422_3_lut_4_lut (.A(n1612), .B(leds_0_3), .C(n146), .D(\r_next.StateTx_1__N_170 ), 
         .Z(n982)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i422_3_lut_4_lut.init = 16'hf808;
    FD1S3IX \r.StateRx_FSM_i3  (.D(n989), .CK(Clk_c), .CD(Rst_c), .Q(n273[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam \r.StateRx_FSM_i3 .GSR = "ENABLED";
    FD1S3IX \r.StateRx_FSM_i2  (.D(n1580), .CK(Clk_c), .CD(Rst_c), .Q(n273[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam \r.StateRx_FSM_i2 .GSR = "ENABLED";
    LUT4 i208_2_lut_rep_21_3_lut (.A(tx_ready), .B(TxStrobe), .C(leds_0_3), 
         .Z(n1601)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(187[20:55])
    defparam i208_2_lut_rep_21_3_lut.init = 16'h4040;
    LUT4 mux_261_i5_3_lut (.A(tx_data[3]), .B(\r.TxShiftReg [5]), .C(n411), 
         .Z(n647[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_261_i5_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_rep_22 (.A(\r.StateRx [2]), .B(leds_0_4), .C(\r_next.Rx_ParityError_N_268 ), 
         .Z(n1602)) /* synthesis lut_function=(A+(B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_3_lut_rep_22.init = 16'heaea;
    LUT4 i954_3_lut_4_lut_3_lut (.A(tx_ready), .B(leds_0_3), .C(tx_valid), 
         .Z(n1536)) /* synthesis lut_function=(A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(187[20:55])
    defparam i954_3_lut_4_lut_3_lut.init = 16'h8080;
    LUT4 i1_3_lut_4_lut_adj_18 (.A(\r.RxCount [2]), .B(\r.RxCount [1]), 
         .C(\r.RxCount [3]), .D(\r.RxCount [0]), .Z(n1122)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(290[38:47])
    defparam i1_3_lut_4_lut_adj_18.init = 16'h8000;
    LUT4 mux_261_i4_3_lut (.A(tx_data[2]), .B(\r.TxShiftReg [4]), .C(n411), 
         .Z(n647[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_261_i4_3_lut.init = 16'hcaca;
    FD1S3IX \r.StateTx_FSM_i3  (.D(n979), .CK(Clk_c), .CD(Rst_c), .Q(n144[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i3 .GSR = "ENABLED";
    LUT4 i381_1_lut_rep_33 (.A(\r.TxCount [0]), .Z(n1613)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(202[24:54])
    defparam i381_1_lut_rep_33.init = 16'h5555;
    FD1S3IX \r.StateTx_FSM_i2  (.D(n977), .CK(Clk_c), .CD(Rst_c), .Q(n146));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i2 .GSR = "ENABLED";
    FD1S3IX \r.StateTx_FSM_i1  (.D(n1421), .CK(Clk_c), .CD(Rst_c), .Q(leds_0_3));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i1 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i7  (.D(\r_next.Rx_ParityError_N_268 ), .SP(Clk_c_enable_18), 
            .CK(Clk_c), .Q(rx_data[7])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i7 .GSR = "ENABLED";
    LUT4 i1_2_lut_rep_19_3_lut_4_lut_4_lut (.A(\r.TxCount [0]), .B(\r.TxCount [3]), 
         .C(\r.TxCount [2]), .D(\r.TxCount [1]), .Z(n1599)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(202[24:54])
    defparam i1_2_lut_rep_19_3_lut_4_lut_4_lut.init = 16'hfffd;
    LUT4 i1_3_lut_4_lut_adj_19 (.A(n1603), .B(\r.TxCount [4]), .C(\r.TxCount [0]), 
         .D(\r_next.StateTx_1__N_170 ), .Z(n394)) /* synthesis lut_function=(A (C (D))+!A !(B+!(C (D)))) */ ;
    defparam i1_3_lut_4_lut_adj_19.init = 16'hb000;
    LUT4 i432_4_lut (.A(n144[3]), .B(n1415), .C(TxStrobe), .D(n9_adj_319), 
         .Z(n979)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i432_4_lut.init = 16'heece;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut (.A(\r.TxCount [0]), .B(\r.TxCount [4]), 
         .C(\r.TxCount [3]), .D(n1608), .Z(n9_adj_316)) /* synthesis lut_function=(((C+(D))+!B)+!A) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(202[24:54])
    defparam i1_2_lut_3_lut_4_lut_4_lut.init = 16'hfff7;
    LUT4 i1_4_lut_adj_20 (.A(n1608), .B(\r.TxCount [3]), .C(\r.TxCount [4]), 
         .D(n1511), .Z(n999)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam i1_4_lut_adj_20.init = 16'h0100;
    LUT4 i1_3_lut_adj_21 (.A(n144[3]), .B(TxStrobe), .C(\r.TxCount [0]), 
         .Z(n1511)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut_adj_21.init = 16'h8080;
    LUT4 i1_4_lut_adj_22 (.A(n1572), .B(n2_adj_320), .C(\r.RxCount [2]), 
         .D(n1602), .Z(\r_next.RxCount [2])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_22.init = 16'hfeee;
    FD1P3AX \r.RxShiftReg__i6  (.D(rx_data[7]), .SP(Clk_c_enable_18), .CK(Clk_c), 
            .Q(rx_data[6])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i6 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i5  (.D(rx_data[6]), .SP(Clk_c_enable_18), .CK(Clk_c), 
            .Q(rx_data[5])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i5 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i4  (.D(rx_data[5]), .SP(Clk_c_enable_18), .CK(Clk_c), 
            .Q(rx_data[4])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i4 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i3  (.D(rx_data[4]), .SP(Clk_c_enable_18), .CK(Clk_c), 
            .Q(rx_data[3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i3 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i2  (.D(rx_data[3]), .SP(Clk_c_enable_18), .CK(Clk_c), 
            .Q(rx_data[2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i2 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i1  (.D(rx_data[2]), .SP(Clk_c_enable_18), .CK(Clk_c), 
            .Q(rx_data[1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i1 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i3  (.D(\r_next.RxCount [3]), .CK(Clk_c), .Q(\r.RxCount [3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxCount_i3 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i2  (.D(\r_next.RxCount [2]), .CK(Clk_c), .Q(\r.RxCount [2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxCount_i2 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i1  (.D(\r_next.RxCount [1]), .CK(Clk_c), .Q(\r.RxCount [1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxCount_i1 .GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i25 (.D(n109[25]), .CK(Clk_c), .CD(Rst_c), 
            .Q(heartbeat_cnt[25])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i25.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i24 (.D(n109[24]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[24])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i24.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i23 (.D(n109[23]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[23])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i23.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i22 (.D(n109[22]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[22])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i22.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i21 (.D(n109[21]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[21])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i21.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i20 (.D(n109[20]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[20])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i20.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i19 (.D(n109[19]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[19])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i19.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i18 (.D(n109[18]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[18])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i18.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i17 (.D(n109[17]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[17])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i17.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i16 (.D(n109[16]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[16])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i16.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i15 (.D(n109[15]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[15])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i15.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i14 (.D(n109[14]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[14])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i14.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i13 (.D(n109[13]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[13])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i13.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i12 (.D(n109[12]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[12])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i12.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i11 (.D(n109[11]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[11])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i11.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i10 (.D(n109[10]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[10])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i10.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i9 (.D(n109[9]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[9])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i9.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i8 (.D(n109[8]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[8])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i8.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i7 (.D(n109[7]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[7])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i7.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i6 (.D(n109[6]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[6])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i6.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i5 (.D(n109[5]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[5])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i5.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i4 (.D(n109[4]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[4])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i4.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i3 (.D(n109[3]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[3])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i3.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i2 (.D(n109[2]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[2])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i2.GSR = "ENABLED";
    FD1S3IX heartbeat_cnt_290__i1 (.D(n109[1]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[1])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i1.GSR = "ENABLED";
    LUT4 i1_3_lut_rep_20_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [3]), 
         .C(\r.RxCount [0]), .D(\r.RxCount [1]), .Z(n1600)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(252[24:37])
    defparam i1_3_lut_rep_20_4_lut.init = 16'hfeff;
    LUT4 i1_2_lut_4_lut (.A(\r.StateRx [2]), .B(leds_0_4), .C(\r_next.Rx_ParityError_N_268 ), 
         .D(\r.RxCount [3]), .Z(n6_adj_318)) /* synthesis lut_function=(A (D)+!A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_2_lut_4_lut.init = 16'hea00;
    LUT4 select_156_Select_2_i2_4_lut (.A(\r.RxCount [2]), .B(n273[1]), 
         .C(\r_next.RxCount_3__N_207 [2]), .D(n1605), .Z(n2_adj_320)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam select_156_Select_2_i2_4_lut.init = 16'h88c0;
    LUT4 i639_3_lut_4_lut (.A(\r.TxCount [2]), .B(n1610), .C(\r.TxCount [3]), 
         .D(\r.TxCount [4]), .Z(n1[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i639_3_lut_4_lut.init = 16'h7f80;
    FD1P3AX \r.TxShiftReg__i8  (.D(n647[7]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(\r.TxShiftReg [7])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i8 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i7  (.D(n647[6]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(\r.TxShiftReg [6])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i7 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i6  (.D(n647[5]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(\r.TxShiftReg [5])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i6 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i5  (.D(n647[4]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(\r.TxShiftReg [4])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i5 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i4  (.D(n647[3]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(\r.TxShiftReg [3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i4 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i3  (.D(n647[2]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(\r.TxShiftReg [2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i3 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i2  (.D(n647[1]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(\r.TxShiftReg [1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i2 .GSR = "ENABLED";
    PFUMX i972 (.BLUT(n1595), .ALUT(n1594), .C0(\r.RxCount [0]), .Z(n1596));
    LUT4 select_156_Select_1_i2_4_lut (.A(\r.RxCount [1]), .B(n273[1]), 
         .C(\r_next.RxCount_3__N_207 [1]), .D(n1605), .Z(n2_adj_321)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam select_156_Select_1_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_23 (.A(n273[2]), .B(n1596), .C(RxStrobe), .D(\r.RxCount [0]), 
         .Z(\r_next.RxCount [0])) /* synthesis lut_function=(A (B+!(C (D)+!C !(D)))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_23.init = 16'hceec;
    PFUMX i966 (.BLUT(n1579), .ALUT(n1578), .C0(n273[1]), .Z(n1580));
    LUT4 i1_4_lut_adj_24 (.A(\r.RxCount [1]), .B(n2_adj_321), .C(n3_adj_322), 
         .D(n1602), .Z(\r_next.RxCount [1])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_24.init = 16'hfefc;
    LUT4 i1_2_lut_rep_24 (.A(\r.RxCount [2]), .B(\r.RxCount [3]), .Z(n1604)) /* synthesis lut_function=(A+(B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(252[24:37])
    defparam i1_2_lut_rep_24.init = 16'heeee;
    LUT4 n280_bdd_2_lut (.A(\r_next.Rx_ParityError_N_268 ), .B(leds_0_4), 
         .Z(n1579)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam n280_bdd_2_lut.init = 16'h4444;
    LUT4 mux_287_i4_4_lut_else_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [2]), 
         .C(RxStrobe), .D(\r.RxCount [0]), .Z(n1614)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(272[21] 281[28])
    defparam mux_287_i4_4_lut_else_4_lut.init = 16'h8000;
    LUT4 i1_4_lut_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [0]), .C(RxStrobe), 
         .D(n273[2]), .Z(n3_adj_322)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(D))+!A !(B (C (D))))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(290[38:47])
    defparam i1_4_lut_4_lut.init = 16'h6a00;
    LUT4 mux_261_i3_3_lut (.A(tx_data[1]), .B(\r.TxShiftReg [3]), .C(n411), 
         .Z(n647[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_261_i3_3_lut.init = 16'hcaca;
    LUT4 parity_err_sticky_I_0_174_i6_1_lut (.A(Uart_Tx_c), .Z(leds_0_5)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i6_1_lut.init = 16'h5555;
    LUT4 mux_261_i2_3_lut (.A(tx_data[0]), .B(\r.TxShiftReg [2]), .C(n411), 
         .Z(n647[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_261_i2_3_lut.init = 16'hcaca;
    LUT4 parity_err_sticky_I_0_174_i3_1_lut (.A(tx_ready), .Z(leds_0_2)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i3_1_lut.init = 16'h5555;
    LUT4 i1_2_lut_3_lut (.A(RxStrobe), .B(n273[2]), .C(\r.RxCount [0]), 
         .Z(Clk_c_enable_18)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_2_lut_3_lut.init = 16'h0808;
    LUT4 parity_err_sticky_I_0_174_i7_1_lut (.A(Uart_Rx_c_0), .Z(leds_0_6)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i7_1_lut.init = 16'h5555;
    LUT4 i509_1_lut (.A(n146), .Z(n1058)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i509_1_lut.init = 16'h5555;
    LUT4 mux_261_i7_3_lut (.A(tx_data[5]), .B(\r.TxShiftReg [7]), .C(n411), 
         .Z(n647[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_261_i7_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut_adj_25 (.A(RxStrobe), .B(\r_next.Rx_ParityError_N_268 ), 
         .C(\r.StateRx [2]), .D(n1047), .Z(n1049)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_25.init = 16'heca0;
    LUT4 parity_err_sticky_I_0_174_i2_1_lut (.A(TxStrobe), .Z(leds_0_1)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i2_1_lut.init = 16'h5555;
    LUT4 i1_2_lut_3_lut_4_lut (.A(RxStrobe), .B(\r.RxSync ), .C(n1600), 
         .D(n273[1]), .Z(n1361)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(250[20:54])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0200;
    LUT4 n5_bdd_3_lut_4_lut (.A(RxStrobe), .B(\r.RxSync ), .C(n273[1]), 
         .D(n1602), .Z(n1594)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (C+(D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(250[20:54])
    defparam n5_bdd_3_lut_4_lut.init = 16'hffd0;
    LUT4 i952_2_lut_rep_25 (.A(RxStrobe), .B(\r.RxSync ), .Z(n1605)) /* synthesis lut_function=((B)+!A) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(250[20:54])
    defparam i952_2_lut_rep_25.init = 16'hdddd;
    LUT4 mux_261_i8_3_lut (.A(tx_data[6]), .B(\r.TxShiftReg [8]), .C(n411), 
         .Z(n647[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_261_i8_3_lut.init = 16'hcaca;
    LUT4 parity_err_sticky_I_0_174_i1_1_lut (.A(heartbeat_cnt[25]), .Z(leds_0_0)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i1_1_lut.init = 16'h5555;
    LUT4 i79_2_lut_rep_27 (.A(n146), .B(n144[3]), .Z(n1607)) /* synthesis lut_function=(A+(B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i79_2_lut_rep_27.init = 16'heeee;
    LUT4 i516_2_lut (.A(Clk_c_enable_39), .B(n411), .Z(n1065)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam i516_2_lut.init = 16'h8888;
    PFUMX i976 (.BLUT(n1617), .ALUT(n1618), .C0(n9_adj_316), .Z(n1062));
    PFUMX i974 (.BLUT(n1614), .ALUT(n1615), .C0(\r.RxCount [3]), .Z(\r_next.RxCount_3__N_108 [3]));
    \olo_intf_sync(1,'1',2)  i_sync (.Clk_c(Clk_c), .Rst_c(Rst_c), .Uart_Rx_c_0(Uart_Rx_c_0), 
            .\r_next.Rx_ParityError_N_268 (\r_next.Rx_ParityError_N_268 ));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(431[14:39])
    \olo_base_strobe_gen(125000000.0,230400.0,true)  i_strb_tx (.TxStrobe(TxStrobe), 
            .Clk_c(Clk_c), .Rst_c(Rst_c), .\r.TxSyncLast (\r.TxSyncLast ), 
            .\r.TxSync (\r.TxSync ), .GND_net(GND_net), .VCC_net(VCC_net));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(405[17:48])
    \olo_base_strobe_gen(125000000.0,230400.0,true)_U0  i_strb_rx (.RxStrobe(RxStrobe), 
            .Clk_c(Clk_c), .Rst_c(Rst_c), .\r.RxSync (\r.RxSync ), .GND_net(GND_net), 
            .VCC_net(VCC_net), .n253(n253));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(418[17:48])
    
endmodule
//
// Verilog Description of module \olo_intf_sync(1,'1',2) 
//

module \olo_intf_sync(1,'1',2)  (Clk_c, Rst_c, Uart_Rx_c_0, \r_next.Rx_ParityError_N_268 );
    input Clk_c;
    input Rst_c;
    input Uart_Rx_c_0;
    output \r_next.Rx_ParityError_N_268 ;
    
    wire [0:0]RegN_0__0__N_313 /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[15:21])
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire Reg0_0 /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(59[12:16])
    
    FD1S3JX \RegN_0[[0__12  (.D(Reg0_0), .CK(Clk_c), .PD(Rst_c), .Q(\r_next.Rx_ParityError_N_268 )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=431, LSE_RLINE=431 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(91[9] 107[16])
    defparam \RegN_0[[0__12 .GSR = "ENABLED";
    FD1S3JX Reg0_0__11 (.D(Uart_Rx_c_0), .CK(Clk_c), .PD(Rst_c), .Q(Reg0_0)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=431, LSE_RLINE=431 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(91[9] 107[16])
    defparam Reg0_0__11.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module \olo_base_strobe_gen(125000000.0,230400.0,true) 
//

module \olo_base_strobe_gen(125000000.0,230400.0,true)  (TxStrobe, Clk_c, 
            Rst_c, \r.TxSyncLast , \r.TxSync , GND_net, VCC_net);
    output TxStrobe;
    input Clk_c;
    input Rst_c;
    output \r.TxSyncLast ;
    input \r.TxSync ;
    input GND_net;
    input VCC_net;
    
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(43[9:18])
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(44[9:18])
    
    wire Out_Valid_N_305;
    wire [15:0]Count;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(63[12:17])
    
    wire n402;
    wire [15:0]n69;
    
    wire n1202, n1201, n28, n1196, n1197, n1198, n1199, n1606, 
        n1195, n1200, n1431, n1417, n1451, n1439, n1380;
    
    FD1S3IX Out_Valid_25 (.D(Out_Valid_N_305), .CK(Clk_c), .CD(Rst_c), 
            .Q(TxStrobe)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Out_Valid_25.GSR = "ENABLED";
    FD1S3IX \r.TxSyncLast_128  (.D(\r.TxSync ), .CK(Clk_c), .CD(Rst_c), 
            .Q(\r.TxSyncLast )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=34, LSE_RLINE=34 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxSyncLast_128 .GSR = "ENABLED";
    FD1S3IX Count_289__i0 (.D(n69[0]), .CK(Clk_c), .CD(n402), .Q(Count[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i0.GSR = "ENABLED";
    CCU2C Count_289_add_4_17 (.A0(Count[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1202), .S0(n69[15]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_17.INIT0 = 16'haaa0;
    defparam Count_289_add_4_17.INIT1 = 16'h0000;
    defparam Count_289_add_4_17.INJECT1_0 = "NO";
    defparam Count_289_add_4_17.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_15 (.A0(Count[13]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1201), .COUT(n1202), .S0(n69[13]), .S1(n69[14]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_15.INIT0 = 16'h6aaa;
    defparam Count_289_add_4_15.INIT1 = 16'haaa0;
    defparam Count_289_add_4_15.INJECT1_0 = "NO";
    defparam Count_289_add_4_15.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_5 (.A0(Count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[4]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1196), .COUT(n1197), .S0(n69[3]), .S1(n69[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_5.INIT0 = 16'haaa0;
    defparam Count_289_add_4_5.INIT1 = 16'h6aaa;
    defparam Count_289_add_4_5.INJECT1_0 = "NO";
    defparam Count_289_add_4_5.INJECT1_1 = "NO";
    FD1S3IX Count_289__i15 (.D(n69[15]), .CK(Clk_c), .CD(n402), .Q(Count[15])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i15.GSR = "ENABLED";
    FD1S3IX Count_289__i14 (.D(n69[14]), .CK(Clk_c), .CD(n402), .Q(Count[14])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i14.GSR = "ENABLED";
    FD1S3IX Count_289__i13 (.D(n69[13]), .CK(Clk_c), .CD(n402), .Q(Count[13])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i13.GSR = "ENABLED";
    FD1S3IX Count_289__i12 (.D(n69[12]), .CK(Clk_c), .CD(n402), .Q(Count[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i12.GSR = "ENABLED";
    FD1S3IX Count_289__i11 (.D(n69[11]), .CK(Clk_c), .CD(n402), .Q(Count[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i11.GSR = "ENABLED";
    FD1S3IX Count_289__i10 (.D(n69[10]), .CK(Clk_c), .CD(n402), .Q(Count[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i10.GSR = "ENABLED";
    FD1S3IX Count_289__i9 (.D(n69[9]), .CK(Clk_c), .CD(n402), .Q(Count[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i9.GSR = "ENABLED";
    FD1S3IX Count_289__i8 (.D(n69[8]), .CK(Clk_c), .CD(n402), .Q(Count[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i8.GSR = "ENABLED";
    FD1S3IX Count_289__i7 (.D(n69[7]), .CK(Clk_c), .CD(n402), .Q(Count[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i7.GSR = "ENABLED";
    FD1S3IX Count_289__i6 (.D(n69[6]), .CK(Clk_c), .CD(n402), .Q(Count[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i6.GSR = "ENABLED";
    FD1S3IX Count_289__i5 (.D(n69[5]), .CK(Clk_c), .CD(n402), .Q(Count[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i5.GSR = "ENABLED";
    FD1S3IX Count_289__i4 (.D(n69[4]), .CK(Clk_c), .CD(n402), .Q(Count[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i4.GSR = "ENABLED";
    FD1S3IX Count_289__i3 (.D(n69[3]), .CK(Clk_c), .CD(n402), .Q(Count[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i3.GSR = "ENABLED";
    FD1S3IX Count_289__i2 (.D(n69[2]), .CK(Clk_c), .CD(n402), .Q(Count[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i2.GSR = "ENABLED";
    FD1S3IX Count_289__i1 (.D(n69[1]), .CK(Clk_c), .CD(n402), .Q(Count[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i1.GSR = "ENABLED";
    CCU2C Count_289_add_4_9 (.A0(Count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[8]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1198), .COUT(n1199), .S0(n69[7]), .S1(n69[8]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_9.INIT0 = 16'haaa0;
    defparam Count_289_add_4_9.INIT1 = 16'haaa0;
    defparam Count_289_add_4_9.INJECT1_0 = "NO";
    defparam Count_289_add_4_9.INJECT1_1 = "NO";
    LUT4 i558_4_lut (.A(Count[15]), .B(n1606), .C(n28), .D(Count[14]), 
         .Z(Out_Valid_N_305)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam i558_4_lut.init = 16'heccc;
    CCU2C Count_289_add_4_3 (.A0(Count[1]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1195), .COUT(n1196), .S0(n69[1]), .S1(n69[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_3.INIT0 = 16'h6aaa;
    defparam Count_289_add_4_3.INIT1 = 16'h555f;
    defparam Count_289_add_4_3.INJECT1_0 = "NO";
    defparam Count_289_add_4_3.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_13 (.A0(Count[11]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1200), .COUT(n1201), .S0(n69[11]), .S1(n69[12]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_13.INIT0 = 16'h6aaa;
    defparam Count_289_add_4_13.INIT1 = 16'haaa0;
    defparam Count_289_add_4_13.INJECT1_0 = "NO";
    defparam Count_289_add_4_13.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_7 (.A0(Count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1197), .COUT(n1198), .S0(n69[5]), .S1(n69[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_7.INIT0 = 16'h555f;
    defparam Count_289_add_4_7.INIT1 = 16'h555f;
    defparam Count_289_add_4_7.INJECT1_0 = "NO";
    defparam Count_289_add_4_7.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_11 (.A0(Count[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[10]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1199), .COUT(n1200), .S0(n69[9]), .S1(n69[10]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_11.INIT0 = 16'haaa0;
    defparam Count_289_add_4_11.INIT1 = 16'h6aaa;
    defparam Count_289_add_4_11.INJECT1_0 = "NO";
    defparam Count_289_add_4_11.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[0]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .COUT(n1195), .S1(n69[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_1.INIT0 = 16'h0000;
    defparam Count_289_add_4_1.INIT1 = 16'h6aaa;
    defparam Count_289_add_4_1.INJECT1_0 = "NO";
    defparam Count_289_add_4_1.INJECT1_1 = "NO";
    LUT4 i387_4_lut (.A(n1431), .B(Count[13]), .C(Count[12]), .D(n1417), 
         .Z(n28)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i387_4_lut.init = 16'hfcec;
    LUT4 i1_2_lut (.A(Count[11]), .B(Count[10]), .Z(n1431)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_4_lut (.A(n1451), .B(n1439), .C(n1380), .D(Count[3]), .Z(n1417)) /* synthesis lut_function=(A (B+(C (D)))) */ ;
    defparam i1_4_lut.init = 16'ha888;
    LUT4 i1_3_lut (.A(Count[8]), .B(Count[7]), .C(Count[9]), .Z(n1451)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut.init = 16'h8080;
    LUT4 i1_3_lut_adj_11 (.A(Count[5]), .B(Count[4]), .C(Count[6]), .Z(n1439)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_11.init = 16'hfefe;
    LUT4 i1_3_lut_adj_12 (.A(Count[2]), .B(Count[0]), .C(Count[1]), .Z(n1380)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_12.init = 16'hfefe;
    LUT4 In_Sync_I_0_29_2_lut_rep_26 (.A(\r.TxSync ), .B(\r.TxSyncLast ), 
         .Z(n1606)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam In_Sync_I_0_29_2_lut_rep_26.init = 16'h2222;
    LUT4 i192_2_lut_3_lut (.A(\r.TxSync ), .B(\r.TxSyncLast ), .C(Rst_c), 
         .Z(n402)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam i192_2_lut_3_lut.init = 16'hf2f2;
    
endmodule
//
// Verilog Description of module \olo_base_strobe_gen(125000000.0,230400.0,true)_U0 
//

module \olo_base_strobe_gen(125000000.0,230400.0,true)_U0  (RxStrobe, Clk_c, 
            Rst_c, \r.RxSync , GND_net, VCC_net, n253);
    output RxStrobe;
    input Clk_c;
    input Rst_c;
    input \r.RxSync ;
    input GND_net;
    input VCC_net;
    output n253;
    
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(43[9:18])
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(44[9:18])
    
    wire Out_Valid_N_305, SyncLast;
    wire [15:0]Count;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(63[12:17])
    
    wire n406;
    wire [15:0]n69;
    
    wire n1611, n28, n1433, n1425, n1443, n1447, n1379, n1223, 
        n1222, n1221, n1220, n1219, n1218, n1217, n1216;
    
    FD1S3IX Out_Valid_25 (.D(Out_Valid_N_305), .CK(Clk_c), .CD(Rst_c), 
            .Q(RxStrobe)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=418, LSE_RLINE=418 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Out_Valid_25.GSR = "ENABLED";
    FD1S3IX SyncLast_26 (.D(\r.RxSync ), .CK(Clk_c), .CD(Rst_c), .Q(SyncLast)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=418, LSE_RLINE=418 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam SyncLast_26.GSR = "ENABLED";
    FD1S3IX Count_291__i0 (.D(n69[0]), .CK(Clk_c), .CD(n406), .Q(Count[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i0.GSR = "ENABLED";
    LUT4 i559_4_lut (.A(Count[15]), .B(n1611), .C(n28), .D(Count[14]), 
         .Z(Out_Valid_N_305)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam i559_4_lut.init = 16'heccc;
    LUT4 In_Sync_I_0_29_2_lut_rep_31 (.A(\r.RxSync ), .B(SyncLast), .Z(n1611)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam In_Sync_I_0_29_2_lut_rep_31.init = 16'h2222;
    LUT4 i196_2_lut_3_lut (.A(\r.RxSync ), .B(SyncLast), .C(Rst_c), .Z(n406)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam i196_2_lut_3_lut.init = 16'hf2f2;
    LUT4 i373_4_lut (.A(n1433), .B(Count[13]), .C(Count[12]), .D(n1425), 
         .Z(n28)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i373_4_lut.init = 16'hfcec;
    LUT4 i1_2_lut (.A(Count[11]), .B(Count[10]), .Z(n1433)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_4_lut (.A(n1443), .B(n1447), .C(n1379), .D(Count[3]), .Z(n1425)) /* synthesis lut_function=(A (B+(C (D)))) */ ;
    defparam i1_4_lut.init = 16'ha888;
    LUT4 i1_3_lut (.A(Count[8]), .B(Count[7]), .C(Count[9]), .Z(n1443)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut.init = 16'h8080;
    LUT4 i1_3_lut_adj_9 (.A(Count[5]), .B(Count[4]), .C(Count[6]), .Z(n1447)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_9.init = 16'hfefe;
    FD1S3IX Count_291__i15 (.D(n69[15]), .CK(Clk_c), .CD(n406), .Q(Count[15])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i15.GSR = "ENABLED";
    LUT4 i1_3_lut_adj_10 (.A(Count[2]), .B(Count[0]), .C(Count[1]), .Z(n1379)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_10.init = 16'hfefe;
    FD1S3IX Count_291__i14 (.D(n69[14]), .CK(Clk_c), .CD(n406), .Q(Count[14])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i14.GSR = "ENABLED";
    FD1S3IX Count_291__i13 (.D(n69[13]), .CK(Clk_c), .CD(n406), .Q(Count[13])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i13.GSR = "ENABLED";
    FD1S3IX Count_291__i12 (.D(n69[12]), .CK(Clk_c), .CD(n406), .Q(Count[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i12.GSR = "ENABLED";
    FD1S3IX Count_291__i11 (.D(n69[11]), .CK(Clk_c), .CD(n406), .Q(Count[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i11.GSR = "ENABLED";
    FD1S3IX Count_291__i10 (.D(n69[10]), .CK(Clk_c), .CD(n406), .Q(Count[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i10.GSR = "ENABLED";
    FD1S3IX Count_291__i9 (.D(n69[9]), .CK(Clk_c), .CD(n406), .Q(Count[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i9.GSR = "ENABLED";
    FD1S3IX Count_291__i8 (.D(n69[8]), .CK(Clk_c), .CD(n406), .Q(Count[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i8.GSR = "ENABLED";
    FD1S3IX Count_291__i7 (.D(n69[7]), .CK(Clk_c), .CD(n406), .Q(Count[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i7.GSR = "ENABLED";
    FD1S3IX Count_291__i6 (.D(n69[6]), .CK(Clk_c), .CD(n406), .Q(Count[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i6.GSR = "ENABLED";
    FD1S3IX Count_291__i5 (.D(n69[5]), .CK(Clk_c), .CD(n406), .Q(Count[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i5.GSR = "ENABLED";
    FD1S3IX Count_291__i4 (.D(n69[4]), .CK(Clk_c), .CD(n406), .Q(Count[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i4.GSR = "ENABLED";
    FD1S3IX Count_291__i3 (.D(n69[3]), .CK(Clk_c), .CD(n406), .Q(Count[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i3.GSR = "ENABLED";
    FD1S3IX Count_291__i2 (.D(n69[2]), .CK(Clk_c), .CD(n406), .Q(Count[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i2.GSR = "ENABLED";
    FD1S3IX Count_291__i1 (.D(n69[1]), .CK(Clk_c), .CD(n406), .Q(Count[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i1.GSR = "ENABLED";
    CCU2C Count_291_add_4_17 (.A0(Count[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1223), .S0(n69[15]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_17.INIT0 = 16'haaa0;
    defparam Count_291_add_4_17.INIT1 = 16'h0000;
    defparam Count_291_add_4_17.INJECT1_0 = "NO";
    defparam Count_291_add_4_17.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_15 (.A0(Count[13]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1222), .COUT(n1223), .S0(n69[13]), .S1(n69[14]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_15.INIT0 = 16'h6aaa;
    defparam Count_291_add_4_15.INIT1 = 16'haaa0;
    defparam Count_291_add_4_15.INJECT1_0 = "NO";
    defparam Count_291_add_4_15.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_13 (.A0(Count[11]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1221), .COUT(n1222), .S0(n69[11]), .S1(n69[12]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_13.INIT0 = 16'h6aaa;
    defparam Count_291_add_4_13.INIT1 = 16'haaa0;
    defparam Count_291_add_4_13.INJECT1_0 = "NO";
    defparam Count_291_add_4_13.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_11 (.A0(Count[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[10]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1220), .COUT(n1221), .S0(n69[9]), .S1(n69[10]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_11.INIT0 = 16'haaa0;
    defparam Count_291_add_4_11.INIT1 = 16'h6aaa;
    defparam Count_291_add_4_11.INJECT1_0 = "NO";
    defparam Count_291_add_4_11.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_9 (.A0(Count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[8]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1219), .COUT(n1220), .S0(n69[7]), .S1(n69[8]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_9.INIT0 = 16'haaa0;
    defparam Count_291_add_4_9.INIT1 = 16'haaa0;
    defparam Count_291_add_4_9.INJECT1_0 = "NO";
    defparam Count_291_add_4_9.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_7 (.A0(Count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1218), .COUT(n1219), .S0(n69[5]), .S1(n69[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_7.INIT0 = 16'h555f;
    defparam Count_291_add_4_7.INIT1 = 16'h555f;
    defparam Count_291_add_4_7.INJECT1_0 = "NO";
    defparam Count_291_add_4_7.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_5 (.A0(Count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[4]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1217), .COUT(n1218), .S0(n69[3]), .S1(n69[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_5.INIT0 = 16'haaa0;
    defparam Count_291_add_4_5.INIT1 = 16'h6aaa;
    defparam Count_291_add_4_5.INJECT1_0 = "NO";
    defparam Count_291_add_4_5.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_3 (.A0(Count[1]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1216), .COUT(n1217), .S0(n69[1]), .S1(n69[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_3.INIT0 = 16'h6aaa;
    defparam Count_291_add_4_3.INIT1 = 16'h555f;
    defparam Count_291_add_4_3.INJECT1_0 = "NO";
    defparam Count_291_add_4_3.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[0]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .COUT(n1216), .S1(n69[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_1.INIT0 = 16'h0000;
    defparam Count_291_add_4_1.INIT1 = 16'h6aaa;
    defparam Count_291_add_4_1.INJECT1_0 = "NO";
    defparam Count_291_add_4_1.INJECT1_1 = "NO";
    LUT4 i100_1_lut (.A(RxStrobe), .Z(n253)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam i100_1_lut.init = 16'h5555;
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

