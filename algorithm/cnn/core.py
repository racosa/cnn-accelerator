import numpy as np
from scipy.misc import imread, imsave, imresize

import relu
import maxpool
import convolution as conv

input_img = imread('dog.jpg')
print(input_img.dtype, input_img.shape)
print('Input image: ')
#print(input_img)

kernel = np.array([[0,0,0],[0,1,0],[0,0,0]])
number_of_kernels = 1
input_depth = 3
stride = 1
zero_padding = 0

conv_layer = conv.Convolution(kernel, kernel.shape[0], number_of_kernels,
                              input_img.shape[0], input_depth, stride, zero_padding)
relu_layer = relu.Relu([]);
maxpool_layer = maxpool.Maxpool(254, 1, 2, 2) 

conv_output = conv_layer.convolve(input_img)
relu_output = relu_layer.activate(conv_output)
maxpool_output = maxpool_layer.pool(relu_output)


print('Output image: \n')
print(maxpool_output)
imsave('output_img.jpg', maxpool_output)
