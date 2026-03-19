# ---------------------------------------------------------------------------
# Clock (100 MHz)
# ---------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {clk}]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# ---------------------------------------------------------------------------
# Reset (Mapping to Push Button 0)
# ---------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {rst}]

# ---------------------------------------------------------------------------
# Push Buttons (BTN2=Left, BTN3=Right)
# ---------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {btn2}]
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports {btn3}]

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

set_property -dict { PACKAGE_PIN P14 IOSTANDARD TMDS_33 } [get_ports {TMDS_DATA_P[2]}] 
set_property -dict { PACKAGE_PIN P15 IOSTANDARD TMDS_33 } [get_ports {TMDS_DATA_N[2]}]
