def Conv2D(inputVolume, fieldSize, stride, zeroPadding, outputChannels, weights):
    nbNeurons=(len(inputVolume)-fieldSize+2*zeroPadding)/stride + 1
    tab=[[0 for i in range(nbNeurons)] for j in range(nbNeurons)]
    for i in range(nbNeurons):
        for j in range(nbNeurons):
            print(i)
    print(tab)
