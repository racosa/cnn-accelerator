#include "ac_fixed.h"

#define KERNEL_W 10
#define KERNEL_I 10

typedef const ac_fixed<KERNEL_W, KERNEL_I, false> kernel_t;

extern kernel_t kernel[];
extern kernel_t bias[];
