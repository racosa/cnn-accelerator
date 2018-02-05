/* fc.cpp
 * Reshape and Fully Connected (Perceptron) layers.
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#include "../include/fc.h"

void reshape(ac_fixed<FIXP_MP3_W, FIXP_MP3_I, true, AC_RND_ZERO> input[],
             ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true, AC_RND_ZERO> output[]){

	int output_length = 0;

	for (unsigned int i = 0; i <  3; i++) { // height last
		for (unsigned int j = 0; j <  3; j++) { // width second
			for (unsigned int k = 0; k < 20; k++) { // canal first
				output[output_length] = input[k*3*3 + i*3 + j];
				output_length++;
			}
		}
	}

}


void fully_connected(ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I,true, AC_RND_ZERO> input[],
                     const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I,true, AC_RND_ZERO> matrix[],
                     ac_fixed<FIXP_FC_W, FIXP_FC_I,true, AC_RND_ZERO> output[],
                     const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I,true, AC_RND_ZERO> bias[]){

	for (unsigned int i = 0; i < 10; i++) {
		output[i] = 0;
		for (unsigned int j = 0; j < 180; j++) {
			output[i] += input[j]*matrix[j*10 + i];
		}
		output[i]+=bias[i];
	}
}
