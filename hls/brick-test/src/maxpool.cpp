#include "maxpool.h"
#include <iostream>

Maxpool::Maxpool(unsigned int maxpool_size,
  unsigned int maxpool_stride,
  unsigned int input_size,
  unsigned int input_depth,
	unsigned int zero_padding)
: maxpool_size(maxpool_size),
  maxpool_stride(maxpool_stride),
  input_size(input_size),
  input_depth(input_depth),
	zero_padding(zero_padding)
{
  output_size = ((input_size - maxpool_size + zero_padding) / maxpool_stride) + 1;
}

Maxpool::~Maxpool()
{}

void Maxpool::maxpool_layer(float input[], float output[]) {

///// ZERO PADDING /////
	/// VERY QUESTIONABLE DECLARATION ///
	float pad_input[(input_size+zero_padding)*(input_size+zero_padding)*input_depth];
	/////////////////////////////////////

	for (unsigned int i = 0; i < input_depth; i++) {
		for (unsigned int j = 0; j < input_size+zero_padding; j++) {
			for (unsigned int k = 0; k < input_size+zero_padding; k++) {
				if (j >= input_size || k >= input_size) pad_input[i*(input_size+zero_padding)*(input_size+zero_padding) + j*(input_size+zero_padding) + k] = 0;
				else pad_input[i*(input_size+zero_padding)*(input_size+zero_padding) + j*(input_size+zero_padding) + k] = input[i*input_size*input_size + j*input_size + k];
			}
		}
	}
	
	// FOR DEBUG PURPOSE //
	std::cout << "zero pad input" << '\n';
	for (unsigned int d = 0; d < input_depth; d++) { // depth
		for (unsigned int r = 0; r < input_size+zero_padding; r++) { // row
			for (unsigned int c = 0; c < input_size+zero_padding; c++) { // column
				std::cout << pad_input[d*(input_size+zero_padding)*(input_size+zero_padding) + r*(input_size+zero_padding) + c] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}
	///////////////////////

///// end of zero padding /////

  unsigned int o_d = 0; // output depth
  unsigned int o_r = 0; // output_height
  unsigned int o_c = 0; // output_width

  for (unsigned int i = 0; i < input_depth; i++) { // depth translation on input
    for (unsigned int j = 0; j <= input_size+zero_padding-maxpool_size; j+= maxpool_stride) { // height translation on input
      for (unsigned int k = 0; k <= input_size+zero_padding-maxpool_size; k+=maxpool_stride) { // width translation on input
        output[o_d*output_size*output_size + o_r*output_size + o_c] = 0;
        ///// Maxpooling /////
        for (unsigned int l = 0; l < maxpool_size; l++) { // maxpool height
          for (unsigned int m = 0; m < maxpool_size; m++) { // maxpool width
            if (output[o_d*output_size*output_size + o_r*output_size + o_c] < pad_input[i*(input_size+zero_padding)*(input_size+zero_padding) + (j+l)*(input_size+zero_padding) + (k+m)]) output[o_d*output_size*output_size + o_r*output_size + o_c] = pad_input[i*(input_size+zero_padding)*(input_size+zero_padding) + (j+l)*(input_size+zero_padding) + (k+m)];
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
