/*#include <iostream>
#include <png.h>*/

#include <stdlib.h> 
#include <time.h>

#include "relu.h"

int main(){
    
	unsigned int height = 5;
	unsigned int width = 5;
	unsigned int depth = 3;

	std::array<std::array<std::array <float, depth> width> height> input;
	std::array<std::array<std::array <float, depth> width> height> output;

	unsigned int x, y, z;

	for(z = 0; z < depth; z++) {
		for (y = 0; y < width; y++) {
			for (x = 0; x < height; x++) {
					input[x][y][z] = ((float)rand())/RAND_MAX * 100.0 - 50.0;
					/*std::cout << input[x][y][z] << std::endl;*/
			}
		}
	}

	Relu relu(height, width, depth);

	output = relu.relu_layer(input);

	/*for(z = 0; z < depth; z++) {
		for (y = 0; y < width; y++) {
			for (x = 0; x < height; x++) {
					std::cout << output[x][y][z] << std::endl;
			}
		}
	}*/

    return 0;
}
