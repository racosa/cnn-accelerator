class ReluLayer():
    def __init__(self,inputSize,inputChannels):
        self.inputSize=inputSize
        self.inputChannels=inputChannels

    def forward(self,inputVolume):
        tab=[[0 for i in range(self.inputSize)] for j in range(self.inputSize)]
        for i in range(self.inputChannels):
            for j in range(self.inputSize):
                for k in range(self.inputSize):
                        tab[i][j][k]=max(inputVolume[i][j][k],0)
        return tab
