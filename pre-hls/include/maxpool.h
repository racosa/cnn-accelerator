#ifndef _MAXPOOL_H_
#define _MAXPOOL_H_

class Maxpool
{
private:
   int maxpool_size;
   int maxpool_stride;
   int input_size;
   int input_depth;
	 int zero_padding;
   int output_size;

public:
  Maxpool( int maxpool_size,
     int maxpool_stride,
     int input_size,
     int input_depth,
     int zero_padding);
  ~Maxpool();
  void maxpool_layer(float input[], float output[]);

};

#endif /* _MAXPOOL_H_ */
