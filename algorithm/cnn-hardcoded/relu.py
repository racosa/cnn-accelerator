class Relu(object):
    def __init__(self, parameters):
        # TODO: Define parameters
        self.parameters = parameters


    def activate(self, input):
        row_count = input.shape[0] 
        col_count = input.shape[1] 
        depth = input.shape[2]

        for z in range(depth):
            for y in range(col_count):
                for x in range(row_count):
                    if input[x][y][z] < 0:
                        input[x][y][z] = 0

        return input
