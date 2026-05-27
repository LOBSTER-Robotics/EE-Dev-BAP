library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UDP_FIFO_AXI_tb is
end entity;

architecture sim of UDP_FIFO_AXI_tb is

    -- DUT signals
    signal clk   : std_logic := '0';
    signal rst   : std_logic := '1';

    signal fifo_data  : std_logic_vector(7 downto 0);
    signal fifo_empty : std_logic := '1';
    signal fifo_almostfull  : std_logic := '0';
    signal fifo_rd_en : std_logic;

    signal t_data  : std_logic_vector(7 downto 0);
    signal t_valid : std_logic;
    signal t_ready : std_logic := '1';
    signal t_last  : std_logic;

    -- simple FIFO model
    type mem_t is array (0 to 31) of std_logic_vector(7 downto 0);
    signal mem : mem_t := (
        x"AB", x"BC", x"AC", x"DD",
        x"11", x"22", x"33", x"44",
        others => x"00"
    );

    signal rd_ptr : integer := 0;

begin

    clk <= not clk after 5 ns;

    dut: entity work.UDP_FIFO_AXI
        port map (
            clk => clk,
            rst => rst,

            fifo_data  => fifo_data,
            fifo_empty => fifo_empty,
            fifo_almostfull  => fifo_almostfull,
            fifo_rd_en => fifo_rd_en,

            t_data  => t_data,
            t_valid => t_valid,
            t_ready => t_ready,
            t_last  => t_last
        );
    
    process(clk)
        begin
            if rising_edge(clk) then

                if rst = '1' then
                    rd_ptr <= 0;
                    fifo_empty <= '0';
                else

                    -- provide data when DUT reads FIFO
                    if fifo_rd_en = '1' then
                        fifo_data <= mem(rd_ptr);

                        -- if rd_ptr = 7 then
                        --     fifo_last <= '1';
                        -- else
                        --     fifo_last <= '0';
                        -- end if;

                        if rd_ptr < 7 then
                            rd_ptr <= rd_ptr + 1;
                        else
                            fifo_empty <= '1';
                        end if;
                    end if;

                end if;
            end if;
    end process;

    process(clk)
        begin
            if rising_edge(clk) then

                if t_valid = '1' and t_ready = '1' then
                    report "TX BYTE = 0x" &
                        to_hstring(t_data) &
                        " LAST=" & std_logic'image(t_last);
                end if;

            end if;
        end process;

    process
        begin
            wait for 20 ns;
            rst <= '0';
            wait for 20 ns;
            fifo_almostfull <= '1';
            wait for 440 ns;
            fifo_almostfull <= '0';

            wait for 2000 ns;

            report "TEST COMPLETE";
            wait;
        end process;
end architecture;