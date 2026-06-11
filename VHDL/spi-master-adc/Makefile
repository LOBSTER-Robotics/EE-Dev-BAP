GHDL=ghdl
FLAGS=--std=08

SRC=src/ADC_master.vhd \
	src/ADC_master_behavioral.vhd
TB=tb/tb_adc_spi_controller.vhd
TOP=tb_ADC_SPI_Controller

all: run

analyze:
	$(GHDL) -a $(FLAGS) $(SRC)
	$(GHDL) -a $(FLAGS) $(TB)

elaborate: analyze
	$(GHDL) -e $(FLAGS) $(TOP)

run: elaborate
	$(GHDL) -r $(FLAGS) $(TOP) --vcd=wave.vcd --stop-time=6ms

clean:
	rm -f *.o *.cf wave.vcd