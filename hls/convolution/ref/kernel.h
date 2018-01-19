#include "ac_fixed.h"

#define KERNEL_W 9
#define KERNEL_I 3

extern const ac_fixed<KERNEL_W, KERNEL_I, true> kernel[];
extern const ac_fixed<KERNEL_W, KERNEL_I, true> bias[];
