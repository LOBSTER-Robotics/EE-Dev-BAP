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
    
    SDI <= MOSI_config;

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
        
                

