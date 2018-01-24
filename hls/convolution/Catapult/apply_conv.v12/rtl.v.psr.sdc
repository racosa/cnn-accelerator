set sdc_version 1.6 

create_clock -name clk -period 40.0 -waveform { 0.0 20.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

# These constraints prevent the Precision 'No initialized timing analysis; 
# cannot define a Clock.' error message in combinational designs
set hls_design_clk [lindex [concat [find_clocks -top] [all_clocks]] 0]
set_input_delay 0.0 -clock $hls_design_clk [all_inputs]
set_output_delay 0.0 -clock $hls_design_clk [all_outputs]

## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {conv_in_rsc_addr*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {conv_in_rsc_re}]
set_input_delay -clock [get_clocks {clk}] 2.13 [get_ports {conv_in_rsc_data_out*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {conv_in_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {conv_out_rsc_data_in*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {conv_out_rsc_addr*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {conv_out_rsc_we}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {conv_out_rsc_triosy_lz}]

