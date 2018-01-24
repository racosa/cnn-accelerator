// ccs_block_macros.h
#include "mc_testbench.h"
extern void mc_testbench_capture_IN( ac_fixed<10, 10, true, AC_TRN, AC_WRAP > conv_in[57600],  ac_fixed<11, 11, true, AC_TRN, AC_WRAP > conv_out[57600]);
extern void mc_testbench_capture_OUT( ac_fixed<10, 10, true, AC_TRN, AC_WRAP > conv_in[57600],  ac_fixed<11, 11, true, AC_TRN, AC_WRAP > conv_out[57600]);
extern void mc_testbench_wait_for_idle_sync();
#ifdef CCS_DESIGN_FUNC_apply_conv
#define ccs_intercept_apply_conv_7 \
  ccs_real_apply_conv(ac_fixed<10, 10, true, AC_TRN, AC_WRAP > conv_in[57600],ac_fixed<11, 11, true, AC_TRN, AC_WRAP > conv_out[57600]);\
  void apply_conv(ac_fixed<10, 10, true, AC_TRN, AC_WRAP > conv_in[57600],ac_fixed<11, 11, true, AC_TRN, AC_WRAP > conv_out[57600])\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'apply_conv' for RTL block 'apply_conv'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(conv_in,conv_out);\
    ccs_real_apply_conv(conv_in,conv_out);\
    mc_testbench_capture_OUT(conv_in,conv_out);\
}\
  void ccs_real_apply_conv
#else
#define ccs_intercept_apply_conv_7 apply_conv
#endif
