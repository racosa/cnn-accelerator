/* cifar10.h
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#ifndef _CIFAR10_H_
#define _CIFAR10_H_

#include <fstream>
#include <iostream>
#include <stdint.h>
#include <numeric> 

int load_file(const char *file_name, float *buffer);
int read_cifar10(uint8_t *images, uint8_t *labels);
int print_image(double *images, uint8_t *labels, int index, bool normalized);

#endif /* _CIFAR10_H_ */
