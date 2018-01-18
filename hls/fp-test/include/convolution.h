#ifndef _CONVOLUTION_H_
#define _CONVOLUTION_H_

#include "../include/fixed_point.h"

#define KERNEL_SIZE 3
#define STRIDE 1
#define ZERO_PADDING 1

class Convolution {
private:
	const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true>* kernel;
  const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true>* bias;
	const int number_of_kernels;
	const int input_size;
	const int input_depth;
	unsigned int output_size;

public:
	Convolution(const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true>* kernel,
  	const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true>* bias,
    const int number_of_kernels,
    const int input_size,
    const int input_depth);
	~Convolution();
	
	template <typename IP, typename OP>
	void conv_layer(IP input[], OP output[]);
};
//It must be included after class declaration
#include "../src/convolution_impl.h"

#endif /* _CONVOLUTION_H_ */
