GHDL=ghdl
FLAGS=--std=08

SRC=src/counter.vhd
TB=tb/counter_tb.vhd
TOP=counter_tb

all: run

analyze:
	$(GHDL) -a $(FLAGS) $(SRC)
	$(GHDL) -a $(FLAGS) $(TB)

elaborate: analyze
	$(GHDL) -e $(FLAGS) $(TOP)

run: elaborate
	$(GHDL) -r $(FLAGS) $(TOP) --vcd=wave.vcd

clean:
	rm -f *.o *.cf wave.vcd