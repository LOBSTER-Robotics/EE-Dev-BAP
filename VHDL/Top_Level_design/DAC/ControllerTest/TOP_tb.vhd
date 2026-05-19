library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top_controller_fifos is
end entity tb_top_controller_fifos;

architecture sim of tb_top_controller_fifos is

    constant C_CLK_PERIOD : time := 10 ns;

    constant C_NUM_CHANNELS : positive := 16;
    constant C_DAC_WIDTH    : positive := 16;
    constant C_BYTE_WIDTH   : positive := 8;

    -- Change this depending on how many bytes you want to push
    -- into the large FIFO.
    --
    -- 128 bytes = 64 samples of 16 bits.
    -- If distributed equally over 16 channels, this gives 4 samples per channel.
    constant C_LARGE_FIFO_FILL_BYTES : natural := 128;

    signal s_clk    : std_logic := '0';
    signal s_rst    : std_logic := '1';
    signal s_enable : std_logic := '0';

    signal s_large_fifo_din   : std_logic_vector(7 downto 0) := (others => '0');
    signal s_large_fifo_wr_en : std_logic := '0';

    signal s_small_fifo_rd_en : std_logic_vector(15 downto 0) := (others => '0');

    signal s_small_fifo_dout : std_logic_vector(255 downto 0);

    signal s_small_fifo_empty        : std_logic_vector(15 downto 0);
    signal s_small_fifo_full         : std_logic_vector(15 downto 0);
    signal s_small_fifo_almost_empty : std_logic_vector(15 downto 0);
    signal s_small_fifo_almost_full  : std_logic_vector(15 downto 0);

    signal s_large_fifo_empty        : std_logic;
    signal s_large_fifo_full         : std_logic;
    signal s_large_fifo_almost_empty : std_logic;
    signal s_large_fifo_almost_full  : std_logic;

    signal s_fifo_sel   : unsigned(3 downto 0);
    signal s_busy       : std_logic;
    signal s_frame_done : std_logic;

    procedure wait_clks (
        signal clk : in std_logic;
        constant n : in natural
    ) is
    begin
        for i in 1 to n loop
            wait until rising_edge(clk);
        end loop;
    end procedure;

begin

    --------------------------------------------------------------------
    -- Clock generation
    --------------------------------------------------------------------

    s_clk <= not s_clk after C_CLK_PERIOD / 2;

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------

    u_dut : entity work.top_controller_fifos
        port map (
            i_clk    => s_clk,
            i_rst    => s_rst,
            i_enable => s_enable,

            i_large_fifo_din   => s_large_fifo_din,
            i_large_fifo_wr_en => s_large_fifo_wr_en,

            i_small_fifo_rd_en => s_small_fifo_rd_en,

            o_small_fifo_dout => s_small_fifo_dout,

            o_small_fifo_empty        => s_small_fifo_empty,
            o_small_fifo_full         => s_small_fifo_full,
            o_small_fifo_almost_empty => s_small_fifo_almost_empty,
            o_small_fifo_almost_full  => s_small_fifo_almost_full,

            o_large_fifo_empty        => s_large_fifo_empty,
            o_large_fifo_full         => s_large_fifo_full,
            o_large_fifo_almost_empty => s_large_fifo_almost_empty,
            o_large_fifo_almost_full  => s_large_fifo_almost_full,

            o_fifo_sel   => s_fifo_sel,
            o_busy       => s_busy,
            o_frame_done => s_frame_done
        );

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------

    p_stimulus : process
        variable v_read_enable : std_logic_vector(15 downto 0);
        variable v_word        : std_logic_vector(15 downto 0);
    begin

        ----------------------------------------------------------------
        -- Initial reset
        ----------------------------------------------------------------

        report "Starting simulation";

        s_rst                <= '1';
        s_enable             <= '0';
        s_large_fifo_wr_en   <= '0';
        s_large_fifo_din     <= (others => '0');
        s_small_fifo_rd_en   <= (others => '0');

        wait_clks(s_clk, 10);

        s_rst <= '0';

        wait_clks(s_clk, 5);

        ----------------------------------------------------------------
        -- Fill large FIFO while Controller is disabled
        ----------------------------------------------------------------

        report "Filling large FIFO";

        s_enable <= '0';

        for i in 0 to C_LARGE_FIFO_FILL_BYTES - 1 loop

            wait until rising_edge(s_clk);

            s_large_fifo_wr_en <= '1';

            -- Different data each write.
            -- Example pattern:
            -- 00, 01, 02, 03, ...
            s_large_fifo_din <= std_logic_vector(to_unsigned(i mod 256, 8));

        end loop;

        wait until rising_edge(s_clk);

        s_large_fifo_wr_en <= '0';
        s_large_fifo_din   <= (others => '0');

        report "Large FIFO fill complete";

        wait_clks(s_clk, 10);

        ----------------------------------------------------------------
        -- Enable Controller to start distribution
        ----------------------------------------------------------------

        report "Enabling Controller";

        s_enable <= '1';

        ----------------------------------------------------------------
        -- Wait until frame_done or timeout
        ----------------------------------------------------------------

        for timeout_count in 0 to 2000 loop
            wait until rising_edge(s_clk);

            if s_frame_done = '1' then
                report "Controller frame done received";
                exit;
            end if;

            if timeout_count = 2000 then
                assert false
                    report "Timeout waiting for frame_done"
                    severity failure;
            end if;
        end loop;

        s_enable <= '0';

        wait_clks(s_clk, 10);

        ----------------------------------------------------------------
        -- Drain all 16 small FIFOs
        ----------------------------------------------------------------

        report "Reading small FIFOs";

        for ch in 0 to 15 loop

            report "Reading small FIFO channel " & integer'image(ch);

            for read_count in 0 to 31 loop

                exit when s_small_fifo_empty(ch) = '1';

                v_read_enable := (others => '0');
                v_read_enable(ch) := '1';

                s_small_fifo_rd_en <= v_read_enable;

                wait until rising_edge(s_clk);

                s_small_fifo_rd_en <= (others => '0');

                -- Wait one extra clock in case the FIFO has registered output.
                wait until rising_edge(s_clk);

                v_word :=
                    s_small_fifo_dout((ch + 1) * C_DAC_WIDTH - 1 downto ch * C_DAC_WIDTH);

                report "Channel " & integer'image(ch) &
                       " read sample " & integer'image(read_count) &
                       " = " & integer'image(to_integer(unsigned(v_word)));

            end loop;

            wait_clks(s_clk, 2);

        end loop;

        ----------------------------------------------------------------
        -- End simulation
        ----------------------------------------------------------------

        report "Simulation complete";

        wait_clks(s_clk, 20);

        assert false
            report "End of testbench"
            severity failure;

    end process;

end architecture sim;