#include "softmax.h"

float softmax(ac_fixed<16,3,true> *input){
    //float max = *std::max_element(input, input+10);
    /*
    ac_fixed<16,3,true> max = input[0];
    for (int i=1; i<10; i++) {
        if (max < input[i]) max = input[i];
    }

    ac_fixed<16,3,true> e = 2.71828183;
    
    for(int i=0; i<10; i++){
        input[i] = (ac_fixed<16,3,true>)exp(input[i] - max);
    }
    
    //float sum = std::accumulate(input, input+10, 0);
    ac_fixed<16,3,true> sum = 0;
    for(int i=0; i<10; i++){
        sum += input[i];
    }

    for(int i=0; i<10; i++){
        input[i] = input[i]/sum;
    }
    
    //float max_index = std::distance(input, std::max_element(input, input+10));
   
    max = input[0];
    float max_index = 0;
    for (int i=1; i<10; i++) {
        if (max < input[i]) max_index = i;
    }
    */
    return 0;//max_index;
}
