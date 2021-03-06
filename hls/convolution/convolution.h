/* convolution.h
 */

#ifndef _CONVOLUTION_H_
#define _CONVOLUTION_H_

#include "ac_fixed.h"
#include "kernel.h"

#define DATA_SIZE 57600
#define DATA_SIZE_OUT 76800


#define INPUT_SIZE_X 160
#define INPUT_SIZE_Y 120
#define INPUT_DEPTH 3

#define OUTPUT_SIZE_X 160
#define OUTPUT_SIZE_Y 120
#define NB_KERNELS 3
#define KERNEL_SIZE 3
#define STRIDE 1
#define ZERO_PADDING 1

#define IN_W 8
#define IN_I 8
#define OUT_W 8
#define OUT_I 8

typedef ac_fixed<IN_W, IN_I, false> in_t;
typedef ac_fixed<OUT_W, OUT_I, false> out_t;
typedef ac_fixed<12, 8, false> temp_t;

void apply_conv(in_t conv_in[DATA_SIZE],
		out_t conv_out[DATA_SIZE_OUT]);

#endif /* _CONVOLUTION_H_ */
