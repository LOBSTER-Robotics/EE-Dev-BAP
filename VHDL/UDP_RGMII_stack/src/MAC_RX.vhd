library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mac_rx is
port (
    clk         : in  std_logic;
    reset       : in  std_logic;

    --------------------------------------------------------------------
    -- GMII INPUT
    --------------------------------------------------------------------
    gmii_rxd    : in  std_logic_vector(7 downto 0);
    gmii_rx_dv  : in  std_logic;
    gmii_rx_er  : in  std_logic;

    --------------------------------------------------------------------
    -- AXI STREAM OUTPUT
    --------------------------------------------------------------------
    m_data      : out std_logic_vector(7 downto 0);
    m_valid     : out std_logic;
    m_last      : out std_logic;
    m_ready     : in  std_logic;

    --------------------------------------------------------------------
    -- DEBUG OUTPUT
    -- debug_state(0) = IDLE
    -- debug_state(1) = PREAMBLE
    -- debug_state(2) = PAYLOAD
    -- debug_state(3) = DROP
    -- debug_state(4) = gmii_rx_dv
    -- debug_state(5) = gmii_rx_er
    -- debug_state(6) = rx_valid_reg / m_valid
    -- debug_state(7) = frame active, state /= IDLE
    --------------------------------------------------------------------
    debug_state : out std_logic_vector(7 downto 0)
);
end entity;

architecture rtl of mac_rx is

    --------------------------------------------------------------------
    -- FSM
    --------------------------------------------------------------------
    type state_t is (
        IDLE,
        PREAMBLE,
        PAYLOAD,
        DROP
    );

    signal state      : state_t := IDLE;
    signal next_state : state_t := IDLE;

    --------------------------------------------------------------------
    -- REGISTERS
    --------------------------------------------------------------------
    signal pre_cnt        : integer range 0 to 7 := 0;
    signal next_pre_cnt   : integer range 0 to 7 := 0;

    signal rx_data_reg    : std_logic_vector(7 downto 0) := (others => '0');
    signal rx_valid_reg   : std_logic := '0';
    signal rx_last_reg    : std_logic := '0';

    signal next_data      : std_logic_vector(7 downto 0);
    signal next_valid     : std_logic;
    signal next_last      : std_logic;

    signal dv_d           : std_logic;
    signal data_d         : std_logic_vector(7 downto 0);

begin

    --------------------------------------------------------------------
    -- OUTPUTS
    --------------------------------------------------------------------
    m_valid <= rx_valid_reg;
    m_data  <= data_d;
    m_last  <= dv_d and not gmii_rx_dv;

    --------------------------------------------------------------------
    -- DEBUG OUTPUT
    --------------------------------------------------------------------
    process(all)
    begin
        debug_state <= (others => '0');

        case state is
            when IDLE =>
                debug_state(0) <= '1';

            when PREAMBLE =>
                debug_state(1) <= '1';

            when PAYLOAD =>
                debug_state(2) <= '1';

            when DROP =>
                debug_state(3) <= '1';
        end case;

        debug_state(4) <= gmii_rx_dv;
        debug_state(5) <= gmii_rx_er;
        debug_state(6) <= rx_valid_reg;

        if state /= IDLE then
            debug_state(7) <= '1';
        else
            debug_state(7) <= '0';
        end if;
    end process;

    --------------------------------------------------------------------
    -- CLOCKED PROCESS
    --------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then

            if reset = '1' then

                state        <= IDLE;
                pre_cnt      <= 0;

                rx_data_reg  <= (others => '0');
                rx_valid_reg <= '0';
                rx_last_reg  <= '0';

                dv_d         <= '0';
                data_d       <= (others => '0');

            else

                ----------------------------------------------------------------
                -- REGISTER UPDATE
                ----------------------------------------------------------------
                state        <= next_state;
                pre_cnt      <= next_pre_cnt;

                rx_data_reg  <= next_data;
                rx_valid_reg <= next_valid;
                rx_last_reg  <= next_last;

                dv_d         <= gmii_rx_dv;
                data_d       <= gmii_rxd;

            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- FSM / COMBINATORIAL
    --------------------------------------------------------------------
    process(all)
    begin

        ----------------------------------------------------------------
        -- DEFAULTS
        ----------------------------------------------------------------
        next_state    <= state;
        next_pre_cnt  <= pre_cnt;

        next_data     <= rx_data_reg;
        next_valid    <= '0';
        next_last     <= '0';

        case state is

            ----------------------------------------------------------------
            -- IDLE
            ----------------------------------------------------------------
            when IDLE =>

                if gmii_rx_dv = '1' then

                    if gmii_rxd = x"55" then

                        next_pre_cnt <= 1;
                        next_state   <= PREAMBLE;

                    else

                        next_state <= DROP;

                    end if;

                end if;

            ----------------------------------------------------------------
            -- PREAMBLE DETECTION
            ----------------------------------------------------------------
            when PREAMBLE =>

                if gmii_rx_dv = '1' then

                    --------------------------------------------------------
                    -- PREAMBLE BYTES
                    --------------------------------------------------------
                    if pre_cnt < 7 then

                        if gmii_rxd = x"55" then

                            next_pre_cnt <= pre_cnt + 1;

                        else

                            next_state <= DROP;

                        end if;

                    --------------------------------------------------------
                    -- SFD
                    --------------------------------------------------------
                    else

                        if gmii_rxd = x"D5" then

                            next_state <= PAYLOAD;

                        else

                            next_state <= DROP;

                        end if;

                    end if;

                else

                    next_state <= IDLE;

                end if;

            ----------------------------------------------------------------
            -- PAYLOAD RECEIVE
            ----------------------------------------------------------------
            when PAYLOAD =>

                if gmii_rx_er = '1' then

                    next_state <= DROP;

                elsif gmii_rx_dv = '1' then

                    if m_ready = '1' then

                        next_data  <= gmii_rxd;
                        next_valid <= '1';

                    end if;

                else

                    ----------------------------------------------------------------
                    -- END OF FRAME
                    ----------------------------------------------------------------
                    next_last  <= '1';
                    next_state <= IDLE;

                end if;

            ----------------------------------------------------------------
            -- DROP FRAME
            ----------------------------------------------------------------
            when DROP =>

                if gmii_rx_dv = '0' then

                    next_state <= IDLE;

                end if;

        end case;

    end process;

end architecture;