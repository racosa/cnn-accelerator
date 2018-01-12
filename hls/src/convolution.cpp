#include "convolution.h"
#include <iostream>


Convolution::Convolution(float *kernel,
	unsigned int kernel_size,
	unsigned int number_of_kernels,
	unsigned int input_size,
	unsigned int stride,
	unsigned int input_depth,
	unsigned int zero_padding,
	float* bias)
:	kernel(kernel),
	kernel_size(kernel_size),
	number_of_kernels(number_of_kernels),
	input_size(input_size),
	stride(stride),
	input_depth(input_depth),
	zero_padding(zero_padding),
	bias(bias)
{
	output_size = ((input_size - kernel_size + 2 * zero_padding) / stride) + 1;
}


Convolution::~Convolution()
{
}


void Convolution::conv_layer(float input[], float output[]) {

	unsigned int o_x = 0;
	unsigned int o_y = 0;
	
	for (unsigned int i = 0; i < number_of_kernels; i++){ // kernel
		/*for (unsigned int o_y = 0; o_y < output_size; o_y++) { // output_height
			for (unsigned int o_x = 0; o_x < output_size; o_x++) { // output_width*/
				output[o_x*output_size*number_of_kernels + o_y*number_of_kernels + i] = 0;
				for (unsigned int j = 0; j < input_depth; j++) { // input and kernel depth
					for (unsigned int k = 0; k < input_size-kernel_size; k+=stride) { // input height
						for (unsigned int l = 0; l < input_size-kernel_size; l+=stride) { // input width
							for (unsigned int y = 0; y < kernel_size; y++) { // kernel height
								for (unsigned int x = 0; x < kernel_size; x++) { // kernel width
									// input[l+x][k+y][j]*kernel[x][y][j]
									output[o_x*output_size*number_of_kernels + o_y*number_of_kernels + i] += input[(l+x)*input_size*input_depth+(k+y)*input_depth+j]*kernel[x*kernel_size*input_depth + y*input_depth + j]+bias[i];
									//std::cout << output[o_x*output_size*number_of_kernels + o_y*number_of_kernels + i] << std::endl;
								}
							//std::cout << "end" << std::endl;
							}
						o_x+=1;}
					o_y+=1;}
				o_x=0;
				o_y=0;}
				if (output[o_x*output_size*number_of_kernels + o_y*number_of_kernels + i] < 0) output[o_x*output_size*number_of_kernels + o_y*number_of_kernels + i] = 0;
			//}
		//}
	}

}
