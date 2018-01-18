#ifndef _RELU_H_
#define _RELU_H_

class Relu
{
private:
	unsigned int input_size;
	unsigned int input_depth;
public:
	Relu(unsigned int input_size, unsigned int input_depth);
	~Relu();
	void relu_layer(float input[]);
};

#endif /* _RELU_H_ */