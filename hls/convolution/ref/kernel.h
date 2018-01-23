#include "ac_fixed.h"

#define KERNEL_W 4
#define KERNEL_I 4

typedef const ac_fixed<KERNEL_W, KERNEL_I, true> kernel_t;

extern kernel_t kernel[];
extern kernel_t bias[];
