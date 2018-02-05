/* maxpool.cpp
 * Maxpool function implementation.
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#include "maxpool.h"

Maxpool::Maxpool(const int input_size, const int input_depth)
: input_size(input_size),
  input_depth(input_depth)
{
  output_size = ((input_size - MAXPOOL_SIZE + ZERO_PADDING) / MAXPOOL_STRIDE) + 1;
}

Maxpool::~Maxpool()
{}

void Maxpool::maxpool_layer(float input[], float output[]) {

///// ZERO PADDING /////
	/// VERY QUESTIONABLE DECLARATION ///
	float pad_input[(input_size+ZERO_PADDING)*(input_size+ZERO_PADDING)*input_depth];
	/////////////////////////////////////

	for (int i = 0; i < input_depth; i++) {
		for (int j = 0; j < input_size+ZERO_PADDING; j++) {
			for (int k = 0; k < input_size+ZERO_PADDING; k++) {
				if (j >= input_size || k >= input_size) pad_input[i*(input_size+ZERO_PADDING)*(input_size+ZERO_PADDING) + j*(input_size+ZERO_PADDING) + k] = 0;
				else pad_input[i*(input_size+ZERO_PADDING)*(input_size+ZERO_PADDING) + j*(input_size+ZERO_PADDING) + k] = input[i*input_size*input_size + j*input_size + k];
			}
		}
	}

///// end of zero padding /////

   unsigned int o_d = 0; // output depth
   unsigned int o_r = 0; // output_height
   unsigned int o_c = 0; // output_width

  for (int i = 0; i < input_depth; i++) { // depth translation on input
    for (int j = 0; j <= input_size+ZERO_PADDING-MAXPOOL_SIZE; j+= MAXPOOL_STRIDE) { // height translation on input
      for (int k = 0; k <= input_size+ZERO_PADDING-MAXPOOL_SIZE; k+=MAXPOOL_STRIDE) { // width translation on input
        output[o_d*output_size*output_size + o_r*output_size + o_c] = 0;
        ///// Maxpooling /////
        for (int l = 0; l < MAXPOOL_SIZE; l++) { // maxpool height
          for (int m = 0; m < MAXPOOL_SIZE; m++) { // maxpool width
            if (output[o_d*output_size*output_size + o_r*output_size + o_c] < pad_input[i*(input_size+ZERO_PADDING)*(input_size+ZERO_PADDING) + (j+l)*(input_size+ZERO_PADDING) + (k+m)]) output[o_d*output_size*output_size + o_r*output_size + o_c] = pad_input[i*(input_size+ZERO_PADDING)*(input_size+ZERO_PADDING) + (j+l)*(input_size+ZERO_PADDING) + (k+m)];
          }
        }
        ///// end of maxpooling region calc /////
        o_c++;
      }
      o_c=0,
      o_r++;
    }
    o_c=0;
    o_r=0;
    o_d++;
  }
}
