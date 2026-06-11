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
        enable : in std_logic;
        Read_large_fifo : in std_logic;
        data_out_large_fifo : out std_logic_vector(G_BYTE_WIDTH-1 downto 0);
        packer_busy : out std_logic;
        packer_frame_done : out std_logic
    );
end entity TOP;



architecture Behavioral of Top is
    signal fifo_dout_to_packer : std_logic_vector(G_ADC_WIDTH-1 downto 0);
    signal fifo_sel : unsigned(3 downto 0);
    signal large_fifo_full : std_logic;
    signal large_fifo_almost_full : std_logic;
    signal large_fifo_wr_en : std_logic;
    signal large_fifo_din : std_logic_vector(G_BYTE_WIDTH-1 downto 0);
begin
    u_adc_fifo_frame_packer : entity work.Controller
        generic map (
            G_NUM_CHANNELS           => 16,
            G_ADC_WIDTH              => 24,
            G_BYTE_WIDTH             => 8,
            G_LARGE_FIFO_COUNT_WIDTH => 16,
            G_MUX_WAIT_CYCLES        => 3
        )
        port map (
            i_clk   => clk,
            i_rst   => rst,

            i_enable => enable,

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
        i_clk => clk,
        i_rst => rst,

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
                Clock => clk,
                Reset => rst,
                Data => Data_x0,
                RdEn => adc_fifo_rd_en(0),
                WrEn => Write_En,
                Q => adc_fifo_0_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(0)
            );
    u_Fifosm1 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x1,
                RdEn => adc_fifo_rd_en(1),
                WrEn => Write_En,
                Q => adc_fifo_1_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(1)
            );
    u_Fifosm2 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x2,
                RdEn => adc_fifo_rd_en(2),
                WrEn => Write_En,
                Q => adc_fifo_2_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(2)
            );
    u_Fifosm3 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x3,
                RdEn => adc_fifo_rd_en(3),
                WrEn => Write_En,
                Q => adc_fifo_3_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(3)
            );
    u_Fifosm4 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x4,
                RdEn => adc_fifo_rd_en(4),
                WrEn => Write_En,
                Q => adc_fifo_4_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(4)
            );
    u_Fifosm5 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x5,
                RdEn => adc_fifo_rd_en(5),
                WrEn => Write_En,
                Q => adc_fifo_5_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(5)
            );
    u_Fifosm6 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x6,
                RdEn => adc_fifo_rd_en(6),
                WrEn => Write_En,
                Q => adc_fifo_6_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(6)
            );
    u_Fifosm7 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x7,
                RdEn => adc_fifo_rd_en(7),
                WrEn => Write_En,
                Q => adc_fifo_7_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(7)
            );
    u_Fifosm8 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x8,
                RdEn => adc_fifo_rd_en(8),
                WrEn => Write_En,
                Q => adc_fifo_8_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(8)
            );
    u_Fifosm9 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x9,
                RdEn => adc_fifo_rd_en(9),
                WrEn => Write_En,
                Q => adc_fifo_9_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(9)
            );
    u_Fifosm10 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x10,
                RdEn => adc_fifo_rd_en(10),
                WrEn => Write_En,
                Q => adc_fifo_10_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(10)
            );
    u_Fifosm11 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x11,
                RdEn => adc_fifo_rd_en(11),
                WrEn => Write_En,
                Q => adc_fifo_11_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(11)
            );
    u_Fifosm12 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x12,
                RdEn => adc_fifo_rd_en(12),
                WrEn => Write_En,
                Q => adc_fifo_12_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(12)
            );
    u_Fifosm13 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x13,
                RdEn => adc_fifo_rd_en(13),
                WrEn => Write_En,
                Q => adc_fifo_13_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(13)
            );
    u_Fifosm14 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x14,
                RdEn => adc_fifo_rd_en(14),
                WrEn => Write_En,
                Q => adc_fifo_14_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(14)
            );
    u_Fifosm15 : entity work.Fifosm
            port map (
                Clock => clk,
                Reset => rst,
                Data => Data_x15,
                RdEn => adc_fifo_rd_en(15),
                WrEn => Write_En,
                Q => adc_fifo_15_dout,
                Full => open,
                AlmostFull => open,
                AlmostEmpty => open,
                Empty => adc_fifo_empty(15)
            );


    u_Fifo_large : entity work.Fifolg    port map (
            Clock        => clk,
            Reset        => rst,
            Data         => large_fifo_din,
            RdEn         => Read_large_fifo,
            WrEn         => large_fifo_wr_en,
            Q            => data_out_large_fifo,
            Full         => large_fifo_full,
            AlmostFull   => large_fifo_almost_full,
            Empty        => open,
            AlmostEmpty  => open
        );


end Behavioral;


