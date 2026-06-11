library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_controller_fifos is
    generic (
        C_NUM_CHANNELS           : positive := 1;
        C_DAC_WIDTH              : positive := 16;
        C_BYTE_WIDTH             : positive := 8
    );
    port (
        i_clk    : in std_logic;
        i_rst    : in std_logic;
        i_enable : in std_logic;

        -- Write side of large FIFO
        i_large_fifo_din   : in std_logic_vector(7 downto 0);
        i_large_fifo_wr_en : in std_logic;

        -- Read side of the 16 small FIFOs
        i_small_fifo_rd_en : in std_logic_vector(C_NUM_CHANNELS - 1 downto 0);

        -- Flattened outputs from 16 small FIFOs
        -- channel 0 = bits 15 downto 0
        -- channel 1 = bits 31 downto 16
        -- ...
        -- channel 15 = bits 255 downto 240

        -- Small FIFO status outputs
        o_small_fifo_empty        : out std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
        o_small_fifo_full         : out std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
        o_small_fifo_almost_empty : out std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
        o_small_fifo_almost_full  : out std_logic_vector(C_NUM_CHANNELS - 1 downto 0);

        -- Large FIFO status outputs
        o_large_fifo_empty        : out std_logic;
        o_large_fifo_full         : out std_logic;
        o_large_fifo_almost_empty : out std_logic;
        o_large_fifo_almost_full  : out std_logic;

        -- Debug / controller status
        o_busy       : out std_logic;
        o_frame_done : out std_logic
    );
end entity top_controller_fifos;

architecture rtl of top_controller_fifos is

    type t_small_fifo_data_array is array (0 to C_NUM_CHANNELS - 1) of std_logic_vector(C_DAC_WIDTH - 1 downto 0);

    signal s_large_fifo_q            : std_logic_vector(7 downto 0);
    signal s_large_fifo_rd_en        : std_logic;
    signal s_large_fifo_empty        : std_logic;
    signal s_large_fifo_full         : std_logic;
    signal s_large_fifo_almost_empty : std_logic;
    signal s_large_fifo_almost_full  : std_logic;

    signal s_fifo_sel : unsigned(0 downto 0);

    signal s_small_fifo_wr_en        : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_din          : std_logic_vector(C_DAC_WIDTH - 1 downto 0);
	
    signal s_small_fifo_q            : t_small_fifo_data_array;

    signal s_small_fifo_empty        : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_full         : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_almost_empty : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_almost_full  : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
	signal o_small_fifo_dout : std_logic_vector(C_NUM_CHANNELS * C_DAC_WIDTH - 1 downto 0);

begin

    --------------------------------------------------------------------
    -- Output assignments
    --------------------------------------------------------------------

    o_large_fifo_empty        <= s_large_fifo_empty;
    o_large_fifo_full         <= s_large_fifo_full;
    o_large_fifo_almost_empty <= s_large_fifo_almost_empty;
    o_large_fifo_almost_full  <= s_large_fifo_almost_full;

    o_small_fifo_empty        <= s_small_fifo_empty;
    o_small_fifo_full         <= s_small_fifo_full;
    o_small_fifo_almost_empty <= s_small_fifo_almost_empty;
    o_small_fifo_almost_full  <= s_small_fifo_almost_full;

    gen_flatten_outputs : for ch in 0 to C_NUM_CHANNELS - 1 generate
        o_small_fifo_dout((ch + 1) * C_DAC_WIDTH - 1 downto ch * C_DAC_WIDTH)
            <= s_small_fifo_q(ch);
    end generate;

    --------------------------------------------------------------------
    -- Large FIFO
    --------------------------------------------------------------------

    u_large_fifo : entity work.Fifolg
        port map (
            Data        => i_large_fifo_din,
            Clock       => i_clk,
            WrEn        => i_large_fifo_wr_en,
            RdEn        => s_large_fifo_rd_en,
            Reset       => i_rst,
            Q           => s_large_fifo_q,
            Empty       => s_large_fifo_empty,
            Full        => s_large_fifo_full,
            AlmostEmpty => s_large_fifo_almost_empty,
            AlmostFull  => s_large_fifo_almost_full
        );

    --------------------------------------------------------------------
    -- Controller
    --------------------------------------------------------------------

    u_controller : entity work.Controller_DAC
        generic map (
            G_NUM_CHANNELS           => C_NUM_CHANNELS,
            G_DAC_WIDTH              => C_DAC_WIDTH,
            G_BYTE_WIDTH             => C_BYTE_WIDTH
        )
        port map (
            i_clk                     => i_clk,
            i_rst                     => i_rst,

            i_enable                  => i_enable,

            i_large_fifo_almost_empty => s_large_fifo_almost_empty,

            o_small_fifo_wr_en        => s_small_fifo_wr_en,

            i_fifo_dout               => s_large_fifo_q,

            i_small_fifo_almost_full  => s_small_fifo_almost_full,

            o_large_fifo_rd_en        => s_large_fifo_rd_en,

            o_small_fifo_din          => s_small_fifo_din,

            o_busy                    => o_busy,
            o_frame_done              => o_frame_done
        );

    --------------------------------------------------------------------
    -- 16 small FIFOs
    --------------------------------------------------------------------

    gen_small_fifos : for ch in 0 to C_NUM_CHANNELS - 1 generate

        u_small_fifo : entity work.FIFOsm
            port map (
                Data        => s_small_fifo_din,
                Clock       => i_clk,
                WrEn        => s_small_fifo_wr_en(ch),
                RdEn        => i_small_fifo_rd_en(ch),
                Reset       => i_rst,
                Q           => s_small_fifo_q(ch),
                Empty       => s_small_fifo_empty(ch),
                Full        => s_small_fifo_full(ch),
                AlmostEmpty => s_small_fifo_almost_empty(ch),
                AlmostFull  => s_small_fifo_almost_full(ch)
            );

    end generate;

end architecture rtl;