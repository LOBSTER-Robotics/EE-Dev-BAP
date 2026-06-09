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
    constant GOOD_UDP_FRAME : byte_array_t := (
        ----------------------------------------------------------------
        -- Preamble + SFD
        ----------------------------------------------------------------
        x"55", x"55", x"55", x"55", x"55", x"55", x"55", x"D5",

        ----------------------------------------------------------------
        -- Ethernet header
        ----------------------------------------------------------------
        x"00", x"11", x"22", x"33", x"44", x"55", -- destination MAC
        x"DE", x"AD", x"BE", x"EF", x"00", x"01", -- source MAC
        x"08", x"00",                             -- EtherType IPv4

        ----------------------------------------------------------------
        -- IPv4 header, 20 bytes
        ----------------------------------------------------------------
        x"45", x"00",                             -- version/IHL, DSCP/ECN
        x"00", x"24",                             -- total length = 36 bytes
        x"00", x"01",                             -- identification
        x"00", x"00",                             -- flags/fragment offset
        x"40",                                    -- TTL
        x"11",                                    -- protocol = UDP
        x"00", x"00",                             -- header checksum ignored
        x"C0", x"A8", x"01", x"0A",               -- source IP 192.168.1.10
        x"C0", x"A8", x"01", x"64",               -- dest IP 192.168.1.100

        ----------------------------------------------------------------
        -- UDP header, 8 bytes
        ----------------------------------------------------------------
        x"04", x"D2",                             -- source port 1234
        x"16", x"2E",                             -- dest port 5678
        x"00", x"10",                             -- UDP length = 16 bytes
        x"00", x"00",                             -- UDP checksum ignored

        ----------------------------------------------------------------
        -- UDP payload, 8 bytes
        ----------------------------------------------------------------
        x"01", x"02", x"03", x"04",
        x"05", x"06", x"07", x"08"
    );

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
            constant frame : in byte_array_t
        ) is
        begin
            for i in frame'range loop
                rgmii_send_byte(frame(i), '1', '0');
            end loop;

            ------------------------------------------------------------
            -- Drop RX_DV after the final byte.
            ------------------------------------------------------------
            rgmii_idle(20);
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
        report "Sending GOOD UDP frame";
        rgmii_send_frame(GOOD_UDP_FRAME);

        rgmii_idle(100);

        ----------------------------------------------------------------
        -- Send one bad packet with wrong MAC address
        ----------------------------------------------------------------
        report "Sending BAD MAC frame";
        rgmii_send_frame(BAD_MAC_FRAME);

        rgmii_idle(100);

        ----------------------------------------------------------------
        -- Send another good packet
        ----------------------------------------------------------------
        report "Sending second GOOD UDP frame";
        rgmii_send_frame(GOOD_UDP_FRAME);

        rgmii_idle(200);

        report "Simulation finished";
        finish;

    end process;

end architecture;