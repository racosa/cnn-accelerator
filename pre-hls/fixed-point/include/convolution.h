#ifndef _CONVOLUTION_H_
#define _CONVOLUTION_H_

#define KERNEL_SIZE 3
#define STRIDE 1
#define ZERO_PADDING 1

class Convolution {
private:
	const float* kernel;
  const float* bias;
	const int number_of_kernels;
	const int input_size;
	const int input_depth;
	unsigned int output_size;

public:
	Convolution(const float* kernel,
  	const float* bias,
    const int number_of_kernels,
    const int input_size,
    const int input_depth);
	~Convolution();
	void conv_layer(float input[], float output[]);
};

#endif /* _CONVOLUTION_H_ */
