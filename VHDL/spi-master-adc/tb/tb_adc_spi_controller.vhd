------------------------------------------------------------------------
-- TESTBENCH
-- ADC_SPI_Controller
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package tb_utilities is
    function to_hstring(data : std_logic_vector) return string;
end package tb_utilities;

package body tb_utilities is
    function to_hstring(data : std_logic_vector) return string is
        constant hex_char : string := "0123456789ABCDEF";
        variable result : string(1 to data'length / 4);
        variable nibble : natural;
    begin
        for i in 0 to (data'length / 4 - 1) loop
            nibble := to_integer(unsigned(data(data'high - i * 4 downto data'high - i * 4 - 3)));
            result(i + 1) := hex_char(nibble + 1);
        end loop;
        return result;
    end function;
end package body tb_utilities;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_ADC_SPI_Controller is
end tb_ADC_SPI_Controller;

use work.tb_utilities.all;

architecture Behavioral of tb_ADC_SPI_Controller is

    --------------------------------------------------------------------
    -- DUT SIGNALS
    --------------------------------------------------------------------
    signal CLK       : std_logic := '0';

    signal MISO1     : std_logic := '0';
    signal MISO2     : std_logic := '0';

    signal BUSY      : std_logic := '0';

    signal SCK       : std_logic;
    signal CS        : std_logic;
    signal CNV       : std_logic;
    signal MOSI      : std_logic;

    signal Data1     : std_logic_vector(23 downto 0);
    signal Data2     : std_logic_vector(23 downto 0);

    signal DataValid : std_logic;

    --------------------------------------------------------------------
    -- TEST DATA
    --------------------------------------------------------------------
    signal adc_data1 : std_logic_vector(23 downto 0)
        := x"ABCDEF";

    signal adc_data2 : std_logic_vector(23 downto 0)
        := x"123456";

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    DUT : entity work.ADC_SPI_Controller
    port map(

        CLK       => CLK,

        MISO1     => MISO1,
        MISO2     => MISO2,

        BUSY      => BUSY,

        SCK       => SCK,
        CS        => CS,
        CNV       => CNV,
        MOSI      => MOSI,

        Data1     => Data1,
        Data2     => Data2,

        DataValid => DataValid
    );

    --------------------------------------------------------------------
    -- 80 MHz CLOCK
    -- Period = 12.5 ns
    --------------------------------------------------------------------
    CLK_PROCESS : process
    begin

        CLK <= '0';
        wait for 6.25 ns;

        CLK <= '1';
        wait for 6.25 ns;

    end process;

    --------------------------------------------------------------------
    -- ADC SERIAL DATA MODEL
    --
    -- Sends 24-bit ADC words during SPI reads
    --------------------------------------------------------------------
    ADC_MODEL : process

        variable shift1 : std_logic_vector(23 downto 0);
        variable shift2 : std_logic_vector(23 downto 0);

    begin

        ----------------------------------------------------------------
        -- WAIT FOR CHIP SELECT
        ----------------------------------------------------------------
        wait until falling_edge(CS);

        wait for 6.8 ns;

        shift1 := adc_data1;
        shift2 := adc_data2;

        MISO1 <= shift1(23);
        MISO2 <= shift2(23);

        shift1 := shift1(22 downto 0) & '0';
        shift2 := shift2(22 downto 0) & '0';

        ----------------------------------------------------------------
        -- SHIFT OUT 24 BITS
        ----------------------------------------------------------------
        for i in 0 to 22 loop

            ------------------------------------------------------------
            -- ADC updates data after rising edge
            ------------------------------------------------------------
            wait until falling_edge(SCK);

            MISO1 <= shift1(23);
            MISO2 <= shift2(23);

            shift1 := shift1(22 downto 0) & '0';
            shift2 := shift2(22 downto 0) & '0';

        end loop;

        ----------------------------------------------------------------
        -- RELEASE LINES
        ----------------------------------------------------------------
        wait until CS = '1';

        MISO1 <= '0';
        MISO2 <= '0';

    end process;

    --------------------------------------------------------------------
    -- MONITOR RESULTS
    --------------------------------------------------------------------
    MONITOR : process
    begin

        wait until rising_edge(CLK);

        if DataValid = '1' then

            report "-----------------------------------------";
            report "ADC DATA VALID";
            report "Data1 = 0x" &
                to_hstring(Data1);

            report "Data2 = 0x" &
                to_hstring(Data2);

        end if;

    end process;

    --------------------------------------------------------------------
    -- SIMULATION CONTROL
    --------------------------------------------------------------------
    STIMULUS : process
    begin

        ----------------------------------------------------------------
        -- RUN LONG ENOUGH FOR:
        -- 3ms POWERUP
        -- CONFIGURATION
        -- ACQUISITION
        ----------------------------------------------------------------
        wait for 5 ms;

        report "Simulation Finished";

        wait;

    end process;

end Behavioral;