#ifndef _CIFAR10_H_
#define _CIFAR10_H_

#include <fstream>
#include <iostream>
#include <stdint.h>
#include <numeric>
#include "../include/fixed_point.h"

template <typename T>
int load_file(const char *file_name,
              T *buffer);
int read_cifar10(uint8_t *images, uint8_t *labels);
int print_image(double *images, uint8_t *labels, int index, bool normalized);

#include "../src/load_file_impl.h"

#endif /* _CIFAR10_H_ */
