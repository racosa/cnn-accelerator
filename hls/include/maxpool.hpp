#ifndef _MAXPOOL_HPP_
#define _MAXPOOL_HPP_

class Maxpool
{
    private:
        unsigned int input_size;
        unsigned int input_depth;
        unsigned int field_size;
        unsigned int stride;
        unsigned int output_size;
    public:
        Maxpool(unsigned int input_size,
        unsigned int input_depth,
        unsigned int field_size,
        unsigned int stride,
        unsigned int output_size);
        ~Maxpool();
        float** pool(float** input);
};

#endif /* _MAXPOOL_HPP_ */
