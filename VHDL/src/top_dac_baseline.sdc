# Synopsys Design Constraints — DAC baseline validation
# 50 MHz clock

create_clock -name clk -period 20.000 [get_ports clk]

derive_clock_uncertainty
