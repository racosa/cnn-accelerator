import numpy as np
from scipy.misc import imread, imsave, imresize

def maxpool_forward(x):
    p_h = 3
    p_w = 3
    stride = 2
    in_h, in_w, depth = x.shape

    out_h = 2 + (in_h - p_h)//stride
    out_w = 2 + (in_w - p_w)//stride
    out = np.zeros((out_h, out_w, depth))
    
    for d in range(depth):
        for h in range(0, in_h, stride):
            for w in range(0, in_w, stride):
                out[h//stride,w//stride,d] = np.max(x[h:h+p_h,w:w+p_w,d])

    return out
