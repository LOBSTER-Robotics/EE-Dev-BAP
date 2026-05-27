library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP_RX_FIFO is
    port (
        --------------------------------------------------------------------
        -- CLOCK / RESET
        --------------------------------------------------------------------
        clk125              : in  std_logic;
        reset               : in  std_logic;

        --------------------------------------------------------------------
        -- RGMII PHY INPUT
        --------------------------------------------------------------------
        rgmii_rxd           : in  std_logic_vector(3 downto 0);
        rgmii_rxctl         : in  std_logic;
        rgmii_rxc           : in  std_logic;

        --------------------------------------------------------------------
        -- SWITCH READ INPUT
        --------------------------------------------------------------------
        read_switch         : in  std_logic;

        --------------------------------------------------------------------
        -- FIFO OUTPUT
        --------------------------------------------------------------------
        fifo_q              : out std_logic_vector(7 downto 0)

    );
end entity;

architecture rtl of TOP_RX_FIFO is

    --------------------------------------------------------------------
    -- TOP_RX TO FIFO SIGNALS
    --------------------------------------------------------------------
    signal rx_fifo_data          : std_logic_vector(7 downto 0);
    signal rx_fifo_wr_en         : std_logic;
    signal rx_fifo_last          : std_logic;

    --------------------------------------------------------------------
    -- FIFO STATUS SIGNALS
    --------------------------------------------------------------------
    signal fifo_full_i           : std_logic;
    signal fifo_empty_i          : std_logic;
    signal fifo_almost_empty_i   : std_logic;
    signal fifo_almost_full_i    : std_logic;

    --------------------------------------------------------------------
    -- READ PULSE SIGNALS
    --------------------------------------------------------------------
    signal fifo_read_enable      : std_logic;
    signal fifo_rd_en_i          : std_logic;

begin

    --------------------------------------------------------------------
    -- Enable read pulse only when FIFO is not empty
    --------------------------------------------------------------------
    fifo_read_enable <= not fifo_empty_i;

    --------------------------------------------------------------------
    -- SWITCH TO ONE-CLOCK FIFO READ PULSE
    --------------------------------------------------------------------
    read_pulse_inst : entity work.OneClockPulse
        port map (
            clk       => clk125,
            reset     => reset,
            enable    => fifo_read_enable,
            ext_in    => read_switch,
            pulse_out => fifo_rd_en_i
        );

    --------------------------------------------------------------------
    -- RX CHAIN: RGMII -> MAC -> UDP
    --------------------------------------------------------------------
    top_rx_inst : entity work.TOP_RX
        port map (
            clk125      => clk125,
            reset       => reset,

            rgmii_rxd   => rgmii_rxd,
            rgmii_rxctl => rgmii_rxctl,
            rgmii_rxc   => rgmii_rxc,

            fifo_data   => rx_fifo_data,
            fifo_wr_en  => rx_fifo_wr_en,
            fifo_last   => rx_fifo_last,
            fifo_full   => fifo_full_i
        );

    --------------------------------------------------------------------
    -- FIFO
    --------------------------------------------------------------------
    fifo_inst : entity work.Fifolg
        port map (
            Data        => rx_fifo_data,
            Clock       => clk125,
            WrEn        => rx_fifo_wr_en,
            RdEn        => fifo_rd_en_i,
            Reset       => reset,

            Q           => fifo_q,
            Empty       => fifo_empty_i,
            Full        => fifo_full_i,
            AlmostEmpty => fifo_almost_empty_i,
            AlmostFull  => fifo_almost_full_i
        );

end architecture;