# ---------------------------------------------------------------------------
# Clock (100 MHz)
# ---------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {clk}]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports {clk}]

# ---------------------------------------------------------------------------
# Reset (Mapping to Push Button 0)
# ---------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {rst}]

# ---------------------------------------------------------------------------
# Switches (Mapping to Slide Switches 0-7)
# ---------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {sw[0]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {sw[1]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {sw[2]}]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {sw[3]}]
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {sw[4]}]
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {sw[5]}]
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports {sw[6]}]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports {sw[7]}]

# ---------------------------------------------------------------------------
# HDMI TX (Video Output)
# ---------------------------------------------------------------------------
set_property -dict { PACKAGE_PIN G15 IOSTANDARD LVCMOS33 } [get_ports {hdmi_tx_hpd}]

set_property -dict { PACKAGE_PIN R14 IOSTANDARD TMDS_33 } [get_ports {TMDS_CLK_P}] 
set_property -dict { PACKAGE_PIN T14 IOSTANDARD TMDS_33 } [get_ports {TMDS_CLK_N}] 

set_property -dict { PACKAGE_PIN R15 IOSTANDARD TMDS_33 } [get_ports {TMDS_DATA_P[0]}] 
set_property -dict { PACKAGE_PIN T15 IOSTANDARD TMDS_33 } [get_ports {TMDS_DATA_N[0]}] 

set_property -dict { PACKAGE_PIN R16 IOSTANDARD TMDS_33 } [get_ports {TMDS_DATA_P[1]}] 
set_property -dict { PACKAGE_PIN R17 IOSTANDARD TMDS_33 } [get_ports {TMDS_DATA_N[1]}] 

set_property -dict { PACKAGE_PIN P15 IOSTANDARD TMDS_33 } [get_ports {TMDS_DATA_P[2]}] 
set_property -dict { PACKAGE_PIN P16 IOSTANDARD TMDS_33 } [get_ports {TMDS_DATA_N[2]}]
