'''
softmax.py: Simple softmax function

authors: Rafael COSTA SALES
         Duc Huy DAO
'''

import numpy as np

def softmax(x):
    exp = np.exp(x - np.max(x))
    return exp / exp.sum()
