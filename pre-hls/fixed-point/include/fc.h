#include "../lib/ac_fixed.h"

void reshape(ac_fixed<16,3,true> input[], ac_fixed<16,3,true> output[]);
void fully_connected(ac_fixed<16,3,true> input[], const ac_fixed<16,3,true> matrix[], ac_fixed<16,3,true> output[], const ac_fixed<16,3,true> bias[]);
