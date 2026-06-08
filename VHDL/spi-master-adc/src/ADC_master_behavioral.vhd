library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture Behavioral of ADC_SPI_Controller is

    signal CLK80 : std_logic;

    --------------------------------------------------------------------
    -- FSM STATES
    --------------------------------------------------------------------
    type state_type is (
        RESET_ST,
        WAIT_POWERUP_ST,
        START_CONFIG_ST,
        WAIT_CONFIG_ST,
        RUN_ACQ_ST
    );

    signal state        : state_type := RESET_ST;
    signal next_state   : state_type := RESET_ST;
    signal state_number : integer range 0 to 4   := 0;     

    --------------------------------------------------------------------
    -- CONFIG CONTROL
    --------------------------------------------------------------------
    signal start_config : std_logic := '0';
    signal config_done  : std_logic;

    --------------------------------------------------------------------
    -- BLOCK ENABLES
    --------------------------------------------------------------------
    signal config_enable : std_logic;
    signal acq_enable    : std_logic;

    --------------------------------------------------------------------
    -- CONFIG SPI SIGNALS
    --------------------------------------------------------------------
    signal sck_config  : std_logic;
    signal cs_config   : std_logic;
    signal mosi_config : std_logic;

    --------------------------------------------------------------------
    -- ACQUISITION ENGINE SIGNALS
    --------------------------------------------------------------------
    signal sck_acq : std_logic;
    signal cs_acq  : std_logic;
    signal cnv_acq : std_logic;

    --------------------------------------------------------------------
    -- POWERUP WAIT COUNTER
    --------------------------------------------------------------------
    signal wait_counter : integer := 0;
    signal next_wait_counter : integer := 0;

    --------------------------------------------------------------------
    -- NEEDED SIGNALS FOR LED DEBUGGER
    --------------------------------------------------------------------
    signal data1_int : std_logic_vector(23 downto 0);
    signal data2_int : std_logic_vector(23 downto 0);
    signal dv_int    : std_logic;

begin

    --------------------------------------------------------------------
    -- SPI OWNERSHIP
    --------------------------------------------------------------------
    config_enable <= '1'
        when (state = START_CONFIG_ST or
              state = WAIT_CONFIG_ST)
        else '0';

    acq_enable <= '1'
        when (state = RUN_ACQ_ST)
        else '0';
    
    --------------------------------------------------------------------
    -- CLOCK REFERENCE
    --------------------------------------------------------------------
    CLOCK_BLOCK : entity work.PLL
    port map (
        CLKI => CLK,
        CLKOP => CLK80
    );

    --------------------------------------------------------------------
    -- CONFIGURATION BLOCK
    --------------------------------------------------------------------
    CONFIG_BLOCK : entity work.ADC_SPI_Config
    port map (

        CLK => CLK80,

        Enable => config_enable,

        StartConfig => start_config,
        ConfigDone  => config_done,

        SCK  => sck_config,
        CS   => cs_config,
        MOSI => mosi_config
    );

    --------------------------------------------------------------------
    -- ACQUISITION ENGINE
    --------------------------------------------------------------------
    ACQ_BLOCK : entity work.ADC_Acquisition_Engine
    port map (

        CLK => CLK80,

        Enable => acq_enable,

        MISO1 => MISO1,
        MISO2 => MISO2,

        CNV => cnv_acq,
        CS  => cs_acq,
        SCK => sck_acq,

        Data1 => data1_int,
        Data2 => data2_int,

        DataValid => dv_int
    );

    Data1     <= data1_int;
    Data2     <= data2_int;
    DataValid <= dv_int;

    --------------------------------------------------------------------
    -- SPI BUS MULTIPLEXER
    --------------------------------------------------------------------
    SCK <= sck_config
        when config_enable = '1'
        else sck_acq;

    CS <= cs_config
        when config_enable = '1'
        else cs_acq;

    --------------------------------------------------------------------
    -- CNV ONLY USED DURING ACQUISITION
    --------------------------------------------------------------------
    CNV <= cnv_acq;

    --------------------------------------------------------------------
    -- MOSI ONLY USED DURING CONFIGURATION
    --------------------------------------------------------------------
    MOSI <= mosi_config;

    --------------------------------------------------------------------
    -- STATE REGISTER
    --------------------------------------------------------------------
    process(CLK80)
    begin

        if rising_edge(CLK80) then

            state <= next_state;
            wait_counter <= next_wait_counter;

        end if;

    end process;

    --------------------------------------------------------------------
    -- UPDATE LED LEVEL INDICATOR
    --------------------------------------------------------------------
    process(CLK80)
    begin
        if rising_edge(CLK80) then
            if dv_int = '1' then
                if    unsigned(data1_int) < x"400000" then RangeLEDs <= "0001";
                elsif unsigned(data1_int) < x"800000" then RangeLEDs <= "0010";
                elsif unsigned(data1_int) < x"C00000" then RangeLEDs <= "0100";
                else                                        RangeLEDs <= "1000";
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- MAIN FSM
    --------------------------------------------------------------------
    process(state, wait_counter)
    begin

        ------------------------------------------------------------
        -- DEFAULTS
        ------------------------------------------------------------
        start_config <= '0';
        next_wait_counter <= wait_counter;

        case state is

            --------------------------------------------------------
            -- RESET
            --------------------------------------------------------
            when RESET_ST =>

                next_wait_counter <= 0;
                state_number <= 0;

            --------------------------------------------------------
            -- POWERUP WAIT
            --------------------------------------------------------
            when WAIT_POWERUP_ST =>

                state_number <= 1;
                if wait_counter < 200 then

                    next_wait_counter <= wait_counter + 1;

                else

                    next_wait_counter <= 0;

                end if;

            --------------------------------------------------------
            -- START CONFIGURATION
            --------------------------------------------------------
            when START_CONFIG_ST =>

                state_number <= 2;
                start_config <= '1';

            --------------------------------------------------------
            -- WAIT CONFIGURATION DONE
            --------------------------------------------------------
            when WAIT_CONFIG_ST =>

                state_number <= 3;
                -- null;

            --------------------------------------------------------
            -- ACQUISITION RUNS AUTONOMOUSLY
            --------------------------------------------------------
            when RUN_ACQ_ST =>

                state_number <= 4;
                --null;

        end case;
    end process;

    --------------------------------------------------------------------
    -- NEXT STATE LOGIC
    --------------------------------------------------------------------
    process(
        state,
        wait_counter,
        config_done
    )
    begin

        ------------------------------------------------------------
        -- DEFAULT
        ------------------------------------------------------------
        next_state <= state;

        case state is

            --------------------------------------------------------
            -- RESET
            --------------------------------------------------------
            when RESET_ST =>

                next_state <= WAIT_POWERUP_ST;

            --------------------------------------------------------
            -- WAIT POWERUP
            --------------------------------------------------------
            when WAIT_POWERUP_ST =>

                if wait_counter = 200 then

                    next_state <= START_CONFIG_ST;

                end if;

            --------------------------------------------------------
            -- START CONFIG
            --------------------------------------------------------
            when START_CONFIG_ST =>

                next_state <= WAIT_CONFIG_ST;

            --------------------------------------------------------
            -- WAIT CONFIG DONE
            --------------------------------------------------------
            when WAIT_CONFIG_ST =>

                if config_done = '1' then

                    next_state <= RUN_ACQ_ST;

                end if;

            --------------------------------------------------------
            -- CONTINUOUS ACQUISITION
            --------------------------------------------------------
            when RUN_ACQ_ST =>

                next_state <= RUN_ACQ_ST;

        end case;

    end process;

end Behavioral;
        

------------------------------------------------------------------------
-- ADC_SPI_Config Behavioral
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture Behavioral of ADC_SPI_Config is

    --------------------------------------------------------------------
    -- FSM STATES
    --------------------------------------------------------------------
    type state_type is (
        IDLE_ST,
        LOAD_CMD_ST,

        ASSERT_CS_ST,
        PRELOAD_BIT_ST,
        SHIFT_ST,
        END_CS_ST,

        NEXT_CMD_ST,
        WAIT_RESET_ST,

        DONE_ST
    );

    signal state      : state_type := IDLE_ST;
    signal next_state : state_type := IDLE_ST;
    signal STATE_DEBUG  : integer range 0 to 8  := 0;

    --------------------------------------------------------------------
    -- SPI SHIFT REGISTER
    --------------------------------------------------------------------
    signal shift_reg : std_logic_vector(23 downto 0)
        := (others => '0');
    signal next_shift_reg : std_logic_vector(23 downto 0) := (others => '0');

    --------------------------------------------------------------------
    -- BIT COUNTER
    --------------------------------------------------------------------
    signal bit_counter : integer range 0 to 24 := 0;
    signal next_bit_counter : integer range 0 to 24 := 0;

    --------------------------------------------------------------------
    -- COMMAND COUNTER
    --------------------------------------------------------------------
    signal cmd_counter : integer range 0 to 5 := 0;
    signal next_cmd_counter : integer range 0 to 5 := 0;

    --------------------------------------------------------------------
    -- WAIT COUNTER
    --------------------------------------------------------------------
    signal wait_reset_counter : integer := 0;
    signal next_wait_reset_counter : integer := 0;

    --------------------------------------------------------------------
    -- SPI ACTIVE
    --------------------------------------------------------------------
    signal spi_active : std_logic := '0';

    --------------------------------------------------------------------
    -- INVERTED CLOCK
    --------------------------------------------------------------------
    signal CLK_inv : std_logic;

begin

    --------------------------------------------------------------------
    -- INVERT CLOCK FOR MOSI UPDATES
    --------------------------------------------------------------------
    CLK_inv <= not CLK;

    --------------------------------------------------------------------
    -- TRUE 80 MHz SPI CLOCK
    --------------------------------------------------------------------
    SCK <= CLK and spi_active;

    --------------------------------------------------------------------
    -- STATE REGISTER
    --------------------------------------------------------------------
    process(CLK)
    begin

        if rising_edge(CLK) then

            state <= next_state;
            cmd_counter <= next_cmd_counter;
            wait_reset_counter <= next_wait_reset_counter;

        end if;

    end process;

    process(CLK_inv)
    begin

        if rising_edge(CLK_inv) then

            bit_counter <= next_bit_counter;
            shift_reg <= next_shift_reg;

        end if;

    end process;

    --------------------------------------------------------------------
    -- MAIN CONTROL LOGIC - STATE MACHINE & COUNTERS
    --------------------------------------------------------------------
    process(state, cmd_counter, wait_reset_counter)
    begin
        spi_active <= '0';
        next_cmd_counter <= cmd_counter;
        next_wait_reset_counter <= wait_reset_counter;

        case state is

            --------------------------------------------------------
            -- LOAD COMMAND
            --------------------------------------------------------
            when LOAD_CMD_ST =>

                ----------------------------------------------------
                -- RESET BIT COUNTER
                ----------------------------------------------------
                --bit_counter <= 0;

                ----------------------------------------------------
                -- STOP SPI CLOCK
                ----------------------------------------------------
                spi_active <= '0';

            --------------------------------------------------------
            -- PRELOAD FIRST MOSI BIT
            --------------------------------------------------------
            when PRELOAD_BIT_ST =>

                ----------------------------------------------------
                -- PUT FIRST BIT ON MOSI
                ----------------------------------------------------
                --MOSI <= shift_reg(23);

                ----------------------------------------------------
                -- SHIFT LEFT
                ----------------------------------------------------
                --shift_reg <=
                    --shift_reg(22 downto 0) & '0';

                -- (bit_counter is handled by CLK_inv process)
                null;

            --------------------------------------------------------
            -- START CLOCKING
            --------------------------------------------------------
            when SHIFT_ST =>

                ----------------------------------------------------
                -- ENABLE SPI CLOCK
                ----------------------------------------------------
                spi_active <= '1';

                -- (bit_counter and MOSI updates happen on CLK_inv)

            --------------------------------------------------------
            -- END SPI TRANSACTION
            --------------------------------------------------------
            when END_CS_ST =>

                ----------------------------------------------------
                -- STOP SPI CLOCK
                ----------------------------------------------------
                spi_active <= '0';

            --------------------------------------------------------
            -- NEXT COMMAND
            --------------------------------------------------------
            when NEXT_CMD_ST =>

                if cmd_counter < 5 then

                    next_cmd_counter <= cmd_counter + 1;

                end if;

            --------------------------------------------------------
            -- WAIT AFTER RESET
            --------------------------------------------------------
            when WAIT_RESET_ST =>

                if wait_reset_counter < 100 then

                    next_wait_reset_counter <=
                        wait_reset_counter + 1;

                else

                    next_wait_reset_counter <= 0;

                end if;

            --------------------------------------------------------
            -- DONE
            --------------------------------------------------------
            when DONE_ST =>

                next_cmd_counter <= 0;

                spi_active <= '0';

            when others =>
                null;

        end case;


    end process;

    --------------------------------------------------------------------
    -- MOSI UPDATE ON INVERTED CLOCK
    -- Gives proper timing margin for tHSDI (hold time)
    --------------------------------------------------------------------
    process(state, bit_counter, cmd_counter)
    begin


        next_bit_counter <= 0;
        next_shift_reg <= shift_reg;
        MOSI <= '0';

        case state is
            when SHIFT_ST =>
                --------------------------------------------------------
                -- UPDATE MOSI WITH NEXT BIT
                --------------------------------------------------------
                if bit_counter < 24 then

                    MOSI <= shift_reg(23);

                    --------------------------------------------------------
                    -- SHIFT LEFT
                    --------------------------------------------------------
                    next_shift_reg <=
                        shift_reg(22 downto 0) & '0';

                    --------------------------------------------------------
                    -- INCREMENT BIT COUNTER
                    --------------------------------------------------------
                    next_bit_counter <= bit_counter + 1;

                end if;

            when LOAD_CMD_ST =>
                next_bit_counter <= 0;

                 ----------------------------------------------------
                -- LOAD COMMAND WORD
                ----------------------------------------------------
                case cmd_counter is

                    ------------------------------------------------
                    -- ENTER CONFIG MODE
                    ------------------------------------------------
                    when 0 =>

                        next_shift_reg <= x"A00000";

                    ------------------------------------------------
                    -- SOFTWARE RESET
                    ------------------------------------------------
                    when 1 =>

                        next_shift_reg <= x"000091";

                    ------------------------------------------------
                    -- ENTER CONVERSION MODE
                    ------------------------------------------------
                    when 2 =>

                        next_shift_reg <= x"001401";

                    ------------------------------------------------
                    -- REENTER CONFIG MODE
                    ------------------------------------------------
                    when 3 =>

                        next_shift_reg <= x"A00000";

                    ------------------------------------------------
                    -- MODE OF OPERATION
                    ------------------------------------------------
                    when 4 =>

                        next_shift_reg <= x"002000";

                    ------------------------------------------------
                    -- EXIT CONFIG MODE
                    ------------------------------------------------
                    when 5 =>

                        next_shift_reg <= x"001401";

                    when others =>

                        next_shift_reg <= (others => '0');

                end case;

            when others =>
                null;

        end case;


    end process;

    --------------------------------------------------------------------
    -- OUTPUT LOGIC
    --------------------------------------------------------------------
    process(state)
    begin

        ------------------------------------------------------------
        -- DEFAULTS
        ------------------------------------------------------------
        CS <= '1';

        ConfigDone <= '0';

        case state is

            --------------------------------------------------------
            -- IDLE
            --------------------------------------------------------
            when IDLE_ST =>

                CS <= '1';
                STATE_DEBUG <= 0;

            --------------------------------------------------------
            -- LOAD COMMAND
            --------------------------------------------------------
            when LOAD_CMD_ST =>

                CS <= '1';
                STATE_DEBUG <= 1;

            --------------------------------------------------------
            -- ASSERT CS
            -- Gives tCSSCK timing
            --------------------------------------------------------
            when ASSERT_CS_ST =>

                CS <= '0';
                STATE_DEBUG <= 2;

            --------------------------------------------------------
            -- PRELOAD FIRST BIT
            -- Gives tSSDI timing
            --------------------------------------------------------
            when PRELOAD_BIT_ST =>

                CS <= '0';
                STATE_DEBUG <= 3;

            --------------------------------------------------------
            -- SHIFT DATA
            --------------------------------------------------------
            when SHIFT_ST =>

                CS <= '0';
                STATE_DEBUG <= 4;

            --------------------------------------------------------
            -- HOLD CS AFTER LAST CLOCK
            -- Gives tSCKCS timing
            --------------------------------------------------------
            when END_CS_ST =>

                CS <= '0';
                STATE_DEBUG <= 5;

            --------------------------------------------------------
            -- NEXT COMMAND
            --------------------------------------------------------
            when NEXT_CMD_ST =>

                CS <= '1';
                STATE_DEBUG <= 6;

            --------------------------------------------------------
            -- WAIT RESET
            --------------------------------------------------------
            when WAIT_RESET_ST =>

                CS <= '1';
                STATE_DEBUG <= 7;

            --------------------------------------------------------
            -- DONE
            --------------------------------------------------------
            when DONE_ST =>

                CS <= '1';

                ConfigDone <= '1';

                STATE_DEBUG <= 8;

        end case;

    end process;

    --------------------------------------------------------------------
    -- NEXT STATE LOGIC
    --------------------------------------------------------------------
    process(
        state,
        StartConfig,
        bit_counter,
        cmd_counter,
        wait_reset_counter,
        Enable
    )
    begin

        ------------------------------------------------------------
        -- DEFAULT
        ------------------------------------------------------------
        next_state <= state;

        ------------------------------------------------------------
        -- ONLY START ROUTINE IF ENABLED
        ------------------------------------------------------------
        if Enable = '1' then
            
            case state is

                --------------------------------------------------------
                -- WAIT FOR START
                --------------------------------------------------------
                when IDLE_ST =>

                    if StartConfig = '1' then

                        next_state <= LOAD_CMD_ST;

                    end if;

                --------------------------------------------------------
                -- LOAD COMMAND
                --------------------------------------------------------
                when LOAD_CMD_ST =>

                    next_state <= ASSERT_CS_ST;

                --------------------------------------------------------
                -- ASSERT CS
                -- Gives tCSSCK timing
                --------------------------------------------------------
                when ASSERT_CS_ST =>

                    next_state <= PRELOAD_BIT_ST;

                --------------------------------------------------------
                -- PRELOAD FIRST BIT
                -- Gives tSSDI timing
                --------------------------------------------------------
                when PRELOAD_BIT_ST =>

                    next_state <= SHIFT_ST;

                --------------------------------------------------------
                -- SHIFT REMAINING 23 BITS
                --------------------------------------------------------
                when SHIFT_ST =>

                    if bit_counter = 23 then

                        next_state <= END_CS_ST;

                    end if;

                --------------------------------------------------------
                -- HOLD CS AFTER LAST CLOCK
                --------------------------------------------------------
                when END_CS_ST =>

                    next_state <= NEXT_CMD_ST;

                --------------------------------------------------------
                -- NEXT COMMAND
                --------------------------------------------------------
                when NEXT_CMD_ST =>

                    if cmd_counter = 2 then

                        next_state <= WAIT_RESET_ST;

                    elsif cmd_counter = 5 then

                        next_state <= DONE_ST;

                    else

                        next_state <= LOAD_CMD_ST;

                    end if;

                --------------------------------------------------------
                -- WAIT RESET DELAY
                --------------------------------------------------------
                when WAIT_RESET_ST =>

                    if wait_reset_counter = 100 then

                        next_state <= LOAD_CMD_ST;

                    end if;

                --------------------------------------------------------
                -- DONE
                --------------------------------------------------------
                when DONE_ST =>

                    next_state <= IDLE_ST;

            end case;

        end if;

    end process;

end Behavioral;
            


------------------------------------------------------------------------
-- ADC Acquisition Engine
-- Zone 2 Operation
--
-- 80 MHz FPGA clock
-- 80 MHz SPI clock
-- 2 MSPS sample rate
--
-- Every 40 FPGA clocks:
--     new conversion starts
--
-- SPI readout happens INSIDE that 40-clock window
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture Behavioral of ADC_Acquisition_Engine is

    --------------------------------------------------------------------
    -- FSM STATES
    --------------------------------------------------------------------
    type state_type is (
        IDLE_ST,

        PRE_CNV_QUIET_ST,
        CNV_PULSE_ST,
        POST_CNV_QUIET_ST,

        ASSERT_CS_ST,
        SHIFT_ST,
        END_CS_ST
    );

    signal state      : state_type := IDLE_ST;
    signal next_state : state_type := IDLE_ST;
    signal STATE_DEBUG  : integer range 0 to 6  := 0;

    --------------------------------------------------------------------
    -- FREE RUNNING SAMPLE TIMER
    -- 80 MHz / 2 MHz = 40 clocks
    --------------------------------------------------------------------
    signal sample_counter : integer range 0 to 39 := 0;
    signal next_sample_counter : integer range 0 to 39 := 0;

    --------------------------------------------------------------------
    -- QUIET COUNTER
    --------------------------------------------------------------------
    signal quiet_counter : integer range 0 to 3 := 0;
    signal next_quiet_counter : integer range 0 to 3 := 0;

    --------------------------------------------------------------------
    -- SPI ACTIVE
    --------------------------------------------------------------------
    signal spi_active : std_logic := '0';

    --------------------------------------------------------------------
    -- SPI BIT COUNTER
    --------------------------------------------------------------------
    signal bit_counter : integer range 0 to 23 := 0;
    signal next_bit_counter : integer range 0 to 23 := 0;

    --------------------------------------------------------------------
    -- ADC DATA SHIFT REGISTERS
    --------------------------------------------------------------------
    signal shift_reg1 : std_logic_vector(23 downto 0)
        := (others => '0');
    signal next_shift_reg1 : std_logic_vector(23 downto 0) := (others => '0');

    signal shift_reg2 : std_logic_vector(23 downto 0)
        := (others => '0');
    signal next_shift_reg2 : std_logic_vector(23 downto 0) := (others => '0');

    --------------------------------------------------------------------
    -- INVERTED CLOCK
    --------------------------------------------------------------------
    signal CLK_inv : std_logic;

begin

    --------------------------------------------------------------------
    -- TRUE 80 MHz SPI CLOCK
    --------------------------------------------------------------------
    SCK <= CLK and spi_active; -- ####CHECK IF THIS IS A PROBLEM

    --------------------------------------------------------------------
    -- INVERT CLOCK FOR MOSI UPDATES
    --------------------------------------------------------------------
    CLK_inv <= not CLK;

    --------------------------------------------------------------------
    -- FREE RUNNING 2 MHz SAMPLE TIMER
    --------------------------------------------------------------------
    process(CLK)
    begin
        if rising_edge(CLK) then
            state          <= next_state;
            sample_counter <= next_sample_counter;
            quiet_counter  <= next_quiet_counter;
            bit_counter    <= next_bit_counter;
            shift_reg1     <= next_shift_reg1;
            shift_reg2     <= next_shift_reg2;
        end if;
    end process;
    --------------------------------------------------------------------
    -- MAIN CONTROL LOGIC
    --------------------------------------------------------------------
    process(state, MISO1, MISO2, quiet_counter, bit_counter, shift_reg1, shift_reg2)
    begin

        ------------------------------------------------------------
        -- DEFAULTS
        ------------------------------------------------------------
        DataValid <= '0';
        next_bit_counter <= 0;
        next_quiet_counter <= 0;
        spi_active <= '0';
        Data1 <= (others => '0');
        Data2 <= (others => '0');

        case state is

            --------------------------------------------------------
            -- IDLE
            --------------------------------------------------------
            when IDLE_ST =>

                CNV <= '0';

                spi_active <= '0';

                next_quiet_counter <= 0;

                STATE_DEBUG <= 0;

            --------------------------------------------------------
            -- PRE-CNV QUIET ZONE
            --
            -- tQUIET_CNV_ADV >= 19.6 ns
            -- 2 clocks @ 80 MHz = 25 ns
            --------------------------------------------------------
            when PRE_CNV_QUIET_ST =>

                CNV <= '0';

                spi_active <= '0';

                if quiet_counter < 1 then

                    next_quiet_counter <= quiet_counter + 1;

                end if;

                STATE_DEBUG <= 1;

            --------------------------------------------------------
            -- CNV PULSE
            --------------------------------------------------------
            when CNV_PULSE_ST =>

                ----------------------------------------------------
                -- START CONVERSION
                ----------------------------------------------------
                CNV <= '1';

                next_quiet_counter <= 0;

                spi_active <= '0';

                STATE_DEBUG <= 2;

            --------------------------------------------------------
            -- POST-CNV QUIET ZONE
            --
            -- tQUIET_CNV_DELAY >= 9.8 ns
            -- 1 clock @ 80 MHz = 12.5 ns
            --------------------------------------------------------
            when POST_CNV_QUIET_ST =>

                CNV <= '0';

                spi_active <= '0';

                STATE_DEBUG <= 3;

            --------------------------------------------------------
            -- ASSERT CS
            --------------------------------------------------------
            when ASSERT_CS_ST =>

                ----------------------------------------------------
                -- RESET SPI COUNTER
                ----------------------------------------------------
                next_bit_counter <= 0;

                ----------------------------------------------------
                -- SPI CLOCK STILL OFF
                ----------------------------------------------------
                spi_active <= '0';

                STATE_DEBUG <= 4;

            --------------------------------------------------------
            -- SHIFT SPI DATA
            --------------------------------------------------------
            when SHIFT_ST =>

                ----------------------------------------------------
                -- ENABLE TRUE 80 MHz SPI CLOCK
                ----------------------------------------------------
                spi_active <= '1';

                ----------------------------------------------------
                -- COUNT SPI BITS
                ----------------------------------------------------
                if bit_counter < 23 then

                    next_bit_counter <= bit_counter + 1;

                end if;

                STATE_DEBUG <= 5;

                --------------------------------------------------------
                -- SHIFT IN ADC DATA
                --------------------------------------------------------
                next_shift_reg1 <=
                    shift_reg1(22 downto 0) & MISO1;

                next_shift_reg2 <=
                    shift_reg2(22 downto 0) & MISO2;

            --------------------------------------------------------
            -- END SPI TRANSACTION
            --------------------------------------------------------
            when END_CS_ST =>

                ----------------------------------------------------
                -- STOP SPI CLOCK
                ----------------------------------------------------
                spi_active <= '0';

                ----------------------------------------------------
                -- LATCH ADC DATA
                ----------------------------------------------------
                Data1 <= shift_reg1;

                Data2 <= shift_reg2;

                ----------------------------------------------------
                -- DATA VALID PULSE
                ----------------------------------------------------
                DataValid <= '1';

                STATE_DEBUG <= 6;

        end case;
    
    end process;

    --------------------------------------------------------------------
    -- OUTPUT LOGIC
    --------------------------------------------------------------------
    process(state)
    begin

        ------------------------------------------------------------
        -- DEFAULTS
        ------------------------------------------------------------
        CS <= '1';

        case state is

            --------------------------------------------------------
            -- ASSERT CS
            --------------------------------------------------------
            when ASSERT_CS_ST =>

                CS <= '0';

            --------------------------------------------------------
            -- SHIFT DATA
            --------------------------------------------------------
            when SHIFT_ST =>

                CS <= '0';

            --------------------------------------------------------
            -- HOLD CS AFTER LAST CLOCK
            --------------------------------------------------------
            when END_CS_ST =>

                CS <= '0';

            when others =>
                null;

        end case;
        
    end process;

    --------------------------------------------------------------------
    -- NEXT STATE LOGIC
    --------------------------------------------------------------------
    process(
        state,
        sample_counter,
        quiet_counter,
        bit_counter,
        Enable
    )
    begin

        ------------------------------------------------------------
        -- DEFAULT
        ------------------------------------------------------------
        next_state <= state;

        ------------------------------------------------------------
        -- ONLY START ROUTINE IF ENABLED
        ------------------------------------------------------------
        if Enable = '1' then
            if sample_counter < 39 then
                next_sample_counter <= sample_counter + 1;
            else
                next_sample_counter <= 0;
            end if;

            case state is

                --------------------------------------------------------
                -- WAIT FOR START OF NEXT SAMPLE PERIOD
                --------------------------------------------------------
                when IDLE_ST =>
                    ----------------------------------------------------
                    -- START NEW SAMPLE FRAME
                    ----------------------------------------------------
                    if sample_counter = 0 then

                        next_state <= PRE_CNV_QUIET_ST;

                    end if;

                --------------------------------------------------------
                -- PRE-CNV QUIET TIME
                --------------------------------------------------------
                when PRE_CNV_QUIET_ST =>

                    if quiet_counter = 1 then

                        next_state <= CNV_PULSE_ST;

                    end if;

                --------------------------------------------------------
                -- START CONVERSION
                --------------------------------------------------------
                when CNV_PULSE_ST =>

                    next_state <= POST_CNV_QUIET_ST;

                --------------------------------------------------------
                -- POST-CNV QUIET TIME
                --------------------------------------------------------
                when POST_CNV_QUIET_ST =>

                    next_state <= ASSERT_CS_ST;

                --------------------------------------------------------
                -- ASSERT CS
                --------------------------------------------------------
                when ASSERT_CS_ST =>

                    next_state <= SHIFT_ST;

                --------------------------------------------------------
                -- SHIFT 24 BITS
                --------------------------------------------------------
                when SHIFT_ST =>

                    if bit_counter = 23 then

                        next_state <= END_CS_ST;

                    end if;

                --------------------------------------------------------
                -- END SPI TRANSACTION
                --------------------------------------------------------
                when END_CS_ST =>

                    ----------------------------------------------------
                    -- WAIT FOR NEXT SAMPLE FRAME
                    ----------------------------------------------------
                    next_state <= IDLE_ST;

            end case;

        end if;

    end process;

end Behavioral;