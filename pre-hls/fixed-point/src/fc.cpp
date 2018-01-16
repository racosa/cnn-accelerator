#include "../include/fc.h"

void reshape(ac_fixed<16,3,true> input[], ac_fixed<16,3,true> output[]){

	int output_length = 0;

	for (unsigned int i = 0; i < 3; i++) { // height last
		for (unsigned int j = 0; j < 3; j++) { // width second
			for (unsigned int k = 0; k < 20; k++) { // canal first
				output[output_length] = input[k*3*3 + i*3 + j];
				output_length++;
			}
		}
	}

}


void fully_connected(ac_fixed<16,3,true> input[], const ac_fixed<16,3,true> matrix[], ac_fixed<16,3,true> output[], const ac_fixed<16,3,true> bias[]){

	for (unsigned int i = 0; i < 10; i++) {
		output[i] = 0;
		for (unsigned int j = 0; j < 180; j++) {
			output[i] += input[j]*matrix[j*10 + i];
		}
		output[i]+=bias[i];
	}
}
