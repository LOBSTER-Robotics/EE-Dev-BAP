library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_packetizer_tb is
end entity;

architecture sim of udp_packetizer_tb is

    --------------------------------------------------------------------
    -- Clock / Reset
    --------------------------------------------------------------------
    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';

    constant clk_period : time := 8 ns;

    --------------------------------------------------------------------
    -- FIFO Interface
    --------------------------------------------------------------------
    signal fifo_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal fifo_empty : std_logic := '1';
    signal fifo_rd    : std_logic;

    --------------------------------------------------------------------
    -- DUT Output
    --------------------------------------------------------------------
    signal tx_data  : std_logic_vector(7 downto 0);
    signal tx_valid : std_logic;
    signal tx_last  : std_logic;

    --------------------------------------------------------------------
    -- Simple FIFO model
    --------------------------------------------------------------------
    type mem_t is array(0 to 31) of std_logic_vector(7 downto 0);

    signal fifo_mem : mem_t := (
        x"FF", x"01", x"02", x"03",
        x"04", x"05", x"06", x"07",
        x"08", x"09", x"0A", x"0B",
        x"0C", x"0D", x"0E", x"0F",
        x"10", x"11", x"12", x"13",
        x"14", x"15", x"16", x"17",
        x"18", x"19", x"1A", x"1B",
        x"1C", x"1D", x"1E", x"1F"
    );

    signal rd_ptr : integer := 0;

begin

    --------------------------------------------------------------------
    -- Clock Generation
    --------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;

            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.udp_packetizer
    port map (
        clk        => clk,
        reset      => reset,

        fifo_data  => fifo_data,
        fifo_empty => fifo_empty,
        fifo_rd    => fifo_rd,

        tx_data    => tx_data,
        tx_valid   => tx_valid,
        tx_last    => tx_last
    );

    --------------------------------------------------------------------
    -- FIFO Behavioral Model
    --------------------------------------------------------------------
    fifo_model : process(clk)
    begin
        if rising_edge(clk) then

            if reset = '1' then
                rd_ptr <= 0;
                fifo_empty <= '0';
                fifo_data <= fifo_mem(0);

            else

                if fifo_rd = '1' then

                    fifo_data <= fifo_mem(rd_ptr);

                    if rd_ptr = 31 then
                        fifo_empty <= '1';
                    else
                        rd_ptr <= rd_ptr + 1;
                    end if;

                end if;

            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    stim_proc : process
    begin

        ------------------------------------------------------------
        -- Reset
        ------------------------------------------------------------
        reset <= '1';
        wait for 50 ns;

        reset <= '0';

        ------------------------------------------------------------
        -- Let simulation run
        ------------------------------------------------------------
        wait for 5 us;

        ------------------------------------------------------------
        -- Finish simulation
        ------------------------------------------------------------
        assert false
        report "UDP Packetizer Simulation Finished"
        severity failure;

    end process;

    --------------------------------------------------------------------
    -- Packet Monitor
    --------------------------------------------------------------------
    monitor_proc : process(clk)
    begin
        if rising_edge(clk) then

            if tx_valid = '1' then

                report
                "TX BYTE = 0x" &
                integer'image(to_integer(unsigned(tx_data)));

                if tx_last = '1' then
                    report "END OF PACKET";
                end if;

            end if;

        end if;
    end process;

end architecture;