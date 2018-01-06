import numpy as np

k0 = [[0,0,0],[0,1,0],[0,0,0]]
kernel_one = np.stack([k0,k0,k0], axis=2)
print(kernel_one)

kernel_one = kernel_one.reshape(1,27)
print(kernel_one)
