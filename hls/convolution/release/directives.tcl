//  Catapult University Version 10.0a/269363 (Production Release) Wed Nov  9 17:38:00 PST 2016
//  
//  Copyright (c) Mentor Graphics Corporation, 1996-2016, All Rights Reserved.
//                       UNPUBLISHED, LICENSED SOFTWARE.
//            CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//          PROPERTY OF MENTOR GRAPHICS OR ITS LICENSORS
//  
//  Running on Linux xph3sei702@ocaepc57 3.16.0-4-amd64 #1 SMP Debian 3.16.43-2+deb8u5 (2017-09-19) x86_64
//  
//  Package information: SIFLIBS v23.0_1.0, HLS_PKGS v23.0_1.0, 
//                       DesignPad v2.78_1.0
//  
//  This version may only be used for academic purposes.  Some optimizations 
//  are disabled, so results obtained from this version may be sub-optimal.
//  
solution new -state initial
solution options defaults
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/SCVerify/LINK_LIBPATHS {/usr/lib /usr/lib/x86_64-linux-gnu}
flow package require /SCVerify
solution file add ./testbench.cpp -type C++ -exclude true
solution file add ./image.cpp -type C++ -exclude true
solution file add ./kernel.cpp -type C++
solution file add ./convolution.cpp -type C++
go new
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
directive set -ASSIGN_OVERHEAD 0
directive set -UNROLL no
directive set -IO_MODE super
directive set -REGISTER_IDLE_SIGNAL false
directive set -IDLE_SIGNAL {}
directive set -STALL_FLAG false
directive set -TRANSACTION_DONE_SIGNAL true
directive set -DONE_FLAG {}
directive set -READY_FLAG {}
directive set -START_FLAG {}
directive set -BLOCK_SYNC none
directive set -TRANSACTION_SYNC ready
directive set -DATA_SYNC none
directive set -RESET_CLEARS_ALL_REGS true
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS use_library
directive set -CHARACTERIZE_ROM false
directive set -PROTOTYPE_ROM true
directive set -ROM_THRESHOLD 64
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_TYPE combinational
directive set -COMPGRADE fast
go analyze
directive set -DESIGN_HIERARCHY apply_conv__FP75ac_fixed__tm__59_XCiL_1_8XCiL_1_8XCbL_1_0XC9ac_q_modeL_1_0XC9ac_o_modeL_1_0T1
go compile
solution library add mgc_Xilinx-ARTIX-7-1_beh_psr -- -rtlsyntool {Precision 2014a} -manufacturer Xilinx -family ARTIX-7 -speed -1 -part 7A100TCSG324
solution library add ram_Xilinx-ARTIX-7-1_RAMDB
solution library add ram_Xilinx-ARTIX-7-1_RAMSB
solution library add Xilinx_RAMS
solution library add Xilinx_accel
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 40.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 20.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /apply_conv/conv_in:rsc -MAP_TO_MODULE Xilinx_RAMS.BLOCK_1R1W_RBW
directive set /apply_conv/core/main -PIPELINE_INIT_INTERVAL 1
directive set /apply_conv/conv_out:rsc -MAP_TO_MODULE Xilinx_RAMS.BLOCK_1R1W_RBW
directive set /apply_conv/kernel.rom -WORD_WIDTH 36
directive set /apply_conv/core/pad_input:rsc -MAP_TO_MODULE Xilinx_RAMS.BLOCK_1R1W_RBW
go architect
go extract
