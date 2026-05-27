library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Top is
    generic (
        N_CHANNELS : positive := 1      -- Number of DAC channels (independent SDI lines)
    );
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        light_0 : out std_logic;
        light_1 : out std_logic;
        light_2 : out std_logic;
        light_3 : out std_logic;
        light_4 : out std_logic;
        light_5 : out std_logic;
        light_6 : out std_logic;
        light_7 : out std_logic;
        spi_clk_dac : out std_logic;
        spi_clk_adc : out std_logic;
        spi_DI_dac : out std_logic_vector(N_CHANNELS-1 downto 0);
        spi_DI_adc : out std_logic_vector(N_CHANNELS-1 downto 0);
        spi_cs_dac : out std_logic;
        spi_cs_adc : out std_logic
    );
end entity;

architecture Behavioral of Top is
        -- Internal signals
        signal lights : unsigned(7 downto 0);
        signal dac_data : std_logic_vector(15 downto 0);
        signal dac_data_valid : std_logic;
        signal dac_ready : std_logic;
        signal adc_data : std_logic_vector(23 downto 0);
        signal adc_data_valid : std_logic;
        signal adc_ready : std_logic;
begin
    -- Initialize signals

    -- Instantiate SPI master for DAC
    spi_master_dac_inst : entity work.spi_master_dac
        generic map (
            N_CHANNELS => N_CHANNELS  -- Example with 1 DAC channel
        )
        port map (
            i_CLK => clk,
            i_RST => reset,
            i_Data => dac_data,  -- Placeholder data input
            i_Data_Valid => dac_data_valid,         -- Placeholder data valid signal
            o_Ready => dac_ready,             -- Unused ready signal
            o_SPI_CLK => spi_clk_dac,
            o_SPI_DI => spi_DI_dac,
            o_SPI_CS_n => spi_cs_dac
        );

    -- Instantiate SPI master for ADC (not implemented here, just a placeholder)
    spi_master_adc_inst : entity work.spi_master_dac
        generic map (
            N_CHANNELS => N_CHANNELS  -- Example with 1 ADC channel
        )
        port map (
            i_CLK => clk,
            i_RST => reset,
            i_Data => adc_data,  -- Placeholder data input
            i_Data_Valid => adc_data_valid,         -- Placeholder data valid signal
            o_Ready => adc_ready,             -- Unused ready signal
            o_SPI_CLK => spi_clk_adc,
            o_SPI_DI => spi_DI_adc,
            o_SPI_CS_n => spi_cs_adc
        );

    -- Instantiate Controller
    controller_inst : entity work.Controller
        port map (
            clk => clk,
            reset => reset,
            lights => lights,              -- Connect to lights_map later
            dac_data => dac_data,            -- Connect to spi_master_dac later
            dac_data_valid => dac_data_valid,      -- Connect to spi_master_dac later
            dac_ready => dac_ready,           -- Connect to spi_master_dac later
            adc_data => adc_data,           -- Connect to spi_master_adc later
            adc_data_valid => adc_data_valid,     -- Connect to spi_master_adc later
            adc_ready => adc_ready           -- Connect to spi_master_adc later
        );
    
end architecture;
