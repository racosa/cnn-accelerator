/* maxpool.cpp
 * Maxpool function implementation.
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#include "maxpool.h"

Maxpool::Maxpool(const int input_size, const int input_depth)
: input_size(input_size),
  input_depth(input_depth)
{
  output_size = ((input_size - MAXPOOL_SIZE + ZERO_PADDING) / MAXPOOL_STRIDE) + 1;
}

Maxpool::~Maxpool()
{}
