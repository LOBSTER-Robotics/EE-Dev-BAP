library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------------------------------------------------
-- TOP LEVEL CONTROLLER
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADC_SPI_Controller is
    Port (

        ----------------------------------------------------------------
        -- SYSTEM CLOCK
        ----------------------------------------------------------------
        CLK       : in  std_logic;

        ----------------------------------------------------------------
        -- ADC SERIAL DATA OUTPUTS
        ----------------------------------------------------------------
        MISO1     : in  std_logic;
        MISO2     : in  std_logic;

        ----------------------------------------------------------------
        -- ADC STATUS
        ----------------------------------------------------------------
        BUSY      : in  std_logic;

        ----------------------------------------------------------------
        -- ADC CONTROL SIGNALS
        ----------------------------------------------------------------
        SCK       : out std_logic;
        CS        : out std_logic;
        CNV       : out std_logic;
        MOSI      : out std_logic;

        ----------------------------------------------------------------
        -- ADC DATA OUTPUTS
        ----------------------------------------------------------------
        Data1     : out std_logic_vector(23 downto 0);

        Data2     : out std_logic_vector(23 downto 0);

        ----------------------------------------------------------------
        -- DATA VALID FLAG
        ----------------------------------------------------------------
        DataValid : out std_logic

    );
end ADC_SPI_Controller;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------------------------------------------
-- SPI CONFIGURATION BLOCK
------------------------------------------------------------------------
entity ADC_SPI_Config is
    Port (
        CLK          : in  std_logic;

        Enable       : in  std_logic;

        StartConfig  : in  std_logic;
        ConfigDone   : out std_logic;

        SCK          : out std_logic;
        CS           : out std_logic;
        MOSI         : out std_logic
    );
end ADC_SPI_Config;


------------------------------------------------------------------------
-- ADC Acquisition engine
-- Zone 2 Operation from ADC datasheet
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADC_Acquisition_Engine is
    Port (

        CLK       : in  std_logic;

        Enable    : in  std_logic;

        MISO1     : in  std_logic;
        MISO2     : in  std_logic;

        CNV       : out std_logic;
        CS        : out std_logic;
        SCK       : out std_logic;

        Data1     : out std_logic_vector(23 downto 0);
        Data2     : out std_logic_vector(23 downto 0);

        DataValid : out std_logic
    );
end ADC_Acquisition_Engine;