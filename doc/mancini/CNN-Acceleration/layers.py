class ConvLayer():
    def __init__(self,inputSize,fieldSize,stride,zeroPadding,inputChannels,outputChannels,weights):
        self.inputSize=inputSize
        self.fieldSize=fieldSize
        self.stride=stride
        self.zeroPadding=zeroPadding
        self.inputChannels=inputChannels
        self.outputChannels=outputChannels
        self.weights=weights
        self.nbNeurons=int((self.inputSize-self.fieldSize+2*self.zeroPadding)/self.stride + 1)

    def forward(self,inputVolume):
        tab=[[[0 for i in range(self.nbNeurons)] for j in range(self.nbNeurons)] for k in range(self.outputChannels)]
        for i in range(self.outputChannels):
            for j in range(self.nbNeurons):
                for k in range(self.nbNeurons):
                    for l in range(self.fieldSize ):
                        for m in range(self.fieldSize):
                            for n in range(self.inputChannels):
                                tab[i][j][k]+=inputVolume[n][j*self.stride+l][k*self.stride+m]*self.weights[l][m]
        return tab

class MaxpoolLayer():
    def __init__(self,inputSize,fieldSize,inputChannels):
        self.inputSize=inputSize
        self.fieldSize=fieldSize
        self.inputChannels=inputChannels
    def forward(self,inputVolume):
        tab[[[0 for i in range(self.inputSize)] for j in range(self.inputSize)] for k in range(self.inputChannels)]

class ReluLayer():
    def __init__(self,inputSize,inputChannels):
        self.inputSize=inputSize
        self.inputChannels=inputChannels

    def forward(self,inputVolume):
        tab=[[[0 for i in range(self.inputSize)] for j in range(self.inputSize)] for k in range(self.inputChannels)]
        for i in range(self.inputChannels):
            for j in range(self.inputSize):
                for k in range(self.inputSize):
                        tab[i][j][k]=max(inputVolume[i][j][k],0)
        return tab
