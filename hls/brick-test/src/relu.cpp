#include "relu.h"

Relu::Relu(unsigned int input_size, unsigned int input_depth)
	: input_size(input_size),
	input_depth(input_depth)
{
}


Relu::~Relu()
{
}

void Relu::relu_layer(float input[]) {
	for (unsigned int i = 0; i < input_size*input_size*input_depth; i++) {
		if (input[i] < 0)
			input[i] = 0;
	}
}