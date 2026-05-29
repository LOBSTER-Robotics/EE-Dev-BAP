lappend auto_path "D:/lscc/diamond/3.14/data/script"
package require simulation_generation
set ::bali::simulation::Para(DEVICEFAMILYNAME) {ECP5U}
set ::bali::simulation::Para(PROJECT) {sim}
set ::bali::simulation::Para(PROJECTPATH) {D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path}
set ::bali::simulation::Para(FILELIST) {"D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/DDR_RX.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/RGMII_withDDR.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/UDP_RGMII_stack/src/MAC_RX.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/UDP_RGMII_stack/src/UDP_RX_AXItoFIFO.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/DDR_forRGMII.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/UDP_RGMII_stack/src/CRC32_8.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/UDP_RGMII_stack/src/MAC_AXItoRGMII.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/UDP_RGMII_stack/src/UDP_FIFO_AXI.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/UDP_RGMII_stack/src/register.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/top_ethernet_tx.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/top_ethernet_tx_tbfpga.vhd" "D:/BAP/EE-Dev-BAP/VHDL/lattice_tx_path/top_ethernet_tx_tbfpga_tb.vhd" }
set ::bali::simulation::Para(GLBINCLIST) {}
set ::bali::simulation::Para(INCLIST) {"none" "none" "none" "none" "none" "none" "none" "none" "none" "none" "none" "none"}
set ::bali::simulation::Para(WORKLIBLIST) {"work" "work" "work" "work" "work" "work" "work" "work" "work" "work" "work" "work" }
set ::bali::simulation::Para(COMPLIST) {"VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" }
set ::bali::simulation::Para(LANGSTDLIST) {"VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" "VHDL_2008" }
set ::bali::simulation::Para(SIMLIBLIST) {pmi_work ovi_ecp5u}
set ::bali::simulation::Para(MACROLIST) {}
set ::bali::simulation::Para(SIMULATIONTOPMODULE) {top_tb_fpga_tb}
set ::bali::simulation::Para(SIMULATIONINSTANCE) {}
set ::bali::simulation::Para(LANGUAGE) {VHDL}
set ::bali::simulation::Para(SDFPATH)  {}
set ::bali::simulation::Para(INSTALLATIONPATH) {D:/lscc/diamond/3.14}
set ::bali::simulation::Para(ADDTOPLEVELSIGNALSTOWAVEFORM)  {1}
set ::bali::simulation::Para(RUNSIMULATION)  {1}
set ::bali::simulation::Para(SIMULATION_RESOLUTION)  {ns}
set ::bali::simulation::Para(HDLPARAMETERS) {}
set ::bali::simulation::Para(POJO2LIBREFRESH)    {}
set ::bali::simulation::Para(POJO2MODELSIMLIB)   {}
set ::bali::simulation::Para(OPTIMIZEARGS)  {+acc}
set ::bali::simulation::Para(OPTIMIZATION_DEBUG)  {1}
::bali::simulation::QuestaSim_Run
