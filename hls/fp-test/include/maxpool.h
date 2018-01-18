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
  void maxpool_layer(double input[], double output[]);
  /*template <typename IP, typename OP>
  void maxpool_layer(IP input[],
                     OP output[]);*/
};
//It must be included after class declaration
//#include "../src/maxpool_impl.h"

#endif /* _MAXPOOL_H_ */
