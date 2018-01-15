#include <iostream>
#include "relu.h"
#include "convolution.h"
#include "maxpool.h"

/*

        Array format : HxWxC (Height x Width x Depth) => array[r][c][d] r: row, c: column, d:depth
        3D to 1D: array[r][c][d] => array[d*W*C + r*W + c]

 */

int main()
{
	//std::cout << "Hello world!" << std::endl;

	/*float input[3][3][2];
	   float flat_input[18];
	   unsigned int x = 0;
	   unsigned int y = 0;
	   unsigned int z = 0;

	   for (z = 0; z < 2; z++) {
	        for (y = 0; y < 3; y++) {
	                for (x = 0; x < 3; x++) {
	                        input[y][x][z] = ((float)rand()) / RAND_MAX * 100.0 - 50.0;
	                        flat_input[x * 3 * 2 + y * 2 + z] = input[y][x][z];
	                }
	        }
	   }

	   std::cout << "input" << std::endl;
	   for (z = 0; z < 2; z++) {
	        for (y = 0; y < 3; y++) {
	                for (x = 0; x < 3; x++) {
	                        std::cout << input[y][x][z] << " ";
	                }
	                std::cout << std::endl;
	        }
	        std::cout << std::endl;
	   }

	   std::cout << "flat" << std::endl;
	   for (z = 0; z < 2; z++) {
	        for (y = 0; y < 3; y++) {
	                for (x = 0; x < 3; x++) {
	                        std::cout << flat_input[x * 3 * 2 + y * 2 + z] << " ";
	                }
	                std::cout << std::endl;
	        }
	        std::cout << std::endl;
	   }

	   Relu relu(3, 2);

	   relu.relu_layer(flat_input);

	   std::cout << "relu flat" << std::endl;
	   for (z = 0; z < 2; z++) {
	        for (y = 0; y < 3; y++) {
	                for (x = 0; x < 3; x++) {
	                        std::cout << flat_input[x * 3 * 2 + y * 2 + z] << " ";
	                }
	                std::cout << std::endl;
	        }
	        std::cout << std::endl;
	   }*/


	/*// conv test
	float kernel[3][3] = {{0, 0, 0},
			      {0, 1, 0},
			      {0, 0, 0}};
	float kernel_flat[9];
	unsigned int kernel_size = 3;
	unsigned int number_of_kernels = 1;
	unsigned int input_size = 5;
	unsigned int stride = 1;
	unsigned int input_depth = 1;
	unsigned int zero_padding = 1;
	float bias[1] = {30};

	std::cout << "kernel flat" << std::endl;
	for (unsigned int y = 0; y < kernel_size; y++) {
		for (unsigned int x = 0; x < kernel_size; x++) {
			kernel_flat[y * kernel_size + x] = kernel[y][x];
			std::cout << kernel_flat[y * kernel_size + x] << " ";
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;


	float input[25];
	for (unsigned int i = 0; i < 25; i++) {
		input[i] = 1.1;
	}

	std::cout << "input" << std::endl;
	for (unsigned int y = 0; y < input_size; y++) {
		for (unsigned int x = 0; x < input_size; x++) {
			std::cout << input[y * input_size + x] << " ";
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;

	float output[25];

	Convolution conv(kernel_flat, kernel_size, number_of_kernels, input_size, stride, input_depth, zero_padding, bias);

	conv.conv_layer(input, output);

	std::cout << "output" << std::endl;
	for (unsigned int y = 0; y < 5; y++) {
		for (unsigned int x = 0; x < 5; x++) {
			std::cout << output[y * 5 + x] << " ";
		}
		std::cout << std::endl;
	}*/

	// maxpool test
	float input[25];
	for (unsigned int i = 0; i < 25; i++) {
		input[i] = (float)i;
	}

	std::cout << "input" << std::endl;
	for (unsigned int y = 0; y < 5; y++) {
		for (unsigned int x = 0; x < 5; x++) {
			std::cout << input[y * 5 + x] << " ";
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;

	float output[4];

	Maxpool maxpool(3, 2, 5, 1);

	maxpool.maxpool_layer(input, output);

	std::cout << "output" << std::endl;
	for (unsigned int y = 0; y < 2; y++) {
		for (unsigned int x = 0; x < 2; x++) {
			std::cout << output[y * 2 + x] << " ";
		}
		std::cout << std::endl;
	}

	return 0;
}
