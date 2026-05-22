library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

architecture Behavioral of ADC_SPI_Controller is
    -- FSM States
    type state_type is (
        RESET_ST,
        WAIT_POWERUP_ST,
        START_CONFIG_ST,
        WAIT_CONFIG_ST,
        START_CONV_ST,
        WAIT_CONV_ST,
        START_READ_ST,
        WAIT_READ_ST
    );

    signal state        : state_type := RESET_ST;
    signal next_state   : state_type := RESET_ST;

    -- control signals

    signal start_config : std_logic := '0';
    signal config_done  : std_logic;

    signal start_conv : std_logic := '0';
    signal conv_done  : std_logic;

    signal start_read : std_logic := '0';
    signal read_done  : std_logic;

    -- internal spi signals

    signal sck_read : std_logic;
    signal cs_read  : std_logic;

    signal sck_config   : std_logic;
    signal cs_config    : std_logic;
    signal MOSI_config  : std_logic;

    -- wait counter 3ms @ 80MHz = 240000 cycles
    signal wait_counter : integer := 0;

begin

    -- config block portmap
    CONFIG_BLOCK : entity work.ADC_SPI_Config 
    port map (
        CLK => CLK,

        StartConfig => start_config,
        ConfigDone  => config_done,

        SCK         => sck_config,
        CS          => cs_config,
        MOSI        => MOSI_config
    );

    -- conversion block portmap
    CONV_BLOCK: entity work.ADC_Conversion_Control
    port map (
        CLK         => CLK,

        BUSY        => BUSY,

        StartConv   => start_conv,
        ConvDone    => conv_done,

        CNV         => CNV
    );

    -- spi data read block portmap
    READ_BLOCK: entity work.ADC_SPI_Data_Read
    port map (
        CLK         => CLK,

        MISO1       => MISO1,
        MISO2       => MISO2,

        StartRead   => start_read,
        ReadDone    => read_done,

        SCK         => sck_read,
        CS          => cs_read,

        Data1       => Data1,
        Data2       => Data2
    );

    -- spi bus multiplexer  
    SCK <=  sck_config when (state = WAIT_CONFIG_ST or
                                 state = START_CONFIG_ST)
            else sck_read;
    
    CS  <=  cs_config  when (state = WAIT_CONFIG_ST or
                             state = START_CONFIG_ST)
            else cs_read;
    
    MOSI <= MOSI_config;

    -- state register
    process(CLK)
    begin
        if rising_edge(CLK) then
            state <= next_state;
        end if;
    end process;

    -- main FSM
    process(CLK)
    begin
        if rising_edge(CLK) then
            start_read      <= '0';
            start_config    <= '0';
            start_conv      <= '0';

            DataValid       <= '0';

            case state is
                when RESET_ST =>
                    wait_counter <= 0;

                when WAIT_POWERUP_ST =>
                    if wait_counter < 239999 then
                        wait_counter <= wait_counter + 1;
                    else
                        wait_counter <= 0;
                    end if;

                when START_CONFIG_ST => 
                    start_config <= '1';
                
                when WAIT_CONFIG_ST => 
                    null;
                    
                when START_CONV_ST => 
                    start_conv <= '1';
                
                when WAIT_CONV_ST => 
                    null;
                
                when START_READ_ST => 
                    start_read <= '0';

                when WAIT_READ_ST =>
                    if read_done = '1' then 
                        DataValid <= '1';
                    end if;
            end case;
        end if;
    end process;
        
    -- state transition logic
    process(
        state,
        read_done,
        config_done,
        conv_done,
        wait_counter
    )
    begin
        next_state <= state;

        case state is
            when RESET_ST => 
                next_state <= WAIT_POWERUP_ST;
            
            when WAIT_POWERUP_ST =>
                if wait_counter = 239999 then
                    next_state <= START_CONFIG_ST;
                end if;
            
            when START_CONFIG_ST => 
                next_state <= WAIT_CONFIG_ST;
                
            when WAIT_CONFIG_ST => 
                if config_done = '1' then 
                    next_state <= START_CONV_ST;
                end if;
            
            when START_CONV_ST =>
                next_state <= WAIT_CONV_ST;
            
            when WAIT_CONV_ST => 
                if conv_done = '1' then
                    next_state <= START_READ_ST;
                end if;
            
            when START_READ_ST =>
                next_state <= WAIT_READ_ST;

            when WAIT_READ_ST =>
                if read_done = '1' then 
                    next_state <= START_CONV_ST;
                end if;
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

    --------------------------------------------------------------------
    -- SPI SHIFT REGISTER
    --------------------------------------------------------------------
    signal shift_reg : std_logic_vector(23 downto 0)
        := (others => '0');

    --------------------------------------------------------------------
    -- BIT COUNTER
    --------------------------------------------------------------------
    signal bit_counter : integer range 0 to 23 := 0;

    --------------------------------------------------------------------
    -- COMMAND COUNTER
    --------------------------------------------------------------------
    signal cmd_counter : integer range 0 to 5 := 0;

    --------------------------------------------------------------------
    -- WAIT COUNTER
    --------------------------------------------------------------------
    signal wait_reset_counter : integer := 0;

    --------------------------------------------------------------------
    -- SPI ACTIVE
    --------------------------------------------------------------------
    signal spi_active : std_logic := '0';

begin

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

        end if;

    end process;

    --------------------------------------------------------------------
    -- MAIN CONTROL LOGIC
    --------------------------------------------------------------------
    process(CLK)
    begin

        ------------------------------------------------------------
        -- RISING EDGE LOGIC
        ------------------------------------------------------------
        if rising_edge(CLK) then

            case state is

                --------------------------------------------------------
                -- LOAD COMMAND
                --------------------------------------------------------
                when LOAD_CMD_ST =>

                    ----------------------------------------------------
                    -- RESET BIT COUNTER
                    ----------------------------------------------------
                    bit_counter <= 0;

                    ----------------------------------------------------
                    -- STOP SPI CLOCK
                    ----------------------------------------------------
                    spi_active <= '0';

                    ----------------------------------------------------
                    -- LOAD COMMAND WORD
                    ----------------------------------------------------
                    case cmd_counter is

                        ------------------------------------------------
                        -- ENTER CONFIG MODE
                        ------------------------------------------------
                        when 0 =>

                            shift_reg <= x"A00000";

                        ------------------------------------------------
                        -- SOFTWARE RESET
                        ------------------------------------------------
                        when 1 =>

                            shift_reg <= x"000091";

                        ------------------------------------------------
                        -- ENTER CONVERSION MODE
                        ------------------------------------------------
                        when 2 =>

                            shift_reg <= x"001401";

                        ------------------------------------------------
                        -- REENTER CONFIG MODE
                        ------------------------------------------------
                        when 3 =>

                            shift_reg <= x"A00000";

                        ------------------------------------------------
                        -- MODE OF OPERATION
                        ------------------------------------------------
                        when 4 =>

                            shift_reg <= x"002000";

                        ------------------------------------------------
                        -- EXIT CONFIG MODE
                        ------------------------------------------------
                        when 5 =>

                            shift_reg <= x"001401";

                        when others =>

                            shift_reg <= (others => '0');

                    end case;

                --------------------------------------------------------
                -- PRELOAD FIRST MOSI BIT
                --------------------------------------------------------
                when PRELOAD_BIT_ST =>

                    ----------------------------------------------------
                    -- PUT FIRST BIT ON MOSI
                    ----------------------------------------------------
                    MOSI <= shift_reg(23);

                    ----------------------------------------------------
                    -- SHIFT LEFT
                    ----------------------------------------------------
                    shift_reg <=
                        shift_reg(22 downto 0) & '0';

                    ----------------------------------------------------
                    -- FIRST BIT ALREADY SENT
                    ----------------------------------------------------
                    bit_counter <= 1;

                --------------------------------------------------------
                -- START CLOCKING
                --------------------------------------------------------
                when SHIFT_ST =>

                    ----------------------------------------------------
                    -- ENABLE SPI CLOCK
                    ----------------------------------------------------
                    spi_active <= '1';

                    ----------------------------------------------------
                    -- COUNT REMAINING BITS
                    ----------------------------------------------------
                    if bit_counter < 23 then

                        bit_counter <= bit_counter + 1;

                    end if;

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

                        cmd_counter <= cmd_counter + 1;

                    end if;

                --------------------------------------------------------
                -- WAIT AFTER RESET
                --------------------------------------------------------
                when WAIT_RESET_ST =>

                    if wait_reset_counter < 79999 then

                        wait_reset_counter <=
                            wait_reset_counter + 1;

                    else

                        wait_reset_counter <= 0;

                    end if;

                --------------------------------------------------------
                -- DONE
                --------------------------------------------------------
                when DONE_ST =>

                    cmd_counter <= 0;

                    spi_active <= '0';

                when others =>
                    null;

            end case;

        end if;

        ------------------------------------------------------------
        -- FALLING EDGE LOGIC
        -- UPDATE MOSI HALF CLOCK BEFORE SAMPLING
        ------------------------------------------------------------
        if falling_edge(CLK) then

            if state = SHIFT_ST then

                --------------------------------------------------------
                -- UPDATE NEXT MOSI BIT
                --------------------------------------------------------
                MOSI <= shift_reg(23);

                --------------------------------------------------------
                -- SHIFT LEFT
                --------------------------------------------------------
                shift_reg <=
                    shift_reg(22 downto 0) & '0';

            end if;

        end if;

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

            --------------------------------------------------------
            -- LOAD COMMAND
            --------------------------------------------------------
            when LOAD_CMD_ST =>

                CS <= '1';

            --------------------------------------------------------
            -- ASSERT CS
            -- Gives tCSSCK timing
            --------------------------------------------------------
            when ASSERT_CS_ST =>

                CS <= '0';

            --------------------------------------------------------
            -- PRELOAD FIRST BIT
            -- Gives tSSDI timing
            --------------------------------------------------------
            when PRELOAD_BIT_ST =>

                CS <= '0';

            --------------------------------------------------------
            -- SHIFT DATA
            --------------------------------------------------------
            when SHIFT_ST =>

                CS <= '0';

            --------------------------------------------------------
            -- HOLD CS AFTER LAST CLOCK
            -- Gives tSCKCS timing
            --------------------------------------------------------
            when END_CS_ST =>

                CS <= '0';

            --------------------------------------------------------
            -- NEXT COMMAND
            --------------------------------------------------------
            when NEXT_CMD_ST =>

                CS <= '1';

            --------------------------------------------------------
            -- WAIT RESET
            --------------------------------------------------------
            when WAIT_RESET_ST =>

                CS <= '1';

            --------------------------------------------------------
            -- DONE
            --------------------------------------------------------
            when DONE_ST =>

                CS <= '1';

                ConfigDone <= '1';

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
        wait_reset_counter
    )
    begin

        ------------------------------------------------------------
        -- DEFAULT
        ------------------------------------------------------------
        next_state <= state;

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

                if wait_reset_counter = 79999 then

                    next_state <= LOAD_CMD_ST;

                end if;

            --------------------------------------------------------
            -- DONE
            --------------------------------------------------------
            when DONE_ST =>

                next_state <= IDLE_ST;

        end case;

    end process;

end Behavioral;
            


------------------------------------------------------------------------
-- ADC_Conversion_Control STUB
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture Stub of ADC_Conversion_Control is

    signal counter : integer := 0;
    signal busy_int : std_logic := '0';

begin

    process(CLK)
    begin

        if rising_edge(CLK) then

            ConvDone <= '0';

            if StartConv = '1' then

                busy_int <= '1';
                counter <= 0;

            end if;

            if busy_int = '1' then

                if counter = 15 then

                    ConvDone <= '1';
                    busy_int <= '0';

                else

                    counter <= counter + 1;

                end if;

            end if;

        end if;

    end process;

    CNV <= busy_int;

end Stub;


------------------------------------------------------------------------
-- ADC_SPI_Data_Read STUB
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture Stub of ADC_SPI_Data_Read is

    signal counter : integer := 0;
    signal busy    : std_logic := '0';

begin

    process(CLK)
    begin

        if rising_edge(CLK) then

            ReadDone <= '0';

            if StartRead = '1' then

                busy <= '1';
                counter <= 0;

            end if;

            if busy = '1' then

                if counter = 24 then

                    ReadDone <= '1';

                    Data1 <= x"ABCDEF";
                    Data2 <= x"123456";

                    busy <= '0';

                else

                    counter <= counter + 1;

                end if;

            end if;

        end if;

    end process;

    SCK <= CLK;
    CS  <= not busy;

end Stub;