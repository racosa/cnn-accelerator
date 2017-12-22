#ifndef _RELU_HPP_
#define _RELU_HPP_

#include "ac_fixed.h"
#include <vector>

class Relu
{
private:
    unsigned int height, width, depth; // x, y, z

public:
    Relu(unsigned int height,
	unsigned int width,
	unsigned int depth);
    ~Relu();
	std::vector<std::vector<std::vector <float>>> relu_layer(std::vector<std::vector<std::vector <float> >> input);
};

#endif /* _RELU_HPP_ */
