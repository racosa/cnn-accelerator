#include "../include/fc.h"

void reshape(ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true> input[],
             ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true> output[]){

	int output_length = 0;

	for (unsigned int i = 0; i <  FIXP_RESHAPE_I; i++) { // height last
		for (unsigned int j = 0; j <  FIXP_RESHAPE_I; j++) { // width second
			for (unsigned int k = 0; k < 20; k++) { // canal first
				output[output_length] = input[k* FIXP_RESHAPE_I* FIXP_RESHAPE_I + i* FIXP_RESHAPE_I + j];
				output_length++;
			}
		}
	}

}


void fully_connected(ac_fixed<FIXP_FC_W, FIXP_FC_I,true> input[],
                     const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I,true> matrix[],
                     ac_fixed<FIXP_FC_W, FIXP_FC_I,true> output[],
                     const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I,true> bias[]){

	for (unsigned int i = 0; i < 10; i++) {
		output[i] = 0;
		for (unsigned int j = 0; j < 180; j++) {
			output[i] += input[j]*matrix[j*10 + i];
		}
		output[i]+=bias[i];
	}
}
