library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crc32_8bit_tb is
end entity;

architecture sim of crc32_8bit_tb is

    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';

    signal crc_en   : std_logic := '0';
    signal data_in  : std_logic_vector(7 downto 0);

    signal crc_out  : std_logic_vector(31 downto 0);

    constant clk_period : time := 8 ns;

    type byte_array is array(natural range <>) of std_logic_vector(7 downto 0);

    constant test_data : byte_array := (
        x"31", -- '1'
        x"32", -- '2'
        x"33", -- '3'
        x"34", -- '4'
        x"35", -- '5'
        x"36", -- '6'
        x"37", -- '7'
        x"38", -- '8'
        x"39"  -- '9'
    );

begin

    ------------------------------------------------------------
    -- Clock
    ------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;

            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    ------------------------------------------------------------
    -- DUT
    ------------------------------------------------------------
    dut : entity work.crc32_8bit
    port map (
        clk      => clk,
        reset    => reset,
        crc_en   => crc_en,
        data_in  => data_in,
        crc_out  => crc_out
    );

    ------------------------------------------------------------
    -- Stimulus
    ------------------------------------------------------------
    stim_proc : process
    begin

        --------------------------------------------------------
        -- Reset
        --------------------------------------------------------
        reset <= '1';
        wait for 20 ns;

        reset <= '0';

        wait for clk_period;

        --------------------------------------------------------
        -- Feed bytes
        --------------------------------------------------------
        for i in test_data'range loop

            data_in <= test_data(i);
            crc_en <= '1';

            wait for clk_period;

        end loop;

        crc_en <= '0';

        wait for 20 ns;

        --------------------------------------------------------
        -- Print CRC
        --------------------------------------------------------
        report "CRC32 = 0x" &
            to_hstring(crc_out);

        --------------------------------------------------------
        -- End simulation
        --------------------------------------------------------
        assert false
        report "CRC Test Finished"
        severity failure;

    end process;

end architecture;