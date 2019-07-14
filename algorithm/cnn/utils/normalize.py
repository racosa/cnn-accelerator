'''
normalize.py: script used to normalize cifar-10 batch files
'''

import numpy as np
import math as m
from scipy.misc import imread, imsave, imresize

def normalize(image):
    image = image[4:28,4:28,:]
    mean = np.sum(image)/1728
    variance = m.sqrt(np.sum(np.power((image - mean), 2))/1728)
    normalized_image = (image - mean)/max(variance, 1/m.sqrt(1728))
    return normalized_image

def unpickle(file):
    import pickle
    with open(file, 'rb') as fo:
        dict = pickle.load(fo, encoding='bytes')
    return dict

def normalize_dict(dict):
    images = dict[b'data'].reshape([-1,3,32,32])
    images = images.transpose([0, 2, 3, 1])
    normalized_images = np.zeros((10000,24,24,3))
    for i in range(10000):
        normalized_images[i] = normalize(images[i])
    return normalized_images
