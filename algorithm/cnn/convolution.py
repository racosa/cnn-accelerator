import numpy as np

class Convolution(object):
    def __init__(self, kernel, kernel_size, number_of_kernels, input_size,
                 input_depth, stride, zero_padding, biases):
        self.kernel = kernel
        self.kernel_size = kernel_size
        self.number_of_kernels = number_of_kernels
        self.input_size = input_size
        self.stride = stride
        self.input_depth = input_depth
        self.zero_padding = zero_padding
        self.output_size = ((input_size - kernel_size + 2*zero_padding)//stride) + 1
        self.biases = biases
        
    def convolve(self, input):
        output = np.zeros((self.output_size,self.output_size, self.number_of_kernels))

        padded_input = np.zeros((input.shape[0] + 2*self.zero_padding,
                                 input.shape[1] + 2*self.zero_padding,
                                 self.input_depth))

        padded_input[self.zero_padding:input.shape[0]+self.zero_padding,
                     self.zero_padding:input.shape[1]+self.zero_padding,
                     :] = input 
    
        for z in range(self.number_of_kernels):
            for y in range(self.output_size):
                for x in range(self.output_size):
                    output[x][y][z] = np.sum(
                        padded_input[x*self.stride : x*self.stride + self.kernel_size,
                                     y*self.stride : y*self.stride + self.kernel_size,
                                     :] * self.kernel[z][:, :, :] ) + self.biases[z]
                    #print('x: ', x, 'y: ', y)
                    #print(output)
        return output
