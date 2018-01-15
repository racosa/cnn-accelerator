#include <iostream>
#include "relu.h"
#include "convolution.h"
#include "maxpool.h"
#include "fc.h"

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
	float kernel[27+27+27] = {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
													0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0,
													0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0};
	//float kernel_flat[9];
	unsigned int kernel_size = 3;
	unsigned int number_of_kernels = 3;
	unsigned int input_size = 5;
	unsigned int stride = 1;
	unsigned int input_depth = 3;
	unsigned int zero_padding = 1;
	float bias[3] = {1, 1 ,1};*/

	/*std::cout << "kernel flat" << std::endl;
	for (unsigned int y = 0; y < kernel_size; y++) {
		for (unsigned int x = 0; x < kernel_size; x++) {
			kernel_flat[y * kernel_size + x] = kernel[y][x];
			std::cout << kernel_flat[y * kernel_size + x] << " ";
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;*/


	//float input[5*5*3];
	/*for (unsigned int i = 0; i < 5*5*3; i++) {
		input[i] = (float)i;
	}*/

	/*std::cout << "input" << std::endl;
	for (unsigned int z = 0; z < input_depth; z++) {
		for (unsigned int y = 0; y < input_size; y++) {
			for (unsigned int x = 0; x < input_size; x++) {
				std::cout << input[z*input_size*input_size + y*input_size + x] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}

	float output[5*5*3];

	Convolution conv(kernel, kernel_size, number_of_kernels, input_size, stride, input_depth, zero_padding, bias);

	conv.conv_layer(input, output);*/

	/*std::cout << "output" << std::endl;
	for (unsigned int y = 0; y < 5; y++) {
		for (unsigned int x = 0; x < 5; x++) {
			std::cout << output[y * 5 + x] << " ";
		}
		std::cout << std::endl;
	}*/

	/*std::cout << "output" << std::endl;
	for (unsigned int z = 0; z < 3; z++) {
		for (unsigned int y = 0; y < 5; y++) {
			for (unsigned int x = 0; x < 5; x++) {
				std::cout << output[z*5*5 + y*5 + x] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}*/

	/*// maxpool test
	float input[36];
	for (unsigned int i = 0; i < 36; i++) {
		input[i] = (float)i;
	}

	std::cout << "input" << std::endl;
	for (unsigned int y = 0; y < 6; y++) {
		for (unsigned int x = 0; x < 6; x++) {
			std::cout << input[y * 6 + x] << " ";
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;

	float output[16];

	unsigned int maxpool_size = 3;
  unsigned int maxpool_stride = 2;
  unsigned int input_size = 6;
  unsigned int input_depth = 1;
	unsigned int zero_padding = 3;

	Maxpool maxpool(maxpool_size, maxpool_stride, input_size, input_depth, zero_padding);

	maxpool.maxpool_layer(input, output);

	std::cout << "output" << std::endl;
	for (unsigned int y = 0; y < 4; y++) {
		for (unsigned int x = 0; x < 4; x++) {
			std::cout << output[y * 4 + x] << " ";
		}
		std::cout << std::endl;
	}*/

	// reshape test

	int input[20][3][3];

	for (unsigned int d = 0; d < 20; d++) {
		for (unsigned int r = 0; r < 3; r++) {
			for (unsigned int c = 0; c < 3; c++) {
				input[d][r][c] = d*9+r*3+c;
			}
		}
	}

	std::cout << "input" << std::endl;
	for (unsigned int d = 0; d < 20; d++) {
		for (unsigned int r = 0; r < 3; r++) {
			for (unsigned int c = 0; c < 3; c++) {
				std::cout << input[d][r][c] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}

	float flat_input[20*3*3];

	for (unsigned int d = 0; d < 20; d++) {
		for (unsigned int r = 0; r < 3; r++) {
			for (unsigned int c = 0; c < 3; c++) {
				flat_input[d*9 + r*3 + c] = (float)input[d][r][c];
			}
		}
	}

	std::cout << "flat_input" << std::endl;
	for (unsigned int d = 0; d < 20; d++) {
		for (unsigned int r = 0; r < 3; r++) {
			for (unsigned int c = 0; c < 3; c++) {
				std::cout << flat_input[d*9 + r*3 + c] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}

	float r_output[180];

	reshape(flat_input, r_output);

	// reshape output
	int sum_output = 0;
	for (unsigned int i = 0; i < 180; i++) { std::cout << r_output[i] << " "; sum_output+=r_output[i]; }
	std::cout << std::endl << std::endl;
	std::cout << sum_output << std::endl << std::endl;

	float matrix[1800];
	for (unsigned int r = 0; r < 180; r++) {
		for (unsigned int c = 0; c < 10; c++) {
			matrix[r*10+c] = 1;
		}
	}

	for (unsigned int r = 0; r < 180; r++) {
		for (unsigned int c = 0; c < 10; c++) {
			std::cout << matrix[r*10+c] << " ";
		}
		std::cout << std::endl;
	}

	float bias[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

	float fc_output[10];

	fully_connected(r_output, matrix, fc_output, bias);

	for (unsigned int i = 0; i < 10; i++) std::cout << fc_output[i] << " ";
	std::cout << std::endl;

	return 0;
}
