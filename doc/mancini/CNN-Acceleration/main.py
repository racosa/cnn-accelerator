import functions as f
import layers as l

#f.Conv2D([1,2,3,4,5,6,7],3,1,0,1,0)
#f.Conv2D([1,2,3,4,5,6,7],3,2,0,1,0)

from PIL import Image
import numpy as np
weights=[[0.03,0.02,0.04,0.01],[0.02,0.03,0.03,0.02],[0.02,0.05,0.02,0.01],[0.01,0.01,0.03,0.05]]
layer=l.ConvLayer(128,4,1,0,3,1,weights)
im=Image.open("animal-chat-icone-4095-128.png")
pic = np.array(im)
height=len(pic)
width=len(pic[0])
volume=[[[0 for i in range (width)] for j in range (height)] for k in range (3)]
for i in range(height):
    for j in range(width):
        for k in range(3):
            volume[k][i][j]=pic[i][j][k]
volume2=layer.forward(volume)
pic2=np.array(volume2[0]).astype(np.uint8)
im2=Image.fromarray(pic2)
#im2.convert('RGB')
im2.save("cat.png")
