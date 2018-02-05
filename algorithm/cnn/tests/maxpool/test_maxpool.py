'''
test_maxpool.py: Script used to test maxpool layer

authors: Rafael COSTA SALES
         Duc Huy DAO
'''

import numpy as np
import maxpool

maxpool_one = {'size': 3,
               'stride' : 2,
               'input_size': 6,
               'input_depth': 3}

maxpool_layer_one = maxpool.Maxpool(maxpool_one['input_size'],
                                    maxpool_one['input_depth'],
                                    maxpool_one['size'], maxpool_one['stride']) 

k = np.array([[0,1,2,3,4,5],[5,6,7,8,9,10],[10,11,12,13,14,15],
              [0,1,2,3,4,5],[0,1,2,3,4,5],[10,11,12,13,14,15]])
k = np.stack([k,k,k],axis=2)
print(k[:,:,0])
print(k[:,:,1])
print(k[:,:,2])
print(k.shape)
pool_result = maxpool_layer_one.pool(k)
print(pool_result[:,:,0])
print(pool_result[:,:,1])
print(pool_result[:,:,2])
print(pool_result.shape)
