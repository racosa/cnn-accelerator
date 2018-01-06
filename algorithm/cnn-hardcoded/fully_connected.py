import numpy as np

class FullyConnected(object):
    def __init__(self, kernel, biases):
        self.kernel = kernel
        self.biases = biases
        
    def classify(self, input):
        output = np.dot(input, self.kernel) + self.biases
        return output
