#include "softmax.h"

float softmax(double *input){
    double max = *std::max_element(input, input+10);
    
    for(int i=0; i<10; i++){
        input[i] = exp(input[i] - max);
    }
    
    double sum = std::accumulate(input, input+10, 0);
    
    for(int i=0; i<10; i++){
        input[i] = input[i]/sum;
    }

    float max_index = std::distance(input, std::max_element(input, input+10));

    return max_index;
}
