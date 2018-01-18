#ifndef _CONVOLUTION_H_
#define _CONVOLUTION_H_

#include "fixed_point.h"

#define KERNEL_SIZE 3
#define STRIDE 1
#define ZERO_PADDING 1

class Convolution {
private:
	const ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true>* kernel;
  const ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true>* bias;
	const int number_of_kernels;
	const int input_size;
	const int input_depth;
	unsigned int output_size;

public:
	Convolution(const ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true>* kernel,
  	const ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true>* bias,
    const int number_of_kernels,
    const int input_size,
    const int input_depth);
	~Convolution();
	void conv_layer(ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true> input[], ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true> output[]);
};

#endif /* _CONVOLUTION_H_ */
