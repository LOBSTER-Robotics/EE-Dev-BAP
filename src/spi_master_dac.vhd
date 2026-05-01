library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_dac is
    generic (
        CLK_DIV : positive := 2
        -- Divides clk_i to produce spi_sclk_o.
        -- Default 2: 100 MHz / 2 = 50 MHz (DAC8811 maximum, tCLK = 20 ns min).
    );
    port (
        -- System interface
        clk_i      : in  std_logic;
        rst_i      : in  std_logic;                     -- Synchronous, active high

        -- Upstream data interface 
        data_i     : in  std_logic_vector(15 downto 0); -- DB15 at index 15, DB0 at index 0
        valid_i    : in  std_logic;                     -- Upstream: data_i holds a new sample
        ready_o    : out std_logic;                     -- Master: ready to accept next sample

        -- SPI bus — DAC8811 (Mode 0: CPOL=0, CPHA=0, MSB first)
        sclk_o : out std_logic;                     -- To DAC8811 CLK  (idles LOW)
        sdi_o  : out std_logic;                     -- To DAC8811 SDI  (MSB first)
        cs_n_o : out std_logic                      -- To DAC8811 CS#  (active low)
    );
end entity spi_master_dac;
