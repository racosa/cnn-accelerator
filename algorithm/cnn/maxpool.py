import numpy as np

class Maxpool(object):
    def __init__(self, input_size, input_depth, field_size, stride):
        self.input_size = input_size
        self.input_depth = input_depth
        self.field_size = field_size
        self.stride = stride
        self.output_size = ((input_size - field_size)//stride) + 2

    def pool(self, input):
        output = np.zeros((self.output_size,self.output_size,self.input_depth))
        for z in range(self.input_depth):
            for y in range(self.output_size):
                for x in range(self.output_size):
                    max = input[x*self.stride][y*self.stride][z]
                    for j in range(self.field_size - self.output_size):
                        for i in range(self.field_size - self.output_size):
                            if input[x*self.stride + i][y*self.stride + j][z] > max:
                                max = input[x*self.stride + i][y*self.stride + j][z]
                    output[x][y][z] = max
        return output
