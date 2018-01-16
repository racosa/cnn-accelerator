#ifndef _CONVOLUTION_H_
#define _CONVOLUTION_H_

#define KERNEL_SIZE 3
#define STRIDE 1
#define ZERO_PADDING 1

#include "../lib/ac_fixed.h"

class Convolution {
private:
        const ac_fixed<16,3,true> *kernel;
        const ac_fixed<16,3,true> *bias;
	const int number_of_kernels;
	const int input_size;
	const int input_depth;
	unsigned int output_size;

public:
	Convolution(const ac_fixed<16,3,true>* kernel,
  	const ac_fixed<16,3,true>* bias,
    const int number_of_kernels,
    const int input_size,
    const int input_depth);
	~Convolution();
	void conv_layer(ac_fixed<16,3,true> input[], ac_fixed<16,3,true> output[]);
};

#endif /* _CONVOLUTION_H_ */
