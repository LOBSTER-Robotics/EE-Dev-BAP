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
    -- FIFO OUTPUT
    --------------------------------------------------------------------
    fifo_data   : out std_logic_vector(7 downto 0);
    fifo_wr_en  : out std_logic;
    fifo_last   : out std_logic;
    fifo_full   : in  std_logic;

    --------------------------------------------------------------------
    -- DEBUG OUTPUT
    -- debug_state(0) = IDLE
    -- debug_state(1) = PREAMBLE
    -- debug_state(2) = PAYLOAD
    -- debug_state(3) = DROP
    -- debug_state(4) = gmii_rx_dv
    -- debug_state(5) = gmii_rx_er
    -- debug_state(6) = fifo_wr_en
    -- debug_state(7) = frame active, state /= IDLE
    --------------------------------------------------------------------
    debug_state : out std_logic_vector(6 downto 0)
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

    signal fifo_data_reg   : std_logic_vector(7 downto 0) := (others => '0');
    signal fifo_wr_reg     : std_logic := '0';
    signal fifo_last_reg   : std_logic := '0';

    signal next_fifo_data  : std_logic_vector(7 downto 0);
    signal next_fifo_wr    : std_logic;
    signal next_fifo_last  : std_logic;

begin

    --------------------------------------------------------------------
    -- OUTPUTS
    --------------------------------------------------------------------
    fifo_data  <= fifo_data_reg;
    fifo_wr_en <= fifo_wr_reg;
    fifo_last  <= fifo_last_reg;

    --------------------------------------------------------------------
    -- Only accept payload bytes when the FIFO can take them.
    -- Header bytes are always consumed internally.
    --------------------------------------------------------------------
    -- Note: the FIFO write enable is only asserted during PAYLOAD.

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
        debug_state(6) <= fifo_wr_reg;
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

                fifo_data_reg <= (others => '0');
                fifo_wr_reg   <= '0';
                fifo_last_reg <= '0';

            else

                ----------------------------------------------------------------
                -- REGISTER UPDATE
                ----------------------------------------------------------------
                state        <= next_state;
                pre_cnt      <= next_pre_cnt;

                fifo_data_reg <= next_fifo_data;
                fifo_wr_reg   <= next_fifo_wr;
                fifo_last_reg <= next_fifo_last;

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

        next_fifo_data <= fifo_data_reg;
        next_fifo_wr   <= '0';
        next_fifo_last <= '0';

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

                    if fifo_full = '0' then
                        next_fifo_data <= gmii_rxd;
                        next_fifo_wr   <= '1';

                    end if;

                else

                    ----------------------------------------------------------------
                    -- END OF FRAME
                    ----------------------------------------------------------------
                    next_fifo_last <= '1';
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