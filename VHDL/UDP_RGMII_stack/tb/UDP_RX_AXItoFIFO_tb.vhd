library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_rx_tb is
end entity;

architecture sim of udp_rx_tb is

    --------------------------------------------------------------------
    -- CLOCK
    --------------------------------------------------------------------
    constant CLK_PERIOD : time := 8 ns;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';

    --------------------------------------------------------------------
    -- AXI INPUT
    --------------------------------------------------------------------
    signal s_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal s_valid : std_logic := '0';
    signal s_last  : std_logic := '0';
    signal s_ready : std_logic;

    --------------------------------------------------------------------
    -- FIFO OUTPUT
    --------------------------------------------------------------------
    signal fifo_data  : std_logic_vector(7 downto 0);
    signal fifo_wr_en : std_logic;
    signal fifo_last  : std_logic;
    signal fifo_full  : std_logic := '0';

    --------------------------------------------------------------------
    -- COUNTER
    --------------------------------------------------------------------
    signal rx_cnt : integer := 0;

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.udp_rx
    port map (
        clk         => clk,
        reset       => reset,

        s_data      => s_data,
        s_valid     => s_valid,
        s_last      => s_last,
        s_ready     => s_ready,

        fifo_data   => fifo_data,
        fifo_wr_en  => fifo_wr_en,
        fifo_last   => fifo_last,
        fifo_full   => fifo_full
    );

    --------------------------------------------------------------------
    -- CLOCK
    --------------------------------------------------------------------
    clk <= not clk after CLK_PERIOD/2;

    --------------------------------------------------------------------
    -- STIMULUS
    --------------------------------------------------------------------
    stim_proc : process

        ----------------------------------------------------------------
        -- SEND BYTE
        ----------------------------------------------------------------
        procedure send_byte(
            data : std_logic_vector(7 downto 0);
            last : std_logic := '0'
        ) is
        begin

            wait until rising_edge(clk);

            s_data  <= data;
            s_valid <= '1';
            s_last  <= last;

        end procedure;

    begin

        ----------------------------------------------------------------
        -- RESET
        ----------------------------------------------------------------
        wait for 40 ns;

        reset <= '0';

        wait for 20 ns;

        report "START UDP RX TEST";

        ----------------------------------------------------------------
        -- ETHERNET HEADER (14 BYTES)
        ----------------------------------------------------------------
        send_byte(x"FF");
        send_byte(x"FF");
        send_byte(x"FF");
        send_byte(x"FF");
        send_byte(x"FF");
        send_byte(x"FF");

        send_byte(x"12");
        send_byte(x"34");
        send_byte(x"56");
        send_byte(x"78");
        send_byte(x"9A");
        send_byte(x"BC");

        send_byte(x"08");
        send_byte(x"00");

        ----------------------------------------------------------------
        -- IPV4 HEADER (20 BYTES)
        ----------------------------------------------------------------
        send_byte(x"45");
        send_byte(x"00");
        send_byte(x"00");
        send_byte(x"3C");

        send_byte(x"00");
        send_byte(x"00");

        send_byte(x"00");
        send_byte(x"00");

        send_byte(x"40");
        send_byte(x"11");

        send_byte(x"00");
        send_byte(x"00");

        send_byte(x"C0");
        send_byte(x"A8");
        send_byte(x"01");
        send_byte(x"0A");

        send_byte(x"C0");
        send_byte(x"A8");
        send_byte(x"01");
        send_byte(x"64");

        ----------------------------------------------------------------
        -- UDP HEADER (8 BYTES)
        ----------------------------------------------------------------
        send_byte(x"04");
        send_byte(x"D2");

        send_byte(x"16");
        send_byte(x"2E");

        send_byte(x"00");
        send_byte(x"10");

        send_byte(x"00");
        send_byte(x"00");

        ----------------------------------------------------------------
        -- PAYLOAD
        ----------------------------------------------------------------
        send_byte(x"11");
        send_byte(x"22");
        send_byte(x"33");
        send_byte(x"44");
        send_byte(x"55");
        send_byte(x"66");
        send_byte(x"77");
        send_byte(x"88", '1');

        ----------------------------------------------------------------
        -- END STREAM
        ----------------------------------------------------------------
        wait until rising_edge(clk);

        s_valid <= '0';
        s_last  <= '0';

        ----------------------------------------------------------------
        -- WAIT
        ----------------------------------------------------------------
        wait for 200 ns;

        assert false
        report "UDP RX TEST COMPLETE"
        severity failure;

    end process;

    --------------------------------------------------------------------
    -- MONITOR FIFO OUTPUT
    --------------------------------------------------------------------
    monitor_proc : process(clk)
    begin
        if rising_edge(clk) then

            if fifo_wr_en = '1' then

                report
                    "FIFO[" &
                    integer'image(rx_cnt) &
                    "] = 0x" &
                    to_hstring(fifo_data);

                rx_cnt <= rx_cnt + 1;

            end if;

            if fifo_last = '1' then

                report "FIFO LAST ASSERTED";

            end if;

        end if;
    end process;

end architecture;