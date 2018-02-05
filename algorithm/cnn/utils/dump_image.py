'''
dump_image.py: script used dump image into text file

authors: Rafael COSTA SALES
         Duc Huy DAO
'''

import numpy as np
from scipy.misc import imread, imsave

img = imread('dog-160x120.jpg')
final = img

r = img[:,:,0].flatten('C')
g = img[:,:,1].flatten('C')
b = img[:,:,2].flatten('C')
image = np.zeros((57600))

for i in range(160*120):
        image[i*3] = r[i]
        image[i*3 +1] = g[i]
        image[i*3 +2] = b[i]
        
np.savetxt('test-rgb.txt', image.reshape(1,-1), fmt='%d')
