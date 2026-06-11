library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb_fpga is
    generic (
        G_NUM_CHANNELS           : positive := 16;
        G_ADC_WIDTH              : positive := 24;
        G_BYTE_WIDTH             : positive := 8;
        G_LARGE_FIFO_COUNT_WIDTH : positive := 16
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
		
        Data: in  std_logic_vector(23 downto 0);
        Write_En : in std_logic;
        enable : in std_logic;
        packer_busy : out std_logic;
        packer_frame_done : out std_logic;
		
		-- RGMII output
		rgmii_txd : out std_logic_vector(3 downto 0);
        rgmii_txctl : out std_logic;
        rgmii_txc : out std_logic
    );
end entity top_tb_fpga;

architecture Behavioral of top_tb_fpga is

dut : entity work.top
        generic map (
            G_NUM_CHANNELS           => G_NUM_CHANNELS,
            G_ADC_WIDTH              => G_ADC_WIDTH,
            G_BYTE_WIDTH             => G_BYTE_WIDTH,
            G_LARGE_FIFO_COUNT_WIDTH => G_LARGE_FIFO_COUNT_WIDTH
        )
        port map (
            clk                 => clk,
            rst                 => rst,
            Data                => Data,
            Write_En            => Write_En,
            enable              => enable,
            packer_busy         => packer_busy,
            packer_frame_done   => packer_frame_done,
			rgmii_txd => rgmii_txd,
			rgmii_txctl => rgmii_txctl,
			rgmii_txc => rgmii_txc
        );

end Behavioral;