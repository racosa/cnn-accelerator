#include <iostream>
#include "relu.h"
#include "convolution.h"

/*
	multidim array https://www.tutorialspoint.com/cplusplus/cpp_multi_dimensional_arrays.htm

	3D to 1D:
		3D: array[x][y][z] x: row (height), y: column (width), z: depth (HWC)
		1D: array[x*width*depth + y*depth + z] = array[x][y][z]

	index from 1D to 3D:
		height_index=index/(width*depth);  //This is x
		width_index=(index-height_index*width*depth)/depth; //This is y
		depth_index=index-width_index*height*depth- height_index*depth;//This is z
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

	float kernel[3][3] = {{0, 0, 0},
							{0, 1, 0},
							{0, 0, 0}};
	float kernel_flat[9];
	unsigned int kernel_size = 3;
	unsigned int number_of_kernels = 1;
	unsigned int input_size = 5;
	unsigned int stride = 1;
	unsigned int input_depth = 1;
	unsigned int zero_padding = 0;
	float bias[1] = {0};

	std::cout << "kernel flat" << std::endl;
	for (unsigned int y = 0; y < 3; y++) {
		for (unsigned int x = 0; x < 3; x++) {
			kernel_flat[y * 3 + x] = kernel[y][x];
			std::cout << kernel_flat[y * 3 + x] << " ";
		}
	std::cout << std::endl;
	}


	float input[25];
	for (unsigned int i = 0; i < 25; i++) {
		input[i] = i;
	}

	float output[9];

	Convolution conv(kernel_flat, kernel_size, number_of_kernels, input_size, stride, input_depth, zero_padding, bias);

	conv.conv_layer(input, output);

	std::cout << "output" << std::endl;
	for (unsigned int y = 0; y < 3; y++) {
		for (unsigned int x = 0; x < 3; x++) {
			std::cout << output[y * 3 + x] << " ";
		}
	std::cout << std::endl;
	}

	return 0;
}
