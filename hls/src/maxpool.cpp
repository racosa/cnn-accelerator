#include "maxpool.h"

Maxpool::Maxpool(unsigned int maxpool_size,
  unsigned int maxpool_stride,
  unsigned int input_size,
  unsigned int input_depth)
: maxpool_size(maxpool_size),
  maxpool_stride(maxpool_stride),
  input_size(input_size),
  input_depth(input_depth)
{
  output_size = ((input_size - maxpool_size) / maxpool_stride) + 1;
}

Maxpool::~Maxpool()
{}

void Maxpool::maxpool_layer(float input[], float output[]) {

  unsigned int o_d = 0; // output depth
  unsigned int o_r = 0; // output_height
  unsigned int o_c = 0; // output_width

  for (unsigned int i = 0; i < input_depth; i++) { // depth translation on input
    for (unsigned int j = 0; j <= input_size-maxpool_size; j+= maxpool_stride) { // height translation on input
      for (unsigned int k = 0; k <= input_size-maxpool_size; k+=maxpool_stride) { // width translation on input
        output[o_d*output_size*output_size + o_r*output_size + o_c] = 0;
        ///// Maxpooling /////
        for (unsigned int l = 0; l < maxpool_size; l++) { // maxpool height
          for (unsigned int m = 0; m < maxpool_size; m++) { // maxpool width
            if (output[o_d*output_size*output_size + o_r*output_size + o_c] < input[i*input_size*input_size + (j+l)*input_size + (k+m)]) output[o_d*output_size*output_size + o_r*output_size + o_c] = input[i*input_size*input_size + (j+l)*input_size + (k+m)];
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
