import numpy as np

def softmax(x):
    exp = np.exp(x - np.max(x))
    return exp / exp.sum()
