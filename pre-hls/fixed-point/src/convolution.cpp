#include "convolution.h"

Convolution::Convolution(const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true, AC_RND_ZERO> *kernel,
                         const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true, AC_RND_ZERO> *bias,
                         const int number_of_kernels,
                         const int input_size,
                         const int input_depth)
:	kernel(kernel),
  bias(bias),
	number_of_kernels(number_of_kernels),
	input_size(input_size),
	input_depth(input_depth)
{
   	output_size = ((input_size - KERNEL_SIZE + 2 * ZERO_PADDING) / STRIDE) + 1;
}

Convolution::~Convolution()
{
}
