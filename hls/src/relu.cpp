#include "../include/relu.h"

Relu::Relu(unsigned int height,
	unsigned int width,
	unsigned int depth)
:	height(height),
	width(width),
	depth(depth)
{}

Relu::~Relu() {}

std::array<std::array<std::array <float> > > Relu::relu_layer(std::array<std::vearrayctor<std::array <float> > > input) {
	std::array<std::array<std::array <float, depth> width> height> array3D;

	unsigned int x, y, z;

	for(z = 0; z < depth; z++) {
		for (y = 0; y < width; y++) {
			for (x = 0; x < height; x++) {
				if (input[x][y][z] < 0)
					array3D[x][y][z] = 0;
				else
					array3D[x][y][z] = input[x][y][z];
			}
		}
	}

	return array3D;
}
