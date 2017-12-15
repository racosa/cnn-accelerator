import numpy as np
from scipy.misc import imread, imsave, imresize

import relu
import maxpool
import convolution as conv

input_img = imread('dog2-24x24.png')
print(input_img.dtype, input_img.shape)
print('Input image: ')
print(input_img)

#k1 = [[1,1,1],[1,1,1],[1,1,1]];
#input_img = np.stack([k1,k1,k1], axis=2)
#print('img: ')
#print(input_img)

k0 = [[0,0,0],[0,1,0],[0,0,0]];
#k1 = [[0,0,0],[0,1,0],[0,0,0]];
kernel = np.stack([k0,k0,k0], axis=2)

kernels = np.array([kernel, kernel, kernel, kernel, kernel, kernel])
print('kernels : ', kernels.shape)

number_of_kernels = kernels.shape[0]
input_depth = 3
stride = 1
zero_padding = 1 # zero_padding = (kernel_size - stride)/2

conv_layer = conv.Convolution(kernels, kernel.shape[0], number_of_kernels,
                              input_img.shape[0], input_depth, stride, zero_padding)
relu_layer = relu.Relu([]);
maxpool_layer = maxpool.Maxpool(24, number_of_kernels, 3, 2) 

conv_output = conv_layer.convolve(input_img)
print('Conv output: ', conv_output.shape)
print(conv_output)

relu_output = relu_layer.activate(conv_output)
print('ReLU output: ', relu_output.shape)
print(relu_output)

maxpool_output = maxpool_layer.pool(relu_output)

print('Output image: \n')
print(maxpool_output)
print(maxpool_output.shape)
#imsave('output_img2.jpg', conv_output)
