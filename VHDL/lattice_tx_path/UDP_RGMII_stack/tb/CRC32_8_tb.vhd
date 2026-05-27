library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crc32_8_tb is
end entity;

architecture sim of crc32_8_tb is

    --------------------------------------------------------------------
    -- DUT Signals
    --------------------------------------------------------------------
    signal crcIn  : std_logic_vector(31 downto 0);
    signal data   : std_logic_vector(7 downto 0);
    signal crcOut : std_logic_vector(31 downto 0);

    --------------------------------------------------------------------
    -- Test vector
    --------------------------------------------------------------------
    type byte_array is array(natural range <>) of
        std_logic_vector(7 downto 0);

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

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.crc32_8
    port map (
        crcIn  => crcIn,
        data   => data,
        crcOut => crcOut
    );

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    stim_proc : process

        variable crc_var : std_logic_vector(31 downto 0);

    begin

        ------------------------------------------------------------
        -- Initial Ethernet CRC value
        ------------------------------------------------------------
        crc_var := x"FFFFFFFF";

        report "Starting CRC test";

        wait for 10 ns;

        ------------------------------------------------------------
        -- Feed bytes
        ------------------------------------------------------------
        for i in test_data'range loop

            crcIn <= crc_var;
            data  <= test_data(i);

            --------------------------------------------------------
            -- Wait for combinational propagation
            --------------------------------------------------------
            wait for 10 ns;

            --------------------------------------------------------
            -- Capture next CRC
            --------------------------------------------------------
            crc_var := crcOut;

            report
                "BYTE = 0x" &
                to_hstring(test_data(i)) &
                "  CRC = 0x" &
                to_hstring(crc_var);

        end loop;

        ------------------------------------------------------------
        -- Ethernet final inversion
        ------------------------------------------------------------
        crc_var := not crc_var;

        report "--------------------------------";

        report
            "FINAL CRC32 = 0x" &
            to_hstring(crc_var);

        report
            "EXPECTED    = 0xCBF43926";

        report "--------------------------------";

        ------------------------------------------------------------
        -- Result
        ------------------------------------------------------------
        if crc_var = x"CBF43926" then

            report
                "CRC TEST PASSED"
                severity note;

        else

            report
                "CRC TEST FAILED"
                severity error;

        end if;

        ------------------------------------------------------------
        -- Keep simulation alive briefly
        ------------------------------------------------------------
        wait for 100 ns;

        report "Simulation Finished";

        wait;

    end process;

end architecture;