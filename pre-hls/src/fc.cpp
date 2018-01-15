#include <algorithm>
#include <math.h>
#include <numeric>
#include <iostream>

void reshape(float input[], float output[]){

	int output_length = 0;

	for (unsigned int i = 0; i < 3; i++) { // height last
		for (unsigned int j = 0; j < 3; j++) { // width second
			for (unsigned int k = 0; k < 20; k++) { // canal last
				output[output_length] = input[k*3*3 + i*3 + j];
				output_length++;
			}
		}
	}
	
}


void fully_connected(float input[], const float matrix[], float output[], const float bias[]){

	for (unsigned int i = 0; i < 10; i++) {
		output[i] = 0;
		for (unsigned int j = 0; j < 180; j++) {
			output[i] += input[j]*matrix[j*10 + i];
		}
		output[i]+=bias[i];
	}
}

float softmax(float *input){
    float max = *std::max_element(input, input+10);
    for(int i=0; i<10; i++){
        input[i] = exp(input[i] - max);
    }

    float sum = std::accumulate(input, input+10, 0);

    for(int i=0; i<10; i++){
        input[i] = input[i]/sum;
    }
    
    float max_index = std::distance(input, std::max_element(input, input+10));
    return max_index;
}
