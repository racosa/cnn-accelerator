#include "softmax.h"

float softmax(double *input){
    double max = input[0];
    for (int i=1; i<10; i++) {
        if (max < input[i]) {
            max = input[i];
        }
    }
 
    for(int i=0; i<10; i++){
        input[i] = exp(input[i] - max);
    }

    double sum = input[0];
    for(int i=1; i<10; i++){
        sum += input[i];
    }

    for(int i=0; i<10; i++){
        input[i] = input[i]/sum;
    }
    
    max = input[0];
    float max_index = 0;
    for (int i=1; i<10; i++) {
        if (max < input[i]) {
            max = input[i];
            max_index = i;
        }
    }
    return max_index;
}
