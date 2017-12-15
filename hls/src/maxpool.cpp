#include <iostream>
#include "maxpool.hpp"


Maxpool::Maxpool(unsigned int input_size,
        unsigned int input_depth,
        unsigned int field_size,
        unsigned int stride,
        unsigned int output_size)

    : input_size(input_size)
    , input_depth(input_depth)
    , field_size(field_size)
    , stride(stride) {

    output_size = ((input_size - field_size)/stride) + 1;

}

Maxpool::~Maxpool() {
}

float** Maxpool::pool(float **input){
    std::cout << "Starting max pooling..." << std::endl;
    
    float output[output_size][output_size];
    unsigned int x, y, i, j;
    float max;
    
    for(y = 0; y < output_size; y++) {
        for(x = 0; x < output_size; x++) {
            max = input[x*stride][y*stride];
            for(j = 0; j < field_size; j++) {
                for(i = 0; i < field_size; i++) {
                    if(input[x*stride+i][y*stride+j] > max)
                        max = input[x*stride+i][y*stride+j];
                }
            }
            output[x][y] = max;
        }
    }

    return output;

}
