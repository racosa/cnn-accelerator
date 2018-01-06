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
        output = np.zeros((self.number_of_kernels, self.output_size,self.output_size))

        padded_input = np.zeros((self.input_depth,
                                 input.shape[1] + 2*self.zero_padding,
                                 input.shape[2] + 2*self.zero_padding,
                                 ))

        padded_input[:,
                     self.zero_padding:input.shape[1]+self.zero_padding,
                     self.zero_padding:input.shape[2]+self.zero_padding,
                     ] = input 
    
        for z in range(self.number_of_kernels):
            for x in range(padded_input.shape[1] - 3 + 1):
                for y in range(padded_input.shape[2] - 3 + 1):
                    temp_array = padded_input[:,x:x+3, y:y+3]
                    output[z][x][y] = np.sum(temp_array * self.kernel[z,:,:,:] )
        return output
