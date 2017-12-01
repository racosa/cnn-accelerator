import numpy as np

class Maxpool(object):
    def __init__(self, input_size, input_depth, field_size, stride):
        # TODO: Define parameters
        self.input_size = input_size
        self.input_depth = input_depth
        self.field_size = field_size
        self.stride = stride
        self.output_size = ((input_size - field_size)//stride) + 1

    def pool(self, input):
        # TODO: Implement max pooling function
        print('Starting max pooling ... \n')
        output = np.zeros((self.output_size,self.output_size))
        
        #TODO: handle multiple kernels
        #for z in range(self.number_of_kernels):
        for y in range(self.output_size):
            for x in range(self.output_size):
                max = input[x*self.stride][y*self.stride]
                for j in range(self.field_size):
                    for i in range(self.field_size):
                        if input[x*self.stride + i][y*self.stride + j] > max:
                            max = input[x*self.stride + i][y*self.stride + j]
                output[x][y] = max
        return output
