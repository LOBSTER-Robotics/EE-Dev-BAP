GHDL=ghdl
FLAGS=--std=08

all: rgmii

# =========================
# RGMII
# =========================

RGMII_SRC=src/RGMII.vhd
RGMII_TB=tb/RGMII_tb.vhd
RGMII_TOP=RGMII_tb

rgmii:
	$(GHDL) -a $(FLAGS) $(RGMII_SRC)
	$(GHDL) -a $(FLAGS) $(RGMII_TB)
	$(GHDL) -e $(FLAGS) $(RGMII_TOP)
	$(GHDL) -r $(FLAGS) $(RGMII_TOP) --vcd=wave_rgmii.vcd

# =========================
# UDP Packetizer
# =========================

UDP_SRC=src/UDP_packetizer.vhd
UDP_TB=tb/UDP_packetizer_tb.vhd
UDP_TOP=UDP_packetizer_tb

udp:
	$(GHDL) -a $(FLAGS) $(UDP_SRC)
	$(GHDL) -a $(FLAGS) $(UDP_TB)
	$(GHDL) -e $(FLAGS) $(UDP_TOP)
	$(GHDL) -r $(FLAGS) $(UDP_TOP) --vcd=wave_udp.vcd

# =========================
# UDP FIFO AXI
# =========================

UDP2_SRC=src/UDP_FIFO_AXI.vhd
UDP2_TB=tb/UDP_FIFO_AXI_tb.vhd
UDP2_TOP=UDP_FIFO_AXI_tb

udp2:
	$(GHDL) -a $(FLAGS) $(UDP2_SRC)
	$(GHDL) -a $(FLAGS) $(UDP2_TB)
	$(GHDL) -e $(FLAGS) $(UDP2_TOP)
	$(GHDL) -r $(FLAGS) $(UDP2_TOP) --stop-time=2500ns --vcd=wave_udp2.vcd

# =========================
# MAC_TX
# =========================

CRC32_8_SRC=src/CRC32_8.vhd
MAC_TX_SRC=src/MAC_TX.vhd
MAC_TX_TB=tb/MAC_TX_tb.vhd
MAC_TX_TOP=MAC_TX_tb

mac_tx:
	$(GHDL) -a $(FLAGS) $(CRC32_8_SRC)
	$(GHDL) -a $(FLAGS) $(MAC_TX_SRC)
	$(GHDL) -a $(FLAGS) $(MAC_TX_TB)
	$(GHDL) -e $(FLAGS) $(MAC_TX_TOP)
	$(GHDL) -r $(FLAGS) $(MAC_TX_TOP) --stop-time=6000ns --vcd=wave_mac_tx.vcd

# =========================
# MAC_AXItoRGMII
# =========================

CRC32_8_SRC=src/CRC32_8.vhd
MAC_TX_SRC=src/MAC_AXItoRGMII.vhd
MAC_TX_TB=tb/MAC_AXItoRGMII_tb.vhd
MAC_TX_TOP=MAC_AXItoRGMII_tb

mac_axitorgmii:
	$(GHDL) -a $(FLAGS) $(CRC32_8_SRC)
	$(GHDL) -a $(FLAGS) $(MAC_TX_SRC)
	$(GHDL) -a $(FLAGS) $(MAC_TX_TB)
	$(GHDL) -e $(FLAGS) $(MAC_TX_TOP)
	$(GHDL) -r $(FLAGS) $(MAC_TX_TOP) --stop-time=6000ns --vcd=wave_axitorgmii.vcd

# =========================
# CRC32_8bit
# =========================

CRC32_8_SRC=src/CRC32_8.vhd
CRC32_8_TB=tb/CRC32_8_tb.vhd
CRC32_8_TOP=crc32_8_tb

crc:
	$(GHDL) -a $(FLAGS) $(CRC32_8_SRC)
	$(GHDL) -a $(FLAGS) $(CRC32_8_TB)
	$(GHDL) -e $(FLAGS) $(CRC32_8_TOP)
	$(GHDL) -r $(FLAGS) $(CRC32_8_TOP) --stop-time=100ns --vcd=wave_crc32_8.vcd

# =========================
# TOP TX
# =========================

CRC32_8_SRC=src/CRC32_8.vhd
MAC_AXItoRGMII_SRC=src/MAC_AXItoRGMII.vhd
RGMII_SRC=src/RGMII.vhd
UDP2_SRC=src/UDP_FIFO_AXI.vhd
TOP_TX_SRC=src/TOP_TX.vhd
TOP_TX_TB=tb/TOP_TX_tb.vhd
TOP_TX_TOP=TOP_TX_tb

top_tx:
	$(GHDL) -a $(FLAGS) $(CRC32_8_SRC)
	$(GHDL) -a $(FLAGS) $(MAC_AXItoRGMII_SRC)
	$(GHDL) -a $(FLAGS) $(RGMII_SRC)
	$(GHDL) -a $(FLAGS) $(UDP2_SRC)
	$(GHDL) -a $(FLAGS) $(TOP_TX_SRC)
	$(GHDL) -a $(FLAGS) $(TOP_TX_TB)
	$(GHDL) -e $(FLAGS) $(TOP_TX_TOP)
	$(GHDL) -r $(FLAGS) $(TOP_TX_TOP) --stop-time=6000ns --vcd=wave_mac_tx.vcd

clean:
	rm -f *.o *.cf *.vcd