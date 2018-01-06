import numpy as np

def conv_relu_forward(x, k, b, stride=1, pad=1):
    pad = 1
    stride = 1
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
                else:
                    out[h//stride, w//stride, n] = temp
    return out
