##
## Copyright 2003-2015 Mentor Graphics Corporation
##
## All Rights Reserved.
##
## THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
## MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
## 

#Simple FIR - Coefficent RAM, Unroll MAC 2x
project new
# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]
# Reset the options to the factory defaults
solution new -state initial 
solution options defaults
# Testbench
flow package require SCVerify

solution file add [file join $sfd FIR_SIMPLE.cpp] -type C++
solution file add [file join $sfd FIR_SIMPLE_REFERENCE.cpp] -type C++ -exclude true
solution file add [file join $sfd FIR_TESTBENCH.cpp] -type C++ -exclude true

directive set -DESIGN_GOAL area
directive set -OLD_SCHED false
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
directive set -MEM_MAP_THRESHOLD 32
directive set -FSM_ENCODING none
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -REGISTER_SHARING_LIMIT 0
directive set -ASSIGN_OVERHEAD 0
directive set -TIMING_CHECKS true
directive set -MUXPATH true
directive set -REALLOC true
directive set -UNROLL no
directive set -IO_MODE super
directive set -REGISTER_IDLE_SIGNAL false
directive set -IDLE_SIGNAL {}
directive set -STALL_FLAG false
directive set -TRANSACTION_DONE_SIGNAL true
directive set -DONE_FLAG {}
directive set -START_FLAG {}
directive set -BLOCK_SYNC none
directive set -TRANSACTION_SYNC ready
directive set -DATA_SYNC none
directive set -RESET_CLEARS_ALL_REGS true
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS -1
directive set -CSA 0
directive set -CHARACTERIZE_ROM false
directive set -PROTOTYPE_ROM true
directive set -ROM_THRESHOLD 64
directive set -CLUSTER_INPUT_WIDTH_THRESHOLD 0
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_TYPE combinational
directive set -COMPGRADE fast
directive set -PIPELINE_RAMP_UP true
go analyze
solution library add mgc_sample-065nm-dw_beh_dc -- -rtlsyntool DesignCompiler -vendor Sample -technology 065nm -Designware Yes
solution library add ram_sample-065nm-singleport_beh_dc
directive set -DESIGN_HIERARCHY FIR_HARDWARE__FR96ac_channel__tm__78_75ac_fixed__tm__59_XCiL_1_8XCiL_1_8XCbL_1_1XC9ac_q_modeL_1_4XC9ac_o_modeL_1_1P76ac_fixed__tm__60_XCiL_2_16XCiL_1_1XCbL_1_1XC9ac_q_modeL_1_4XC9ac_o_modeL_1_1T1
go compile
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 5.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 2.5 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
directive set -CLOCK_NAME clk
go assembly
directive set /FIR_HARDWARE/coeffs:rsc -MAP_TO_MODULE ram_sample-065nm-singleport_beh_dc.RAM
directive set /FIR_HARDWARE/core/taps:rsc -MAP_TO_MODULE {[Register]}
directive set /FIR_HARDWARE/core/main -PIPELINE_INIT_INTERVAL 1
directive set /FIR_HARDWARE/core/SHIFT -UNROLL yes
directive set /FIR_HARDWARE/coeffs -WORD_WIDTH 32
directive set /FIR_HARDWARE/core/MAC -UNROLL 2
go architect
go extract
flow run /SCVerify/launch_make ./scverify/Verify_rtl_v_msim.mk {} SIMTOOL=msim sim
