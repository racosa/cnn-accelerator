# This Catapult LB script has been generated to expand the characterization range(es)
# of components of the Catapult base library(ies) to fit the current design
# 
# Running this script is optional but using the updated library should result in improved correlation.
# 
# Run this script in Catapult LB with the base library loaded or uncomment the "library load" command(s)
#library load /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/siflibs/psr2014a/mgc_Xilinx-ARTIX-7-2_beh_psr.lib
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/width_a -- -CHAR_RANGE {4, 8 to 32 by 8}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/signd_a -- -CHAR_RANGE {0, 1 to 1}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/width_b -- -CHAR_RANGE {4, 8 to 32 by 8}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/signd_b -- -CHAR_RANGE {0, 1 to 1}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/width_z -- -CHAR_RANGE {4, 16 to 64 by 8}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/enable_active -- -CHAR_RANGE {0, 1 to 1}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/a_rst_active -- -CHAR_RANGE {0, 1 to 1}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/s_rst_active -- -CHAR_RANGE {0 to 0, 1}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mul_pipe/PARAMETERS/stages -- -CHAR_RANGE {2 to 6 by 2, 7}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mux1hot/PARAMETERS/ctrlw -- -CHAR_RANGE {1, 4 to 32}
library set /LIBS/mgc_Xilinx-ARTIX-7-2_beh_psr/MODS/mgc_mux1hot/PARAMETERS/width -- -CHAR_RANGE {1, 4 to 32}
# The "library characterize" command below requires that: 
#   1. characterization directory set in the library exists and write accessible;
#   2. paths to technology libraries are set to correct locations;
#   3. the downstream tool used to characterize the library is available;
library characterize
