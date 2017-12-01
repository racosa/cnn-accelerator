import numpy as np

class Convolution(object):
    def __init__(self, kernel, kernel_size, number_of_kernels, input_size,
                 input_depth, stride, zero_padding):
        # TODO: Define parameters
        self.kernel = kernel
        self.kernel_size = kernel_size
        self.number_of_kernels = number_of_kernels
        self.input_size = input_size
        self.stride = stride
        self.input_depth = input_depth
        self.zero_padding = zero_padding
        self.output_size = ((input_size - kernel_size + 2*zero_padding)//stride) + 1

    def convolve(self, input):
        # TODO: Implement convolution function
        print('Starting convolution ... \n')
        output = np.zeros((self.output_size,self.output_size))
        print('output: ', output) 
        
        #TODO: handle multiple kernels
        #for z in range(self.number_of_kernels):
        for y in range(self.output_size):
            for x in range(self.output_size):
                #print('x: ', x, 'y: ', y)
                output[x][y] = np.sum(input[x*self.stride : x*self.stride + self.kernel_size,
                                               y*self.stride : y*self.stride + self.kernel_size,
                                               :] * self.kernel )
        

        return output
