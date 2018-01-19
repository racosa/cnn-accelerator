#ifndef _CONVOLUTION_H_
#define _CONVOLUTION_H_

#include "ac_fixed.h"
#include "kernel.h"

#define NB_KERNELS 3

#define INPUT_SIZE 160 //temporary
#define INPUT_SIZE_X 160
#define INPUT_SIZE_Y 120
#define INPUT_DEPTH 3

#define OUTPUT_SIZE 160 //temporary
#define OUTPUT_SIZE_X 160
#define OUTPUT_SIZE_Y 120 

#define KERNEL_SIZE 3
#define STRIDE 1
#define ZERO_PADDING 1

#define IMAGE_W 8
#define IMAGE_I 8
#define IN_W 8
#define IN_I 8
#define OUT_W 8
#define OUT_I 8

void apply_conv1(ac_fixed<IN_W, IN_I, false> input[], ac_fixed<OUT_W, OUT_I, false> output[]);

#endif /* _CONVOLUTION_H_ */
