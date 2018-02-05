'''
fully_connected.py: Implementation of the Fully Connected (Perceptron) layer

authors: Rafael COSTA SALES
         Duc Huy DAO
'''

import numpy as np

def fully_connected_forward(x, kernel, biases):
        output = np.dot(x, kernel) + biases
        return output
