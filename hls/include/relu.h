#ifndef _RELU_HPP_
#define _RELU_HPP_

#include "ac_fixed.h"
#include <array>

class Relu
{
private:
    unsigned int height, width, depth; // x, y, z

public:
    Relu(unsigned int height,
	unsigned int width,
	unsigned int depth);
    ~Relu();
	std::array<std::array<std::array <float, depth> width> height> relu_layer(std::array<std::array<std::array <float, depth> width> height> input);
};

#endif /* _RELU_HPP_ */
