library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mdio_master is
    generic (
        CLK_FREQ_HZ : positive := 100_000_000;
        MDC_FREQ_HZ : positive := 2_500_000
    );
    port (
        clk      : in  std_logic;
        rst      : in  std_logic;

        start    : in  std_logic;                    -- pulse 1 clk when busy='0'
        rw       : in  std_logic;                    -- '0' = write, '1' = read
        phy_addr : in  std_logic_vector(4 downto 0);
        reg_addr : in  std_logic_vector(4 downto 0);
        wr_data  : in  std_logic_vector(15 downto 0);
        rd_data  : out std_logic_vector(15 downto 0);
        busy     : out std_logic;
        done     : out std_logic;                    -- 1 clk pulse

        mdc      : out std_logic;
        mdio     : inout std_logic
    );
end entity;

architecture rtl of mdio_master is
    constant HALF_PERIOD_CLKS : positive := CLK_FREQ_HZ / (2 * MDC_FREQ_HZ);

    type state_t is (S_IDLE, S_TRANSFER, S_FINISH);

    signal state      : state_t := S_IDLE;
    signal div_cnt    : integer range 0 to HALF_PERIOD_CLKS - 1 := 0;
    signal mdc_r      : std_logic := '0';
    signal mdio_o     : std_logic := '1';
    signal mdio_oe    : std_logic := '0';
    signal frame      : std_logic_vector(63 downto 0) := (others => '1');
    signal bit_cnt    : integer range 0 to 63 := 0;
    signal rw_latched : std_logic := '0';
    signal rd_shift   : std_logic_vector(15 downto 0) := (others => '0');
    signal rd_data_r  : std_logic_vector(15 downto 0) := (others => '0');
    signal done_r     : std_logic := '0';
    signal busy_r     : std_logic := '0';
begin

    mdc     <= mdc_r;
    mdio    <= mdio_o when mdio_oe = '1' else 'Z';
    rd_data <= rd_data_r;
    done    <= done_r;
    busy    <= busy_r;

    process(clk)
        variable f       : std_logic_vector(63 downto 0);
        variable rd_next : std_logic_vector(15 downto 0);
        variable next_i  : integer range 0 to 63;
    begin
        if rising_edge(clk) then
            done_r  <= '0';
            rd_next := rd_shift;

            if rst = '1' then
                state      <= S_IDLE;
                div_cnt    <= 0;
                mdc_r      <= '0';
                mdio_o     <= '1';
                mdio_oe    <= '0';
                bit_cnt    <= 0;
                busy_r     <= '0';
                done_r     <= '0';
                rd_shift   <= (others => '0');
                rd_data_r  <= (others => '0');
                rw_latched <= '0';
                frame      <= (others => '1');

            else
                case state is

                    when S_IDLE =>
                        mdc_r   <= '0';
                        div_cnt <= 0;
                        busy_r  <= '0';
                        mdio_oe <= '0';
                        mdio_o  <= '1';

                        if start = '1' then
                            f := (others => '1');           -- 32-bit preamble

                            f(31 downto 30) := "01";       -- start

                            if rw = '1' then
                                f(29 downto 28) := "10";   -- read opcode
                                f(17 downto 16) := "00";   -- placeholder
                            else
                                f(29 downto 28) := "01";   -- write opcode
                                f(17 downto 16) := "10";   -- write turnaround
                            end if;

                            f(27 downto 23) := phy_addr;
                            f(22 downto 18) := reg_addr;
                            f(15 downto 0)  := wr_data;

                            frame      <= f;
                            rw_latched <= rw;
                            bit_cnt    <= 0;
                            rd_shift   <= (others => '0');
                            busy_r     <= '1';
                            state      <= S_TRANSFER;

                            mdio_oe <= '1';
                            mdio_o  <= f(63);
                        end if;

                    when S_TRANSFER =>
                        busy_r <= '1';

                        if div_cnt = HALF_PERIOD_CLKS - 1 then
                            div_cnt <= 0;

                            if mdc_r = '0' then
                                -- MDC rising edge: sample read data.
                                mdc_r <= '1';

                                if (rw_latched = '1') and (bit_cnt >= 48) then
                                    rd_next(63 - bit_cnt) := mdio;
                                    rd_shift <= rd_next;
                                end if;

                                if bit_cnt = 63 then
                                    rd_data_r <= rd_next;
                                    mdio_oe   <= '0';
                                    state     <= S_FINISH;
                                end if;

                            else
                                -- MDC falling edge: prepare next bit.
                                mdc_r <= '0';

                                if bit_cnt < 63 then
                                    next_i  := bit_cnt + 1;
                                    bit_cnt <= next_i;

                                    if (rw_latched = '1') and (next_i >= 46) then
                                        mdio_oe <= '0';      -- release during read TA/data
                                        mdio_o  <= '1';
                                    else
                                        mdio_oe <= '1';
                                        mdio_o  <= frame(63 - next_i);
                                    end if;
                                end if;
                            end if;

                        else
                            div_cnt <= div_cnt + 1;
                        end if;

                    when S_FINISH =>
                        busy_r  <= '1';
                        mdio_oe <= '0';

                        if div_cnt = HALF_PERIOD_CLKS - 1 then
                            div_cnt <= 0;
                            mdc_r   <= '0';
                            busy_r  <= '0';
                            done_r  <= '1';
                            state   <= S_IDLE;
                        else
                            div_cnt <= div_cnt + 1;
                        end if;

                end case;
            end if;
        end if;
    end process;

end architecture;