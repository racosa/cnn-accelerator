#include <fstream>
#include <iostream>
#include <stdint.h>
#include <numeric> 

int load_file(const char *file_name, float *buffer);
int read_cifar10(uint8_t *images, uint8_t *labels);
int print_image(double *images, uint8_t *labels, int index, bool normalized);

