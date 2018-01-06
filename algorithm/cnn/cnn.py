import math as m
import numpy as np
from scipy.misc import imread, imsave, imresize

import coeff as c
#import normalize as n
import conv_relu as c_r
import maxpool as mp
import fully_connected as fc
import softmax as s

def apply_cnn(images, labels):    

    analyzed = 0
    detected = 0
    
    for idx,img in enumerate(images):        
        conv_one_out = c_r.conv_relu_forward(img,
                                             c.conv1_weights,
                                             c.conv1_biases)
        
        mp_one_out = mp.maxpool_forward(conv_one_out)
        
        conv_two_out = c_r.conv_relu_forward(mp_one_out,
                                             c.conv2_weights,
                                             c.conv2_biases)
        
        mp_two_out = mp.maxpool_forward(conv_two_out)
        
        conv_three_out = c_r.conv_relu_forward(mp_two_out,
                                               c.conv3_weights,
                                               c.conv3_biases)

        mp_three_out = mp.maxpool_forward(conv_three_out)
        
        reshaped_out = mp_three_out.reshape(1,-1)

        fc_output = fc.fully_connected_forward(reshaped_out,
                                            c.local3_weights,
                                            c.local3_biases)
        output = s.softmax(fc_output)
        analyzed = analyzed + 1
        assumption = np.nanargmax(output)
        if (assumption == labels[idx]):
            detected = detected + 1

        print('# Analyzed: ', analyzed)
        print('# Detected: ', detected)
        print('# Rate: ', (detected/analyzed)*100, '%')
        
#dict = n.unpickle('full-path-to-test-batch')
#labels = dict[b'labels']
#np.save('test-batch-labels.npy', labels)
#images = n.normalize_dict(dict)
#images = np.transpose(images, (0,1,2,3))
#np.save('cifar10-test-batch-images.npy', images)

labels = np.load('cifar10-test-batch-labels.npy')
images = np.load('cifar10-test-batch-normalized-images.npy')
apply_cnn(images, labels)