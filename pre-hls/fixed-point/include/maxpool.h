#ifndef _MAXPOOL_H_
#define _MAXPOOL_H_

#define MAXPOOL_SIZE 3
#define MAXPOOL_STRIDE 2
#define ZERO_PADDING 1

#include "../lib/ac_fixed.h"

class Maxpool
{
private:
   const int input_size;
   const int input_depth;
   unsigned int output_size;

public:
  Maxpool(const int input_size, const int input_depth);
  ~Maxpool();
  void maxpool_layer(ac_fixed<16,3,true> input[], ac_fixed<16,3,true> output[]);
};

#endif /* _MAXPOOL_H_ */
