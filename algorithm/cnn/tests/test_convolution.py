import numpy as np
from scipy.misc import imread, imsave, imresize

import convolution as conv

input_img = imread('images/wiki.png')
print(input_img.shape)
input_img = imresize(input_img, (66, 66))
#input_img = input_img[:,:,0]
#print('non-stacked: ', input_img)
#input_img = np.stack([input_img], axis=2)
#print('stacked: ', input_img)

edge_kernel_3 = np.array([[0, -1, 0],
                         [-1, 5, -1],
                         [0, -1, 0]])
kernels = edge_kernel_3

#kernels = np.stack([edge_kernel_3,edge_kernel_3,edge_kernel_3], axis=2)
#kernels = np.stack([kernels], axis=0)
#kernels = kernels[0][:,:,0]
print('kernels: ', kernels)
#print('kernel: ', kernels[0][:,:,0])
print(kernels.shape)
biases = np.zeros(9)

conv_one = {'kernels': kernels,
            'kernel_size' : 3,
            'nb_kernels': 1,
            'biases' : biases,
            'input_size': 66,
            'input_depth': 3,
            'stride': 1,
            'zero_pad' : 1} # zero_padding = (kernel_size - stride)/2


conv_layer_one = conv.Convolution(conv_one['kernels'], conv_one['kernel_size'],
                                  conv_one['nb_kernels'], conv_one['input_size'],
                                  conv_one['input_depth'], conv_one['stride'],
                                  conv_one['zero_pad'], conv_one['biases'])


print('input: ', input_img.shape)
#print(input_img)
conv_one_output = conv_layer_one.convolve(input_img)
print('output shape: ', conv_one_output.shape)
print('output: ', conv_one_output[:,:,0])
#print(conv_one_output[:,:,0])
#conv_one_output = np.stack([conv_one_output, conv_one_output, conv_one_output], axis=2)
#print(conv_one_output.shape)
#print(conv_one_output[:,:,:,0].shape)
imsave('test-conv-output.png', conv_one_output[:,:,0])
