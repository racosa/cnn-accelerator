class Relu(object):
    def __init__(self, parameters):
        # TODO: Define parameters
        self.parameters = parameters


    def activate(self, input):
        # TODO: Implement relu activation function
        print('Starting relu activation ... \n')
        row_count = input.shape[0] 
        col_count = input.shape[1] 
        #depth = input.shape[2]

        #for k in range(depth):
        for j in range(col_count):
            for i in range(row_count):
                if input[i][j] < 0:
                    input[i][j] = 0

        return input
