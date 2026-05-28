library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_TOP is
end tb_TOP;

architecture sim of tb_TOP is

    constant G_NUM_CHANNELS           : positive := 16;
    constant G_ADC_WIDTH              : positive := 24;
    constant G_BYTE_WIDTH             : positive := 8;
    constant G_LARGE_FIFO_COUNT_WIDTH : positive := 16;

    constant CLK_PERIOD : time := 10 ns;

    -- 16 channels * 24 bits = 384 bits = 48 bytes
    constant C_FRAME_BYTES : integer :=
        (G_NUM_CHANNELS * G_ADC_WIDTH) / G_BYTE_WIDTH;

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';

    signal Data : std_logic_vector(23 downto 0) := (others => '0');
    signal Write_En : std_logic := '0';
    signal enable : std_logic := '0';
    signal Read_large_fifo : std_logic := '0';

    --signal data_out_large_fifo : std_logic_vector(G_BYTE_WIDTH-1 downto 0);
    signal packer_busy : std_logic;
    signal packer_frame_done : std_logic;
	
	signal rgmii_txd : std_logic_vector(3 downto 0);
    signal rgmii_txctl : std_logic;
    signal rgmii_txc : std_logic;

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    uut : entity work.top
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
            --Read_large_fifo     => Read_large_fifo,
            --data_out_large_fifo => data_out_large_fifo,
            packer_busy         => packer_busy,
            packer_frame_done   => packer_frame_done,
			rgmii_txd => rgmii_txd,
			rgmii_txctl => rgmii_txctl,
			rgmii_txc => rgmii_txc
        );

    --------------------------------------------------------------------
    -- Clock generation
    --------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    stim_process : process
        variable frame_seen : integer;
    begin
        rst <= '1';
        Write_En <= '0';
        enable <= '0';
        Read_large_fifo <= '0';
        Data <= (others => '0');

        wait for 5 * CLK_PERIOD;

        wait until clk'event and clk = '1';
        rst <= '0';

        wait until clk'event and clk = '1';

        ----------------------------------------------------------------
        -- Step 1: Write ADC sample data into FIFOs
        ----------------------------------------------------------------
        report "Writing ADC samples into FIFOs";

        for i in 0 to 4 loop

            Data <= (others => '1');
            Write_En <= '1';

            wait until clk'event and clk = '1';

        end loop;

        Write_En <= '0';
        Data <= (others => '0');

        wait for 3 * CLK_PERIOD;

        ----------------------------------------------------------------
        -- Step 2: Enable the packer/controller
        ----------------------------------------------------------------
        report "Enabling frame packer";

        wait until clk'event and clk = '1';
        enable <= '1';

        ----------------------------------------------------------------
        -- Step 3: Wait for frame done
        ----------------------------------------------------------------
	frame_seen := 0;

	while frame_seen < 1 loop

    		wait until clk'event and clk = '1';

    		if packer_frame_done = '1' then
       			frame_seen := frame_seen + 1;
        		report "Frame done detected";
    		end if;

	end loop;
	enable <= '0';

        wait for 5 * CLK_PERIOD;
	

        ----------------------------------------------------------------
        -- Step 4: Read large FIFO
        ----------------------------------------------------------------
        report "Reading large FIFO";

        for i in 0 to (C_FRAME_BYTES + 1)*8 loop

            Read_large_fifo <= '1';

            wait until clk'event and clk = '1';

            report "Read byte "
                & integer'image(i)
                & " = "
                --& integer'image(to_integer(unsigned(data_out_large_fifo)))
				;

        end loop;

        Read_large_fifo <= '0';

        wait for 10 * CLK_PERIOD;

        report "Test bench finished";

    end process;

end sim;
