import numpy as np
from scipy.misc import imread, imsave, imresize

import relu
import maxpool
import convolution as conv
import fully_connected 
import coeff as c
import math as m
import normalize as n

conv_one = {'kernels': c.conv1_weights_t,
            'kernel_size' : 3,
            'nb_kernels': 64,
            'biases' : c.conv1_biases,
            'input_size': 24,
            'input_depth': 3,
            'stride': 1,
            'zero_pad' : 1} # zero_padding = (kernel_size - stride)/2

maxpool_one = {'size': 3,
               'stride' : 2,
               'input_size': 24,
               'input_depth': conv_one['nb_kernels']}

conv_two = {'kernels': c.conv2_weights_t,
            'kernel_size' : 3,
            'nb_kernels': 32,
            'biases' : c.conv2_biases,
            'input_size': 12,
            'input_depth': conv_one['nb_kernels'],
            'stride': 1,
            'zero_pad' : 1} # zero_padding = (kernel_size - stride)/2

maxpool_two = {'size': 3,
               'stride' : 2,
               'input_size': 12,
               'input_depth': conv_two['nb_kernels']}

conv_three = {'kernels': c.conv3_weights_t,
              'kernel_size' : 3,
              'nb_kernels': 20,
              'biases' : c.conv3_biases,
              'input_size': 6,
              'input_depth': conv_two['nb_kernels'],
              'stride': 1,
              'zero_pad' : 1} # zero_padding = (kernel_size - stride)/2

maxpool_three = {'size': 3,
                 'stride' : 2,
                 'input_size': 6,
                 'input_depth': conv_three['nb_kernels']}

fc =  {'kernels': c.local3_weights,
       'biases': c.local3_biases}

relu_layer = relu.Relu([]);
conv_layer_one = conv.Convolution(conv_one['kernels'], conv_one['kernel_size'],
                                  conv_one['nb_kernels'], conv_one['input_size'],
                                  conv_one['input_depth'], conv_one['stride'],
                                  conv_one['zero_pad'], conv_one['biases'])

maxpool_layer_one = maxpool.Maxpool(maxpool_one['input_size'],
                                    maxpool_one['input_depth'],
                                    maxpool_one['size'], maxpool_one['stride']) 

conv_layer_two = conv.Convolution(conv_two['kernels'], conv_two['kernel_size'],
                                  conv_two['nb_kernels'], conv_two['input_size'],
                                  conv_two['input_depth'], conv_two['stride'],
                                  conv_two['zero_pad'], conv_two['biases'])

maxpool_layer_two = maxpool.Maxpool(maxpool_two['input_size'],
                                    maxpool_two['input_depth'],
                                    maxpool_two['size'], maxpool_two['stride']) 


conv_layer_three = conv.Convolution(conv_three['kernels'], conv_three['kernel_size'],
                                    conv_three['nb_kernels'], conv_three['input_size'],
                                    conv_three['input_depth'], conv_three['stride'],
                                    conv_three['zero_pad'], conv_three['biases'])

maxpool_layer_three = maxpool.Maxpool(maxpool_three['input_size'],
                                      maxpool_three['input_depth'],
                                      maxpool_three['size'], maxpool_three['stride']) 

fc_layer = fully_connected.FullyConnected(fc['kernels'],
                                          fc['biases'])

def apply_cnn(images, labels):    

    analysed = 0
    detected = 0
    
    for idx,input_img in enumerate(images):
        #print('# Convolution Layer One ...')
        conv_one_output = conv_layer_one.convolve(input_img)
        #print('# Convolution Layer One output shape: ', conv_one_output.shape)
        #print(conv_one_output)

        #print('# ReLU Layer One ...')
        relu_output = relu_layer.activate(conv_one_output)
        #print('# ReLU Layer One output shape: ', relu_output.shape)
        #print(relu_output)

        #print('# Maxpool Layer One ...')
        maxpool_one_output = maxpool_layer_one.pool(relu_output)
        #print('# Maxpool Layer One output shape: ', maxpool_one_output.shape)
        #print(maxpool_one_output)

        #print('# Convolution Layer Two ...')
        conv_two_output = conv_layer_two.convolve(maxpool_one_output)
        #print('# Convolution Layer Two output shape: ', conv_two_output.shape)
        #print(conv_two_output)

        #print('# ReLU Layer Two ...')
        relu_output = relu_layer.activate(conv_two_output)
        #print(' ReLU Layer Two output shape: ', relu_output.shape)
        #print(rlu_output)

        #print(' Maxpool Layer Two ...')
        maxpool_two_output = maxpool_layer_two.pool(relu_output)
        #print(' Maxpool Layer Two output shape: ', maxpool_two_output.shape)
        #print(mxpool_two_output)

        #print(' Convolution Layer Three ...')
        conv_three_output = conv_layer_three.convolve(maxpool_two_output)
        #print(' Convolution Layer Three output shape: ', conv_three_output.shape)
        #print(cnv_three_output)

        #print(' ReLU Layer Three ...')
        relu_output = relu_layer.activate(conv_three_output)
        #print(' ReLU Layer Three output shape: ', relu_output.shape)
        #print(rlu_output)

        #print(' Maxpool Layer Three ...')
        maxpool_three_output = maxpool_layer_three.pool(relu_output)
        #print(' Maxpool Layer Three output shape: ', maxpool_three_output.shape)
        #print(mxpool_three_output)

        #print(' Reshaping output ...')
        reshape_output = maxpool_three_output.reshape(1,-1)
        #print(' Reshape output: ')
        #print(rshape_output)

        #print(' Fully Connected Layer ...')
        fc_output = fc_layer.classify(reshape_output)
        #print(' Fully Connected Layer output: ', fc_output)
        #imsave('output.jpg', maxpool_one_output)

        #print(' Max value index: ', np.argmax(fc_output))
        analysed = analysed + 1
        if (np.argmax(fc_output) == labels[idx]):
            detected = detected + 1

        print('# Analysed: ', analysed)
        print('# Detected: ', detected)
        print('# Rate: ', (detected/analysed)*100, '%')
        
dict = n.unpickle('/home/racosa/tmp/cifar-10/cifar-10-batches-py/test_batch')
labels = dict[b'labels']
images = n.normalize_dict(dict)
images = np.transpose(images, (0,3,1,2))
print(images.shape)
apply_cnn(images,labels)
#print(images[0].shape)
#print(images[0])
