#ifndef _MAXPOOL_H_
#define _MAXPOOL_H_

class Maxpool
{
private:
  unsigned int maxpool_size;
  unsigned int maxpool_stride;
  unsigned int input_size;
  unsigned int input_depth;
  unsigned int output_size;

public:
  Maxpool(unsigned int maxpool_size,
    unsigned int maxpool_stride,
    unsigned int input_size,
    unsigned int input_depth);
  ~Maxpool();
  void maxpool_layer(float input[], float output[]);

};

#endif /* _MAXPOOL_H_ */
