// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Fri May 29 11:31:42 2026
//
// Verilog Description of module uart_echo
//

module uart_echo (Clk, Rst, Uart_Tx, Uart_Rx);   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(5[8:17])
    input Clk;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    input Rst;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(8[9:12])
    output Uart_Tx;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(10[9:16])
    input Uart_Rx;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(11[9:16])
    
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    
    wire GND_net, VCC_net, Rst_c, Uart_Tx_c, Uart_Rx_c_0, tx_valid, 
        tx_ready;
    wire [7:0]tx_data;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(19[12:19])
    
    wire rx_valid;
    wire [7:0]rx_data;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(22[12:19])
    
    wire echo_pending;
    wire [7:0]echo_data;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(26[12:21])
    
    wire tx_valid_N_34, n894, Clk_c_enable_29, Clk_c_enable_36, n802, 
        n139, n140, n1537;
    
    VHI i2 (.Z(VCC_net));
    FD1P3AX echo_data_i0_i0 (.D(rx_data[0]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(echo_data[0]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_data_i0_i0.GSR = "ENABLED";
    FD1P3IX echo_pending_25 (.D(VCC_net), .SP(rx_valid), .CD(n802), .CK(Clk_c), 
            .Q(echo_pending)) /* synthesis lse_init_val=0 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_pending_25.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i0 (.D(echo_data[0]), .SP(Clk_c_enable_29), .CK(Clk_c), 
            .Q(tx_data[0]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_data_i0_i0.GSR = "ENABLED";
    IB Rst_pad (.I(Rst), .O(Rst_c));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(8[9:12])
    IB Uart_Rx_pad (.I(Uart_Rx), .O(Uart_Rx_c_0));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(11[9:16])
    LUT4 i173_2_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(Rst_c), 
         .Z(Clk_c_enable_29)) /* synthesis lut_function=(!((B+(C))+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(82[20:57])
    defparam i173_2_lut_3_lut.init = 16'h0202;
    GSR GSR_INST (.GSR(VCC_net));
    LUT4 tx_valid_I_0_30_2_lut_rep_34 (.A(tx_valid), .B(tx_ready), .Z(n1537)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(71[20:53])
    defparam tx_valid_I_0_30_2_lut_rep_34.init = 16'h8888;
    LUT4 i414_2_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(Rst_c), 
         .Z(n802)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(82[20:57])
    defparam i414_2_lut_3_lut.init = 16'hf2f2;
    LUT4 i545_3_lut_3_lut (.A(echo_pending), .B(tx_valid), .C(tx_ready), 
         .Z(tx_valid_N_34)) /* synthesis lut_function=(!(A (B (C))+!A ((C)+!B))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(82[20:57])
    defparam i545_3_lut_3_lut.init = 16'h2e2e;
    IB Clk_pad (.I(Clk), .O(Clk_c));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    FD1S3IX tx_valid_24 (.D(tx_valid_N_34), .CK(Clk_c), .CD(Rst_c), .Q(tx_valid)) /* synthesis lse_init_val=0 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_valid_24.GSR = "ENABLED";
    OB Uart_Tx_pad (.I(Uart_Tx_c), .O(Uart_Tx));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(10[9:16])
    LUT4 i504_3_lut_3_lut_4_lut (.A(tx_valid), .B(tx_ready), .C(n140), 
         .D(n139), .Z(n894)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(71[20:53])
    defparam i504_3_lut_3_lut_4_lut.init = 16'h0080;
    FD1P3AX tx_data_i0_i7 (.D(echo_data[7]), .SP(Clk_c_enable_29), .CK(Clk_c), 
            .Q(tx_data[7]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_data_i0_i7.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i6 (.D(echo_data[6]), .SP(Clk_c_enable_29), .CK(Clk_c), 
            .Q(tx_data[6]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_data_i0_i6.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i5 (.D(echo_data[5]), .SP(Clk_c_enable_29), .CK(Clk_c), 
            .Q(tx_data[5]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_data_i0_i5.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i4 (.D(echo_data[4]), .SP(Clk_c_enable_29), .CK(Clk_c), 
            .Q(tx_data[4]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_data_i0_i4.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i3 (.D(echo_data[3]), .SP(Clk_c_enable_29), .CK(Clk_c), 
            .Q(tx_data[3]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_data_i0_i3.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i2 (.D(echo_data[2]), .SP(Clk_c_enable_29), .CK(Clk_c), 
            .Q(tx_data[2]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_data_i0_i2.GSR = "ENABLED";
    FD1P3AX tx_data_i0_i1 (.D(echo_data[1]), .SP(Clk_c_enable_29), .CK(Clk_c), 
            .Q(tx_data[1]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam tx_data_i0_i1.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i7 (.D(rx_data[7]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(echo_data[7]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_data_i0_i7.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i6 (.D(rx_data[6]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(echo_data[6]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_data_i0_i6.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i5 (.D(rx_data[5]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(echo_data[5]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_data_i0_i5.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i4 (.D(rx_data[4]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(echo_data[4]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_data_i0_i4.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i3 (.D(rx_data[3]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(echo_data[3]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_data_i0_i3.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i2 (.D(rx_data[2]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(echo_data[2]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_data_i0_i2.GSR = "ENABLED";
    FD1P3AX echo_data_i0_i1 (.D(rx_data[1]), .SP(Clk_c_enable_36), .CK(Clk_c), 
            .Q(echo_data[1]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(62[9] 90[16])
    defparam echo_data_i0_i1.GSR = "ENABLED";
    LUT4 i171_2_lut (.A(rx_valid), .B(Rst_c), .Z(Clk_c_enable_36)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(64[13] 88[20])
    defparam i171_2_lut.init = 16'h2222;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    \olo_intf_uart(125000000.0,115200.0,8,"1","none")(1,1,1,4)  u_uart (.tx_data({tx_data}), 
            .Clk_c(Clk_c), .Uart_Tx_c(Uart_Tx_c), .n894(n894), .tx_ready(tx_ready), 
            .Rst_c(Rst_c), .tx_valid(tx_valid), .n140(n140), .rx_data({rx_data}), 
            .n139(n139), .rx_valid(rx_valid), .n1537(n1537), .Uart_Rx_c_0(Uart_Rx_c_0), 
            .GND_net(GND_net), .VCC_net(VCC_net));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(33[14:39])
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
            Clk_c, Uart_Tx_c, n894, tx_ready, Rst_c, tx_valid, n140, 
            rx_data, n139, rx_valid, n1537, Uart_Rx_c_0, GND_net, 
            VCC_net);
    input [7:0]tx_data;
    input Clk_c;
    output Uart_Tx_c;
    input n894;
    output tx_ready;
    input Rst_c;
    input tx_valid;
    output n140;
    output [7:0]rx_data;
    output n139;
    output rx_valid;
    input n1537;
    input Uart_Rx_c_0;
    input GND_net;
    input VCC_net;
    
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire UartRxInt /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(135[12:21])
    wire [9:0]\r.TxShiftReg ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(130[12:13])
    
    wire n400;
    wire [8:0]n636;
    
    wire Clk_c_enable_38, n899;
    wire [4:0]\r.TxCount ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(130[12:13])
    
    wire Clk_c_enable_39, n898, n1450, n895, Clk_c_enable_7, \r_next.Tx_Ready ;
    wire [3:0]n137;
    
    wire n1246, TxStrobe, n9, n817, n1449, \r.TxSync , n1367;
    wire [3:0]\r.RxCount ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(130[12:13])
    wire [3:0]\r_next.RxCount ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(130[15:21])
    
    wire RxStrobe, \r.RxSync , n1436;
    wire [7:0]n265;
    
    wire n1191, n1446, n1344, n838, Clk_c_enable_16, \r_next.StateTx_1__N_144 , 
        n1434, n1380, n1379, n1381, n245;
    wire [2:0]\r.StateRx ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(130[12:13])
    
    wire n1439, n9_adj_261, n815, n1448, n1253, n828, n1452, n1385, 
        n825, n896, UartRxInt_N_174, n887;
    wire [3:0]\r_next.RxCount_3__N_181 ;
    
    wire n1438, n1432, n885, n382, n964;
    wire [4:0]n25;
    
    wire \r.TxSyncLast ;
    wire [3:0]\r_next.RxCount_3__N_108 ;
    
    wire n1456, n1455, n1435, n1437, n1430, n1286, n6, n1447, 
        n1441, n1440, n1431, n2, n2_adj_262, n3, n2_adj_263, n6_adj_264, 
        n1451;
    
    LUT4 mux_259_i3_3_lut (.A(tx_data[1]), .B(\r.TxShiftReg [3]), .C(n400), 
         .Z(n636[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam mux_259_i3_3_lut.init = 16'hcaca;
    FD1P3IX \r.TxShiftReg__i9  (.D(tx_data[7]), .SP(Clk_c_enable_38), .CD(n899), 
            .CK(Clk_c), .Q(\r.TxShiftReg [8])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i9 .GSR = "ENABLED";
    FD1P3IX \r.TxCount_286__i0  (.D(n1450), .SP(Clk_c_enable_39), .CD(n898), 
            .CK(Clk_c), .Q(\r.TxCount [0]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam \r.TxCount_286__i0 .GSR = "ENABLED";
    FD1S3JX \r.Uart_Tx_104  (.D(\r.TxShiftReg [0]), .CK(Clk_c), .PD(n895), 
            .Q(Uart_Tx_c)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.Uart_Tx_104 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i6  (.D(n636[5]), .SP(Clk_c_enable_38), .CK(Clk_c), 
            .Q(\r.TxShiftReg [5])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i6 .GSR = "ENABLED";
    FD1P3IX \r.TxShiftReg__i1  (.D(\r.TxShiftReg [1]), .SP(Clk_c_enable_38), 
            .CD(n894), .CK(Clk_c), .Q(\r.TxShiftReg [0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i1 .GSR = "ENABLED";
    LUT4 mux_259_i2_3_lut (.A(tx_data[0]), .B(\r.TxShiftReg [2]), .C(n400), 
         .Z(n636[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam mux_259_i2_3_lut.init = 16'hcaca;
    FD1P3IX \r.Tx_Ready_100  (.D(\r_next.Tx_Ready ), .SP(Clk_c_enable_7), 
            .CD(Rst_c), .CK(Clk_c), .Q(tx_ready)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.Tx_Ready_100 .GSR = "ENABLED";
    LUT4 i429_4_lut (.A(n137[3]), .B(n1246), .C(TxStrobe), .D(n9), .Z(n817)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam i429_4_lut.init = 16'heece;
    LUT4 i1_4_lut (.A(n1449), .B(tx_valid), .C(n140), .D(tx_ready), 
         .Z(\r_next.Tx_Ready )) /* synthesis lut_function=(A+!(B (C)+!B !((D)+!C))) */ ;
    defparam i1_4_lut.init = 16'hbfaf;
    FD1S3AX \r.TxSync_101  (.D(n1367), .CK(Clk_c), .Q(\r.TxSync )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxSync_101 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i0  (.D(\r_next.RxCount [0]), .CK(Clk_c), .Q(\r.RxCount [0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxCount_i0 .GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut_4_lut (.A(RxStrobe), .B(\r.RxSync ), .C(n1436), 
         .D(n265[1]), .Z(n1191)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(244[20:54])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0200;
    LUT4 i1_4_lut_adj_12 (.A(n1446), .B(\r.TxCount [2]), .C(\r.TxCount [4]), 
         .D(n1344), .Z(n838)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam i1_4_lut_adj_12.init = 16'h0100;
    FD1S3AX \r.StateTx_FSM_i0  (.D(Rst_c), .CK(Clk_c), .Q(n137[0]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam \r.StateTx_FSM_i0 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i7  (.D(UartRxInt), .SP(Clk_c_enable_16), .CK(Clk_c), 
            .Q(rx_data[7])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxShiftReg__i7 .GSR = "ENABLED";
    LUT4 i1_4_lut_adj_13 (.A(\r_next.StateTx_1__N_144 ), .B(n1434), .C(n139), 
         .D(\r.TxCount [4]), .Z(n1246)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam i1_4_lut_adj_13.init = 16'h2000;
    FD1P3AX \r.RxShiftReg__i6  (.D(rx_data[7]), .SP(Clk_c_enable_16), .CK(Clk_c), 
            .Q(rx_data[6])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxShiftReg__i6 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i5  (.D(rx_data[6]), .SP(Clk_c_enable_16), .CK(Clk_c), 
            .Q(rx_data[5])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxShiftReg__i5 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i4  (.D(rx_data[5]), .SP(Clk_c_enable_16), .CK(Clk_c), 
            .Q(rx_data[4])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxShiftReg__i4 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i3  (.D(rx_data[4]), .SP(Clk_c_enable_16), .CK(Clk_c), 
            .Q(rx_data[3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxShiftReg__i3 .GSR = "ENABLED";
    FD1P3AX \r.RxShiftReg__i2  (.D(rx_data[3]), .SP(Clk_c_enable_16), .CK(Clk_c), 
            .Q(rx_data[2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxShiftReg__i2 .GSR = "ENABLED";
    PFUMX i958 (.BLUT(n1380), .ALUT(n1379), .C0(n265[1]), .Z(n1381));
    LUT4 i1_3_lut (.A(n137[3]), .B(TxStrobe), .C(\r.TxCount [0]), .Z(n1344)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut.init = 16'h8080;
    FD1P3AX \r.RxShiftReg__i1  (.D(rx_data[2]), .SP(Clk_c_enable_16), .CK(Clk_c), 
            .Q(rx_data[1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxShiftReg__i1 .GSR = "ENABLED";
    FD1S3IX \r.Rx_Valid_110  (.D(\r.StateRx [2]), .CK(Clk_c), .CD(n245), 
            .Q(rx_valid)) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.Rx_Valid_110 .GSR = "ENABLED";
    LUT4 i427_4_lut (.A(n139), .B(n1439), .C(\r_next.StateTx_1__N_144 ), 
         .D(n9_adj_261), .Z(n815)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam i427_4_lut.init = 16'heece;
    LUT4 i1_4_lut_adj_14 (.A(n838), .B(n140), .C(n137[0]), .D(n1448), 
         .Z(n1253)) /* synthesis lut_function=(A+(B (C+!(D))+!B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam i1_4_lut_adj_14.init = 16'hfafe;
    LUT4 i508_4_lut_then_4_lut (.A(n137[3]), .B(\r_next.StateTx_1__N_144 ), 
         .C(n139), .D(n828), .Z(n1452)) /* synthesis lut_function=(!(A+(B (C+!(D))+!B !(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam i508_4_lut_then_4_lut.init = 16'h1500;
    FD1P3AX \r.TxShiftReg__i5  (.D(n636[4]), .SP(Clk_c_enable_38), .CK(Clk_c), 
            .Q(\r.TxShiftReg [4])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i5 .GSR = "ENABLED";
    FD1S3IX \r.StateRx_FSM_i4  (.D(n1385), .CK(Clk_c), .CD(Rst_c), .Q(\r.StateRx [2]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam \r.StateRx_FSM_i4 .GSR = "ENABLED";
    FD1S3IX \r.StateRx_FSM_i3  (.D(n825), .CK(Clk_c), .CD(Rst_c), .Q(n265[2]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam \r.StateRx_FSM_i3 .GSR = "ENABLED";
    FD1S3IX \r.StateRx_FSM_i2  (.D(n1381), .CK(Clk_c), .CD(Rst_c), .Q(n265[1]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam \r.StateRx_FSM_i2 .GSR = "ENABLED";
    FD1S3IX \r.RxSync_107  (.D(UartRxInt_N_174), .CK(Clk_c), .CD(n896), 
            .Q(\r.RxSync )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxSync_107 .GSR = "ENABLED";
    FD1S3JX \r.StateRx_FSM_i1  (.D(n887), .CK(Clk_c), .PD(Rst_c), .Q(n265[0]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam \r.StateRx_FSM_i1 .GSR = "ENABLED";
    LUT4 i567_2_lut_4_lut_4_lut_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [1]), 
         .C(\r.RxCount [0]), .Z(\r_next.RxCount_3__N_181 [2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(284[38:47])
    defparam i567_2_lut_4_lut_4_lut_4_lut.init = 16'h6a6a;
    LUT4 i1_2_lut_rep_29 (.A(\r.TxCount [1]), .B(\r.TxCount [3]), .Z(n1446)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_29.init = 16'heeee;
    LUT4 i1_2_lut_rep_21_3_lut (.A(\r.TxCount [1]), .B(\r.TxCount [3]), 
         .C(\r.TxCount [2]), .Z(n1438)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_rep_21_3_lut.init = 16'hfefe;
    FD1P3AX \r.RxShiftReg__i0  (.D(rx_data[1]), .SP(Clk_c_enable_16), .CK(Clk_c), 
            .Q(rx_data[0])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxShiftReg__i0 .GSR = "ENABLED";
    LUT4 i568_2_lut_4_lut_3_lut_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [0]), 
         .C(\r.RxCount [2]), .D(\r.RxCount [3]), .Z(\r_next.RxCount_3__N_181 [1])) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(284[38:47])
    defparam i568_2_lut_4_lut_3_lut_4_lut.init = 16'h6664;
    LUT4 i506_1_lut (.A(n265[0]), .Z(n896)) /* synthesis lut_function=(!(A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i506_1_lut.init = 16'h5555;
    LUT4 i1_4_lut_adj_15 (.A(n265[2]), .B(n1432), .C(RxStrobe), .D(\r.RxCount [0]), 
         .Z(\r_next.RxCount [0])) /* synthesis lut_function=(A (B+!(C (D)+!C !(D)))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_4_lut_adj_15.init = 16'hceec;
    LUT4 UartRxInt_I_0_1_lut (.A(UartRxInt), .Z(UartRxInt_N_174)) /* synthesis lut_function=(!(A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(237[20:35])
    defparam UartRxInt_I_0_1_lut.init = 16'h5555;
    FD1P3AX \r.TxShiftReg__i4  (.D(n636[3]), .SP(Clk_c_enable_38), .CK(Clk_c), 
            .Q(\r.TxShiftReg [3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i4 .GSR = "ENABLED";
    LUT4 i1_4_lut_adj_16 (.A(RxStrobe), .B(UartRxInt), .C(\r.StateRx [2]), 
         .D(n885), .Z(n887)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_4_lut_adj_16.init = 16'heca0;
    LUT4 i566_2_lut_4_lut_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [3]), 
         .C(\r.RxCount [1]), .D(\r.RxCount [0]), .Z(\r_next.RxCount_3__N_181 [3])) /* synthesis lut_function=(!(A (B (C (D))+!B !(C (D)))+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(246[24:37])
    defparam i566_2_lut_4_lut_4_lut.init = 16'h6ccc;
    LUT4 i1_3_lut_4_lut (.A(n1438), .B(\r.TxCount [4]), .C(\r.TxCount [0]), 
         .D(\r_next.StateTx_1__N_144 ), .Z(n382)) /* synthesis lut_function=(A (C (D))+!A !(B+!(C (D)))) */ ;
    defparam i1_3_lut_4_lut.init = 16'hb000;
    LUT4 \r.StateRx_2__bdd_4_lut  (.A(\r.StateRx [2]), .B(n964), .C(n265[2]), 
         .D(RxStrobe), .Z(n1385)) /* synthesis lut_function=(A (B (C+!(D))+!B !(D))+!A (B (C (D)))) */ ;
    defparam \r.StateRx_2__bdd_4_lut .init = 16'hc0aa;
    LUT4 i423_3_lut_4_lut (.A(n9), .B(TxStrobe), .C(n137[3]), .D(n828), 
         .Z(Clk_c_enable_39)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A !(C+!(D))) */ ;
    defparam i423_3_lut_4_lut.init = 16'h8f80;
    FD1P3IX \r.TxCount_286__i4  (.D(n25[4]), .SP(Clk_c_enable_39), .CD(n898), 
            .CK(Clk_c), .Q(\r.TxCount [4]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam \r.TxCount_286__i4 .GSR = "ENABLED";
    LUT4 i1_3_lut_adj_17 (.A(\r.TxSyncLast ), .B(\r.TxSync ), .C(TxStrobe), 
         .Z(\r_next.StateTx_1__N_144 )) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(194[20:78])
    defparam i1_3_lut_adj_17.init = 16'h1010;
    FD1P3IX \r.TxCount_286__i3  (.D(n25[3]), .SP(Clk_c_enable_39), .CD(n898), 
            .CK(Clk_c), .Q(\r.TxCount [3]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam \r.TxCount_286__i3 .GSR = "ENABLED";
    LUT4 mux_259_i4_3_lut (.A(tx_data[2]), .B(\r.TxShiftReg [4]), .C(n400), 
         .Z(n636[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam mux_259_i4_3_lut.init = 16'hcaca;
    FD1P3AX \r.TxShiftReg__i3  (.D(n636[2]), .SP(Clk_c_enable_38), .CK(Clk_c), 
            .Q(\r.TxShiftReg [2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i3 .GSR = "ENABLED";
    FD1P3IX \r.TxCount_286__i2  (.D(n25[2]), .SP(Clk_c_enable_39), .CD(n898), 
            .CK(Clk_c), .Q(\r.TxCount [2]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam \r.TxCount_286__i2 .GSR = "ENABLED";
    LUT4 \r.RxCount_2__bdd_4_lut_983  (.A(\r.RxCount [2]), .B(\r.RxCount [0]), 
         .C(\r.RxCount [1]), .D(RxStrobe), .Z(\r_next.RxCount_3__N_108 [2])) /* synthesis lut_function=(!(A (B (C (D)))+!A !(B (C (D))))) */ ;
    defparam \r.RxCount_2__bdd_4_lut_983 .init = 16'h6aaa;
    FD1P3AX \r.TxShiftReg__i2  (.D(n636[1]), .SP(Clk_c_enable_38), .CK(Clk_c), 
            .Q(\r.TxShiftReg [1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i2 .GSR = "ENABLED";
    LUT4 mux_285_i4_4_lut_then_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [2]), 
         .C(RxStrobe), .D(\r.RxCount [0]), .Z(n1456)) /* synthesis lut_function=(!(A (B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(266[21] 275[28])
    defparam mux_285_i4_4_lut_then_4_lut.init = 16'h7fff;
    LUT4 mux_285_i4_4_lut_else_4_lut (.A(\r.RxCount [1]), .B(\r.RxCount [2]), 
         .C(RxStrobe), .D(\r.RxCount [0]), .Z(n1455)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(266[21] 275[28])
    defparam mux_285_i4_4_lut_else_4_lut.init = 16'h8000;
    LUT4 i1_2_lut_rep_18_3_lut_4_lut (.A(\r.TxCount [1]), .B(\r.TxCount [3]), 
         .C(\r.TxCount [4]), .D(\r.TxCount [2]), .Z(n1435)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;
    defparam i1_2_lut_rep_18_3_lut_4_lut.init = 16'hffef;
    LUT4 n5_bdd_3_lut_4_lut (.A(RxStrobe), .B(\r.RxSync ), .C(n265[1]), 
         .D(n1437), .Z(n1430)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (C+(D))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(244[20:54])
    defparam n5_bdd_3_lut_4_lut.init = 16'hffd0;
    LUT4 i1_2_lut (.A(\r.TxCount [3]), .B(\r.TxCount [4]), .Z(n1286)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_3_lut_rep_20 (.A(\r.StateRx [2]), .B(n265[0]), .C(UartRxInt), 
         .Z(n1437)) /* synthesis lut_function=(A+(B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_3_lut_rep_20.init = 16'heaea;
    LUT4 i1_2_lut_4_lut (.A(\r.StateRx [2]), .B(n265[0]), .C(UartRxInt), 
         .D(\r.RxCount [3]), .Z(n6)) /* synthesis lut_function=(A (D)+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_2_lut_4_lut.init = 16'hea00;
    FD1S3IX \r.StateTx_FSM_i3  (.D(n817), .CK(Clk_c), .CD(Rst_c), .Q(n137[3]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam \r.StateTx_FSM_i3 .GSR = "ENABLED";
    LUT4 i624_2_lut_rep_30 (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .Z(n1447)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam i624_2_lut_rep_30.init = 16'h8888;
    LUT4 i628_2_lut_3_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .C(\r.TxCount [2]), 
         .Z(n25[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam i628_2_lut_3_lut.init = 16'h7878;
    LUT4 n5_bdd_4_lut (.A(n1441), .B(n1440), .C(n265[1]), .D(\r.RxCount [1]), 
         .Z(n1431)) /* synthesis lut_function=(!(A (B+!(C))+!A (B+((D)+!C)))) */ ;
    defparam n5_bdd_4_lut.init = 16'h2030;
    LUT4 mux_259_i8_3_lut (.A(tx_data[6]), .B(\r.TxShiftReg [8]), .C(n400), 
         .Z(n636[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam mux_259_i8_3_lut.init = 16'hcaca;
    LUT4 i505_1_lut (.A(n139), .Z(n895)) /* synthesis lut_function=(!(A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam i505_1_lut.init = 16'h5555;
    LUT4 i2_3_lut_4_lut (.A(n265[1]), .B(n1440), .C(n265[0]), .D(n1436), 
         .Z(n885)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A (C)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i2_3_lut_4_lut.init = 16'hf2f0;
    LUT4 i635_2_lut_3_lut_4_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), 
         .C(\r.TxCount [3]), .D(\r.TxCount [2]), .Z(n25[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam i635_2_lut_3_lut_4_lut.init = 16'h78f0;
    FD1S3IX \r.StateTx_FSM_i2  (.D(n815), .CK(Clk_c), .CD(Rst_c), .Q(n139));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam \r.StateTx_FSM_i2 .GSR = "ENABLED";
    FD1S3IX \r.StateTx_FSM_i1  (.D(n1253), .CK(Clk_c), .CD(Rst_c), .Q(n140));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam \r.StateTx_FSM_i1 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i3  (.D(\r_next.RxCount [3]), .CK(Clk_c), .Q(\r.RxCount [3])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxCount_i3 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i2  (.D(\r_next.RxCount [2]), .CK(Clk_c), .Q(\r.RxCount [2])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxCount_i2 .GSR = "ENABLED";
    FD1S3AX \r.RxCount_i1  (.D(\r_next.RxCount [1]), .CK(Clk_c), .Q(\r.RxCount [1])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.RxCount_i1 .GSR = "ENABLED";
    LUT4 mux_259_i6_3_lut (.A(tx_data[4]), .B(\r.TxShiftReg [6]), .C(n400), 
         .Z(n636[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam mux_259_i6_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut_adj_18 (.A(\r_next.StateTx_1__N_144 ), .B(n1435), .C(n139), 
         .D(\r.TxCount [0]), .Z(n400)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(194[17] 206[24])
    defparam i1_4_lut_adj_18.init = 16'h8000;
    LUT4 \r_next.StateTx_1__I_0_129_2_lut_rep_31  (.A(tx_ready), .B(TxStrobe), 
         .Z(n1448)) /* synthesis lut_function=(!(A+!(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(181[20:55])
    defparam \r_next.StateTx_1__I_0_129_2_lut_rep_31 .init = 16'h4444;
    FD1P3AX \r.TxShiftReg__i8  (.D(n636[7]), .SP(Clk_c_enable_38), .CK(Clk_c), 
            .Q(\r.TxShiftReg [7])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i8 .GSR = "ENABLED";
    FD1P3AX \r.TxShiftReg__i7  (.D(n636[6]), .SP(Clk_c_enable_38), .CK(Clk_c), 
            .Q(\r.TxShiftReg [6])) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxShiftReg__i7 .GSR = "ENABLED";
    FD1P3IX \r.TxCount_286__i1  (.D(n25[1]), .SP(Clk_c_enable_39), .CD(n898), 
            .CK(Clk_c), .Q(\r.TxCount [1]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam \r.TxCount_286__i1 .GSR = "ENABLED";
    LUT4 i642_3_lut_4_lut (.A(\r.TxCount [2]), .B(n1447), .C(\r.TxCount [3]), 
         .D(\r.TxCount [4]), .Z(n25[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam i642_3_lut_4_lut.init = 16'h7f80;
    LUT4 n272_bdd_4_lut (.A(n1436), .B(n1440), .C(UartRxInt), .D(n265[0]), 
         .Z(n1379)) /* synthesis lut_function=(A (B+!(C))+!A (B+!(C+!(D)))) */ ;
    defparam n272_bdd_4_lut.init = 16'hcfce;
    LUT4 i957_3_lut_4_lut_3_lut (.A(tx_ready), .B(n140), .C(tx_valid), 
         .Z(n1367)) /* synthesis lut_function=(A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(181[20:55])
    defparam i957_3_lut_4_lut_3_lut.init = 16'h8080;
    LUT4 i509_2_lut (.A(Clk_c_enable_38), .B(n400), .Z(n899)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam i509_2_lut.init = 16'h8888;
    LUT4 i1_4_lut_adj_19 (.A(n265[2]), .B(n2), .C(n6), .D(\r_next.RxCount_3__N_108 [3]), 
         .Z(\r_next.RxCount [3])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_4_lut_adj_19.init = 16'hfefc;
    LUT4 select_153_Select_3_i2_4_lut (.A(\r.RxCount [3]), .B(n265[1]), 
         .C(\r_next.RxCount_3__N_181 [3]), .D(n1440), .Z(n2)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam select_153_Select_3_i2_4_lut.init = 16'h88c0;
    LUT4 i206_2_lut_rep_22_3_lut (.A(tx_ready), .B(TxStrobe), .C(n140), 
         .Z(n1439)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(181[20:55])
    defparam i206_2_lut_rep_22_3_lut.init = 16'h4040;
    LUT4 i80_2_lut_rep_32 (.A(n139), .B(n137[3]), .Z(n1449)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam i80_2_lut_rep_32.init = 16'heeee;
    LUT4 i422_3_lut_4_lut (.A(n1448), .B(n140), .C(n139), .D(\r_next.StateTx_1__N_144 ), 
         .Z(n828)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam i422_3_lut_4_lut.init = 16'hf808;
    LUT4 i955_2_lut_rep_23 (.A(RxStrobe), .B(\r.RxSync ), .Z(n1440)) /* synthesis lut_function=((B)+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(244[20:54])
    defparam i955_2_lut_rep_23.init = 16'hdddd;
    LUT4 i1_3_lut_4_lut_adj_20 (.A(n139), .B(n137[3]), .C(Rst_c), .D(n838), 
         .Z(Clk_c_enable_7)) /* synthesis lut_function=(A (C+(D))+!A ((C+(D))+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam i1_3_lut_4_lut_adj_20.init = 16'hfff1;
    LUT4 i377_1_lut_rep_33 (.A(\r.TxCount [0]), .Z(n1450)) /* synthesis lut_function=(!(A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(196[24:54])
    defparam i377_1_lut_rep_33.init = 16'h5555;
    LUT4 i1_4_lut_4_lut (.A(\r.TxCount [0]), .B(\r.TxCount [1]), .C(n1286), 
         .D(\r.TxCount [2]), .Z(n9)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(196[24:54])
    defparam i1_4_lut_4_lut.init = 16'hfffd;
    PFUMX i977 (.BLUT(n1431), .ALUT(n1430), .C0(\r.RxCount [0]), .Z(n1432));
    LUT4 n272_bdd_2_lut (.A(UartRxInt), .B(n265[0]), .Z(n1380)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam n272_bdd_2_lut.init = 16'h4444;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut (.A(\r.TxCount [0]), .B(\r.TxCount [4]), 
         .C(\r.TxCount [2]), .D(n1446), .Z(n9_adj_261)) /* synthesis lut_function=(((C+(D))+!B)+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(196[24:54])
    defparam i1_2_lut_3_lut_4_lut_4_lut.init = 16'hfff7;
    LUT4 i1_2_lut_rep_17_3_lut_4_lut_4_lut (.A(\r.TxCount [0]), .B(\r.TxCount [2]), 
         .C(\r.TxCount [3]), .D(\r.TxCount [1]), .Z(n1434)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(196[24:54])
    defparam i1_2_lut_rep_17_3_lut_4_lut_4_lut.init = 16'hfffd;
    LUT4 select_153_Select_1_i2_4_lut (.A(\r.RxCount [1]), .B(n265[1]), 
         .C(\r_next.RxCount_3__N_181 [1]), .D(n1440), .Z(n2_adj_262)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam select_153_Select_1_i2_4_lut.init = 16'h88c0;
    LUT4 mux_259_i7_3_lut (.A(tx_data[5]), .B(\r.TxShiftReg [7]), .C(n400), 
         .Z(n636[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam mux_259_i7_3_lut.init = 16'hcaca;
    LUT4 mux_259_i5_3_lut (.A(tx_data[3]), .B(\r.TxShiftReg [5]), .C(n400), 
         .Z(n636[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam mux_259_i5_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut_adj_21 (.A(\r.RxCount [1]), .B(n2_adj_262), .C(n3), 
         .D(n1437), .Z(\r_next.RxCount [1])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_4_lut_adj_21.init = 16'hfefc;
    LUT4 i1_2_lut_rep_24 (.A(\r.RxCount [2]), .B(\r.RxCount [3]), .Z(n1441)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(246[24:37])
    defparam i1_2_lut_rep_24.init = 16'heeee;
    LUT4 select_153_Select_2_i2_4_lut (.A(\r.RxCount [2]), .B(n265[1]), 
         .C(\r_next.RxCount_3__N_181 [2]), .D(n1440), .Z(n2_adj_263)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam select_153_Select_2_i2_4_lut.init = 16'h88c0;
    LUT4 i621_2_lut (.A(\r.TxCount [1]), .B(\r.TxCount [0]), .Z(n25[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam i621_2_lut.init = 16'h6666;
    LUT4 i269_4_lut_rep_16 (.A(n1537), .B(n382), .C(n139), .D(n140), 
         .Z(Clk_c_enable_38)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(174[9] 225[18])
    defparam i269_4_lut_rep_16.init = 16'hcac0;
    LUT4 i1_4_lut_adj_22 (.A(n265[2]), .B(n2_adj_263), .C(n6_adj_264), 
         .D(\r_next.RxCount_3__N_108 [2]), .Z(\r_next.RxCount [2])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_4_lut_adj_22.init = 16'hfefc;
    LUT4 i1_2_lut_4_lut_adj_23 (.A(\r.StateRx [2]), .B(n265[0]), .C(UartRxInt), 
         .D(\r.RxCount [2]), .Z(n6_adj_264)) /* synthesis lut_function=(A (D)+!A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_2_lut_4_lut_adj_23.init = 16'hea00;
    LUT4 i437_4_lut (.A(n265[2]), .B(n1191), .C(RxStrobe), .D(n964), 
         .Z(n825)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i437_4_lut.init = 16'hceee;
    LUT4 i1_3_lut_rep_19_4_lut (.A(\r.RxCount [2]), .B(\r.RxCount [3]), 
         .C(\r.RxCount [0]), .D(\r.RxCount [1]), .Z(n1436)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(246[24:37])
    defparam i1_3_lut_rep_19_4_lut.init = 16'hfeff;
    LUT4 i1_3_lut_4_lut_adj_24 (.A(\r.RxCount [2]), .B(\r.RxCount [1]), 
         .C(\r.RxCount [3]), .D(\r.RxCount [0]), .Z(n964)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(284[38:47])
    defparam i1_3_lut_4_lut_adj_24.init = 16'h8000;
    LUT4 i508_4_lut_else_4_lut (.A(n137[3]), .B(n828), .Z(n1451)) /* synthesis lut_function=(!(A+!(B))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(216[38:47])
    defparam i508_4_lut_else_4_lut.init = 16'h4444;
    LUT4 i1_4_lut_4_lut_adj_25 (.A(\r.RxCount [1]), .B(\r.RxCount [0]), 
         .C(RxStrobe), .D(n265[2]), .Z(n3)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(D))+!A !(B (C (D))))) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(284[38:47])
    defparam i1_4_lut_4_lut_adj_25.init = 16'h6a00;
    LUT4 i1_2_lut_3_lut (.A(RxStrobe), .B(n265[2]), .C(\r.RxCount [0]), 
         .Z(Clk_c_enable_16)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(233[9] 304[18])
    defparam i1_2_lut_3_lut.init = 16'h0808;
    PFUMX i981 (.BLUT(n1455), .ALUT(n1456), .C0(\r.RxCount [3]), .Z(\r_next.RxCount_3__N_108 [3]));
    PFUMX i979 (.BLUT(n1451), .ALUT(n1452), .C0(n9_adj_261), .Z(n898));
    \olo_intf_sync(1,'1',2)  i_sync (.Clk_c(Clk_c), .Rst_c(Rst_c), .Uart_Rx_c_0(Uart_Rx_c_0), 
            .UartRxInt(UartRxInt));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(366[14:39])
    \olo_base_strobe_gen(125000000.0,230400.0,true)  i_strb_tx (.\r.TxSync (\r.TxSync ), 
            .\r.TxSyncLast (\r.TxSyncLast ), .Rst_c(Rst_c), .Clk_c(Clk_c), 
            .TxStrobe(TxStrobe), .GND_net(GND_net), .VCC_net(VCC_net));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(340[17:48])
    \olo_base_strobe_gen(125000000.0,230400.0,true)_U0  i_strb_rx (.RxStrobe(RxStrobe), 
            .n245(n245), .Clk_c(Clk_c), .Rst_c(Rst_c), .\r.RxSync (\r.RxSync ), 
            .GND_net(GND_net), .VCC_net(VCC_net));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(353[17:48])
    
endmodule
//
// Verilog Description of module \olo_intf_sync(1,'1',2) 
//

module \olo_intf_sync(1,'1',2)  (Clk_c, Rst_c, Uart_Rx_c_0, UartRxInt);
    input Clk_c;
    input Rst_c;
    input Uart_Rx_c_0;
    output UartRxInt;
    
    wire [0:0]RegN_0__0__N_259 /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(135[12:21])
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    wire Reg0_0 /* synthesis shreg_extract="no", syn_srlstyle="registers", dont_merge=true, preserve=true, async_reg=true */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(59[12:16])
    
    FD1S3JX \RegN_0[[0__12  (.D(Reg0_0), .CK(Clk_c), .PD(Rst_c), .Q(UartRxInt)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=366, LSE_RLINE=366 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(91[9] 107[16])
    defparam \RegN_0[[0__12 .GSR = "ENABLED";
    FD1S3JX Reg0_0__11 (.D(Uart_Rx_c_0), .CK(Clk_c), .PD(Rst_c), .Q(Reg0_0)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=366, LSE_RLINE=366 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_sync.vhd(91[9] 107[16])
    defparam Reg0_0__11.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module \olo_base_strobe_gen(125000000.0,230400.0,true) 
//

module \olo_base_strobe_gen(125000000.0,230400.0,true)  (\r.TxSync , \r.TxSyncLast , 
            Rst_c, Clk_c, TxStrobe, GND_net, VCC_net);
    input \r.TxSync ;
    output \r.TxSyncLast ;
    input Rst_c;
    input Clk_c;
    output TxStrobe;
    input GND_net;
    input VCC_net;
    
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    
    wire n1444;
    wire [15:0]Count;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(63[12:17])
    
    wire n1280, n390, n1211;
    wire [15:0]n69;
    
    wire Out_Valid_N_251, n1046, n1045, n28, n1040, n1041, n1042, 
        n1043, n1039, n1044, n1262, n1252, n1276;
    
    LUT4 In_Sync_I_0_29_2_lut_rep_27 (.A(\r.TxSync ), .B(\r.TxSyncLast ), 
         .Z(n1444)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam In_Sync_I_0_29_2_lut_rep_27.init = 16'h2222;
    LUT4 i1_3_lut (.A(Count[5]), .B(Count[4]), .C(Count[6]), .Z(n1280)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut.init = 16'hfefe;
    LUT4 i189_2_lut_3_lut (.A(\r.TxSync ), .B(\r.TxSyncLast ), .C(Rst_c), 
         .Z(n390)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam i189_2_lut_3_lut.init = 16'hf2f2;
    LUT4 i1_3_lut_adj_10 (.A(Count[2]), .B(Count[0]), .C(Count[1]), .Z(n1211)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_10.init = 16'hfefe;
    FD1S3IX Count_287__i0 (.D(n69[0]), .CK(Clk_c), .CD(n390), .Q(Count[0])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i0.GSR = "ENABLED";
    FD1S3IX Out_Valid_25 (.D(Out_Valid_N_251), .CK(Clk_c), .CD(Rst_c), 
            .Q(TxStrobe)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=340, LSE_RLINE=340 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Out_Valid_25.GSR = "ENABLED";
    FD1S3IX \r.TxSyncLast_102  (.D(\r.TxSync ), .CK(Clk_c), .CD(Rst_c), 
            .Q(\r.TxSyncLast )) /* synthesis LSE_LINE_FILE_ID=45, LSE_LCOL=14, LSE_RCOL=39, LSE_LLINE=33, LSE_RLINE=33 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_intf_uart.vhd(324[9] 334[16])
    defparam \r.TxSyncLast_102 .GSR = "ENABLED";
    FD1S3IX Count_287__i15 (.D(n69[15]), .CK(Clk_c), .CD(n390), .Q(Count[15])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i15.GSR = "ENABLED";
    FD1S3IX Count_287__i14 (.D(n69[14]), .CK(Clk_c), .CD(n390), .Q(Count[14])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i14.GSR = "ENABLED";
    FD1S3IX Count_287__i13 (.D(n69[13]), .CK(Clk_c), .CD(n390), .Q(Count[13])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i13.GSR = "ENABLED";
    FD1S3IX Count_287__i12 (.D(n69[12]), .CK(Clk_c), .CD(n390), .Q(Count[12])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i12.GSR = "ENABLED";
    FD1S3IX Count_287__i11 (.D(n69[11]), .CK(Clk_c), .CD(n390), .Q(Count[11])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i11.GSR = "ENABLED";
    FD1S3IX Count_287__i10 (.D(n69[10]), .CK(Clk_c), .CD(n390), .Q(Count[10])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i10.GSR = "ENABLED";
    FD1S3IX Count_287__i9 (.D(n69[9]), .CK(Clk_c), .CD(n390), .Q(Count[9])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i9.GSR = "ENABLED";
    FD1S3IX Count_287__i8 (.D(n69[8]), .CK(Clk_c), .CD(n390), .Q(Count[8])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i8.GSR = "ENABLED";
    FD1S3IX Count_287__i7 (.D(n69[7]), .CK(Clk_c), .CD(n390), .Q(Count[7])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i7.GSR = "ENABLED";
    FD1S3IX Count_287__i6 (.D(n69[6]), .CK(Clk_c), .CD(n390), .Q(Count[6])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i6.GSR = "ENABLED";
    FD1S3IX Count_287__i5 (.D(n69[5]), .CK(Clk_c), .CD(n390), .Q(Count[5])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i5.GSR = "ENABLED";
    FD1S3IX Count_287__i4 (.D(n69[4]), .CK(Clk_c), .CD(n390), .Q(Count[4])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i4.GSR = "ENABLED";
    FD1S3IX Count_287__i3 (.D(n69[3]), .CK(Clk_c), .CD(n390), .Q(Count[3])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i3.GSR = "ENABLED";
    FD1S3IX Count_287__i2 (.D(n69[2]), .CK(Clk_c), .CD(n390), .Q(Count[2])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i2.GSR = "ENABLED";
    FD1S3IX Count_287__i1 (.D(n69[1]), .CK(Clk_c), .CD(n390), .Q(Count[1])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287__i1.GSR = "ENABLED";
    CCU2C Count_287_add_4_17 (.A0(Count[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1046), .S0(n69[15]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_17.INIT0 = 16'haaa0;
    defparam Count_287_add_4_17.INIT1 = 16'h0000;
    defparam Count_287_add_4_17.INJECT1_0 = "NO";
    defparam Count_287_add_4_17.INJECT1_1 = "NO";
    CCU2C Count_287_add_4_15 (.A0(Count[13]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1045), .COUT(n1046), .S0(n69[13]), .S1(n69[14]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_15.INIT0 = 16'h6aaa;
    defparam Count_287_add_4_15.INIT1 = 16'haaa0;
    defparam Count_287_add_4_15.INJECT1_0 = "NO";
    defparam Count_287_add_4_15.INJECT1_1 = "NO";
    CCU2C Count_287_add_4_5 (.A0(Count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[4]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1040), .COUT(n1041), .S0(n69[3]), .S1(n69[4]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_5.INIT0 = 16'haaa0;
    defparam Count_287_add_4_5.INIT1 = 16'h6aaa;
    defparam Count_287_add_4_5.INJECT1_0 = "NO";
    defparam Count_287_add_4_5.INJECT1_1 = "NO";
    CCU2C Count_287_add_4_9 (.A0(Count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[8]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1042), .COUT(n1043), .S0(n69[7]), .S1(n69[8]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_9.INIT0 = 16'haaa0;
    defparam Count_287_add_4_9.INIT1 = 16'haaa0;
    defparam Count_287_add_4_9.INJECT1_0 = "NO";
    defparam Count_287_add_4_9.INJECT1_1 = "NO";
    CCU2C Count_287_add_4_3 (.A0(Count[1]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1039), .COUT(n1040), .S0(n69[1]), .S1(n69[2]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_3.INIT0 = 16'h6aaa;
    defparam Count_287_add_4_3.INIT1 = 16'h555f;
    defparam Count_287_add_4_3.INJECT1_0 = "NO";
    defparam Count_287_add_4_3.INJECT1_1 = "NO";
    CCU2C Count_287_add_4_13 (.A0(Count[11]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1044), .COUT(n1045), .S0(n69[11]), .S1(n69[12]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_13.INIT0 = 16'h6aaa;
    defparam Count_287_add_4_13.INIT1 = 16'haaa0;
    defparam Count_287_add_4_13.INJECT1_0 = "NO";
    defparam Count_287_add_4_13.INJECT1_1 = "NO";
    CCU2C Count_287_add_4_7 (.A0(Count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1041), .COUT(n1042), .S0(n69[5]), .S1(n69[6]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_7.INIT0 = 16'h555f;
    defparam Count_287_add_4_7.INIT1 = 16'h555f;
    defparam Count_287_add_4_7.INJECT1_0 = "NO";
    defparam Count_287_add_4_7.INJECT1_1 = "NO";
    CCU2C Count_287_add_4_11 (.A0(Count[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[10]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1043), .COUT(n1044), .S0(n69[9]), .S1(n69[10]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_11.INIT0 = 16'haaa0;
    defparam Count_287_add_4_11.INIT1 = 16'h6aaa;
    defparam Count_287_add_4_11.INJECT1_0 = "NO";
    defparam Count_287_add_4_11.INJECT1_1 = "NO";
    CCU2C Count_287_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[0]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .COUT(n1039), .S1(n69[0]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_287_add_4_1.INIT0 = 16'h0000;
    defparam Count_287_add_4_1.INIT1 = 16'h6aaa;
    defparam Count_287_add_4_1.INJECT1_0 = "NO";
    defparam Count_287_add_4_1.INJECT1_1 = "NO";
    LUT4 i395_4_lut (.A(n1262), .B(Count[13]), .C(Count[12]), .D(n1252), 
         .Z(n28)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i395_4_lut.init = 16'hfcec;
    LUT4 i1_3_lut_adj_11 (.A(Count[8]), .B(Count[7]), .C(Count[9]), .Z(n1276)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut_adj_11.init = 16'h8080;
    LUT4 i1_2_lut (.A(Count[11]), .B(Count[10]), .Z(n1262)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_4_lut (.A(n1276), .B(n1280), .C(n1211), .D(Count[3]), .Z(n1252)) /* synthesis lut_function=(A (B+(C (D)))) */ ;
    defparam i1_4_lut.init = 16'ha888;
    LUT4 i557_4_lut (.A(Count[15]), .B(n1444), .C(n28), .D(Count[14]), 
         .Z(Out_Valid_N_251)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam i557_4_lut.init = 16'heccc;
    
endmodule
//
// Verilog Description of module \olo_base_strobe_gen(125000000.0,230400.0,true)_U0 
//

module \olo_base_strobe_gen(125000000.0,230400.0,true)_U0  (RxStrobe, n245, 
            Clk_c, Rst_c, \r.RxSync , GND_net, VCC_net);
    output RxStrobe;
    output n245;
    input Clk_c;
    input Rst_c;
    input \r.RxSync ;
    input GND_net;
    input VCC_net;
    
    wire Clk_c /* synthesis SET_AS_NETWORK=Clk_c, is_clock=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/uart_echo.vhd(7[9:12])
    
    wire SyncLast, Out_Valid_N_251;
    wire [15:0]Count;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(63[12:17])
    
    wire n394;
    wire [15:0]n69;
    
    wire n1054, n1443, n28, n1053, n1052, n1051, n1050, n1049, 
        n1264, n1257, n1272, n1048, n1047, n1268, n1210;
    
    LUT4 i100_1_lut (.A(RxStrobe), .Z(n245)) /* synthesis lut_function=(!(A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam i100_1_lut.init = 16'h5555;
    FD1S3IX SyncLast_26 (.D(\r.RxSync ), .CK(Clk_c), .CD(Rst_c), .Q(SyncLast)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=353, LSE_RLINE=353 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam SyncLast_26.GSR = "ENABLED";
    FD1S3IX Out_Valid_25 (.D(Out_Valid_N_251), .CK(Clk_c), .CD(Rst_c), 
            .Q(RxStrobe)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=17, LSE_RCOL=48, LSE_LLINE=353, LSE_RLINE=353 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(80[9] 109[16])
    defparam Out_Valid_25.GSR = "ENABLED";
    FD1S3IX Count_288__i0 (.D(n69[0]), .CK(Clk_c), .CD(n394), .Q(Count[0])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i0.GSR = "ENABLED";
    CCU2C Count_288_add_4_17 (.A0(Count[15]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1054), .S0(n69[15]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_17.INIT0 = 16'haaa0;
    defparam Count_288_add_4_17.INIT1 = 16'h0000;
    defparam Count_288_add_4_17.INJECT1_0 = "NO";
    defparam Count_288_add_4_17.INJECT1_1 = "NO";
    FD1S3IX Count_288__i15 (.D(n69[15]), .CK(Clk_c), .CD(n394), .Q(Count[15])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i15.GSR = "ENABLED";
    LUT4 i558_4_lut (.A(Count[15]), .B(n1443), .C(n28), .D(Count[14]), 
         .Z(Out_Valid_N_251)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam i558_4_lut.init = 16'heccc;
    CCU2C Count_288_add_4_15 (.A0(Count[13]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[14]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1053), .COUT(n1054), .S0(n69[13]), .S1(n69[14]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_15.INIT0 = 16'h6aaa;
    defparam Count_288_add_4_15.INIT1 = 16'haaa0;
    defparam Count_288_add_4_15.INJECT1_0 = "NO";
    defparam Count_288_add_4_15.INJECT1_1 = "NO";
    CCU2C Count_288_add_4_13 (.A0(Count[11]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[12]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1052), .COUT(n1053), .S0(n69[11]), .S1(n69[12]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_13.INIT0 = 16'h6aaa;
    defparam Count_288_add_4_13.INIT1 = 16'haaa0;
    defparam Count_288_add_4_13.INJECT1_0 = "NO";
    defparam Count_288_add_4_13.INJECT1_1 = "NO";
    CCU2C Count_288_add_4_11 (.A0(Count[9]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[10]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1051), .COUT(n1052), .S0(n69[9]), .S1(n69[10]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_11.INIT0 = 16'haaa0;
    defparam Count_288_add_4_11.INIT1 = 16'h6aaa;
    defparam Count_288_add_4_11.INJECT1_0 = "NO";
    defparam Count_288_add_4_11.INJECT1_1 = "NO";
    CCU2C Count_288_add_4_9 (.A0(Count[7]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[8]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1050), .COUT(n1051), .S0(n69[7]), .S1(n69[8]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_9.INIT0 = 16'haaa0;
    defparam Count_288_add_4_9.INIT1 = 16'haaa0;
    defparam Count_288_add_4_9.INJECT1_0 = "NO";
    defparam Count_288_add_4_9.INJECT1_1 = "NO";
    CCU2C Count_288_add_4_7 (.A0(Count[5]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), 
          .CIN(n1049), .COUT(n1050), .S0(n69[5]), .S1(n69[6]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_7.INIT0 = 16'h555f;
    defparam Count_288_add_4_7.INIT1 = 16'h555f;
    defparam Count_288_add_4_7.INJECT1_0 = "NO";
    defparam Count_288_add_4_7.INJECT1_1 = "NO";
    FD1S3IX Count_288__i14 (.D(n69[14]), .CK(Clk_c), .CD(n394), .Q(Count[14])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i14.GSR = "ENABLED";
    FD1S3IX Count_288__i13 (.D(n69[13]), .CK(Clk_c), .CD(n394), .Q(Count[13])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i13.GSR = "ENABLED";
    FD1S3IX Count_288__i12 (.D(n69[12]), .CK(Clk_c), .CD(n394), .Q(Count[12])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i12.GSR = "ENABLED";
    FD1S3IX Count_288__i11 (.D(n69[11]), .CK(Clk_c), .CD(n394), .Q(Count[11])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i11.GSR = "ENABLED";
    FD1S3IX Count_288__i10 (.D(n69[10]), .CK(Clk_c), .CD(n394), .Q(Count[10])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i10.GSR = "ENABLED";
    FD1S3IX Count_288__i9 (.D(n69[9]), .CK(Clk_c), .CD(n394), .Q(Count[9])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i9.GSR = "ENABLED";
    FD1S3IX Count_288__i8 (.D(n69[8]), .CK(Clk_c), .CD(n394), .Q(Count[8])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i8.GSR = "ENABLED";
    FD1S3IX Count_288__i7 (.D(n69[7]), .CK(Clk_c), .CD(n394), .Q(Count[7])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i7.GSR = "ENABLED";
    FD1S3IX Count_288__i6 (.D(n69[6]), .CK(Clk_c), .CD(n394), .Q(Count[6])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i6.GSR = "ENABLED";
    FD1S3IX Count_288__i5 (.D(n69[5]), .CK(Clk_c), .CD(n394), .Q(Count[5])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i5.GSR = "ENABLED";
    FD1S3IX Count_288__i4 (.D(n69[4]), .CK(Clk_c), .CD(n394), .Q(Count[4])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i4.GSR = "ENABLED";
    LUT4 In_Sync_I_0_29_2_lut_rep_26 (.A(\r.RxSync ), .B(SyncLast), .Z(n1443)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam In_Sync_I_0_29_2_lut_rep_26.init = 16'h2222;
    FD1S3IX Count_288__i3 (.D(n69[3]), .CK(Clk_c), .CD(n394), .Q(Count[3])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i3.GSR = "ENABLED";
    FD1S3IX Count_288__i2 (.D(n69[2]), .CK(Clk_c), .CD(n394), .Q(Count[2])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i2.GSR = "ENABLED";
    FD1S3IX Count_288__i1 (.D(n69[1]), .CK(Clk_c), .CD(n394), .Q(Count[1])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288__i1.GSR = "ENABLED";
    LUT4 i365_4_lut (.A(n1264), .B(Count[13]), .C(Count[12]), .D(n1257), 
         .Z(n28)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i365_4_lut.init = 16'hfcec;
    LUT4 i1_3_lut (.A(Count[5]), .B(Count[4]), .C(Count[6]), .Z(n1272)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut.init = 16'hfefe;
    CCU2C Count_288_add_4_5 (.A0(Count[3]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[4]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .CIN(n1048), .COUT(n1049), .S0(n69[3]), .S1(n69[4]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_5.INIT0 = 16'haaa0;
    defparam Count_288_add_4_5.INIT1 = 16'h6aaa;
    defparam Count_288_add_4_5.INJECT1_0 = "NO";
    defparam Count_288_add_4_5.INJECT1_1 = "NO";
    CCU2C Count_288_add_4_3 (.A0(Count[1]), .B0(Count[15]), .C0(n28), 
          .D0(Count[14]), .A1(Count[2]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n1047), .COUT(n1048), .S0(n69[1]), .S1(n69[2]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_3.INIT0 = 16'h6aaa;
    defparam Count_288_add_4_3.INIT1 = 16'h555f;
    defparam Count_288_add_4_3.INJECT1_0 = "NO";
    defparam Count_288_add_4_3.INJECT1_1 = "NO";
    LUT4 i193_2_lut_3_lut (.A(\r.RxSync ), .B(SyncLast), .C(Rst_c), .Z(n394)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[16:52])
    defparam i193_2_lut_3_lut.init = 16'hf2f2;
    CCU2C Count_288_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(Count[0]), .B1(Count[15]), .C1(n28), .D1(Count[14]), 
          .COUT(n1047), .S1(n69[0]));   // d:/bap/ee-dev-bap/vhdl/uart_forusb/olo_base_strobe_gen.vhd(82[13] 100[20])
    defparam Count_288_add_4_1.INIT0 = 16'h0000;
    defparam Count_288_add_4_1.INIT1 = 16'h6aaa;
    defparam Count_288_add_4_1.INJECT1_0 = "NO";
    defparam Count_288_add_4_1.INJECT1_1 = "NO";
    LUT4 i1_2_lut (.A(Count[11]), .B(Count[10]), .Z(n1264)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_4_lut (.A(n1268), .B(n1272), .C(n1210), .D(Count[3]), .Z(n1257)) /* synthesis lut_function=(A (B+(C (D)))) */ ;
    defparam i1_4_lut.init = 16'ha888;
    LUT4 i1_3_lut_adj_8 (.A(Count[8]), .B(Count[7]), .C(Count[9]), .Z(n1268)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut_adj_8.init = 16'h8080;
    LUT4 i1_3_lut_adj_9 (.A(Count[2]), .B(Count[0]), .C(Count[1]), .Z(n1210)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_3_lut_adj_9.init = 16'hfefe;
    
endmodule
