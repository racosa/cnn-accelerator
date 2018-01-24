void mc_testbench_capture_IN( ac_fixed<10, 10, true, AC_TRN, AC_WRAP > conv_in[57600],  ac_fixed<11, 11, true, AC_TRN, AC_WRAP > conv_out[57600]) { testbench::capture_IN(conv_in,conv_out); }
void mc_testbench_capture_OUT( ac_fixed<10, 10, true, AC_TRN, AC_WRAP > conv_in[57600],  ac_fixed<11, 11, true, AC_TRN, AC_WRAP > conv_out[57600]) { testbench::capture_OUT(conv_in,conv_out); }
void mc_testbench_wait_for_idle_sync() {testbench::wait_for_idle_sync(); }
