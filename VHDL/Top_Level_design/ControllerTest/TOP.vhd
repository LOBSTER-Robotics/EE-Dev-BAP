library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP is
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
        -- High while a frame is being packed.
        packer_busy : out std_logic;
        -- Pulses high for one clock when a full frame has been written.
        packer_frame_done : out std_logic
    );
end entity TOP;



architecture Behavioral of Top is
    signal fifo_dout_to_packer : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal fifo_sel : unsigned(3 downto 0);
    signal adc_fifo_empty : std_logic_vector(G_NUM_CHANNELS-1 downto 0);
    signal adc_fifo_rd_en : std_logic_vector(G_NUM_CHANNELS-1 downto 0);
    signal adc_fifo_0_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_1_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_2_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_3_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_4_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_5_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_6_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_7_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_8_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_9_dout  : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_10_dout : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_11_dout : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_12_dout : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_13_dout : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_14_dout : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal adc_fifo_15_dout : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal large_fifo_full : std_logic;
    signal large_fifo_almost_full : std_logic;
    signal large_fifo_wr_en : std_logic;
    signal large_fifo_din : std_logic_vector(G_BYTE_WIDTH-1 downto 0);
begin
    u_adc_fifo_frame_packer : entity work.adc_fifo_frame_packer
        generic map (
            G_NUM_CHANNELS           => 16,
            G_ADC_WIDTH              => 24,
            G_BYTE_WIDTH             => 8,
            G_LARGE_FIFO_COUNT_WIDTH => 16
        )
        port map (
            i_clk   => clk,
            i_rst   => rst,

            i_enable => '1',

            i_small_fifo_empty => adc_fifo_empty,

            o_fifo_sel => fifo_sel,

            o_small_fifo_rd_en => adc_fifo_rd_en,

            i_fifo_dout => fifo_dout_to_packer,

            i_large_fifo_full       => large_fifo_full,
            i_large_fifo_almost_full => large_fifo_almost_full,
            o_large_fifo_wr_en      => large_fifo_wr_en,
            o_large_fifo_din        => large_fifo_din,

            o_busy       => packer_busy,
            o_frame_done => packer_frame_done
        );

    u_MuxFifo : entity work.fifo_16ch_mux
        generic map (
            G_ADC_WIDTH => 24
        )
        port map (
            i_fifo_sel => fifo_sel,

            i_fifo_0_dout  => adc_fifo_0_dout,
            i_fifo_1_dout  => adc_fifo_1_dout,
            i_fifo_2_dout  => adc_fifo_2_dout,
            i_fifo_3_dout  => adc_fifo_3_dout,
            i_fifo_4_dout  => adc_fifo_4_dout,
            i_fifo_5_dout  => adc_fifo_5_dout,
            i_fifo_6_dout  => adc_fifo_6_dout,
            i_fifo_7_dout  => adc_fifo_7_dout,
            i_fifo_8_dout  => adc_fifo_8_dout,
            i_fifo_9_dout  => adc_fifo_9_dout,
            i_fifo_10_dout => adc_fifo_10_dout,
            i_fifo_11_dout => adc_fifo_11_dout,
            i_fifo_12_dout => adc_fifo_12_dout,
            i_fifo_13_dout => adc_fifo_13_dout,
            i_fifo_14_dout => adc_fifo_14_dout,
            i_fifo_15_dout => adc_fifo_15_dout,

            o_fifo_dout => fifo_dout_to_packer
        );
    u_Fifosm0 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,
            rd_en => adc_fifo_rd_en(0),  -- Connect to Controller read enable for channel 0
            wr_en => Write_En,
            Q => adc_fifo_0_dout,  -- Connect to MuxFifo output
            full => open,      -- Connect to frame packer input
            almost_full => open,  -- Connect to frame packer input
            empty => adc_fifo_rd_en(0)  -- Connect to Controller read enable for channel 0
        );
    u_Fifosm1 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(1),  -- Connect to Controller read enable for channel 1
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_1_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(1)  -- Connect to Controller read enable for channel 1
        );
    u_Fifosm2 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(2),  -- Connect to Controller read enable for channel 2
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_2_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(2)  -- Connect to Controller read enable for channel 2
        );
    u_Fifosm3 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(3),  -- Connect to Controller read enable for channel 3
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_3_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(3)  -- Connect to Controller read enable for channel 3
        );
    u_Fifosm4 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(4),  -- Connect to Controller read enable for channel 4
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_4_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(4)  -- Connect to Controller read enable for channel 4
        );
    u_Fifosm5 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(5),  -- Connect to Controller read enable for channel 5
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_5_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(5)  -- Connect to Controller read enable for channel 5
        );
    u_Fifosm6 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(6),  -- Connect to Controller read enable for channel 6
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_6_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(6)  -- Connect to Controller read enable for channel 6
        );
    u_Fifosm7 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(7),  -- Connect to Controller read enable for channel 7
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_7_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(7)  -- Connect to Controller read enable for channel 7
        );
    u_Fifosm8 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(8),  -- Connect to Controller read enable for channel 8
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_8_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(8)  -- Connect to Controller read enable for channel 8
        );
    u_Fifosm9 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(9),  -- Connect to Controller read enable for channel 9
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_9_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused    
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(9)  -- Connect to Controller read enable for channel 9
        );
    u_Fifosm10 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(10),  -- Connect to Controller read enable for channel 10
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_10_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(10)  -- Connect to Controller read enable for channel 10
        );
    u_Fifosm11 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(11),  -- Connect to Controller read enable for channel 11
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_11_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(11)  -- Connect to Controller read enable for channel 11
        );
    u_Fifosm12 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(12),  -- Connect to Controller read enable for channel 12
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_12_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(12)  -- Connect to Controller read enable for channel 12
        );
    u_Fifosm13 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(13),  -- Connect to Controller read enable for channel 13
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_13_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(13)  -- Connect to Controller read enable for channel 13
        );
    u_Fifosm14 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(14),  -- Connect to Controller read enable for channel 14
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_14_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(14)  -- Connect to Controller read enable for channel 14
        );
    u_Fifosm15 : entity work.Fifosm
        port map (
            clk => clk,
            rst => rst,
            Data => Data,  -- Unused channels can be tied to zero
            rd_en => adc_fifo_rd_en(15),  -- Connect to Controller read enable for channel 15
            wr_en => Write_En,  -- No writes to unused channels
            Q => adc_fifo_15_dout,  -- Connect to MuxFifo output
            full => open,      -- Unused
            almost_full => open,  -- Unused
            empty => adc_fifo_rd_en(15)  -- Connect to Controller read enable for channel 15
        );

end Behavioral;


