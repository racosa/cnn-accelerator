-makelib ies/xil_defaultlib -sv \
  "/softslin/vivado_17.1/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/softslin/vivado_17.1/Vivado/2017.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "/softl2/XILINX/vivado_17.1/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/blk_mem_gen_v8_3_6 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_3.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../ZyboVGARAMProc.srcs/sources_1/ip/blk_mem_mire_out/sim/blk_mem_mire_out.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

