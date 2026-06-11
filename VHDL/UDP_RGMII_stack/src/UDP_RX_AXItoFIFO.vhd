library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_rx is
port (
    clk         : in  std_logic;
    reset       : in  std_logic;

    --------------------------------------------------------------------
    -- AXI INPUT FROM MAC RX
    --------------------------------------------------------------------
    s_data      : in  std_logic_vector(7 downto 0);
    s_valid     : in  std_logic;
    s_last      : in  std_logic;
    s_ready     : out std_logic;

    --------------------------------------------------------------------
    -- FIFO OUTPUT
    --------------------------------------------------------------------
    fifo_data   : out std_logic_vector(7 downto 0);
    fifo_wr_en  : out std_logic;
    fifo_last   : out std_logic;
    fifo_full   : in  std_logic
);
end entity;

architecture rtl of udp_rx is

    --------------------------------------------------------------------
    -- FSM
    --------------------------------------------------------------------
    type state_t is (
        IDLE,
        ETH_HDR,
        IP_HDR,
        UDP_HDR,
        PAYLOAD,
        DROP
    );

    signal state      : state_t := IDLE;
    signal next_state : state_t := IDLE;

    --------------------------------------------------------------------
    -- COUNTERS
    --------------------------------------------------------------------
    signal cnt        : integer range 0 to 255 := 0;
    signal next_cnt   : integer range 0 to 255 := 0;

    --------------------------------------------------------------------
    -- REGISTERS
    --------------------------------------------------------------------
    signal fifo_data_reg   : std_logic_vector(7 downto 0)
        := (others => '0');

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
    -- ALWAYS READY UNLESS FIFO FULL
    --------------------------------------------------------------------
    s_ready <= not fifo_full;

    --------------------------------------------------------------------
    -- CLOCKED PROCESS
    --------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then

            if reset = '1' then

                state <= IDLE;
                cnt   <= 0;

                fifo_data_reg <= (others => '0');
                fifo_wr_reg   <= '0';
                fifo_last_reg <= '0';

            else

                --------------------------------------------------------
                -- REGISTER UPDATE
                --------------------------------------------------------
                state <= next_state;
                cnt   <= next_cnt;

                fifo_data_reg <= next_fifo_data;
                fifo_wr_reg   <= next_fifo_wr;
                fifo_last_reg <= next_fifo_last;

            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- FSM / COMBINATORIAL
    --------------------------------------------------------------------
    process(
        state,
        cnt,

        s_data,
        s_valid,
        s_last,

        fifo_full,

        fifo_data_reg
    )
    begin

        ----------------------------------------------------------------
        -- DEFAULTS
        ----------------------------------------------------------------
        next_state <= state;
        next_cnt   <= cnt;

        next_fifo_data <= fifo_data_reg;
        next_fifo_wr   <= '0';
        next_fifo_last <= '0';

        case state is

            ----------------------------------------------------------------
            -- IDLE
            ----------------------------------------------------------------
            when IDLE =>

                if s_valid = '1' then

                    next_cnt   <= 0;
                    next_state <= ETH_HDR;
                    next_fifo_data <= s_data;
                    next_fifo_wr   <= '1';

                end if;

            ----------------------------------------------------------------
            -- ETHERNET HEADER
            -- 14 bytes
            ----------------------------------------------------------------
            when ETH_HDR =>

                if s_valid = '1' then
                    next_fifo_data <= s_data;
                    next_fifo_wr   <= '1';
                    if cnt = 13 then

                        next_cnt   <= 0;
                        next_state <= IP_HDR;
                        next_fifo_wr   <= '0';

                    else

                        next_cnt <= cnt + 1;

                    end if;

                end if;

            ----------------------------------------------------------------
            -- IPV4 HEADER
            -- 20 bytes
            ----------------------------------------------------------------
            when IP_HDR =>

                if s_valid = '1' then
                    next_fifo_data <= s_data;
                    next_fifo_wr   <= '0';
                    if cnt = 19 then

                        next_cnt   <= 0;
                        next_state <= UDP_HDR;

                    else

                        next_cnt <= cnt + 1;

                    end if;

                end if;

            ----------------------------------------------------------------
            -- UDP HEADER
            -- 8 bytes
            ----------------------------------------------------------------
            when UDP_HDR =>

                if s_valid = '1' then
                    next_fifo_data <= s_data;
                    next_fifo_wr   <= '0';
                    if cnt = 7 then
                        if s_valid = '1' and fifo_full = '0' then
                            next_fifo_data <= s_data;
                            next_fifo_wr   <= '1';
                        end if;

                        next_state <= PAYLOAD;

                    else

                        next_cnt <= cnt + 1;

                    end if;

                end if;

            ----------------------------------------------------------------
            -- PAYLOAD
            ----------------------------------------------------------------
            when PAYLOAD =>

                if s_valid = '1' and fifo_full = '0' then

                    next_fifo_data <= s_data;
                    next_fifo_wr   <= '0';

                    ----------------------------------------------------
                    -- LAST BYTE
                    ----------------------------------------------------
                    if s_last = '1' then

                        next_fifo_last <= '1';
                        next_state     <= IDLE;

                    end if;

                end if;

            ----------------------------------------------------------------
            -- DROP
            ----------------------------------------------------------------
            when DROP =>

                if s_last = '1' then
                    next_state <= IDLE;
                end if;

        end case;

    end process;

end architecture;