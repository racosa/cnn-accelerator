#ifndef _CONVOLUTION_H_
#define _CONVOLUTION_H_

class Convolution
{
private:
	float *kernel;
	unsigned int kernel_size;
	unsigned int number_of_kernels;
	unsigned int input_size;
	unsigned int stride;
	unsigned int input_depth;
	unsigned int zero_padding;
	unsigned int output_size;
	float* bias;

public:
	Convolution(float *kernel,
		unsigned int kernel_size,
		unsigned int number_of_kernels,
		unsigned int input_size,
		unsigned int stride,
		unsigned int input_depth,
		unsigned int zero_padding,
		float* bias);
	~Convolution();
	void conv_layer(float input[], float output[]);
};

#endif /* _CONVOLUTION_H_ */
