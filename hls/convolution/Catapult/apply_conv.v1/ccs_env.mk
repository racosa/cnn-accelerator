ifeq "$(CXX_HOME)" ""
CXX_HOME                                      := /softl3/catapultc10_0a/64bit/Mgc_home
export CXX_HOME
endif
ifeq "$(CXX_TYPE)" ""
CXX_TYPE                                      := gcc
export CXX_TYPE
endif
ifeq "$(CXX_VCO)" ""
CXX_VCO                                       := aol
export CXX_VCO
endif
ifeq "$(Option_CppStandard)" ""
Option_CppStandard                            := c++98
export Option_CppStandard
endif
ifeq "$(SYN_DIR)" ""
SYN_DIR                                       := gate_synthesis_psr
export SYN_DIR
endif
ifeq "$(HLD_CONSTRAINT_FNAME)" ""
HLD_CONSTRAINT_FNAME                          := top_gate_constraints.cpp
export HLD_CONSTRAINT_FNAME
endif
ifeq "$(TCLSH_CMD)" ""
TCLSH_CMD                                     := /softl3/catapultc10_0a/64bit/Mgc_home/bin/tclsh8.5
export TCLSH_CMD
endif
ifeq "$(ModelSim_Path)" ""
ModelSim_Path                                 := /softslin/modelsim10_2c/modeltech/linux
export ModelSim_Path
endif
ifeq "$(ModelSim_FORCE_32BIT)" ""
ModelSim_FORCE_32BIT                          := 
export ModelSim_FORCE_32BIT
endif
ifeq "$(ModelSim_DEF_MODELSIM_INI)" ""
ModelSim_DEF_MODELSIM_INI                     := 
export ModelSim_DEF_MODELSIM_INI
endif
ifeq "$(ModelSim_ENABLE_VOPT)" ""
ModelSim_ENABLE_VOPT                          := false
export ModelSim_ENABLE_VOPT
endif
ifeq "$(ModelSim_VOPT_ARGS)" ""
ModelSim_VOPT_ARGS                            := +acc
export ModelSim_VOPT_ARGS
endif
ifeq "$(ModelSim_VCOM_OPTS)" ""
ModelSim_VCOM_OPTS                            := 
export ModelSim_VCOM_OPTS
endif
ifeq "$(ModelSim_VLOG_OPTS)" ""
ModelSim_VLOG_OPTS                            := 
export ModelSim_VLOG_OPTS
endif
ifeq "$(ModelSim_SCCOM_OPTS)" ""
ModelSim_SCCOM_OPTS                           := -g -x c++ -Wall -Wno-unknown-pragmas
export ModelSim_SCCOM_OPTS
endif
ifeq "$(ModelSim_VSIM_OPTS)" ""
ModelSim_VSIM_OPTS                            := -t ps
export ModelSim_VSIM_OPTS
endif
ifeq "$(ModelSim_GATE_VSIM_OPTS)" ""
ModelSim_GATE_VSIM_OPTS                       := +notimingchecks -sdfnoerror -noglitch
export ModelSim_GATE_VSIM_OPTS
endif
ifeq "$(ModelSim_RADIX)" ""
ModelSim_RADIX                                := hex
export ModelSim_RADIX
endif
ifeq "$(ModelSim_MSIM_AC_TYPES)" ""
ModelSim_MSIM_AC_TYPES                        := true
export ModelSim_MSIM_AC_TYPES
endif
ifeq "$(ModelSim_MSIM_DOFILE)" ""
ModelSim_MSIM_DOFILE                          := 
export ModelSim_MSIM_DOFILE
endif
ifeq "$(ModelSim_VCD_SIZE_LIMIT)" ""
ModelSim_VCD_SIZE_LIMIT                       := 2000
export ModelSim_VCD_SIZE_LIMIT
endif
ifeq "$(ModelSim_ENABLE_CODE_COVERAGE)" ""
ModelSim_ENABLE_CODE_COVERAGE                 := false
export ModelSim_ENABLE_CODE_COVERAGE
endif
ifeq "$(ModelSim_QHOME)" ""
ModelSim_QHOME                                := $(QHOME)
export ModelSim_QHOME
endif
ifeq "$(ModelSim_WITNESS_WAVEFORM)" ""
ModelSim_WITNESS_WAVEFORM                     := false
export ModelSim_WITNESS_WAVEFORM
endif
ifeq "$(ModelSim_SYSC_VERSION)" ""
ModelSim_SYSC_VERSION                         := 2.3
export ModelSim_SYSC_VERSION
endif
ifeq "$(ModelSim_ALLOW_DUP_SYMS)" ""
ModelSim_ALLOW_DUP_SYMS                       := false
export ModelSim_ALLOW_DUP_SYMS
endif
ifeq "$(ModelSim_SHOW_LIST)" ""
ModelSim_SHOW_LIST                            := false
export ModelSim_SHOW_LIST
endif
ifeq "$(ModelSim_ENABLE_OLD_MSIM_FLOW)" ""
ModelSim_ENABLE_OLD_MSIM_FLOW                 := false
export ModelSim_ENABLE_OLD_MSIM_FLOW
endif
ifeq "$(ModelSim_Flags)" ""
ModelSim_Flags                                := 
export ModelSim_Flags
endif
ifeq "$(NCSim_NC_ROOT)" ""
NCSim_NC_ROOT                                 := $(NC_ROOT)
export NCSim_NC_ROOT
endif
ifeq "$(NCSim_FORCE_32BIT)" ""
NCSim_FORCE_32BIT                             := 
export NCSim_FORCE_32BIT
endif
ifeq "$(NCSim_GCC_HOME)" ""
NCSim_GCC_HOME                                := 
export NCSim_GCC_HOME
endif
ifeq "$(NCSim_NCSIM_GCCVERSION)" ""
NCSim_NCSIM_GCCVERSION                        := 4.1
export NCSim_NCSIM_GCCVERSION
endif
ifeq "$(NCSim_NCVHDL_OPTS)" ""
NCSim_NCVHDL_OPTS                             := -v93 -linedebug
export NCSim_NCVHDL_OPTS
endif
ifeq "$(NCSim_NCVLOG_OPTS)" ""
NCSim_NCVLOG_OPTS                             := -linedebug
export NCSim_NCVLOG_OPTS
endif
ifeq "$(NCSim_NCSC_OPTS)" ""
NCSim_NCSC_OPTS                               := 
export NCSim_NCSC_OPTS
endif
ifeq "$(NCSim_NCSC_CXX_OPTS)" ""
NCSim_NCSC_CXX_OPTS                           := -x c++ -Wall -Wno-unknown-pragmas -Wno-deprecated
export NCSim_NCSC_CXX_OPTS
endif
ifeq "$(NCSim_NCELAB_OPTS)" ""
NCSim_NCELAB_OPTS                             := 
export NCSim_NCELAB_OPTS
endif
ifeq "$(NCSim_NCSIM_OPTS)" ""
NCSim_NCSIM_OPTS                              := 
export NCSim_NCSIM_OPTS
endif
ifeq "$(NCSim_NCSIM_TIMESCALE)" ""
NCSim_NCSIM_TIMESCALE                         := 1 ns / 1 ps
export NCSim_NCSIM_TIMESCALE
endif
ifeq "$(NCSim_NCSIM_SAIF_OPTIONS)" ""
NCSim_NCSIM_SAIF_OPTIONS                      := -verbose -overwrite -internal -hierarchy
export NCSim_NCSIM_SAIF_OPTIONS
endif
ifeq "$(NCSim_NCSIM_DOFILE)" ""
NCSim_NCSIM_DOFILE                            := 
export NCSim_NCSIM_DOFILE
endif
ifeq "$(OSCI_SYSTEMC_INCLUDE)" ""
OSCI_SYSTEMC_INCLUDE                          := /softl3/catapultc10_0a/64bit/Mgc_home/shared/include
export OSCI_SYSTEMC_INCLUDE
endif
ifeq "$(OSCI_SYSTEMC_LIB)" ""
OSCI_SYSTEMC_LIB                              := /softl3/catapultc10_0a/64bit/Mgc_home/shared/lib/$(CXX_OS)/$(CXX_TYPE)
export OSCI_SYSTEMC_LIB
endif
ifeq "$(OSCI_SYSTEMC_NAME)" ""
OSCI_SYSTEMC_NAME                             := systemc
export OSCI_SYSTEMC_NAME
endif
ifeq "$(OSCI_COMP_FLAGS)" ""
OSCI_COMP_FLAGS                               := -Wall -Wno-unknown-pragmas
export OSCI_COMP_FLAGS
endif
ifeq "$(OSCI_USE_32BIT_COMPILER)" ""
OSCI_USE_32BIT_COMPILER                       := false
export OSCI_USE_32BIT_COMPILER
endif
ifeq "$(OSCI_GDBGUI)" ""
OSCI_GDBGUI                                   := ddd
export OSCI_GDBGUI
endif
ifeq "$(OSCI_GCOV)" ""
OSCI_GCOV                                     := false
export OSCI_GCOV
endif
ifeq "$(OSCI_LCOVDIR)" ""
OSCI_LCOVDIR                                  := $(LCOVDIR)
export OSCI_LCOVDIR
endif
ifeq "$(Novas_NOVAS_INST_DIR)" ""
Novas_NOVAS_INST_DIR                          := $(NOVAS_INST_DIR)
export Novas_NOVAS_INST_DIR
endif
ifeq "$(Novas_NOVAS_PLATFORM)" ""
Novas_NOVAS_PLATFORM                          := LINUX
export Novas_NOVAS_PLATFORM
endif
ifeq "$(Novas_NOVAS_MSIM_PLI)" ""
Novas_NOVAS_MSIM_PLI                          := modelsim_fli61
export Novas_NOVAS_MSIM_PLI
endif
ifeq "$(Novas_NOVAS_NCSIM_VER)" ""
Novas_NOVAS_NCSIM_VER                         := nc57_vhdl
export Novas_NOVAS_NCSIM_VER
endif
ifeq "$(Novas_NOVAS_NCSIM_PLI)" ""
Novas_NOVAS_NCSIM_PLI                         := ncsc57/lib-linux_gcc3_23
export Novas_NOVAS_NCSIM_PLI
endif
ifeq "$(Novas_NOVAS_NCSIM_LDV)" ""
Novas_NOVAS_NCSIM_LDV                         := ius_vhpi_latest
export Novas_NOVAS_NCSIM_LDV
endif
ifeq "$(Novas_NOVAS_NCSIM_FSDBW)" ""
Novas_NOVAS_NCSIM_FSDBW                       := LINUX_GNU_296
export Novas_NOVAS_NCSIM_FSDBW
endif
ifeq "$(Valgrind_VALGRIND)" ""
Valgrind_VALGRIND                             := /usr/opt/bin/valgrind
export Valgrind_VALGRIND
endif
ifeq "$(Valgrind_VALGRIND_OPTS)" ""
Valgrind_VALGRIND_OPTS                        := --demangle=yes --leak-check=no --undef-value-errors=yes
export Valgrind_VALGRIND_OPTS
endif
ifeq "$(VCS_VCS_HOME)" ""
VCS_VCS_HOME                                  := $(VCS_HOME)
export VCS_VCS_HOME
endif
ifeq "$(VCS_FORCE_32BIT)" ""
VCS_FORCE_32BIT                               := 
export VCS_FORCE_32BIT
endif
ifeq "$(VCS_VG_GNU_PACKAGE)" ""
VCS_VG_GNU_PACKAGE                            := $(VG_GNU_PACKAGE)
export VCS_VG_GNU_PACKAGE
endif
ifeq "$(VCS_VG_ENV32_SCRIPT)" ""
VCS_VG_ENV32_SCRIPT                           := source_me_gcc452.csh
export VCS_VG_ENV32_SCRIPT
endif
ifeq "$(VCS_VG_ENV64_SCRIPT)" ""
VCS_VG_ENV64_SCRIPT                           := source_me_gcc452.csh
export VCS_VG_ENV64_SCRIPT
endif
ifeq "$(VCS_COMP_FLAGS)" ""
VCS_COMP_FLAGS                                := -g -Wall -Wno-unknown-pragmas
export VCS_COMP_FLAGS
endif
ifeq "$(VCS_VHDLAN_OPTS)" ""
VCS_VHDLAN_OPTS                               := 
export VCS_VHDLAN_OPTS
endif
ifeq "$(VCS_VLOGAN_OPTS)" ""
VCS_VLOGAN_OPTS                               := +v2k
export VCS_VLOGAN_OPTS
endif
ifeq "$(VCS_VCSELAB_OPTS)" ""
VCS_VCSELAB_OPTS                              := -debug_all -timescale=1ps/1ps -sysc=blocksync
export VCS_VCSELAB_OPTS
endif
ifeq "$(VCS_VCSSIM_OPTS)" ""
VCS_VCSSIM_OPTS                               := 
export VCS_VCSSIM_OPTS
endif
ifeq "$(VCS_VCS_GCC_VER)" ""
VCS_VCS_GCC_VER                               := 4.2.2
export VCS_VCS_GCC_VER
endif
ifeq "$(VCS_VCS_DOFILE)" ""
VCS_VCS_DOFILE                                := 
export VCS_VCS_DOFILE
endif
ifeq "$(VCS_SYSC_VERSION)" ""
VCS_SYSC_VERSION                              := 2.3
export VCS_SYSC_VERSION
endif
ifeq "$(VCS_LIC_QUEUE)" ""
VCS_LIC_QUEUE                                 := false
export VCS_LIC_QUEUE
endif
ifeq "$(VCS_ENABLE_CODE_COVERAGE)" ""
VCS_ENABLE_CODE_COVERAGE                      := false
export VCS_ENABLE_CODE_COVERAGE
endif
ifeq "$(SCVerify_RESET_CYCLES)" ""
SCVerify_RESET_CYCLES                         := 2
export SCVerify_RESET_CYCLES
endif
ifeq "$(SCVerify_SYNC_ALL_RESETS)" ""
SCVerify_SYNC_ALL_RESETS                      := true
export SCVerify_SYNC_ALL_RESETS
endif
ifeq "$(SCVerify_TB_STACKSIZE)" ""
SCVerify_TB_STACKSIZE                         := 64000000
export SCVerify_TB_STACKSIZE
endif
ifeq "$(SCVerify_INVOKE_ARGS)" ""
SCVerify_INVOKE_ARGS                          := 
export SCVerify_INVOKE_ARGS
endif
ifeq "$(SCVerify_REPLAY_ARGS)" ""
SCVerify_REPLAY_ARGS                          := 
export SCVerify_REPLAY_ARGS
endif
ifeq "$(SCVerify_MSIM_DEBUG)" ""
SCVerify_MSIM_DEBUG                           := false
export SCVerify_MSIM_DEBUG
endif
ifeq "$(SCVerify_MAX_ERROR_CNT)" ""
SCVerify_MAX_ERROR_CNT                        := 0
export SCVerify_MAX_ERROR_CNT
endif
ifeq "$(SCVerify_DEADLOCK_DETECTION)" ""
SCVerify_DEADLOCK_DETECTION                   := true
export SCVerify_DEADLOCK_DETECTION
endif
ifeq "$(SCVerify_MAX_DEADLOCK_TIMER)" ""
SCVerify_MAX_DEADLOCK_TIMER                   := 0
export SCVerify_MAX_DEADLOCK_TIMER
endif
ifeq "$(SCVerify_INCL_DIRS)" ""
SCVerify_INCL_DIRS                            := 
export SCVerify_INCL_DIRS
endif
ifeq "$(SCVerify_LINK_LIBPATHS)" ""
SCVerify_LINK_LIBPATHS                        := /usr/lib/usr/lib/x86_64-linux-gnu
export SCVerify_LINK_LIBPATHS
endif
ifeq "$(SCVerify_LINK_LIBNAMES)" ""
SCVerify_LINK_LIBNAMES                        := 
export SCVerify_LINK_LIBNAMES
endif
ifeq "$(SCVerify_USE_MSIM)" ""
SCVerify_USE_MSIM                             := true
export SCVerify_USE_MSIM
endif
ifeq "$(SCVerify_USE_OSCI)" ""
SCVerify_USE_OSCI                             := true
export SCVerify_USE_OSCI
endif
ifeq "$(SCVerify_USE_NCSIM)" ""
SCVerify_USE_NCSIM                            := false
export SCVerify_USE_NCSIM
endif
ifeq "$(SCVerify_USE_VCS)" ""
SCVerify_USE_VCS                              := false
export SCVerify_USE_VCS
endif
ifeq "$(SCVerify_DISABLE_EMPTY_INPUTS)" ""
SCVerify_DISABLE_EMPTY_INPUTS                 := false
export SCVerify_DISABLE_EMPTY_INPUTS
endif
ifeq "$(SCVerify_IDLE_SYNCHRONIZATION_MODE)" ""
SCVerify_IDLE_SYNCHRONIZATION_MODE            := false
export SCVerify_IDLE_SYNCHRONIZATION_MODE
endif
ifeq "$(SCVerify_MISMATCHED_OUTPUTS_ONLY)" ""
SCVerify_MISMATCHED_OUTPUTS_ONLY              := true
export SCVerify_MISMATCHED_OUTPUTS_ONLY
endif
ifeq "$(SCVerify_WAVE_PROBES)" ""
SCVerify_WAVE_PROBES                          := false
export SCVerify_WAVE_PROBES
endif
ifeq "$(SCVerify_OPTIMIZE_WRAPPERS)" ""
SCVerify_OPTIMIZE_WRAPPERS                    := false
export SCVerify_OPTIMIZE_WRAPPERS
endif
ifeq "$(SCVerify_GENERATE_STAGES)" ""
SCVerify_GENERATE_STAGES                      := schedule extract switching power
export SCVerify_GENERATE_STAGES
endif
ifeq "$(SCVerify_USE_CCS_BLOCK)" ""
SCVerify_USE_CCS_BLOCK                        := false
export SCVerify_USE_CCS_BLOCK
endif
ifeq "$(SCVerify_AUTOWAIT)" ""
SCVerify_AUTOWAIT                             := 0
export SCVerify_AUTOWAIT
endif
ifeq "$(SCVerify_ENABLE_STALL_TOGGLE)" ""
SCVerify_ENABLE_STALL_TOGGLE                  := false
export SCVerify_ENABLE_STALL_TOGGLE
endif
ifeq "$(SCVerify_USE_VISTA)" ""
SCVerify_USE_VISTA                            := false
export SCVerify_USE_VISTA
endif
ifeq "$(SCVerify_ENABLE_REPLAY_VERIFICATION)" ""
SCVerify_ENABLE_REPLAY_VERIFICATION           := false
export SCVerify_ENABLE_REPLAY_VERIFICATION
endif
ifeq "$(SCVerify_ENABLE_CPP_SCVERIFY_TOP)" ""
SCVerify_ENABLE_CPP_SCVERIFY_TOP              := true
export SCVerify_ENABLE_CPP_SCVERIFY_TOP
endif
ifeq "$(Precision_Path)" ""
Precision_Path                                := /softslin/precision2014a_64b/Mgc_home/bin
export Precision_Path
endif
ifeq "$(Precision_Flags)" ""
Precision_Flags                               := 
export Precision_Flags
endif
ifeq "$(Precision_addio)" ""
Precision_addio                               := true
export Precision_addio
endif
ifeq "$(Precision_retiming)" ""
Precision_retiming                            := false
export Precision_retiming
endif
ifeq "$(Precision_run_pnr)" ""
Precision_run_pnr                             := false
export Precision_run_pnr
endif
ifeq "$(Precision_newgui)" ""
Precision_newgui                              := true
export Precision_newgui
endif
ifeq "$(Precision_rtlplus)" ""
Precision_rtlplus                             := false
export Precision_rtlplus
endif
ifeq "$(Precision_OutputEDIF)" ""
Precision_OutputEDIF                          := true
export Precision_OutputEDIF
endif
ifeq "$(Precision_bottom_up_flow)" ""
Precision_bottom_up_flow                      := false
export Precision_bottom_up_flow
endif
ifeq "$(Precision_PlaceAndRouteInstallPath)" ""
Precision_PlaceAndRouteInstallPath            := 
export Precision_PlaceAndRouteInstallPath
endif
ifeq "$(Precision_TimingReportingMode)" ""
Precision_TimingReportingMode                 := p2p
export Precision_TimingReportingMode
endif
ifeq "$(Precision_EnableClockGating)" ""
Precision_EnableClockGating                   := false
export Precision_EnableClockGating
endif
ifeq "$(Precision_ConstraintsMode)" ""
Precision_ConstraintsMode                     := wildcard
export Precision_ConstraintsMode
endif
ifeq "$(Xilinx_XILINX)" ""
Xilinx_XILINX                                 := /softl2/XILINX/ise_edk_147i/14.7/ISE_DS/ISE
export Xilinx_XILINX
endif
ifeq "$(Xilinx_XILINX_LIB)" ""
Xilinx_XILINX_LIB                             := $(XILINX_LIB)
export Xilinx_XILINX_LIB
endif
ifeq "$(Xilinx_XILINX_VHDL_LIB)" ""
Xilinx_XILINX_VHDL_LIB                        := 
export Xilinx_XILINX_VHDL_LIB
endif
ifeq "$(Xilinx_XILINX_VERILOG_LIB)" ""
Xilinx_XILINX_VERILOG_LIB                     := 
export Xilinx_XILINX_VERILOG_LIB
endif
ifeq "$(Xilinx_XILINX_SIM_LIBS)" ""
Xilinx_XILINX_SIM_LIBS                        := 
export Xilinx_XILINX_SIM_LIBS
endif
ifeq "$(Xilinx_NEW_SIMLIB_FLOW)" ""
Xilinx_NEW_SIMLIB_FLOW                        := false
export Xilinx_NEW_SIMLIB_FLOW
endif
ifeq "$(Xilinx_COMPXLIB_DIR)" ""
Xilinx_COMPXLIB_DIR                           := 
export Xilinx_COMPXLIB_DIR
endif
ifeq "$(Xilinx_SIMLIBS_V)" ""
Xilinx_SIMLIBS_V                              := 
export Xilinx_SIMLIBS_V
endif
ifeq "$(Xilinx_SIMLIBS_VHD)" ""
Xilinx_SIMLIBS_VHD                            := 
export Xilinx_SIMLIBS_VHD
endif
ifeq "$(Xilinx_BITGEN)" ""
Xilinx_BITGEN                                 := false
export Xilinx_BITGEN
endif
ifeq "$(LINK_LIBPATHS)" ""
LINK_LIBPATHS                                 := /usr/lib /usr/lib/x86_64-linux-gnu
export LINK_LIBPATHS
endif
ifeq "$(LINK_LIBNAMES)" ""
LINK_LIBNAMES                                 := 
export LINK_LIBNAMES
endif
ifeq "$(MODEL_TECH)" ""
MODEL_TECH                                    := /softslin/modelsim10_2c/modeltech/linux
export MODEL_TECH
endif
ifeq "$(INCL_DIRS)" ""
INCL_DIRS                                     := 
export INCL_DIRS
endif
