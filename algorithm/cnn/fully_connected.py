'''
fully_connected.py: Implementation of the Fully Connected (Perceptron) layer
'''

import numpy as np

def fully_connected_forward(x, kernel, biases):
        output = np.dot(x, kernel) + biases
        return output
