library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.env.all;

entity tb_TOP_RX_FIFO is
end entity;

architecture sim of tb_TOP_RX_FIFO is

    --------------------------------------------------------------------
    -- DUT SIGNALS
    --------------------------------------------------------------------
    signal clk125      : std_logic := '0';
    signal clk100      : std_logic := '0';
    signal reset       : std_logic := '1';

    signal rgmii_rxd   : std_logic_vector(3 downto 0) := (others => '0');
    signal rgmii_rxctl : std_logic := '0';
    signal rgmii_rxc   : std_logic := '0';

    signal phy_reset   : std_logic;
    signal phy_mdc     : std_logic;
    signal phy_mdio    : std_logic := 'Z';

    signal rgmii_txd   : std_logic_vector(3 downto 0);
    signal rgmii_txctl : std_logic;
    signal rgmii_txc   : std_logic;

    signal seg_sel_sw  : std_logic := '0';

    signal fifo_q      : std_logic_vector(7 downto 0);

    signal seg_a       : std_logic;
    signal seg_b       : std_logic;
    signal seg_c       : std_logic;
    signal seg_d       : std_logic;
    signal seg_e       : std_logic;
    signal seg_f       : std_logic;
    signal seg_g       : std_logic;
    signal seg_h       : std_logic;
    signal seg_j       : std_logic;
    signal seg_k       : std_logic;
    signal seg_l       : std_logic;
    signal seg_m       : std_logic;
    signal seg_n       : std_logic;
    signal seg_p       : std_logic;
    signal seg_dp      : std_logic;

    signal Uart_Tx     : std_logic;
    signal Uart_Rx     : std_logic := '1';

    signal sdi_dac     : std_logic;
    signal cs_n_dac    : std_logic;
    signal spi_clk_dac : std_logic;

    --------------------------------------------------------------------
    -- BYTE ARRAY TYPE
    --------------------------------------------------------------------
    type byte_array_t is array (natural range <>) of std_logic_vector(7 downto 0);

    --------------------------------------------------------------------
    -- BURST TEST CONFIGURATION
    --------------------------------------------------------------------
    constant C_GOOD_PAYLOAD_BYTES : natural := 1400;
    constant C_BURST_COUNT        : natural := 200;
    constant C_BURST_GAP_CYCLES   : natural := 1;

    constant C_FRAME_PREAMBLE_BYTES : natural := 8;
    constant C_FRAME_ETH_BYTES      : natural := 14;
    constant C_FRAME_IPV4_BYTES     : natural := 20;
    constant C_FRAME_UDP_BYTES      : natural := 8;
    constant C_FRAME_HEADER_BYTES   : natural :=
        C_FRAME_PREAMBLE_BYTES +
        C_FRAME_ETH_BYTES +
        C_FRAME_IPV4_BYTES +
        C_FRAME_UDP_BYTES;

    function make_good_udp_frame(
        constant payload_bytes : in natural
    ) return byte_array_t is
        constant c_ipv4_total_len : natural := C_FRAME_IPV4_BYTES + C_FRAME_UDP_BYTES + payload_bytes;
        constant c_udp_len        : natural := C_FRAME_UDP_BYTES + payload_bytes;
        constant c_total_bytes    : natural := C_FRAME_HEADER_BYTES + payload_bytes;

        variable frame : byte_array_t(0 to c_total_bytes - 1);
    begin
        assert payload_bytes <= 65507
            report "payload_bytes exceeds the IPv4/UDP maximum"
            severity failure;

        frame(0) := x"55";
        frame(1) := x"55";
        frame(2) := x"55";
        frame(3) := x"55";
        frame(4) := x"55";
        frame(5) := x"55";
        frame(6) := x"55";
        frame(7) := x"D5";

        frame(8)  := x"00";
        frame(9)  := x"11";
        frame(10) := x"22";
        frame(11) := x"33";
        frame(12) := x"44";
        frame(13) := x"55";
        frame(14) := x"DE";
        frame(15) := x"AD";
        frame(16) := x"BE";
        frame(17) := x"EF";
        frame(18) := x"00";
        frame(19) := x"01";
        frame(20) := x"08";
        frame(21) := x"00";

        frame(22) := x"45";
        frame(23) := x"00";
        frame(24) := std_logic_vector(to_unsigned(c_ipv4_total_len / 256, 8));
        frame(25) := std_logic_vector(to_unsigned(c_ipv4_total_len mod 256, 8));
        frame(26) := x"00";
        frame(27) := x"01";
        frame(28) := x"00";
        frame(29) := x"00";
        frame(30) := x"40";
        frame(31) := x"11";
        frame(32) := x"00";
        frame(33) := x"00";
        frame(34) := x"C0";
        frame(35) := x"A8";
        frame(36) := x"01";
        frame(37) := x"0A";
        frame(38) := x"C0";
        frame(39) := x"A8";
        frame(40) := x"01";
        frame(41) := x"64";

        frame(42) := x"04";
        frame(43) := x"D2";
        frame(44) := x"16";
        frame(45) := x"2E";
        frame(46) := std_logic_vector(to_unsigned(c_udp_len / 256, 8));
        frame(47) := std_logic_vector(to_unsigned(c_udp_len mod 256, 8));
        frame(48) := x"00";
        frame(49) := x"00";

        for i in 0 to payload_bytes - 1 loop
            frame(C_FRAME_HEADER_BYTES + i) :=
                std_logic_vector(to_unsigned(i mod 256, 8));
        end loop;

        return frame;
    end function;

    --------------------------------------------------------------------
    -- GOOD UDP FRAME
    --
    -- Ethernet:
    --   Destination MAC = 00:11:22:33:44:55
    --   Source MAC      = DE:AD:BE:EF:00:01
    --   EtherType       = 0800, IPv4
    --
    -- IPv4:
    --   Version/IHL     = 45
    --   Protocol        = 11, UDP
    --   Destination IP  = 192.168.1.100 = C0.A8.01.64
    --
    -- UDP:
    --   Source port     = 1234
    --   Destination port= 5678
    --   Payload         = 01 02 03 04 05 06 07 08
    --------------------------------------------------------------------
    constant GOOD_UDP_FRAME : byte_array_t := make_good_udp_frame(C_GOOD_PAYLOAD_BYTES);

    --------------------------------------------------------------------
    -- BAD MAC FRAME
    -- Same style packet, but destination MAC does not match.
    -- Useful to check DROP behavior.
    --------------------------------------------------------------------
    constant BAD_MAC_FRAME : byte_array_t := (
        x"55", x"55", x"55", x"55", x"55", x"55", x"55", x"D5",

        x"FF", x"FF", x"FF", x"FF", x"FF", x"FF", -- wrong destination MAC
        x"DE", x"AD", x"BE", x"EF", x"00", x"01",
        x"08", x"00",

        x"45", x"00",
        x"00", x"24",
        x"00", x"01",
        x"00", x"00",
        x"40",
        x"11",
        x"00", x"00",
        x"C0", x"A8", x"01", x"0A",
        x"C0", x"A8", x"01", x"64",

        x"04", x"D2",
        x"16", x"2E",
        x"00", x"10",
        x"00", x"00",

        x"AA", x"BB", x"CC", x"DD",
        x"11", x"22", x"33", x"44"
    );

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    uut : entity work.TOP_RX_FIFO
        generic map (
            CLK_FREQ_HZ       => 125_000_000,
            PHY_ADDR          => "00000",
            C_NUM_CHANNELS    => 1,
            C_DAC_WIDTH       => 16,
            C_ADC_WIDTH       => 16,
            C_BYTE_WIDTH      => 8,
            C_MUX_WAIT_CYCLES => 3
        )
        port map (
            clk125       => clk125,
            clk100       => clk100,
            reset        => reset,

            rgmii_rxd    => rgmii_rxd,
            rgmii_rxctl  => rgmii_rxctl,
            rgmii_rxc    => rgmii_rxc,

            phy_reset    => phy_reset,
            phy_mdc      => phy_mdc,
            phy_mdio     => phy_mdio,

            rgmii_txd    => rgmii_txd,
            rgmii_txctl  => rgmii_txctl,
            rgmii_txc    => rgmii_txc,

            seg_sel_sw   => seg_sel_sw,

            fifo_q       => fifo_q,

            seg_a        => seg_a,
            seg_b        => seg_b,
            seg_c        => seg_c,
            seg_d        => seg_d,
            seg_e        => seg_e,
            seg_f        => seg_f,
            seg_g        => seg_g,
            seg_h        => seg_h,
            seg_j        => seg_j,
            seg_k        => seg_k,
            seg_l        => seg_l,
            seg_m        => seg_m,
            seg_n        => seg_n,
            seg_p        => seg_p,
            seg_dp       => seg_dp,

            Uart_Tx      => Uart_Tx,
            Uart_Rx      => Uart_Rx,

            sdi_dac      => sdi_dac,
            cs_n_dac     => cs_n_dac,
            spi_clk_dac  => spi_clk_dac
        );

    --------------------------------------------------------------------
    -- 125 MHz system clock
    --------------------------------------------------------------------
    clk125 <= not clk125 after 4 ns;

    --------------------------------------------------------------------
    -- 100 MHz clock
    --------------------------------------------------------------------
    clk100 <= not clk100 after 5 ns;

    --------------------------------------------------------------------
    -- RGMII receive clock, 125 MHz
    --------------------------------------------------------------------
    rgmii_rxc <= not rgmii_rxc after 4 ns;

    --------------------------------------------------------------------
    -- STIMULUS
    --------------------------------------------------------------------
    stim_proc : process

        procedure rgmii_send_byte(
            constant b  : in std_logic_vector(7 downto 0);
            constant dv : in std_logic := '1';
            constant er : in std_logic := '0'
        ) is
        begin
            ------------------------------------------------------------
            -- Prepare low nibble before rising edge.
            -- RGMII rising edge carries byte[3:0].
            ------------------------------------------------------------
            wait until falling_edge(rgmii_rxc);
            rgmii_rxd   <= b(3 downto 0);
            rgmii_rxctl <= dv;

            ------------------------------------------------------------
            -- Prepare high nibble before falling edge.
            -- RGMII falling edge carries byte[7:4].
            ------------------------------------------------------------
            wait until rising_edge(rgmii_rxc);
            rgmii_rxd   <= b(7 downto 4);
            rgmii_rxctl <= dv xor er;
        end procedure;


        procedure rgmii_idle(
            constant cycles : in natural
        ) is
        begin
            for i in 0 to cycles - 1 loop
                wait until falling_edge(rgmii_rxc);
                rgmii_rxd   <= (others => '0');
                rgmii_rxctl <= '0';
            end loop;
        end procedure;


        procedure rgmii_send_frame(
            constant frame      : in byte_array_t;
            constant gap_cycles  : in natural := C_BURST_GAP_CYCLES
        ) is
        begin
            for i in frame'range loop
                rgmii_send_byte(frame(i), '1', '0');
            end loop;

            ------------------------------------------------------------
            -- Drop RX_DV after the final byte.
            ------------------------------------------------------------
            if gap_cycles > 0 then
                rgmii_idle(gap_cycles);
            end if;
        end procedure;


        procedure rgmii_send_frame_burst(
            constant frame      : in byte_array_t;
            constant repetitions : in natural;
            constant gap_cycles : in natural := C_BURST_GAP_CYCLES
        ) is
        begin
            for i in 1 to repetitions loop
                rgmii_send_frame(frame, gap_cycles);
            end loop;
        end procedure;

    begin

        ----------------------------------------------------------------
        -- Initial idle
        ----------------------------------------------------------------
        rgmii_rxd   <= (others => '0');
        rgmii_rxctl <= '0';

        reset <= '1';
        rgmii_idle(20);

        reset <= '0';
        rgmii_idle(20);

        ----------------------------------------------------------------
        -- Send one good UDP packet
        ----------------------------------------------------------------
        report "Sending 1400-byte GOOD UDP frame";
        rgmii_send_frame(GOOD_UDP_FRAME, C_BURST_GAP_CYCLES);

        rgmii_idle(100);

        ----------------------------------------------------------------
        -- Send one bad packet with wrong MAC address
        ----------------------------------------------------------------
        report "Sending BAD MAC frame";
        rgmii_send_frame(BAD_MAC_FRAME);

        rgmii_idle(100);

        ----------------------------------------------------------------
        -- Send a fast burst of large good packets
        ----------------------------------------------------------------
        report "Sending burst of GOOD UDP frames";
        rgmii_send_frame_burst(GOOD_UDP_FRAME, C_BURST_COUNT, C_BURST_GAP_CYCLES);

        rgmii_idle(200);

        report "Simulation finished";

    end process;

end architecture;