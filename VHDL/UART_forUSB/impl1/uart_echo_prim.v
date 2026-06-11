// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Fri May 29 16:44:21 2026
//
// Verilog Description of module uart_echo
//

module uart_echo (Clk, Rst, n_Rst, Uart_Tx, Uart_Rx, leds);   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(5[8:17])
    input Clk;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    input Rst;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(8[9:12])
    output n_Rst;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(9[3:8])
    output Uart_Tx;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(11[9:16])
    input Uart_Rx;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[9:16])
    output [7:0]leds;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(43[9:18])
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(44[9:18])
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    
    wire Rst_c, n_Rst_c, Uart_Tx_c, Uart_Rx_c_0, leds_0_6, leds_0_5, 
        leds_0_4, leds_0_3, leds_0_2, leds_0_1, leds_0_0, tx_valid, 
        tx_ready;
    wire [7:0]tx_data;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(21[12:19])
    
    wire rx_valid;
    wire [7:0]rx_data;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(24[12:19])
    
    wire echo_pending;
    wire [7:0]echo_data;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(28[12:21])
    
    wire tx_valid_N_35, Clk_c_enable_32, Clk_c_enable_39, n967, n147, 
        n1065, n1695;
    
    VHI i2 (.Z(VCC_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    FD1P3AX echo_data_i0_i0 (.D(rx_data[0]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(echo_data[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_data_i0_i0.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i0 (.D(echo_data[0]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(tx_data[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_data_i0_i0.GSR = "ENABLED";
    FD1P3IX echo_pending_26 (.D(VCC_net), .SP(rx_valid), .CD(n967), .CK(Clk_c), 
            .Q(echo_pending)) /* synthesis lse_init_val=0 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_pending_26.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i4 (.D(rx_data[4]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(echo_data[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_data_i0_i4.GSR = "ENABLED";
    OB leds_pad_6 (.I(leds_0_6), .O(leds[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    GSR GSR_INST (.GSR(VCC_net));
    FD1S3IX tx_valid_25 (.D(tx_valid_N_35), .CK(Clk_c), .CD(Rst_c), .Q(tx_valid)) /* synthesis lse_init_val=0 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_valid_25.GSR = "ENABLED";
    OB leds_pad_5 (.I(leds_0_5), .O(leds[5]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    LUT4 Rst_I_0_1_lut (.A(Rst_c), .Z(n_Rst_c)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(31[11:18])
    defparam Rst_I_0_1_lut.init = 16'h5555;
    OB leds_pad_7 (.I(VCC_net), .O(leds[7]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    OB Uart_Tx_pad (.I(Uart_Tx_c), .O(Uart_Tx));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(11[9:16])
    LUT4 tx_valid_I_0_31_2_lut_rep_35 (.A(tx_valid), .B(tx_ready), .Z(n1695)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(74[20:53])
    defparam tx_valid_I_0_31_2_lut_rep_35.init = 16'h8888;
    LUT4 i173_2_lut (.A(rx_valid), .B(Rst_c), .Z(Clk_c_enable_39)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(67[13] 91[20])
    defparam i173_2_lut.init = 16'h2222;
    FD1P3AX echo_data_i0_i3 (.D(rx_data[3]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(echo_data[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_data_i0_i3.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i2 (.D(rx_data[2]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(echo_data[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_data_i0_i2.GSR = "ENABLED";
    OB n_Rst_pad (.I(n_Rst_c), .O(n_Rst));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(9[3:8])
    LUT4 i516_3_lut_3_lut_4_lut (.A(tx_valid), .B(tx_ready), .C(leds_0_3), 
         .D(n147), .Z(n1065)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(74[20:53])
    defparam i516_3_lut_3_lut_4_lut.init = 16'h0080;
    LUT4 i420_2_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(Rst_c), 
         .Z(n967)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(85[20:57])
    defparam i420_2_lut_3_lut.init = 16'hf2f2;
    FD1P3AX echo_data_i0_i1 (.D(rx_data[1]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(echo_data[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_data_i0_i1.GSR = "ENABLED";
    LUT4 i175_2_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(Rst_c), 
         .Z(Clk_c_enable_32)) /* synthesis lut_function=(!((B+(C))+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(85[20:57])
    defparam i175_2_lut_3_lut.init = 16'h0202;
    LUT4 i544_3_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(tx_ready), 
         .Z(tx_valid_N_35)) /* synthesis lut_function=(!(A (B (C))+!A ((C)+!B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(85[20:57])
    defparam i544_3_lut_3_lut.init = 16'h2e2e;
    FD1P3AX tx_data_i0_i7 (.D(echo_data[7]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(tx_data[7]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_data_i0_i7.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i6 (.D(echo_data[6]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(tx_data[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_data_i0_i6.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i5 (.D(echo_data[5]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(tx_data[5]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_data_i0_i5.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i4 (.D(echo_data[4]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(tx_data[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_data_i0_i4.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i3 (.D(echo_data[3]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(tx_data[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_data_i0_i3.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i2 (.D(echo_data[2]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(tx_data[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_data_i0_i2.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i1 (.D(echo_data[1]), .SP(Clk_c_enable_32), .CK(Clk_c), 
            .Q(tx_data[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam tx_data_i0_i1.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i7 (.D(rx_data[7]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(echo_data[7]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_data_i0_i7.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i6 (.D(rx_data[6]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(echo_data[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_data_i0_i6.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i5 (.D(rx_data[5]), .SP(Clk_c_enable_39), .CK(Clk_c), 
            .Q(echo_data[5]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(65[9] 93[16])
    defparam echo_data_i0_i5.GSR = "ENABLED";
    OB leds_pad_4 (.I(leds_0_4), .O(leds[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    OB leds_pad_3 (.I(leds_0_3), .O(leds[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    OB leds_pad_2 (.I(leds_0_2), .O(leds[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    OB leds_pad_1 (.I(leds_0_1), .O(leds[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    OB leds_pad_0 (.I(leds_0_0), .O(leds[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(13[3:7])
    IB Clk_pad (.I(Clk), .O(Clk_c));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    IB Rst_pad (.I(Rst), .O(Rst_c));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(8[9:12])
    IB Uart_Rx_pad (.I(Uart_Rx), .O(Uart_Rx_c_0));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(12[9:16])
    \olo_intf_uart(125000000.0,115200.0,8,"1","none")(1,1,1,4)  u_uart (.tx_data({tx_data}), 
            .Clk_c(Clk_c), .tx_ready(tx_ready), .Rst_c(Rst_c), .Uart_Tx_c(Uart_Tx_c), 
            .n147(n147), .rx_data({rx_data}), .leds_0_1(leds_0_1), .rx_valid(rx_valid), 
            .leds_0_4(leds_0_4), .GND_net(GND_net), .VCC_net(VCC_net), 
            .leds_0_0(leds_0_0), .n1695(n1695), .leds_0_3(leds_0_3), .n1065(n1065), 
            .tx_valid(tx_valid), .leds_0_5(leds_0_5), .Uart_Rx_c_0(Uart_Rx_c_0), 
            .leds_0_6(leds_0_6), .leds_0_2(leds_0_2));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(35[14:39])
    VLO i1 (.Z(GND_net));
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module \olo_intf_uart(125000000.0,115200.0,8,"1","none")(1,1,1,4) 
//

module \olo_intf_uart(125000000.0,115200.0,8,"1","none")(1,1,1,4)  (tx_data, 
            Clk_c, tx_ready, Rst_c, Uart_Tx_c, n147, rx_data, leds_0_1, 
            rx_valid, leds_0_4, GND_net, VCC_net, leds_0_0, n1695, 
            leds_0_3, n1065, tx_valid, leds_0_5, Uart_Rx_c_0, leds_0_6, 
            leds_0_2);
    input [7:0]tx_data;
    input Clk_c;
    output tx_ready;
    input Rst_c;
    output Uart_Tx_c;
    output n147;
    output [7:0]rx_data;
    output leds_0_1;
    output rx_valid;
    output leds_0_4;
    input GND_net;
    input VCC_net;
    output leds_0_0;
    input n1695;
    output leds_0_3;
    input n1065;
    input tx_valid;
    output leds_0_5;
    input Uart_Rx_c_0;
    output leds_0_6;
    output leds_0_2;
    
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(43[9:18])
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(44[9:18])
    wire \r_next.Rx_ParityError_N_269  /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[15:21])
    wire [9:0]\r.TxShiftReg ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    
    wire n410;
    wire [8:0]n646;
    wire [4:0]\r.TxCount ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    
    wire Clk_c_enable_12, n1060;
    wire [4:0]n1;
    
    wire Clk_c_enable_5, \r_next.Tx_Ready , n1056, \r.RxSync , n1055, 
        UartRxInt_N_201, \r.TxSync , n1535;
    wire [3:0]\r.RxCount ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    wire [3:0]\r_next.RxCount ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[15:21])
    
    wire Clk_c_enable_25;
    wire [7:0]n274;
    wire [3:0]\r_next.RxCount_3__N_208 ;
    
    wire n1604, n2;
    wire [25:0]n191;
    wire [25:0]n109;
    
    wire TxStrobe;
    wire [3:0]n145;
    
    wire n1414, n9, n979, n1603, \r_next.StateTx_1__N_171 , n1599, 
        n254;
    wire [2:0]\r.StateRx ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[12:13])
    
    wire n982, n1615, n1602, n9_adj_316, n977, Clk_c_enable_36, 
        n1063, n1124, RxStrobe, n1581, n1598, n1049, n1206;
    wire [25:0]heartbeat_cnt;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(137[9:22])
    
    wire n1600, n1047, n393, n1454, n1618, n1605, n1583, n1617, 
        n1579, n1601, n1612, n1608, n2_adj_318, n3, n1205, n1610, 
        n1204, n1203, n999, n1360, n989, n1202, n1611, n1201, 
        n1561, n1562, n1200, n1195, n1196, n1609, n1510, n1580, 
        n1425, n6_adj_322, n1584, n1197, n1198, n1194, n1199, 
        n1582, n2_adj_323;
    wire [3:0]\r_next.RxCount_3__N_109 ;
    
    wire n1578, n1614, \r.TxSyncLast ;
    
    LUT4 mux_260_i8_3_lut (.A(tx_data[6]), .B(\r.TxShiftReg [8]), .C(n410), 
         .Z(n646[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_260_i8_3_lut.init = 16'hcaca;
    FD1P3IX \r.TxCount_288__i1  (.D(n1[1]), .SP(Clk_c_enable_12), .CD(n1060), 
            .CK(Clk_c), .Q(\r.TxCount [1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i1 .GSR = "ENABLED";
    FD1P3IX \r.TxCount_288__i2  (.D(n1[2]), .SP(Clk_c_enable_12), .CD(n1060), 
            .CK(Clk_c), .Q(\r.TxCount [2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i2 .GSR = "ENABLED";
    FD1P3IX \r.Tx_Ready_126  (.D(\r_next.Tx_Ready ), .SP(Clk_c_enable_5), 
            .CD(Rst_c), .CK(Clk_c), .Q(tx_ready)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.Tx_Ready_126 .GSR = "ENABLED";
    LUT4 mux_260_i7_3_lut (.A(tx_data[5]), .B(\r.TxShiftReg [7]), .C(n410), 
         .Z(n646[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_260_i7_3_lut.init = 16'hcaca;
    FD1S3JX \r.Uart_Tx_130  (.D(\r.TxShiftReg [0]), .CK(Clk_c), .PD(n1056), 
            .Q(Uart_Tx_c)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.Uart_Tx_130 .GSR = "ENABLED";
    LUT4 i617_2_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .Z(n1[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i617_2_lut.init = 16'h6666;
    LUT4 i507_1_lut (.A(n147), .Z(n1056)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i507_1_lut.init = 16'h5555;
    FD1P3IX \r.TxCount_288__i3  (.D(n1[3]), .SP(Clk_c_enable_12), .CD(n1060), 
            .CK(Clk_c), .Q(\r.TxCount [3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i3 .GSR = "ENABLED";
    FD1S3IX \r.RxSync_133  (.D(UartRxInt_N_201), .CK(Clk_c), .CD(n1055), 
            .Q(\r.RxSync )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxSync_133 .GSR = "ENABLED";
    FD1S3AX \r.TxSync_127  (.D(n1535), .CK(Clk_c), .Q(\r.TxSync )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxSync_127 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i0  (.D(\r_next.RxCount [0]), .CK(Clk_c), .Q(\r.RxCount [0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxCount_i0 .GSR = "ENABLED";
    LUT4 mux_260_i6_3_lut (.A(tx_data[4]), .B(\r.TxShiftReg [6]), .C(n410), 
         .Z(n646[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_260_i6_3_lut.init = 16'hcaca;
    FD1P3AX \r.RxShiftReg__i0  (.D(rx_data[1]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(rx_data[0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i0 .GSR = "ENABLED";
    LUT4 select_157_Select_2_i2_4_lut (.A(\r.RxCount [2]), .B(n274[1]), 
         .C(\r_next.RxCount_3__N_208 [2]), .D(n1604), .Z(n2)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam select_157_Select_2_i2_4_lut.init = 16'h88c0;
    FD1S3IX heartbeat_cnt_290__i0 (.D(n109[0]), .CK(Clk_c), .CD(Rst_c), 
            .Q(n191[0])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i0.GSR = "ENABLED";
    LUT4 parity_err_sticky_I_0_174_i2_1_lut (.A(TxStrobe), .Z(leds_0_1)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i2_1_lut.init = 16'h5555;
    LUT4 i569_2_lut_4_lut_4_lut_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [1]), 
         .C(\r.RxCount [0]), .Z(\r_next.RxCount_3__N_208 [2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(290[38:47])
    defparam i569_2_lut_4_lut_4_lut_4_lut.init = 16'h6a6a;
    FD1S3AX \r.StateTx_FSM_i0  (.D(Rst_c), .CK(Clk_c), .Q(n145[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i0 .GSR = "ENABLED";
    LUT4 i432_4_lut (.A(n145[3]), .B(n1414), .C(TxStrobe), .D(n9), .Z(n979)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i432_4_lut.init = 16'heece;
    LUT4 i1_2_lut_rep_24_3_lut (.A(\r.TxCount [1]), .B(\r.TxCount [2]), 
         .C(\r.TxCount [3]), .Z(n1603)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_rep_24_3_lut.init = 16'hfefe;
    LUT4 i1_4_lut (.A(\r_next.StateTx_1__N_171 ), .B(n1599), .C(n147), 
         .D(\r.TxCount [4]), .Z(n1414)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam i1_4_lut.init = 16'h2000;
    FD1S3IX \r.Rx_Valid_136  (.D(\r.StateRx [2]), .CK(Clk_c), .CD(n254), 
            .Q(rx_valid)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.Rx_Valid_136 .GSR = "ENABLED";
    LUT4 i423_3_lut_4_lut (.A(n9), .B(TxStrobe), .C(n145[3]), .D(n982), 
         .Z(Clk_c_enable_12)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A !(C+!(D))) */ ;
    defparam i423_3_lut_4_lut.init = 16'h8f80;
    LUT4 i513_4_lut_then_4_lut (.A(n145[3]), .B(\r_next.StateTx_1__N_171 ), 
         .C(n147), .D(n982), .Z(n1615)) /* synthesis lut_function=(!(A+(B (C+!(D))+!B !(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i513_4_lut_then_4_lut.init = 16'h1500;
    LUT4 i570_2_lut_4_lut_3_lut_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [0]), 
         .C(\r.RxCount [2]), .D(\r.RxCount [3]), .Z(\r_next.RxCount_3__N_208 [1])) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A !(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(290[38:47])
    defparam i570_2_lut_4_lut_3_lut_4_lut.init = 16'h6664;
    LUT4 i430_4_lut (.A(n147), .B(n1602), .C(\r_next.StateTx_1__N_171 ), 
         .D(n9_adj_316), .Z(n977)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i430_4_lut.init = 16'heece;
    LUT4 i514_2_lut (.A(Clk_c_enable_36), .B(n410), .Z(n1063)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam i514_2_lut.init = 16'h8888;
    LUT4 \r.StateRx_2__bdd_4_lut  (.A(\r.StateRx [2]), .B(n1124), .C(n274[2]), 
         .D(RxStrobe), .Z(n1581)) /* synthesis lut_function=(A (B (C+!(D))+!B !(D))+!A (B (C (D)))) */ ;
    defparam \r.StateRx_2__bdd_4_lut .init = 16'hc0aa;
    LUT4 i1_4_lut_adj_13 (.A(\r_next.StateTx_1__N_171 ), .B(n1598), .C(n147), 
         .D(\r.TxCount [0]), .Z(n410)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(200[17] 212[24])
    defparam i1_4_lut_adj_13.init = 16'h8000;
    FD1S3JX \r.StateRx_FSM_i1  (.D(n1049), .CK(Clk_c), .PD(Rst_c), .Q(leds_0_4));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam \r.StateRx_FSM_i1 .GSR = "ENABLED";
    FD1P3IX \r.TxCount_288__i4  (.D(n1[4]), .SP(Clk_c_enable_12), .CD(n1060), 
            .CK(Clk_c), .Q(\r.TxCount [4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i4 .GSR = "ENABLED";
    CCU2C heartbeat_cnt_290_add_4_27 (.A0(heartbeat_cnt[25]), .B0(GND_net), 
          .C0(GND_net), .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n1206), .S0(n109[25]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_27.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_27.INIT1 = 16'h0000;
    defparam heartbeat_cnt_290_add_4_27.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_27.INJECT1_1 = "NO";
    LUT4 i568_2_lut_4_lut_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [3]), 
         .C(\r.RxCount [1]), .D(\r.RxCount [0]), .Z(\r_next.RxCount_3__N_208 [3])) /* synthesis lut_function=(!(A (B (C (D))+!B !(C (D)))+!A !(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(252[24:37])
    defparam i568_2_lut_4_lut_4_lut.init = 16'h6ccc;
    LUT4 i1_2_lut_rep_19_3_lut_4_lut (.A(\r.TxCount [1]), .B(\r.TxCount [2]), 
         .C(\r.TxCount [4]), .D(\r.TxCount [3]), .Z(n1598)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;
    defparam i1_2_lut_rep_19_3_lut_4_lut.init = 16'hffef;
    LUT4 i2_3_lut_4_lut (.A(n274[1]), .B(n1604), .C(leds_0_4), .D(n1600), 
         .Z(n1047)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i2_3_lut_4_lut.init = 16'hf2f0;
    LUT4 i506_1_lut (.A(leds_0_4), .Z(n1055)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i506_1_lut.init = 16'h5555;
    LUT4 parity_err_sticky_I_0_174_i1_1_lut (.A(heartbeat_cnt[25]), .Z(leds_0_0)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i1_1_lut.init = 16'h5555;
    LUT4 i269_4_lut_rep_18 (.A(n1695), .B(n393), .C(n147), .D(leds_0_3), 
         .Z(Clk_c_enable_36)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i269_4_lut_rep_18.init = 16'hcac0;
    LUT4 i1_4_lut_adj_14 (.A(\r.TxCount [3]), .B(\r.TxCount [0]), .C(n1454), 
         .D(\r.TxCount [1]), .Z(n9)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;
    defparam i1_4_lut_adj_14.init = 16'hfffb;
    LUT4 mux_287_i4_4_lut_then_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [2]), 
         .C(RxStrobe), .D(\r.RxCount [0]), .Z(n1618)) /* synthesis lut_function=(!(A (B (C (D))))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(272[21] 281[28])
    defparam mux_287_i4_4_lut_then_4_lut.init = 16'h7fff;
    LUT4 n5_bdd_4_lut (.A(n1605), .B(n1604), .C(n274[1]), .D(\r.RxCount [1]), 
         .Z(n1583)) /* synthesis lut_function=(!(A (B+!(C))+!A (B+((D)+!C)))) */ ;
    defparam n5_bdd_4_lut.init = 16'h2030;
    LUT4 mux_287_i4_4_lut_else_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [2]), 
         .C(RxStrobe), .D(\r.RxCount [0]), .Z(n1617)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(272[21] 281[28])
    defparam mux_287_i4_4_lut_else_4_lut.init = 16'h8000;
    FD1P3IX \r.TxShiftReg__i1  (.D(\r.TxShiftReg [1]), .SP(Clk_c_enable_36), 
            .CD(n1065), .CK(Clk_c), .Q(\r.TxShiftReg [0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i1 .GSR = "ENABLED";
    LUT4 n281_bdd_2_lut (.A(\r_next.Rx_ParityError_N_269 ), .B(leds_0_4), 
         .Z(n1579)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam n281_bdd_2_lut.init = 16'h4444;
    FD1P3IX \r.TxShiftReg__i9  (.D(tx_data[7]), .SP(Clk_c_enable_36), .CD(n1063), 
            .CK(Clk_c), .Q(\r.TxShiftReg [8])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i9 .GSR = "ENABLED";
    LUT4 i1_3_lut_rep_22 (.A(\r.StateRx [2]), .B(leds_0_4), .C(\r_next.Rx_ParityError_N_269 ), 
         .Z(n1601)) /* synthesis lut_function=(A+(B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_3_lut_rep_22.init = 16'heaea;
    FD1P3IX \r.TxCount_288__i0  (.D(n1612), .SP(Clk_c_enable_12), .CD(n1060), 
            .CK(Clk_c), .Q(\r.TxCount [0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam \r.TxCount_288__i0 .GSR = "ENABLED";
    LUT4 \r_next.StateTx_1__I_0_161_2_lut_rep_29  (.A(tx_ready), .B(TxStrobe), 
         .Z(n1608)) /* synthesis lut_function=(!(A+!(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(187[20:55])
    defparam \r_next.StateTx_1__I_0_161_2_lut_rep_29 .init = 16'h4444;
    LUT4 i207_2_lut_rep_23_3_lut (.A(tx_ready), .B(TxStrobe), .C(leds_0_3), 
         .Z(n1602)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(187[20:55])
    defparam i207_2_lut_rep_23_3_lut.init = 16'h4040;
    LUT4 i1_4_lut_adj_15 (.A(\r.RxCount [1]), .B(n2_adj_318), .C(n3), 
         .D(n1601), .Z(\r_next.RxCount [1])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_15.init = 16'hfefc;
    CCU2C heartbeat_cnt_290_add_4_25 (.A0(n191[23]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[24]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1205), .COUT(n1206), .S0(n109[23]), .S1(n109[24]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_25.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_25.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_25.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_25.INJECT1_1 = "NO";
    LUT4 i80_2_lut_rep_31 (.A(n147), .B(n145[3]), .Z(n1610)) /* synthesis lut_function=(A+(B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i80_2_lut_rep_31.init = 16'heeee;
    CCU2C heartbeat_cnt_290_add_4_23 (.A0(n191[21]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[22]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1204), .COUT(n1205), .S0(n109[21]), .S1(n109[22]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_23.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_23.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_23.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_23.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_21 (.A0(n191[19]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[20]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1203), .COUT(n1204), .S0(n109[19]), .S1(n109[20]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_21.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_21.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_21.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_21.INJECT1_1 = "NO";
    LUT4 i953_3_lut_4_lut_3_lut (.A(tx_ready), .B(leds_0_3), .C(tx_valid), 
         .Z(n1535)) /* synthesis lut_function=(A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(187[20:55])
    defparam i953_3_lut_4_lut_3_lut.init = 16'h8080;
    LUT4 i1_3_lut_4_lut (.A(n147), .B(n145[3]), .C(Rst_c), .D(n999), 
         .Z(Clk_c_enable_5)) /* synthesis lut_function=(A (C+(D))+!A ((C+(D))+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i1_3_lut_4_lut.init = 16'hfff1;
    LUT4 i441_4_lut (.A(n274[2]), .B(n1360), .C(RxStrobe), .D(n1124), 
         .Z(n989)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i441_4_lut.init = 16'hceee;
    CCU2C heartbeat_cnt_290_add_4_19 (.A0(n191[17]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[18]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1202), .COUT(n1203), .S0(n109[17]), .S1(n109[18]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_19.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_19.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_19.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_19.INJECT1_1 = "NO";
    LUT4 i620_2_lut_rep_32 (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .Z(n1611)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i620_2_lut_rep_32.init = 16'h8888;
    CCU2C heartbeat_cnt_290_add_4_17 (.A0(n191[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[16]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1201), .COUT(n1202), .S0(n109[15]), .S1(n109[16]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_17.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_17.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_17.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_17.INJECT1_1 = "NO";
    LUT4 n123_bdd_2_lut_962 (.A(n1561), .B(n274[2]), .Z(n1562)) /* synthesis lut_function=(A (B)) */ ;
    defparam n123_bdd_2_lut_962.init = 16'h8888;
    CCU2C heartbeat_cnt_290_add_4_15 (.A0(n191[13]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[14]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1200), .COUT(n1201), .S0(n109[13]), .S1(n109[14]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_15.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_15.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_15.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_15.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_5 (.A0(n191[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[4]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1195), .COUT(n1196), .S0(n109[3]), .S1(n109[4]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_5.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_5.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_5.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_5.INJECT1_1 = "NO";
    LUT4 UartRxInt_I_0_1_lut (.A(\r_next.Rx_ParityError_N_269 ), .Z(UartRxInt_N_201)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(243[20:35])
    defparam UartRxInt_I_0_1_lut.init = 16'h5555;
    FD1S3IX \r.StateRx_FSM_i4  (.D(n1581), .CK(Clk_c), .CD(Rst_c), .Q(\r.StateRx [2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam \r.StateRx_FSM_i4 .GSR = "ENABLED";
    LUT4 n280_bdd_4_lut_993 (.A(\r.RxCount [2]), .B(RxStrobe), .C(\r.RxCount [1]), 
         .D(\r.RxCount [0]), .Z(n1561)) /* synthesis lut_function=(!(A (B (C (D)))+!A !(B (C (D))))) */ ;
    defparam n280_bdd_4_lut_993.init = 16'h6aaa;
    LUT4 i624_2_lut_3_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .C(\r.TxCount [2]), 
         .Z(n1[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i624_2_lut_3_lut.init = 16'h7878;
    LUT4 i631_2_lut_3_lut_4_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), 
         .C(\r.TxCount [3]), .D(\r.TxCount [2]), .Z(n1[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i631_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 select_157_Select_1_i2_4_lut (.A(\r.RxCount [1]), .B(n274[1]), 
         .C(\r_next.RxCount_3__N_208 [1]), .D(n1604), .Z(n2_adj_318)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam select_157_Select_1_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_16 (.A(n1610), .B(tx_valid), .C(leds_0_3), .D(tx_ready), 
         .Z(\r_next.Tx_Ready )) /* synthesis lut_function=(A+!(B (C)+!B !((D)+!C))) */ ;
    defparam i1_4_lut_adj_16.init = 16'hbfaf;
    LUT4 i1_4_lut_adj_17 (.A(n1609), .B(\r.TxCount [3]), .C(\r.TxCount [4]), 
         .D(n1510), .Z(n999)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam i1_4_lut_adj_17.init = 16'h0100;
    FD1S3IX \r.StateRx_FSM_i3  (.D(n989), .CK(Clk_c), .CD(Rst_c), .Q(n274[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam \r.StateRx_FSM_i3 .GSR = "ENABLED";
    FD1S3IX \r.StateRx_FSM_i2  (.D(n1580), .CK(Clk_c), .CD(Rst_c), .Q(n274[1]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam \r.StateRx_FSM_i2 .GSR = "ENABLED";
    LUT4 i1_3_lut_4_lut_adj_18 (.A(n1603), .B(\r.TxCount [4]), .C(\r.TxCount [0]), 
         .D(\r_next.StateTx_1__N_171 ), .Z(n393)) /* synthesis lut_function=(A (C (D))+!A !(B+!(C (D)))) */ ;
    defparam i1_3_lut_4_lut_adj_18.init = 16'hb000;
    FD1P3AX \r.TxShiftReg__i8  (.D(n646[7]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(\r.TxShiftReg [7])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i8 .GSR = "ENABLED";
    LUT4 i1_2_lut_rep_30 (.A(\r.TxCount [1]), .B(\r.TxCount [2]), .Z(n1609)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_30.init = 16'heeee;
    FD1P3AX \r.TxShiftReg__i7  (.D(n646[6]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(\r.TxShiftReg [6])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i7 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i6  (.D(n646[5]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(\r.TxShiftReg [5])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i6 .GSR = "ENABLED";
    FD1S3IX \r.StateTx_FSM_i3  (.D(n979), .CK(Clk_c), .CD(Rst_c), .Q(n145[3]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i3 .GSR = "ENABLED";
    LUT4 i1_3_lut_4_lut_adj_19 (.A(\r.RxCount [2]), .B(\r.RxCount [1]), 
         .C(\r.RxCount [3]), .D(\r.RxCount [0]), .Z(n1124)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(290[38:47])
    defparam i1_3_lut_4_lut_adj_19.init = 16'h8000;
    LUT4 i381_1_lut_rep_33 (.A(\r.TxCount [0]), .Z(n1612)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(202[24:54])
    defparam i381_1_lut_rep_33.init = 16'h5555;
    FD1S3IX \r.StateTx_FSM_i2  (.D(n977), .CK(Clk_c), .CD(Rst_c), .Q(n147));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i2 .GSR = "ENABLED";
    FD1S3IX \r.StateTx_FSM_i1  (.D(n1425), .CK(Clk_c), .CD(Rst_c), .Q(leds_0_3));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam \r.StateTx_FSM_i1 .GSR = "ENABLED";
    LUT4 i1_2_lut_4_lut (.A(\r.StateRx [2]), .B(leds_0_4), .C(\r_next.Rx_ParityError_N_269 ), 
         .D(\r.RxCount [3]), .Z(n6_adj_322)) /* synthesis lut_function=(A (D)+!A (B (C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_2_lut_4_lut.init = 16'hea00;
    LUT4 i1_2_lut_rep_20_3_lut_4_lut_4_lut (.A(\r.TxCount [0]), .B(\r.TxCount [3]), 
         .C(\r.TxCount [2]), .D(\r.TxCount [1]), .Z(n1599)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(202[24:54])
    defparam i1_2_lut_rep_20_3_lut_4_lut_4_lut.init = 16'hfffd;
    LUT4 i1_3_lut (.A(n145[3]), .B(TxStrobe), .C(\r.TxCount [0]), .Z(n1510)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut.init = 16'h8080;
    LUT4 i638_3_lut_4_lut (.A(\r.TxCount [2]), .B(n1611), .C(\r.TxCount [3]), 
         .D(\r.TxCount [4]), .Z(n1[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i638_3_lut_4_lut.init = 16'h7f80;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut (.A(\r.TxCount [0]), .B(\r.TxCount [4]), 
         .C(\r.TxCount [3]), .D(n1609), .Z(n9_adj_316)) /* synthesis lut_function=(((C+(D))+!B)+!A) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(202[24:54])
    defparam i1_2_lut_3_lut_4_lut_4_lut.init = 16'hfff7;
    FD1S3IX heartbeat_cnt_290__i25 (.D(n109[25]), .CK(Clk_c), .CD(Rst_c), 
            .Q(heartbeat_cnt[25])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290__i25.GSR = "ENABLED";
    LUT4 i1_4_lut_adj_20 (.A(n274[2]), .B(n1584), .C(RxStrobe), .D(\r.RxCount [0]), 
         .Z(\r_next.RxCount [0])) /* synthesis lut_function=(A (B+!(C (D)+!C !(D)))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_20.init = 16'hceec;
    CCU2C heartbeat_cnt_290_add_4_9 (.A0(n191[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[8]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1197), .COUT(n1198), .S0(n109[7]), .S1(n109[8]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_9.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_9.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_9.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_9.INJECT1_1 = "NO";
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
    FD1P3AX \r.RxShiftReg__i7  (.D(\r_next.Rx_ParityError_N_269 ), .SP(Clk_c_enable_25), 
            .CK(Clk_c), .Q(rx_data[7])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i7 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i6  (.D(rx_data[7]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(rx_data[6])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i6 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i5  (.D(rx_data[6]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(rx_data[5])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i5 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i4  (.D(rx_data[5]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(rx_data[4])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i4 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i3  (.D(rx_data[4]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(rx_data[3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i3 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i2  (.D(rx_data[3]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(rx_data[2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i2 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i1  (.D(rx_data[2]), .SP(Clk_c_enable_25), .CK(Clk_c), 
            .Q(rx_data[1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxShiftReg__i1 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i3  (.D(\r_next.RxCount [3]), .CK(Clk_c), .Q(\r.RxCount [3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxCount_i3 .GSR = "ENABLED";
    CCU2C heartbeat_cnt_290_add_4_3 (.A0(n191[1]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[2]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1194), .COUT(n1195), .S0(n109[1]), .S1(n109[2]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_3.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_3.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_3.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_3.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_13 (.A0(n191[11]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[12]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1199), .COUT(n1200), .S0(n109[11]), .S1(n109[12]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_13.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_13.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_13.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_13.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_7 (.A0(n191[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1196), .COUT(n1197), .S0(n109[5]), .S1(n109[6]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_7.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_7.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_7.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_7.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_11 (.A0(n191[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n191[10]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1198), .COUT(n1199), .S0(n109[9]), .S1(n109[10]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_11.INIT0 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_11.INIT1 = 16'haaa0;
    defparam heartbeat_cnt_290_add_4_11.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_11.INJECT1_1 = "NO";
    CCU2C heartbeat_cnt_290_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n191[0]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .COUT(n1194), .S1(n109[0]));   // E:/Apps/Lattice Diamond/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2193[12:13])
    defparam heartbeat_cnt_290_add_4_1.INIT0 = 16'h0000;
    defparam heartbeat_cnt_290_add_4_1.INIT1 = 16'h555f;
    defparam heartbeat_cnt_290_add_4_1.INJECT1_0 = "NO";
    defparam heartbeat_cnt_290_add_4_1.INJECT1_1 = "NO";
    FD1S3AX \r.RxCount_i2  (.D(\r_next.RxCount [2]), .CK(Clk_c), .Q(\r.RxCount [2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxCount_i2 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i1  (.D(\r_next.RxCount [1]), .CK(Clk_c), .Q(\r.RxCount [1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.RxCount_i1 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i5  (.D(n646[4]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(\r.TxShiftReg [4])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i5 .GSR = "ENABLED";
    LUT4 i1_3_lut_rep_21_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [3]), 
         .C(\r.RxCount [0]), .D(\r.RxCount [1]), .Z(n1600)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(252[24:37])
    defparam i1_3_lut_rep_21_4_lut.init = 16'hfeff;
    FD1P3AX \r.TxShiftReg__i4  (.D(n646[3]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(\r.TxShiftReg [3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i4 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i3  (.D(n646[2]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(\r.TxShiftReg [2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i3 .GSR = "ENABLED";
    LUT4 i1_4_lut_adj_21 (.A(n999), .B(leds_0_3), .C(n145[0]), .D(n1608), 
         .Z(n1425)) /* synthesis lut_function=(A+(B (C+!(D))+!B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i1_4_lut_adj_21.init = 16'hfafe;
    FD1P3AX \r.TxShiftReg__i2  (.D(n646[1]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(\r.TxShiftReg [1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxShiftReg__i2 .GSR = "ENABLED";
    PFUMX i968 (.BLUT(n1583), .ALUT(n1582), .C0(\r.RxCount [0]), .Z(n1584));
    LUT4 i1_4_lut_adj_22 (.A(n274[2]), .B(n2_adj_323), .C(n6_adj_322), 
         .D(\r_next.RxCount_3__N_109 [3]), .Z(\r_next.RxCount [3])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_22.init = 16'hfefc;
    LUT4 select_157_Select_3_i2_4_lut (.A(\r.RxCount [3]), .B(n274[1]), 
         .C(\r_next.RxCount_3__N_208 [3]), .D(n1604), .Z(n2_adj_323)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam select_157_Select_3_i2_4_lut.init = 16'h88c0;
    LUT4 mux_260_i5_3_lut (.A(tx_data[3]), .B(\r.TxShiftReg [5]), .C(n410), 
         .Z(n646[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_260_i5_3_lut.init = 16'hcaca;
    LUT4 n5_bdd_3_lut_4_lut (.A(RxStrobe), .B(\r.RxSync ), .C(n274[1]), 
         .D(n1601), .Z(n1582)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (C+(D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(250[20:54])
    defparam n5_bdd_3_lut_4_lut.init = 16'hffd0;
    LUT4 n281_bdd_4_lut_988 (.A(n1600), .B(n1604), .C(\r_next.Rx_ParityError_N_269 ), 
         .D(leds_0_4), .Z(n1578)) /* synthesis lut_function=(A (B+!(C))+!A (B+!(C+!(D)))) */ ;
    defparam n281_bdd_4_lut_988.init = 16'hcfce;
    LUT4 i513_4_lut_else_4_lut (.A(n145[3]), .B(n982), .Z(n1614)) /* synthesis lut_function=(!(A+!(B))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(222[38:47])
    defparam i513_4_lut_else_4_lut.init = 16'h4444;
    LUT4 mux_260_i4_3_lut (.A(tx_data[2]), .B(\r.TxShiftReg [4]), .C(n410), 
         .Z(n646[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_260_i4_3_lut.init = 16'hcaca;
    PFUMX i966 (.BLUT(n1579), .ALUT(n1578), .C0(n274[1]), .Z(n1580));
    LUT4 i1_4_lut_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [0]), .C(RxStrobe), 
         .D(n274[2]), .Z(n3)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(D))+!A !(B (C (D))))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(290[38:47])
    defparam i1_4_lut_4_lut.init = 16'h6a00;
    LUT4 mux_260_i3_3_lut (.A(tx_data[1]), .B(\r.TxShiftReg [3]), .C(n410), 
         .Z(n646[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_260_i3_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_3_lut (.A(RxStrobe), .B(n274[2]), .C(\r.RxCount [0]), 
         .Z(Clk_c_enable_25)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_2_lut_3_lut.init = 16'h0808;
    LUT4 i1_4_lut_adj_23 (.A(n1562), .B(n2), .C(\r.RxCount [2]), .D(n1601), 
         .Z(\r_next.RxCount [2])) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_23.init = 16'hfeee;
    LUT4 mux_260_i2_3_lut (.A(tx_data[0]), .B(\r.TxShiftReg [2]), .C(n410), 
         .Z(n646[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam mux_260_i2_3_lut.init = 16'hcaca;
    LUT4 parity_err_sticky_I_0_174_i6_1_lut (.A(Uart_Tx_c), .Z(leds_0_5)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i6_1_lut.init = 16'h5555;
    LUT4 i1_4_lut_adj_24 (.A(RxStrobe), .B(\r_next.Rx_ParityError_N_269 ), 
         .C(\r.StateRx [2]), .D(n1047), .Z(n1049)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(239[9] 310[18])
    defparam i1_4_lut_adj_24.init = 16'heca0;
    LUT4 i1_2_lut_3_lut_4_lut (.A(RxStrobe), .B(\r.RxSync ), .C(n1600), 
         .D(n274[1]), .Z(n1360)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(250[20:54])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0200;
    LUT4 parity_err_sticky_I_0_174_i7_1_lut (.A(Uart_Rx_c_0), .Z(leds_0_6)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i7_1_lut.init = 16'h5555;
    LUT4 i1_3_lut_adj_25 (.A(\r.TxSyncLast ), .B(\r.TxSync ), .C(TxStrobe), 
         .Z(\r_next.StateTx_1__N_171 )) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(200[20:78])
    defparam i1_3_lut_adj_25.init = 16'h1010;
    LUT4 i422_3_lut_4_lut (.A(n1608), .B(leds_0_3), .C(n147), .D(\r_next.StateTx_1__N_171 ), 
         .Z(n982)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(180[9] 231[18])
    defparam i422_3_lut_4_lut.init = 16'hf808;
    LUT4 parity_err_sticky_I_0_174_i3_1_lut (.A(tx_ready), .Z(leds_0_2)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(400[25:35])
    defparam parity_err_sticky_I_0_174_i3_1_lut.init = 16'h5555;
    LUT4 i1_2_lut (.A(\r.TxCount [2]), .B(\r.TxCount [4]), .Z(n1454)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i951_2_lut_rep_25 (.A(RxStrobe), .B(\r.RxSync ), .Z(n1604)) /* synthesis lut_function=((B)+!A) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(250[20:54])
    defparam i951_2_lut_rep_25.init = 16'hdddd;
    PFUMX i975 (.BLUT(n1617), .ALUT(n1618), .C0(\r.RxCount [3]), .Z(\r_next.RxCount_3__N_109 [3]));
    LUT4 i1_2_lut_rep_26 (.A(\r.RxCount [2]), .B(\r.RxCount [3]), .Z(n1605)) /* synthesis lut_function=(A+(B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(252[24:37])
    defparam i1_2_lut_rep_26.init = 16'heeee;
    PFUMX i973 (.BLUT(n1614), .ALUT(n1615), .C0(n9_adj_316), .Z(n1060));
    \olo_intf_sync(1,'1',2)  i_sync (.Clk_c(Clk_c), .Rst_c(Rst_c), .Uart_Rx_c_0(Uart_Rx_c_0), 
            .\r_next.Rx_ParityError_N_269 (\r_next.Rx_ParityError_N_269 ));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(431[14:39])
    \olo_base_strobe_gen(125000000.0,230400.0,true)  i_strb_tx (.GND_net(GND_net), 
            .VCC_net(VCC_net), .TxStrobe(TxStrobe), .Clk_c(Clk_c), .Rst_c(Rst_c), 
            .\r.TxSyncLast (\r.TxSyncLast ), .\r.TxSync (\r.TxSync ));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(405[17:48])
    \olo_base_strobe_gen(125000000.0,230400.0,true)_U0  i_strb_rx (.RxStrobe(RxStrobe), 
            .Clk_c(Clk_c), .Rst_c(Rst_c), .\r.RxSync (\r.RxSync ), .GND_net(GND_net), 
            .VCC_net(VCC_net), .n254(n254));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(418[17:48])
    
endmodule
//
// Verilog Description of module \olo_intf_sync(1,'1',2) 
//

module \olo_intf_sync(1,'1',2)  (Clk_c, Rst_c, Uart_Rx_c_0, \r_next.Rx_ParityError_N_269 );
    input Clk_c;
    input Rst_c;
    input Uart_Rx_c_0;
    output \r_next.Rx_ParityError_N_269 ;
    
    wire [0:0]RegN_0__0__N_314 /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(131[15:21])
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire Reg0_0 /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(59[12:16])
    
    FD1S3JX \RegN_0[[0__12  (.D(Reg0_0), .CK(Clk_c), .PD(Rst_c), .Q(\r_next.Rx_ParityError_N_269 )) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=431, LSE_RLINE=431 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(91[9] 107[16])
    defparam \RegN_0[[0__12 .GSR = "ENABLED";
    FD1S3JX Reg0_0__11 (.D(Uart_Rx_c_0), .CK(Clk_c), .PD(Rst_c), .Q(Reg0_0)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=431, LSE_RLINE=431 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(91[9] 107[16])
    defparam Reg0_0__11.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module \olo_base_strobe_gen(125000000.0,230400.0,true) 
//

module \olo_base_strobe_gen(125000000.0,230400.0,true)  (GND_net, VCC_net, 
            TxStrobe, Clk_c, Rst_c, \r.TxSyncLast , \r.TxSync );
    input GND_net;
    input VCC_net;
    output TxStrobe;
    input Clk_c;
    input Rst_c;
    output \r.TxSyncLast ;
    input \r.TxSync ;
    
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(43[9:18])
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(44[9:18])
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    
    wire n1214;
    wire [15:0]Count;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(63[12:17])
    wire [15:0]n69;
    
    wire n1212, n28, n1213, n1432, n1416, n1211, n1210, n1209, 
        Out_Valid_N_306, n1450, n1442, n1378, n401, n1208, n1207, 
        n1606;
    
    CCU2C Count_289_add_4_17 (.A0(Count[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1214), .S0(n69[15]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_17.INIT0 = 16'haaa0;
    defparam Count_289_add_4_17.INIT1 = 16'h0000;
    defparam Count_289_add_4_17.INJECT1_0 = "NO";
    defparam Count_289_add_4_17.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_13 (.A0(Count[11]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1212), .COUT(n1213), .S0(n69[11]), .S1(n69[12]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_13.INIT0 = 16'h6aaa;
    defparam Count_289_add_4_13.INIT1 = 16'haaa0;
    defparam Count_289_add_4_13.INJECT1_0 = "NO";
    defparam Count_289_add_4_13.INJECT1_1 = "NO";
    LUT4 i388_4_lut (.A(n1432), .B(Count[13]), .C(Count[12]), .D(n1416), 
         .Z(n28)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i388_4_lut.init = 16'hfcec;
    CCU2C Count_289_add_4_11 (.A0(Count[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[10]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1211), .COUT(n1212), .S0(n69[9]), .S1(n69[10]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_11.INIT0 = 16'haaa0;
    defparam Count_289_add_4_11.INIT1 = 16'h6aaa;
    defparam Count_289_add_4_11.INJECT1_0 = "NO";
    defparam Count_289_add_4_11.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_9 (.A0(Count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[8]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1210), .COUT(n1211), .S0(n69[7]), .S1(n69[8]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_9.INIT0 = 16'haaa0;
    defparam Count_289_add_4_9.INIT1 = 16'haaa0;
    defparam Count_289_add_4_9.INJECT1_0 = "NO";
    defparam Count_289_add_4_9.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_7 (.A0(Count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1209), .COUT(n1210), .S0(n69[5]), .S1(n69[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_7.INIT0 = 16'h555f;
    defparam Count_289_add_4_7.INIT1 = 16'h555f;
    defparam Count_289_add_4_7.INJECT1_0 = "NO";
    defparam Count_289_add_4_7.INJECT1_1 = "NO";
    FD1S3IX Out_Valid_25 (.D(Out_Valid_N_306), .CK(Clk_c), .CD(Rst_c), 
            .Q(TxStrobe)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=405, LSE_RLINE=405 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Out_Valid_25.GSR = "ENABLED";
    LUT4 i1_2_lut (.A(Count[11]), .B(Count[10]), .Z(n1432)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_4_lut (.A(n1450), .B(n1442), .C(n1378), .D(Count[3]), .Z(n1416)) /* synthesis lut_function=(A (B+(C (D)))) */ ;
    defparam i1_4_lut.init = 16'ha888;
    FD1S3IX Count_289__i0 (.D(n69[0]), .CK(Clk_c), .CD(n401), .Q(Count[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i0.GSR = "ENABLED";
    FD1S3IX \r.TxSyncLast_128  (.D(\r.TxSync ), .CK(Clk_c), .CD(Rst_c), 
            .Q(\r.TxSyncLast )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=35, LSE_RLINE=35 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(330[9] 340[16])
    defparam \r.TxSyncLast_128 .GSR = "ENABLED";
    LUT4 i1_3_lut (.A(Count[8]), .B(Count[7]), .C(Count[9]), .Z(n1450)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut.init = 16'h8080;
    CCU2C Count_289_add_4_15 (.A0(Count[13]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1213), .COUT(n1214), .S0(n69[13]), .S1(n69[14]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_15.INIT0 = 16'h6aaa;
    defparam Count_289_add_4_15.INIT1 = 16'haaa0;
    defparam Count_289_add_4_15.INJECT1_0 = "NO";
    defparam Count_289_add_4_15.INJECT1_1 = "NO";
    LUT4 i1_3_lut_adj_11 (.A(Count[5]), .B(Count[4]), .C(Count[6]), .Z(n1442)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_11.init = 16'hfefe;
    LUT4 i1_3_lut_adj_12 (.A(Count[2]), .B(Count[0]), .C(Count[1]), .Z(n1378)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_12.init = 16'hfefe;
    CCU2C Count_289_add_4_5 (.A0(Count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[4]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1208), .COUT(n1209), .S0(n69[3]), .S1(n69[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_5.INIT0 = 16'haaa0;
    defparam Count_289_add_4_5.INIT1 = 16'h6aaa;
    defparam Count_289_add_4_5.INJECT1_0 = "NO";
    defparam Count_289_add_4_5.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_3 (.A0(Count[1]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1207), .COUT(n1208), .S0(n69[1]), .S1(n69[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_3.INIT0 = 16'h6aaa;
    defparam Count_289_add_4_3.INIT1 = 16'h555f;
    defparam Count_289_add_4_3.INJECT1_0 = "NO";
    defparam Count_289_add_4_3.INJECT1_1 = "NO";
    CCU2C Count_289_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[0]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .COUT(n1207), .S1(n69[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289_add_4_1.INIT0 = 16'h0000;
    defparam Count_289_add_4_1.INIT1 = 16'h6aaa;
    defparam Count_289_add_4_1.INJECT1_0 = "NO";
    defparam Count_289_add_4_1.INJECT1_1 = "NO";
    FD1S3IX Count_289__i15 (.D(n69[15]), .CK(Clk_c), .CD(n401), .Q(Count[15])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i15.GSR = "ENABLED";
    FD1S3IX Count_289__i14 (.D(n69[14]), .CK(Clk_c), .CD(n401), .Q(Count[14])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i14.GSR = "ENABLED";
    FD1S3IX Count_289__i13 (.D(n69[13]), .CK(Clk_c), .CD(n401), .Q(Count[13])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i13.GSR = "ENABLED";
    FD1S3IX Count_289__i12 (.D(n69[12]), .CK(Clk_c), .CD(n401), .Q(Count[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i12.GSR = "ENABLED";
    FD1S3IX Count_289__i11 (.D(n69[11]), .CK(Clk_c), .CD(n401), .Q(Count[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i11.GSR = "ENABLED";
    FD1S3IX Count_289__i10 (.D(n69[10]), .CK(Clk_c), .CD(n401), .Q(Count[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i10.GSR = "ENABLED";
    FD1S3IX Count_289__i9 (.D(n69[9]), .CK(Clk_c), .CD(n401), .Q(Count[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i9.GSR = "ENABLED";
    FD1S3IX Count_289__i8 (.D(n69[8]), .CK(Clk_c), .CD(n401), .Q(Count[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i8.GSR = "ENABLED";
    FD1S3IX Count_289__i7 (.D(n69[7]), .CK(Clk_c), .CD(n401), .Q(Count[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i7.GSR = "ENABLED";
    FD1S3IX Count_289__i6 (.D(n69[6]), .CK(Clk_c), .CD(n401), .Q(Count[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i6.GSR = "ENABLED";
    FD1S3IX Count_289__i5 (.D(n69[5]), .CK(Clk_c), .CD(n401), .Q(Count[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i5.GSR = "ENABLED";
    FD1S3IX Count_289__i4 (.D(n69[4]), .CK(Clk_c), .CD(n401), .Q(Count[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i4.GSR = "ENABLED";
    FD1S3IX Count_289__i3 (.D(n69[3]), .CK(Clk_c), .CD(n401), .Q(Count[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i3.GSR = "ENABLED";
    FD1S3IX Count_289__i2 (.D(n69[2]), .CK(Clk_c), .CD(n401), .Q(Count[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i2.GSR = "ENABLED";
    FD1S3IX Count_289__i1 (.D(n69[1]), .CK(Clk_c), .CD(n401), .Q(Count[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_289__i1.GSR = "ENABLED";
    LUT4 i555_4_lut (.A(Count[15]), .B(n1606), .C(n28), .D(Count[14]), 
         .Z(Out_Valid_N_306)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam i555_4_lut.init = 16'heccc;
    LUT4 In_Sync_I_0_29_2_lut_rep_27 (.A(\r.TxSync ), .B(\r.TxSyncLast ), 
         .Z(n1606)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam In_Sync_I_0_29_2_lut_rep_27.init = 16'h2222;
    LUT4 i191_2_lut_3_lut (.A(\r.TxSync ), .B(\r.TxSyncLast ), .C(Rst_c), 
         .Z(n401)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam i191_2_lut_3_lut.init = 16'hf2f2;
    
endmodule
//
// Verilog Description of module \olo_base_strobe_gen(125000000.0,230400.0,true)_U0 
//

module \olo_base_strobe_gen(125000000.0,230400.0,true)_U0  (RxStrobe, Clk_c, 
            Rst_c, \r.RxSync , GND_net, VCC_net, n254);
    output RxStrobe;
    input Clk_c;
    input Rst_c;
    input \r.RxSync ;
    input GND_net;
    input VCC_net;
    output n254;
    
    wire Clk_c /* synthesis DSPPORT_20=CLK3, CLOCK_NET_FOR_BUS20=20, is_clock=1, SET_AS_NETWORK=Clk_c */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire GND_net /* synthesis RESET_NET_FOR_BUS20=20, DSPPORT_20=RST3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(43[9:18])
    wire VCC_net /* synthesis CE_NET_FOR_BUS20=20, DSPPORT_20=CE3 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(44[9:18])
    
    wire Out_Valid_N_306, SyncLast;
    wire [15:0]Count;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(63[12:17])
    
    wire n1613, n28, n1430, n1419, n1446, n1438, n1379, n405;
    wire [15:0]n69;
    
    wire n1222, n1221, n1220, n1219, n1218, n1217, n1216, n1215;
    
    FD1S3IX Out_Valid_25 (.D(Out_Valid_N_306), .CK(Clk_c), .CD(Rst_c), 
            .Q(RxStrobe)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=418, LSE_RLINE=418 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Out_Valid_25.GSR = "ENABLED";
    FD1S3IX SyncLast_26 (.D(\r.RxSync ), .CK(Clk_c), .CD(Rst_c), .Q(SyncLast)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=418, LSE_RLINE=418 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam SyncLast_26.GSR = "ENABLED";
    LUT4 i556_4_lut (.A(Count[15]), .B(n1613), .C(n28), .D(Count[14]), 
         .Z(Out_Valid_N_306)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam i556_4_lut.init = 16'heccc;
    LUT4 i374_4_lut (.A(n1430), .B(Count[13]), .C(Count[12]), .D(n1419), 
         .Z(n28)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i374_4_lut.init = 16'hfcec;
    LUT4 i1_2_lut (.A(Count[11]), .B(Count[10]), .Z(n1430)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_4_lut (.A(n1446), .B(n1438), .C(n1379), .D(Count[3]), .Z(n1419)) /* synthesis lut_function=(A (B+(C (D)))) */ ;
    defparam i1_4_lut.init = 16'ha888;
    LUT4 i1_3_lut (.A(Count[8]), .B(Count[7]), .C(Count[9]), .Z(n1446)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut.init = 16'h8080;
    FD1S3IX Count_291__i0 (.D(n69[0]), .CK(Clk_c), .CD(n405), .Q(Count[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i0.GSR = "ENABLED";
    LUT4 i1_3_lut_adj_9 (.A(Count[5]), .B(Count[4]), .C(Count[6]), .Z(n1438)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_9.init = 16'hfefe;
    LUT4 i1_3_lut_adj_10 (.A(Count[2]), .B(Count[0]), .C(Count[1]), .Z(n1379)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_10.init = 16'hfefe;
    FD1S3IX Count_291__i15 (.D(n69[15]), .CK(Clk_c), .CD(n405), .Q(Count[15])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i15.GSR = "ENABLED";
    FD1S3IX Count_291__i14 (.D(n69[14]), .CK(Clk_c), .CD(n405), .Q(Count[14])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i14.GSR = "ENABLED";
    FD1S3IX Count_291__i13 (.D(n69[13]), .CK(Clk_c), .CD(n405), .Q(Count[13])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i13.GSR = "ENABLED";
    FD1S3IX Count_291__i12 (.D(n69[12]), .CK(Clk_c), .CD(n405), .Q(Count[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i12.GSR = "ENABLED";
    FD1S3IX Count_291__i11 (.D(n69[11]), .CK(Clk_c), .CD(n405), .Q(Count[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i11.GSR = "ENABLED";
    FD1S3IX Count_291__i10 (.D(n69[10]), .CK(Clk_c), .CD(n405), .Q(Count[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i10.GSR = "ENABLED";
    FD1S3IX Count_291__i9 (.D(n69[9]), .CK(Clk_c), .CD(n405), .Q(Count[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i9.GSR = "ENABLED";
    FD1S3IX Count_291__i8 (.D(n69[8]), .CK(Clk_c), .CD(n405), .Q(Count[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i8.GSR = "ENABLED";
    FD1S3IX Count_291__i7 (.D(n69[7]), .CK(Clk_c), .CD(n405), .Q(Count[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i7.GSR = "ENABLED";
    FD1S3IX Count_291__i6 (.D(n69[6]), .CK(Clk_c), .CD(n405), .Q(Count[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i6.GSR = "ENABLED";
    FD1S3IX Count_291__i5 (.D(n69[5]), .CK(Clk_c), .CD(n405), .Q(Count[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i5.GSR = "ENABLED";
    FD1S3IX Count_291__i4 (.D(n69[4]), .CK(Clk_c), .CD(n405), .Q(Count[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i4.GSR = "ENABLED";
    FD1S3IX Count_291__i3 (.D(n69[3]), .CK(Clk_c), .CD(n405), .Q(Count[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i3.GSR = "ENABLED";
    FD1S3IX Count_291__i2 (.D(n69[2]), .CK(Clk_c), .CD(n405), .Q(Count[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i2.GSR = "ENABLED";
    FD1S3IX Count_291__i1 (.D(n69[1]), .CK(Clk_c), .CD(n405), .Q(Count[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291__i1.GSR = "ENABLED";
    LUT4 In_Sync_I_0_29_2_lut_rep_34 (.A(\r.RxSync ), .B(SyncLast), .Z(n1613)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam In_Sync_I_0_29_2_lut_rep_34.init = 16'h2222;
    LUT4 i195_2_lut_3_lut (.A(\r.RxSync ), .B(SyncLast), .C(Rst_c), .Z(n405)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam i195_2_lut_3_lut.init = 16'hf2f2;
    CCU2C Count_291_add_4_17 (.A0(Count[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1222), .S0(n69[15]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_17.INIT0 = 16'haaa0;
    defparam Count_291_add_4_17.INIT1 = 16'h0000;
    defparam Count_291_add_4_17.INJECT1_0 = "NO";
    defparam Count_291_add_4_17.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_15 (.A0(Count[13]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1221), .COUT(n1222), .S0(n69[13]), .S1(n69[14]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_15.INIT0 = 16'h6aaa;
    defparam Count_291_add_4_15.INIT1 = 16'haaa0;
    defparam Count_291_add_4_15.INJECT1_0 = "NO";
    defparam Count_291_add_4_15.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_13 (.A0(Count[11]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1220), .COUT(n1221), .S0(n69[11]), .S1(n69[12]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_13.INIT0 = 16'h6aaa;
    defparam Count_291_add_4_13.INIT1 = 16'haaa0;
    defparam Count_291_add_4_13.INJECT1_0 = "NO";
    defparam Count_291_add_4_13.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_11 (.A0(Count[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[10]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1219), .COUT(n1220), .S0(n69[9]), .S1(n69[10]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_11.INIT0 = 16'haaa0;
    defparam Count_291_add_4_11.INIT1 = 16'h6aaa;
    defparam Count_291_add_4_11.INJECT1_0 = "NO";
    defparam Count_291_add_4_11.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_9 (.A0(Count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[8]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1218), .COUT(n1219), .S0(n69[7]), .S1(n69[8]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_9.INIT0 = 16'haaa0;
    defparam Count_291_add_4_9.INIT1 = 16'haaa0;
    defparam Count_291_add_4_9.INJECT1_0 = "NO";
    defparam Count_291_add_4_9.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_7 (.A0(Count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1217), .COUT(n1218), .S0(n69[5]), .S1(n69[6]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_7.INIT0 = 16'h555f;
    defparam Count_291_add_4_7.INIT1 = 16'h555f;
    defparam Count_291_add_4_7.INJECT1_0 = "NO";
    defparam Count_291_add_4_7.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_5 (.A0(Count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[4]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1216), .COUT(n1217), .S0(n69[3]), .S1(n69[4]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_5.INIT0 = 16'haaa0;
    defparam Count_291_add_4_5.INIT1 = 16'h6aaa;
    defparam Count_291_add_4_5.INJECT1_0 = "NO";
    defparam Count_291_add_4_5.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_3 (.A0(Count[1]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1215), .COUT(n1216), .S0(n69[1]), .S1(n69[2]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_3.INIT0 = 16'h6aaa;
    defparam Count_291_add_4_3.INIT1 = 16'h555f;
    defparam Count_291_add_4_3.INJECT1_0 = "NO";
    defparam Count_291_add_4_3.INJECT1_1 = "NO";
    CCU2C Count_291_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[0]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .COUT(n1215), .S1(n69[0]));   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_291_add_4_1.INIT0 = 16'h0000;
    defparam Count_291_add_4_1.INIT1 = 16'h6aaa;
    defparam Count_291_add_4_1.INJECT1_0 = "NO";
    defparam Count_291_add_4_1.INJECT1_1 = "NO";
    LUT4 i101_1_lut (.A(RxStrobe), .Z(n254)) /* synthesis lut_function=(!(A)) */ ;   // c:/users/hoona/documents/school/universiteit/jaar 3/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam i101_1_lut.init = 16'h5555;
    
endmodule
