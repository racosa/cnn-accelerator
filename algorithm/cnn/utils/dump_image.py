import numpy as np
from scipy.misc import imread, imsave

img = imread('dog-160x120.jpg')
#imsave('dog.jpg', img)
final = img
#final = np.concatenate((img[:,:,0].flatten('C'),
#                        img[:,:,1].flatten('C'),
#                        img[:,:,2].flatten('C')), axis=0)
#final = final.reshape(1,-1)


r = img[:,:,0].flatten('C')
g = img[:,:,1].flatten('C')
b = img[:,:,2].flatten('C')
image = np.zeros((57600))

for i in range(160*120):
        image[i*3] = r[i]
        image[i*3 +1] = g[i]
        image[i*3 +2] = b[i]
        
np.savetxt('test-rgb.txt', image.reshape(1,-1), fmt='%d')
