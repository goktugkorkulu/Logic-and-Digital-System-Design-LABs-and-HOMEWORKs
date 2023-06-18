//inputs
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {A}];
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {B}];
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {Cin}];
//outputs
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {Sum}];
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {Carry}];