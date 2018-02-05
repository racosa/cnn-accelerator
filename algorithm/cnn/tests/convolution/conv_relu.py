'''
test_conv_relu.py: Script used to test convolution and relu layers

authors: Rafael COSTA SALES
         Duc Huy DAO
'''

import numpy as np
from scipy.misc import imread, imsave

def conv_relu_forward(x, k, b, stride=1, pad=1):
    in_h, in_w, depth = x.shape
    k_h, k_w, depth, k_n = k.shape 
    out_h = 1 + (in_h + 2*pad - k_h)//stride
    out_w = 1 + (in_w + 2*pad - k_w)//stride
 
    out = np.zeros((out_h, out_w, k_n))
    x_pad = np.pad(x,((pad,pad),(pad,pad),(0,0)),'constant')

    for n in range(k_n):
        for h in range(0,in_h,stride):
            for w in range(0,in_w,stride):
                temp = np.sum(x_pad[h:h+k_h,w:w+k_w,:]*k[:,:,:,n]) + b[n]
                if (temp < 0):
                    out[h//stride, w//stride, n] = 0
                elif (temp > 255):
                    out[h//stride, w//stride, n] = 255
                else:
                    out[h//stride, w//stride, n] = temp
    return out       

identity = np.array([[[[0,0,0],[0,0,0],[0,0,0]],[[0,0,0],[0,0,0],[0,0,0]],[[0,0,0],[0,0,0],[0,0,0]]],
              [[[0,0,0],[0,0,0],[0,0,0]],[[1,0,0],[0,1,0],[0,0,1]],[[0,0,0],[0,0,0],[0,0,0]]],
              [[[0,0,0],[0,0,0],[0,0,0]],[[0,0,0],[0,0,0],[0,0,0]],[[0,0,0],[0,0,0],[0,0,0]]]])

edge = np.array([[[[-1,0,0],[0,-1,0],[0,0,-1]],[[-1,0,0],[0,-1,0],[0,0,-1]],[[-1,0,0],[0,-1,0],[0,0,-1]]],
                 [[[-1,0,0],[0,-1,0],[0,0,-1]],[[8,0,0],[0,8,0],[0,0,8]],[[-1,0,0],[0,-1,0],[0,0,-1]]],
                 [[[-1,0,0],[0,-1,0],[0,0,-1]],[[-1,0,0],[0,-1,0],[0,0,-1]],[[-1,0,0],[0,-1,0],[0,0,-1]]]])

sharpen = np.array([[[[0,0,0],[0,0,0],[0,0,0]],[[-1,0,0],[0,-1,0],[0,0,-1]],[[0,0,0],[0,0,0],[0,0,0]]],
                    [[[-1,0,0],[0,-1,0],[0,0,-1]],[[5,0,0],[0,5,0],[0,0,5]],[[-1,0,0],[0,-1,0],[0,0,-1]]],
                    [[[0,0,0],[0,0,0],[0,0,0]],[[-1,0,0],[0,-1,0],[0,0,-1]],[[0,0,0],[0,0,0],[0,0,0]]]])

b = np.array([0,0,0])

x = imread('dog-160x120.jpg')

out = conv_relu_forward(x, sharpen, b)

fx = np.concatenate((x[:,:,0].flatten('C'),
                     x[:,:,1].flatten('C'),
                     x[:,:,2].flatten('C')), axis=0)
fx = fx.reshape(1,-1)
np.savetxt('input.txt', fx, fmt='%d')

fout = np.concatenate((out[:,:,0].flatten('C'),
                       out[:,:,1].flatten('C'),
                       out[:,:,2].flatten('C')), axis=0)
fout = fout.reshape(1,-1)
np.savetxt('output.txt', fout, fmt='%d')


fs = np.concatenate((sharpen[:,:,0].flatten('C'),
                       sharpen[:,:,1].flatten('C'),
                       sharpen[:,:,2].flatten('C')), axis=0)
fs = fs.reshape(1,-1)
np.savetxt('sharpen.txt', fs, delimiter=',', fmt='%d')

fi = np.concatenate((identity[:,:,0].flatten('C'),
                     identity[:,:,1].flatten('C'),
                     identity[:,:,2].flatten('C')), axis=0)
fi = fi.reshape(1,-1)
np.savetxt('identity.txt', fi, delimiter=',', fmt='%d')

imsave('out.jpg', out)
