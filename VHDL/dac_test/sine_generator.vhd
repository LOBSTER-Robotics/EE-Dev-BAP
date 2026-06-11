-- Sine-wave sample generator for DAC baseline test.
--
-- Connects DIRECTLY to spi_master_dac — no FIFO in the data path.
-- The SPI master's read_en pulse is wired to the 'advance' port;
-- the generator presents the next sample combinatorially on data_out.
--
-- Output frequency = f_sample / N_SAMPLES
-- f_sample = 50 MHz / (19 + DONE_WAIT_CYCLS)
--
-- At 2 MSps (DONE_WAIT_CYCLS = 6):
--   N_SAMPLES =  4 → 500 kHz  (4-point — needs analog LPF to look sinusoidal)
--   N_SAMPLES =  8 → 250 kHz
--   N_SAMPLES = 16 → 125 kHz  (smooth on scope without filter)
--   N_SAMPLES = 32 →  62.5 kHz
--
-- Values = round(32768 + 32767 * sin(2π * k / N))
-- Centred at 0x8000 (mid-scale), full swing 0x0001 – 0xFFFF.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sine_generator is
    port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        -- Pulse high for one cycle to advance to the next sample.
        -- Wire directly to spi_master_dac read_en(0).
        advance  : in  std_logic;
        -- Current sample — combinatorial, always valid.
        -- Wire directly to spi_master_dac data_in.
        data_out : out std_logic_vector(15 downto 0)
    );
end entity sine_generator;

architecture rtl of sine_generator is

    constant N_SAMPLES : natural := 16;   -- 125 kHz at 2 MSps

    type lut_t is array (0 to N_SAMPLES - 1) of std_logic_vector(15 downto 0);

    constant SINE_LUT : lut_t := (
        0  => x"8000",   -- sin(  0.0°) =  0.000 → 32768
        1  => x"B0FC",   -- sin( 22.5°) = +0.383 → 45308
        2  => x"DA82",   -- sin( 45.0°) = +0.707 → 55938
        3  => x"F641",   -- sin( 67.5°) = +0.924 → 63041
        4  => x"FFFF",   -- sin( 90.0°) = +1.000 → 65535
        5  => x"F641",   -- sin(112.5°) = +0.924 → 63041
        6  => x"DA82",   -- sin(135.0°) = +0.707 → 55938
        7  => x"B0FC",   -- sin(157.5°) = +0.383 → 45308
        8  => x"8000",   -- sin(180.0°) =  0.000 → 32768
        9  => x"4F04",   -- sin(202.5°) = -0.383 → 20228
        10 => x"257E",   -- sin(225.0°) = -0.707 →  9598
        11 => x"09BF",   -- sin(247.5°) = -0.924 →  2495
        12 => x"0001",   -- sin(270.0°) = -1.000 →     1
        13 => x"09BF",   -- sin(292.5°) = -0.924 →  2495
        14 => x"257E",   -- sin(315.0°) = -0.707 →  9598
        15 => x"4F04"    -- sin(337.5°) = -0.383 → 20228
    );

    signal idx : natural range 0 to N_SAMPLES - 1 := 0;

begin

    -- Combinatorial output: SPI master sees the current sample on the
    -- same cycle that advance='1' (READ state), capturing it before idx
    -- increments on the rising edge.
    data_out <= SINE_LUT(idx);

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                idx <= 0;
            elsif advance = '1' then
                if idx = N_SAMPLES - 1 then
                    idx <= 0;
                else
                    idx <= idx + 1;
                end if;
            end if;
        end if;
    end process;

end architecture rtl;
