#include "../include/fixed_point.h"

void reshape(ac_fixed<FIXP_MAXPOOL_W, FIXP_MAXPOOL_I, true> input[], ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true> output[]);
void fully_connected(ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true> input[], const ac_fixed<FIXP_FC_W, FIXP_FC_I, true> matrix[], ac_fixed<FIXP_FC_W, FIXP_FC_I, true> output[], const ac_fixed<FIXP_FC_W, FIXP_FC_I, true> bias[]);
