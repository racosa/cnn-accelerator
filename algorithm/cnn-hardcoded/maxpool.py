import numpy as np

class Maxpool(object):
    def __init__(self, input_size, input_depth, field_size, stride):
        self.input_size = input_size
        self.input_depth = input_depth
        self.field_size = field_size
        self.stride = stride
        self.output_size = ((input_size - field_size)//stride) + 2

    def pool(self, input):
        output = np.zeros((self.input_depth, self.output_size,self.output_size))

        padded_input = np.zeros((self.input_depth,
                                 input.shape[1] + 1,
                                 input.shape[2] + 1))

        padded_input[:,
                     0:input.shape[1],
                     0:input.shape[2]] = input 
               
        for z in range(self.input_depth):
            for y in range(self.input_size//2):
                for x in range(self.input_size//2):
                    max = padded_input[z][x][y]
                    for j in range(self.field_size):
                        for i in range(self.field_size):
                            #print('x:', x*self.stride + i,
                            #          'y:', y*self.stride + j,
                            #          ' = ', padded_input[x*self.stride + i ][y*self.stride + j][z])
                            if padded_input[z][x*self.stride + i][y*self.stride + j ] > max:
                                max = padded_input[z][x*self.stride + i][y*self.stride + j]
                                
                    output[z][x][y] = max
        return output
