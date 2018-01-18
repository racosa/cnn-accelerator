#ifndef _MAXPOOL_H_
#define _MAXPOOL_H_

#include "../include/fixed_point.h"

#define MAXPOOL_SIZE 3
#define MAXPOOL_STRIDE 2
#define ZERO_PADDING 1

class Maxpool
{
private:
   const int input_size;
   const int input_depth;
   unsigned int output_size;

public:
  Maxpool(const int input_size, const int input_depth);
  ~Maxpool();
  void maxpool_layer(ac_fixed<FIXP_CONV_W, FIXP_CONV_I, true> input[], ac_fixed<FIXP_MAXPOOL_W, FIXP_MAXPOOL_I, true> output[]);
};

#endif /* _MAXPOOL_H_ */