library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_dac is
    generic (
        N_CHANNELS : positive := 2      -- Number of DAC channels (independent SDI lines)
    );
    port (
        -- System interface
        i_CLK        : in  std_logic;
        i_RST        : in  std_logic;                               -- Synchronous, active high

        -- Upstream data interface
        -- i_Data is a flat vector: channel k occupies bits (k+1)*16-1 downto k*16
        i_Data       : in  std_logic_vector(N_CHANNELS*16-1 downto 0);
        i_Data_Valid : in  std_logic;                               -- Upstream: i_Data holds new samples
        o_Ready      : out std_logic;                               -- Master: ready to accept next samples

        -- SPI bus — DAC8811 (Mode 0: CPOL=0, CPHA=0, MSB first)
        o_SPI_CLK  : out std_logic;                                 -- Shared clock to all DAC8811 CLK pins
        o_SPI_DI   : out std_logic_vector(N_CHANNELS-1 downto 0);  -- Per-channel SDI (one per DAC8811)
        o_SPI_CS_n : out std_logic                                  -- Shared CS#, active low
    );
end entity spi_master_dac;


architecture RTL of spi_master_dac is

    type state_type is (IDLE, SHIFT_LOW, SHIFT_HIGH, DONE);

    -- One 16-bit shift register per channel
    type data_array_t is array (0 to N_CHANNELS-1) of std_logic_vector(15 downto 0);

    signal state_reg  : state_type;
    signal next_state : state_type;

    signal shift_reg  : data_array_t;
    signal next_shift : data_array_t;

    signal count_reg  : integer range 0 to 16;
    signal next_count : integer range 0 to 16;

    -- Extra cycle counter for DONE state to satisfy tCSW >= 20 ns (2 cycles at 100 MHz)
    signal done_count_reg  : integer range 0 to 1;
    signal next_done_count : integer range 0 to 1;

    -- Registered output signals (glitch-free)
    signal r_SPI_CLK  : std_logic;
    signal r_SPI_DI   : std_logic_vector(N_CHANNELS-1 downto 0);
    signal r_SPI_CS_n : std_logic;
    signal r_Ready    : std_logic;

    -- Next values for registered outputs (look-ahead)
    signal next_SPI_CLK  : std_logic;
    signal next_SPI_DI   : std_logic_vector(N_CHANNELS-1 downto 0);
    signal next_SPI_CS_n : std_logic;
    signal next_Ready    : std_logic;

begin

    -- Connect registered outputs to ports
    o_SPI_CLK  <= r_SPI_CLK;
    o_SPI_DI   <= r_SPI_DI;
    o_SPI_CS_n <= r_SPI_CS_n;
    o_Ready    <= r_Ready;

    -- =========================================================================
    -- PROCESS 1: Synchronous state, datapath, and output registers
    -- =========================================================================
    process (i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RST = '1' then
                state_reg      <= IDLE;
                shift_reg      <= (others => (others => '0'));
                count_reg      <= 0;
                done_count_reg <= 0;
                r_SPI_CLK      <= '0';
                r_SPI_DI       <= (others => '0');
                r_SPI_CS_n     <= '1';
                r_Ready        <= '0';
            else
                state_reg      <= next_state;
                shift_reg      <= next_shift;
                count_reg      <= next_count;
                done_count_reg <= next_done_count;
                r_SPI_CLK      <= next_SPI_CLK;
                r_SPI_DI       <= next_SPI_DI;
                r_SPI_CS_n     <= next_SPI_CS_n;
                r_Ready        <= next_Ready;
            end if;
        end if;
    end process;

    -- =========================================================================
    -- PROCESS 2: Next-state logic and look-ahead output routing
    -- =========================================================================
    process (state_reg, shift_reg, count_reg, done_count_reg, i_Data_Valid, i_Data)
        variable v_msbs : std_logic_vector(N_CHANNELS-1 downto 0);
        variable v_next : std_logic_vector(N_CHANNELS-1 downto 0);
    begin
        -- Default: hold current register values
        next_state      <= state_reg;
        next_shift      <= shift_reg;
        next_count      <= count_reg;
        next_done_count <= done_count_reg;

        -- Default output next values
        next_SPI_CS_n <= '1';
        next_SPI_CLK  <= '0';
        next_Ready    <= '0';

        -- Collect MSB of each channel's shift register for SDI output
        for k in 0 to N_CHANNELS-1 loop
            v_msbs(k) := shift_reg(k)(15);
            v_next(k) := shift_reg(k)(14);  -- Look-ahead: next bit after shift
        end loop;
        next_SPI_DI <= v_msbs;

        case state_reg is

            when IDLE =>
                next_Ready <= '1';
                if i_Data_Valid = '1' then
                    -- Latch each channel's 16-bit word from flat input vector
                    for k in 0 to N_CHANNELS-1 loop
                        next_shift(k) <= i_Data((k+1)*16-1 downto k*16);
                    end loop;
                    next_count    <= 16;
                    next_SPI_CS_n <= '0';   -- Look-ahead: CS will be low in SHIFT_LOW
                    next_Ready    <= '0';
                    next_state    <= SHIFT_LOW;
                end if;

            when SHIFT_LOW =>
                next_SPI_CS_n <= '0';
                next_SPI_CLK  <= '1';       -- Look-ahead: clock will rise in SHIFT_HIGH
                next_SPI_DI   <= v_msbs;
                next_state    <= SHIFT_HIGH;

            when SHIFT_HIGH =>
                next_SPI_CS_n <= '0';
                next_SPI_CLK  <= '0';       -- Look-ahead: clock will fall in SHIFT_LOW
                next_SPI_DI   <= v_next;    -- Look-ahead: next bit of each channel
                -- Shift all channels left by 1
                for k in 0 to N_CHANNELS-1 loop
                    next_shift(k) <= shift_reg(k)(14 downto 0) & '0';
                end loop;
                next_count <= count_reg - 1;
                if count_reg = 1 then
                    next_SPI_CS_n <= '1';   -- Look-ahead: CS will rise in DONE
                    next_state    <= DONE;
                else
                    next_state <= SHIFT_LOW;
                end if;

            when DONE =>
                next_SPI_CS_n <= '1';
                next_SPI_CLK  <= '0';
                -- Hold for 2 cycles to satisfy tCSW >= 20 ns
                if done_count_reg = 1 then
                    next_done_count <= 0;
                    next_Ready      <= '1';  -- Look-ahead: ready in IDLE
                    next_state      <= IDLE;
                else
                    next_done_count <= done_count_reg + 1;
                end if;

        end case;
    end process;

end architecture RTL;
