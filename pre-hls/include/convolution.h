#ifndef _CONVOLUTION_H_
#define _CONVOLUTION_H_

class Convolution {
private:
	const float *kernel;
        const float* bias;
        int kernel_size;
	int number_of_kernels;
	int input_size;
	int stride;
	int input_depth;
	int zero_padding;
	int output_size;
       
public:
	Convolution(const float *kernel,
                    const float* bias,
		    int kernel_size,
		    int number_of_kernels,
		    int input_size,
		    int stride,
		    int input_depth,
		    int zero_padding);
	~Convolution();
	void conv_layer(float input[], float output[]);
};

#endif /* _CONVOLUTION_H_ */
