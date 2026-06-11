library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity marvell_88e1512_rgmii_init is
    generic (
        CLK_FREQ_HZ : positive := 100_000_000;
        PHY_ADDR    : std_logic_vector(4 downto 0) := "00000";
        MDC_FREQ_HZ : positive := 2_500_000
    );
    port (
        clk        : in  std_logic;
        rst        : in  std_logic;

        phy_resetn : out std_logic;
        mdc        : out std_logic;
        mdio       : inout std_logic;

        init_done  : out std_logic;
        link_up    : out std_logic;
        speed      : out std_logic_vector(1 downto 0); -- 10=1000, 01=100, 00=10
        duplex     : out std_logic                     -- 1=full duplex
    );
end entity;

architecture rtl of marvell_88e1512_rgmii_init is

    constant RESET_HOLD_CLKS : natural := CLK_FREQ_HZ / 100; -- 10 ms
    constant WAIT_10MS_CLKS  : natural := CLK_FREQ_HZ / 100;
    constant POLL_CLKS       : natural := CLK_FREQ_HZ / 10;  -- 100 ms

    -- Page 2 Register 21 bits:
    -- bit 5 = RGMII RX clock delay
    -- bit 4 = RGMII TX clock delay
    constant RGMII_DELAY_MASK : std_logic_vector(15 downto 0) := x"0010";

    type state_t is (
        S_RESET_LOW,
        S_RESET_HIGH_WAIT,

        S_WR_PAGE18_START, S_WR_PAGE18_WAIT,
        S_WR_MODE_START,   S_WR_MODE_WAIT,
        S_MODE_RESET_WAIT,

        -- New states for RGMII internal delay config
        S_WR_PAGE2_START,       S_WR_PAGE2_WAIT,
        S_RD_RGMII_DELAY_START, S_RD_RGMII_DELAY_WAIT,
        S_WR_RGMII_DELAY_START, S_WR_RGMII_DELAY_WAIT,

        S_WR_PAGE0_START, S_WR_PAGE0_WAIT,

        -- Software reset after changing RGMII delay bits
        S_SW_RESET_START, S_SW_RESET_WAIT,
        S_SW_RESET_DELAY,

        S_WR_ANEG_START,   S_WR_ANEG_WAIT,

        S_POLL_DELAY,
        S_RD_STATUS_START, S_RD_STATUS_WAIT
    );

    signal state        : state_t := S_RESET_LOW;
    signal timer        : natural range 0 to POLL_CLKS := 0;
    signal phy_resetn_r : std_logic := '0';

    signal mdio_start   : std_logic := '0';
    signal mdio_rw      : std_logic := '0';
    signal mdio_reg     : std_logic_vector(4 downto 0) := (others => '0');
    signal mdio_wdata   : std_logic_vector(15 downto 0) := (others => '0');
    signal mdio_rdata   : std_logic_vector(15 downto 0);
    signal mdio_busy    : std_logic;
    signal mdio_done    : std_logic;

    signal init_done_r  : std_logic := '0';
    signal link_up_r    : std_logic := '0';
    signal speed_r      : std_logic_vector(1 downto 0) := "00";
    signal duplex_r     : std_logic := '0';

    signal rgmii_delay_reg : std_logic_vector(15 downto 0) := (others => '0');

begin

    phy_resetn <= phy_resetn_r;
    init_done  <= init_done_r;
    link_up    <= link_up_r;
    speed      <= speed_r;
    duplex     <= duplex_r;

    u_mdio : entity work.mdio_master
        generic map (
            CLK_FREQ_HZ => CLK_FREQ_HZ,
            MDC_FREQ_HZ => MDC_FREQ_HZ
        )
        port map (
            clk      => clk,
            rst      => rst,
            start    => mdio_start,
            rw       => mdio_rw,
            phy_addr => PHY_ADDR,
            reg_addr => mdio_reg,
            wr_data  => mdio_wdata,
            rd_data  => mdio_rdata,
            busy     => mdio_busy,
            done     => mdio_done,
            mdc      => mdc,
            mdio     => mdio
        );

    process(clk)
    begin
        if rising_edge(clk) then
            mdio_start <= '0';

            if rst = '1' then
                state           <= S_RESET_LOW;
                timer           <= 0;
                phy_resetn_r    <= '0';
                init_done_r     <= '0';
                link_up_r       <= '0';
                speed_r         <= "00";
                duplex_r        <= '0';
                mdio_rw         <= '0';
                mdio_reg        <= (others => '0');
                mdio_wdata      <= (others => '0');
                rgmii_delay_reg <= (others => '0');

            else
                case state is

                    ----------------------------------------------------------------
                    -- Hardware reset
                    ----------------------------------------------------------------
                    when S_RESET_LOW =>
                        phy_resetn_r <= '0';
                        init_done_r  <= '0';
                        link_up_r    <= '0';

                        if timer >= RESET_HOLD_CLKS then
                            timer <= 0;
                            state <= S_RESET_HIGH_WAIT;
                        else
                            timer <= timer + 1;
                        end if;

                    when S_RESET_HIGH_WAIT =>
                        phy_resetn_r <= '1';

                        if timer >= WAIT_10MS_CLKS then
                            timer <= 0;
                            state <= S_WR_PAGE18_START;
                        else
                            timer <= timer + 1;
                        end if;

                    ----------------------------------------------------------------
                    -- Select Page 18
                    ----------------------------------------------------------------
                    when S_WR_PAGE18_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '0';
                            mdio_reg   <= "10110"; -- Reg 22: page select
                            mdio_wdata <= x"0012"; -- Page 18
                            mdio_start <= '1';
                            state      <= S_WR_PAGE18_WAIT;
                        end if;

                    when S_WR_PAGE18_WAIT =>
                        if mdio_done = '1' then
                            state <= S_WR_MODE_START;
                        end if;

                    ----------------------------------------------------------------
                    -- Page 18, Reg 20 = 0x8200
                    -- bit 15 = mode software reset
                    -- bits[9:7] = 100
                    -- MODE[2:0] = 000, RGMII-to-copper
                    ----------------------------------------------------------------
                    when S_WR_MODE_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '0';
                            mdio_reg   <= "10100"; -- Reg 20
                            mdio_wdata <= x"8200";
                            mdio_start <= '1';
                            state      <= S_WR_MODE_WAIT;
                        end if;

                    when S_WR_MODE_WAIT =>
                        if mdio_done = '1' then
                            timer <= 0;
                            state <= S_MODE_RESET_WAIT;
                        end if;

                    when S_MODE_RESET_WAIT =>
                        if timer >= WAIT_10MS_CLKS then
                            timer <= 0;
                            state <= S_WR_PAGE2_START;
                        else
                            timer <= timer + 1;
                        end if;

                    ----------------------------------------------------------------
                    -- New: Select Page 2 for RGMII delay control
                    ----------------------------------------------------------------
                    when S_WR_PAGE2_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '0';
                            mdio_reg   <= "10110"; -- Reg 22: page select
                            mdio_wdata <= x"0002"; -- Page 2
                            mdio_start <= '1';
                            state      <= S_WR_PAGE2_WAIT;
                        end if;

                    when S_WR_PAGE2_WAIT =>
                        if mdio_done = '1' then
                            state <= S_RD_RGMII_DELAY_START;
                        end if;

                    ----------------------------------------------------------------
                    -- Read Page 2, Reg 21
                    ----------------------------------------------------------------
                    when S_RD_RGMII_DELAY_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '1';
                            mdio_reg   <= "10101"; -- Reg 21
                            mdio_wdata <= x"0000";
                            mdio_start <= '1';
                            state      <= S_RD_RGMII_DELAY_WAIT;
                        end if;

                    when S_RD_RGMII_DELAY_WAIT =>
                        if mdio_done = '1' then
                            -- Preserve existing bits, enable RGMII TX and RX delays
                            rgmii_delay_reg <= mdio_rdata or RGMII_DELAY_MASK;
                            state           <= S_WR_RGMII_DELAY_START;
                        end if;

                    ----------------------------------------------------------------
                    -- Write Page 2, Reg 21 with bits 5 and 4 set
                    ----------------------------------------------------------------
                    when S_WR_RGMII_DELAY_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '0';
                            mdio_reg   <= "10101"; -- Reg 21
                            mdio_wdata <= rgmii_delay_reg;
                            mdio_start <= '1';
                            state      <= S_WR_RGMII_DELAY_WAIT;
                        end if;

                    when S_WR_RGMII_DELAY_WAIT =>
                        if mdio_done = '1' then
                            state <= S_WR_PAGE0_START;
                        end if;

                    ----------------------------------------------------------------
                    -- Return to Page 0
                    ----------------------------------------------------------------
                    when S_WR_PAGE0_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '0';
                            mdio_reg   <= "10110"; -- Reg 22: page select
                            mdio_wdata <= x"0000"; -- Page 0
                            mdio_start <= '1';
                            state      <= S_WR_PAGE0_WAIT;
                        end if;

                    when S_WR_PAGE0_WAIT =>
                        if mdio_done = '1' then
                            state <= S_SW_RESET_START;
                        end if;

                    ----------------------------------------------------------------
                    -- Software reset after changing RGMII delay bits
                    ----------------------------------------------------------------
                    when S_SW_RESET_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '0';
                            mdio_reg   <= "00000"; -- Page 0, Reg 0
                            mdio_wdata <= x"9340"; -- reset + auto-neg enable + restart
                            mdio_start <= '1';
                            state      <= S_SW_RESET_WAIT;
                        end if;

                    when S_SW_RESET_WAIT =>
                        if mdio_done = '1' then
                            timer <= 0;
                            state <= S_SW_RESET_DELAY;
                        end if;

                    when S_SW_RESET_DELAY =>
                        if timer >= WAIT_10MS_CLKS then
                            timer <= 0;
                            state <= S_WR_ANEG_START;
                        else
                            timer <= timer + 1;
                        end if;

                    ----------------------------------------------------------------
                    -- Restart auto-negotiation cleanly
                    -- Page 0, Reg 0 = 0x1340
                    ----------------------------------------------------------------
                    when S_WR_ANEG_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '0';
                            mdio_reg   <= "00000"; -- Reg 0
                            mdio_wdata <= x"1340"; -- auto-neg enable + restart
                            mdio_start <= '1';
                            state      <= S_WR_ANEG_WAIT;
                        end if;

                    when S_WR_ANEG_WAIT =>
                        if mdio_done = '1' then
                            init_done_r <= '1';
                            timer       <= 0;
                            state       <= S_POLL_DELAY;
                        end if;

                    ----------------------------------------------------------------
                    -- Poll Page 0, Reg 17
                    ----------------------------------------------------------------
                    when S_POLL_DELAY =>
                        if timer >= POLL_CLKS then
                            timer <= 0;
                            state <= S_RD_STATUS_START;
                        else
                            timer <= timer + 1;
                        end if;

                    when S_RD_STATUS_START =>
                        if mdio_busy = '0' then
                            mdio_rw    <= '1';
                            mdio_reg   <= "10001"; -- Page 0, Reg 17
                            mdio_wdata <= x"0000";
                            mdio_start <= '1';
                            state      <= S_RD_STATUS_WAIT;
                        end if;

                    when S_RD_STATUS_WAIT =>
                        if mdio_done = '1' then
                            link_up_r <= mdio_rdata(10);

                            -- Reg 17 bit 11 = speed/duplex resolved.
                            -- Only trust speed/duplex when this bit is 1.
                            if mdio_rdata(11) = '1' then
                                speed_r  <= mdio_rdata(15 downto 14);
                                duplex_r <= mdio_rdata(13);
                            end if;

                            timer <= 0;
                            state <= S_POLL_DELAY;
                        end if;

                end case;
            end if;
        end if;
    end process;

end architecture;