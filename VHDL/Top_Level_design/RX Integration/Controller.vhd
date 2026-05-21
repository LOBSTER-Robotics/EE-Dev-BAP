library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Controller_Pkg is
    function clog2(n : positive) return positive;
end Controller_Pkg;

package body Controller_Pkg is
    function clog2(n : positive) return positive is
        variable v : natural;
        variable r : natural := 0;
    begin
        v := n - 1;

        while v > 0 loop
            v := v / 2;
            r := r + 1;
        end loop;

        if r = 0 then
            return 1;
        else
            return r;
        end if;
    end function;
end Controller_Pkg;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Controller_Pkg.all;

entity Controller is
    generic (
        G_NUM_CHANNELS           : positive := 16;
        G_DAC_WIDTH              : positive := 16;
        G_BYTE_WIDTH             : positive := 8;
        G_LARGE_FIFO_COUNT_WIDTH : positive := 16
    );
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;

        i_enable : in std_logic;

        i_large_fifo_almost_empty : in std_logic;

        o_fifo_sel : out unsigned(clog2(G_NUM_CHANNELS)-1 downto 0);

        o_small_fifo_wr_en : out std_logic_vector(G_NUM_CHANNELS-1 downto 0);

        i_fifo_dout : in std_logic_vector(G_BYTE_WIDTH-1 downto 0);

        i_small_fifo_almost_full : in std_logic_vector(G_NUM_CHANNELS-1 downto 0);

        o_large_fifo_rd_en : out std_logic;

        o_small_fifo_din : out std_logic_vector(G_DAC_WIDTH-1 downto 0);

        o_busy : out std_logic;
        o_frame_done : out std_logic
    );
end entity Controller;


architecture rtl of Controller is

    constant C_CHANNEL_WIDTH : positive := clog2(G_NUM_CHANNELS);

    constant C_BYTES_PER_WORD : positive := G_DAC_WIDTH / G_BYTE_WIDTH;
    constant C_BYTE_INDEX_WIDTH : positive := clog2(C_BYTES_PER_WORD);

    subtype t_channel is unsigned(C_CHANNEL_WIDTH-1 downto 0);
    subtype t_byte_index is unsigned(C_BYTE_INDEX_WIDTH-1 downto 0);

    constant C_LAST_CHANNEL : t_channel :=
        to_unsigned(G_NUM_CHANNELS - 1, C_CHANNEL_WIDTH);

    constant C_LAST_BYTE_INDEX : t_byte_index :=
        to_unsigned(C_BYTES_PER_WORD - 1, C_BYTE_INDEX_WIDTH);

    constant C_NO_SMALL_FIFO_ALMOST_FULL :
        std_logic_vector(G_NUM_CHANNELS-1 downto 0) := (others => '0');

    constant C_ZERO_WORD :
        std_logic_vector(G_DAC_WIDTH-1 downto 0) := (others => '0');

    type t_state is (
        S_IDLE,
        S_READ_FIRST_BYTE,
        S_READ_NEXT_BYTE,
        S_FRAME_DONE
    );

    signal r_state      : t_state;
    signal r_next_state : t_state;

    signal r_channel      : t_channel;
    signal r_next_channel : t_channel;

    signal r_byte_index      : t_byte_index;
    signal r_next_byte_index : t_byte_index;

    signal r_word_buffer      : std_logic_vector(G_DAC_WIDTH-1 downto 0);
    signal r_next_word_buffer : std_logic_vector(G_DAC_WIDTH-1 downto 0);

    signal r_word_valid      : std_logic;
    signal r_next_word_valid : std_logic;

    signal s_all_small_fifos_ready : std_logic;
    signal s_continue_allowed      : std_logic;

    ---------------------------------------------------------------------------
    -- Inserts one byte into a DAC word, MSB first.
    --
    -- Example with G_DAC_WIDTH = 24 and G_BYTE_WIDTH = 8:
    --
    -- byte_index = 0 -> bits 23 downto 16
    -- byte_index = 1 -> bits 15 downto 8
    -- byte_index = 2 -> bits 7 downto 0
    ---------------------------------------------------------------------------
    function insert_byte_msb_first(
        word_in    : std_logic_vector;
        byte_in    : std_logic_vector;
        byte_index : natural
    ) return std_logic_vector is
        variable v_result : std_logic_vector(word_in'range);
        variable v_hi     : integer;
        variable v_lo     : integer;
    begin
        v_result := word_in;

        v_hi := word_in'length - 1 - integer(byte_index * byte_in'length);
        v_lo := v_hi - byte_in'length + 1;

        v_result(v_hi downto v_lo) := byte_in;

        return v_result;
    end function;

begin

    ---------------------------------------------------------------------------
    -- Elaboration checks
    ---------------------------------------------------------------------------
    assert (G_DAC_WIDTH mod G_BYTE_WIDTH) = 0
        report "G_DAC_WIDTH must be a multiple of G_BYTE_WIDTH"
        severity failure;

    assert C_BYTES_PER_WORD >= 2
        report "This controller expects at least 2 bytes per DAC word"
        severity failure;

    ---------------------------------------------------------------------------
    -- Status helpers
    ---------------------------------------------------------------------------
    s_all_small_fifos_ready <= '1'
        when i_small_fifo_almost_full = C_NO_SMALL_FIFO_ALMOST_FULL
        else '0';

    s_continue_allowed <= '1'
        when    i_enable = '1'
            and i_large_fifo_almost_empty = '0'
            and s_all_small_fifos_ready = '1'
        else '0';

    ---------------------------------------------------------------------------
    -- Register process
    ---------------------------------------------------------------------------
    p_registers : process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_rst = '1' then
                r_state       <= S_IDLE;
                r_channel     <= (others => '0');
                r_byte_index  <= (others => '0');
                r_word_buffer <= (others => '0');
                r_word_valid  <= '0';
            else
                r_state       <= r_next_state;
                r_channel     <= r_next_channel;
                r_byte_index  <= r_next_byte_index;
                r_word_buffer <= r_next_word_buffer;
                r_word_valid  <= r_next_word_valid;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Combinatorial FSM
    ---------------------------------------------------------------------------
    p_comb : process(
        r_state,
        r_channel,
        r_byte_index,
        r_word_buffer,
        r_word_valid,
        i_enable,
        i_large_fifo_almost_empty,
        i_fifo_dout,
        i_small_fifo_almost_full,
        s_continue_allowed
    )
    begin
        -----------------------------------------------------------------------
        -- Defaults
        -----------------------------------------------------------------------
        r_next_state       <= r_state;
        r_next_channel     <= r_channel;
        r_next_byte_index  <= r_byte_index;
        r_next_word_buffer <= r_word_buffer;
        r_next_word_valid  <= r_word_valid;

        o_fifo_sel          <= r_channel;
        o_small_fifo_wr_en  <= (others => '0');
        o_large_fifo_rd_en  <= '0';
        o_small_fifo_din    <= r_word_buffer;
        if (r_state /= S_IDLE) and (r_state /= S_FRAME_DONE) then
			o_busy <= '1';
		else
			o_busy <= '0';
		end if;
        o_frame_done        <= '0';

        -----------------------------------------------------------------------
        -- FSM
        -----------------------------------------------------------------------
        case r_state is

            when S_IDLE =>

                r_next_channel    <= (others => '0');
                r_next_byte_index <= (others => '0');
                r_next_word_valid <= '0';

                if s_continue_allowed = '1' then
                    o_large_fifo_rd_en <= '1';
                    r_next_state <= S_READ_FIRST_BYTE;
                end if;

            when S_READ_FIRST_BYTE =>
                if not ((r_word_valid = '1') and (r_channel = C_LAST_CHANNEL)) then
                    r_next_word_buffer <= insert_byte_msb_first(
                        C_ZERO_WORD,
                        i_fifo_dout,
                        0
                    );
                    r_next_byte_index <= to_unsigned(1, C_BYTE_INDEX_WIDTH);
                    r_next_word_valid <= '0';
                end if;
                if r_word_valid = '1' then
                    o_small_fifo_din <= r_word_buffer;
                    o_fifo_sel       <= r_channel;
                    o_small_fifo_wr_en(to_integer(r_channel)) <= '1';
                    r_next_word_valid <= '0';
                    if r_channel = C_LAST_CHANNEL then
                        r_next_channel    <= (others => '0');
                        r_next_byte_index <= (others => '0');
                        r_next_state      <= S_FRAME_DONE;
                    else
                        r_next_channel <= r_channel + to_unsigned(1, C_CHANNEL_WIDTH);
                        o_large_fifo_rd_en <= '1';
                        r_next_state <= S_READ_NEXT_BYTE;
                    end if;
                else
                    o_large_fifo_rd_en <= '1';
                    r_next_state <= S_READ_NEXT_BYTE;
                end if;

            when S_READ_NEXT_BYTE =>

                r_next_word_buffer <= insert_byte_msb_first(
                    r_word_buffer,
                    i_fifo_dout,
                    to_integer(r_byte_index)
                );

                if r_byte_index = C_LAST_BYTE_INDEX then
                    r_next_word_valid <= '1';
                    r_next_byte_index <= (others => '0');
                    if r_channel = C_LAST_CHANNEL then
                        o_large_fifo_rd_en <= '0';
                    else
                        o_large_fifo_rd_en <= '1';
                    end if;
                    r_next_state <= S_READ_FIRST_BYTE;
                else
                    r_next_word_valid <= '0';
                    r_next_byte_index <= r_byte_index + to_unsigned(1, C_BYTE_INDEX_WIDTH);
                    o_large_fifo_rd_en <= '1';
                    r_next_state <= S_READ_NEXT_BYTE;
                end if;

            when S_FRAME_DONE =>
                o_frame_done <= '1';

                r_next_channel    <= (others => '0');
                r_next_byte_index <= (others => '0');
                r_next_word_valid <= '0';

                if s_continue_allowed = '1' then
                    o_large_fifo_rd_en <= '1';
                    r_next_state <= S_READ_FIRST_BYTE;
                else
                    o_large_fifo_rd_en <= '0';
                    r_next_state <= S_IDLE;
                end if;

        end case;
    end process;

end architecture rtl;