library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RX_integration is
    port (
        --------------------------------------------------------------------
        -- CLOCK / RESET
        --------------------------------------------------------------------
        clk125 : in std_logic;
        reset  : in std_logic;

        --------------------------------------------------------------------
        -- RGMII PHY INPUT
        --------------------------------------------------------------------
        rgmii_rxd   : in std_logic_vector(3 downto 0);
        rgmii_rxctl : in std_logic;
        rgmii_rxc   : in std_logic;

        --------------------------------------------------------------------
        -- ENABLE
        --------------------------------------------------------------------
        i_enable : in std_logic;

        --------------------------------------------------------------------
        -- SMALL FIFO READ CONTROL
        --------------------------------------------------------------------
        i_small_fifo_rd_en : in std_logic_vector(15 downto 0);

        --------------------------------------------------------------------
        -- SMALL FIFO OUTPUTS
        --------------------------------------------------------------------
        o_small_fifo_dout : out std_logic_vector(255 downto 0);

        o_small_fifo_empty        : out std_logic_vector(15 downto 0);
        o_small_fifo_full         : out std_logic_vector(15 downto 0);
        o_small_fifo_almost_empty : out std_logic_vector(15 downto 0);
        o_small_fifo_almost_full  : out std_logic_vector(15 downto 0);

        --------------------------------------------------------------------
        -- LARGE FIFO STATUS
        --------------------------------------------------------------------
        o_large_fifo_empty        : out std_logic;
        o_large_fifo_full         : out std_logic;
        o_large_fifo_almost_empty : out std_logic;
        o_large_fifo_almost_full  : out std_logic;

        --------------------------------------------------------------------
        -- CONTROLLER STATUS
        --------------------------------------------------------------------
        o_fifo_sel   : out unsigned(3 downto 0);
        o_busy       : out std_logic;
        o_frame_done : out std_logic
    );
end entity RX_integration;


architecture rtl of RX_integration is

    --------------------------------------------------------------------
    -- Internal connection between TOP_RX and top_controller_fifos
    --------------------------------------------------------------------
    signal s_fifo_data  : std_logic_vector(7 downto 0);
    signal s_fifo_wr_en : std_logic;
    signal s_fifo_last  : std_logic;

    signal s_large_fifo_full : std_logic;

begin

    --------------------------------------------------------------------
    -- RGMII RX MODULE
    --------------------------------------------------------------------
    u_top_rx : entity work.TOP_RX
        port map (
            ----------------------------------------------------------------
            -- CLOCK / RESET
            ----------------------------------------------------------------
            clk125 => clk125,
            reset  => reset,

            ----------------------------------------------------------------
            -- RGMII PHY INPUT
            ----------------------------------------------------------------
            rgmii_rxd   => rgmii_rxd,
            rgmii_rxctl => rgmii_rxctl,
            rgmii_rxc   => rgmii_rxc,

            ----------------------------------------------------------------
            -- FIFO OUTPUT TO CONTROLLER LARGE FIFO
            ----------------------------------------------------------------
            fifo_data  => s_fifo_data,
            fifo_wr_en => s_fifo_wr_en,
            fifo_last  => s_fifo_last,
            fifo_full  => s_large_fifo_full
        );


    --------------------------------------------------------------------
    -- FIFO CONTROLLER
    --------------------------------------------------------------------
    u_top_controller_fifos : entity work.top_controller_fifos
        port map (
            i_clk    => clk125,
            i_rst    => reset,
            i_enable => i_enable,

            i_large_fifo_din   => s_fifo_data,
            i_large_fifo_wr_en => s_fifo_wr_en,

            i_small_fifo_rd_en => i_small_fifo_rd_en,

            o_small_fifo_dout => o_small_fifo_dout,

            o_small_fifo_empty        => o_small_fifo_empty,
            o_small_fifo_full         => o_small_fifo_full,
            o_small_fifo_almost_empty => o_small_fifo_almost_empty,
            o_small_fifo_almost_full  => o_small_fifo_almost_full,

            o_large_fifo_empty        => o_large_fifo_empty,
            o_large_fifo_full         => s_large_fifo_full,
            o_large_fifo_almost_empty => o_large_fifo_almost_empty,
            o_large_fifo_almost_full  => o_large_fifo_almost_full,

            o_fifo_sel   => o_fifo_sel,
            o_busy       => o_busy,
            o_frame_done => o_frame_done
        );

    --------------------------------------------------------------------
    -- Export large FIFO full status
    --------------------------------------------------------------------
    o_large_fifo_full <= s_large_fifo_full;

end architecture rtl;