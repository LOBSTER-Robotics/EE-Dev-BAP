library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_spi_master_dac is
end entity tb_spi_master_dac;

architecture sim of tb_spi_master_dac is

    -- -------------------------------------------------------------------------
    -- Testbench configuration
    -- -------------------------------------------------------------------------
    constant C_N_CHANNELS : positive := 2;
    constant C_CLK_PERIOD : time     := 10 ns;  -- 100 MHz system clock

    -- -------------------------------------------------------------------------
    -- DUT signals
    -- -------------------------------------------------------------------------
    signal i_CLK        : std_logic := '0';
    signal i_RST        : std_logic := '1';
    signal i_Data       : std_logic_vector(C_N_CHANNELS*16-1 downto 0) := (others => '0');
    signal i_Data_Valid : std_logic := '0';
    signal o_Ready      : std_logic;
    signal o_SPI_CLK    : std_logic;
    signal o_SPI_DI     : std_logic_vector(C_N_CHANNELS-1 downto 0);
    signal o_SPI_CS_n   : std_logic;

begin

    -- -------------------------------------------------------------------------
    -- Clock generation: 100 MHz
    -- -------------------------------------------------------------------------
    i_CLK <= not i_CLK after C_CLK_PERIOD / 2;

    -- -------------------------------------------------------------------------
    -- DUT instantiation
    -- -------------------------------------------------------------------------
    DUT : entity work.spi_master_dac
        generic map (
            N_CHANNELS => C_N_CHANNELS
        )
        port map (
            i_CLK        => i_CLK,
            i_RST        => i_RST,
            i_Data       => i_Data,
            i_Data_Valid => i_Data_Valid,
            o_Ready      => o_Ready,
            o_SPI_CLK    => o_SPI_CLK,
            o_SPI_DI     => o_SPI_DI,
            o_SPI_CS_n   => o_SPI_CS_n
        );

    -- -------------------------------------------------------------------------
    -- Stimulus process
    -- -------------------------------------------------------------------------
    stimulus : process
    begin
        -- Hold reset for 5 clock cycles
        i_RST <= '1';
        wait for C_CLK_PERIOD * 5;
        i_RST <= '0';
        wait for C_CLK_PERIOD * 2;

        -- -----------------------------------------------------------------------
        -- Test 1: Single transfer
        -- Channel 0: 0xAAAA (1010 1010 1010 1010)
        -- Channel 1: 0x5555 (0101 0101 0101 0101)
        -- Easy to verify in waveform — alternating bits
        -- -----------------------------------------------------------------------
        wait until o_Ready = '1';
        wait until rising_edge(i_CLK);
        i_Data       <= x"5555" & x"AAAA";  -- ch1=0x5555, ch0=0xAAAA
        i_Data_Valid <= '1';
        wait for C_CLK_PERIOD;
        i_Data_Valid <= '0';

        -- Wait for transfer to complete
        wait until o_Ready = '1';
        wait for C_CLK_PERIOD * 5;

        -- -----------------------------------------------------------------------
        -- Test 2: Second transfer immediately after ready
        -- Channel 0: 0xFFFF (all ones)
        -- Channel 1: 0x0000 (all zeros)
        -- -----------------------------------------------------------------------
        wait until rising_edge(i_CLK);
        i_Data       <= x"0000" & x"FFFF";  -- ch1=0x0000, ch0=0xFFFF
        i_Data_Valid <= '1';
        wait for C_CLK_PERIOD;
        i_Data_Valid <= '0';

        -- Wait for transfer to complete
        wait until o_Ready = '1';
        wait for C_CLK_PERIOD * 5;

        -- -----------------------------------------------------------------------
        -- Test 3: Back-to-back transfer (valid asserted as soon as ready)
        -- Channel 0: 0x1234
        -- Channel 1: 0xABCD
        -- -----------------------------------------------------------------------
        wait until rising_edge(i_CLK);
        i_Data       <= x"ABCD" & x"1234";
        i_Data_Valid <= '1';
        wait for C_CLK_PERIOD;
        i_Data_Valid <= '0';

        wait until o_Ready = '1';
        wait for C_CLK_PERIOD * 10;

        -- End simulation
        report "Simulation complete" severity note;
        wait;
    end process;

end architecture sim;
