-- Behavioral model of FIFOsm_DAC (ECP5 structural netlist).
-- Mimics the observable interface:
--   - Dual-clock (WrClock / RdClock)
--   - Depth 128, width 16
--   - NOREG read mode: Q valid 1 RdClock cycle after RdEn
--   - AlmostEmpty when fill <= G_ALMOST_EMPTY (default 10)
--   - AlmostFull  when fill >= G_ALMOST_FULL  (default 110)
--   - Reset clears both pointers; RPReset clears only the read pointer
--
-- For simulation with GHDL only. Do NOT synthesise.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_dac_behav is
    generic (
        G_DEPTH        : positive := 128;
        G_WIDTH        : positive := 16;
        G_ALMOST_EMPTY : positive := 10;
        G_ALMOST_FULL  : positive := 110
    );
    port (
        Data        : in  std_logic_vector(G_WIDTH-1 downto 0);
        WrClock     : in  std_logic;
        RdClock     : in  std_logic;
        WrEn        : in  std_logic;
        RdEn        : in  std_logic;
        Reset       : in  std_logic;   -- async, active-high; clears both pointers
        RPReset     : in  std_logic;   -- async, active-high; clears read pointer only
        Q           : out std_logic_vector(G_WIDTH-1 downto 0);
        Empty       : out std_logic;
        Full        : out std_logic;
        AlmostEmpty : out std_logic;
        AlmostFull  : out std_logic
    );
end entity fifo_dac_behav;

architecture behav of fifo_dac_behav is

    -- Shared memory (one writer, one reader — no conflict)
    type t_mem is array (0 to G_DEPTH-1) of std_logic_vector(G_WIDTH-1 downto 0);
    shared variable v_mem : t_mem := (others => (others => '0'));

    -- Monotonic counters: fill = wr_count - rd_count.
    -- They never wrap in a finite simulation, so subtraction is always safe.
    signal s_wr_count : natural := 0;
    signal s_rd_count : natural := 0;
    signal s_fill     : integer := 0;

    -- Registered output (NOREG = 1-cycle read latency)
    signal s_q_reg : std_logic_vector(G_WIDTH-1 downto 0) := (others => '0');

begin

    --------------------------------------------------------------------
    -- Fill level (combinational)
    --------------------------------------------------------------------

    s_fill <= s_wr_count - s_rd_count;

    Empty       <= '1' when s_fill = 0              else '0';
    Full        <= '1' when s_fill >= G_DEPTH        else '0';
    AlmostEmpty <= '1' when s_fill <= G_ALMOST_EMPTY else '0';
    AlmostFull  <= '1' when s_fill >= G_ALMOST_FULL  else '0';

    Q <= s_q_reg;

    --------------------------------------------------------------------
    -- Write domain
    --------------------------------------------------------------------

    p_write : process (WrClock, Reset)
    begin
        if Reset = '1' then
            s_wr_count <= 0;
        elsif rising_edge(WrClock) then
            if WrEn = '1' and s_fill < G_DEPTH then
                v_mem(s_wr_count mod G_DEPTH) := Data;
                s_wr_count <= s_wr_count + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Read domain  (NOREG: Q valid 1 cycle after RdEn)
    --------------------------------------------------------------------

    p_read : process (RdClock, Reset, RPReset)
    begin
        if Reset = '1' or RPReset = '1' then
            s_rd_count <= 0;
            s_q_reg    <= (others => '0');
        elsif rising_edge(RdClock) then
            if RdEn = '1' and s_fill > 0 then
                s_q_reg    <= v_mem(s_rd_count mod G_DEPTH);
                s_rd_count <= s_rd_count + 1;
            end if;
        end if;
    end process;

end architecture behav;
