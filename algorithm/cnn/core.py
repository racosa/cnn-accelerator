import numpy as np
from scipy.misc import imread, imsave, imresize

import relu
import maxpool
import convolution as conv

input_img = imread('blue-dot.jpg')
print(input_img.dtype, input_img.shape)
print('Input image: ')
print(input_img)

conv_layer = conv.Convolution([])
relu_layer = relu.Relu([]);
maxpool_layer = maxpool.Maxpool([]) 

conv_output = conv_layer.convolve(input_img)
relu_output = relu_layer.activate(conv_output)
maxpool_output = maxpool_layer.pool(relu_output)

print('Output image: \n')
print(maxpool_output)
imsave('output_img.jpg', maxpool_output)
