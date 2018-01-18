#ifndef _KERNELS_H_
#define _KERNELS_H_

#include "../include/fixed_point.h"

extern const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true> conv1_weights[];
extern const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true> conv1_biases[];
extern const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true> conv2_weights[];
extern const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true> conv2_biases[];
extern const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true> conv3_weights[];
extern const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I, true> conv3_biases[];
extern const double local3_weights[];
extern const double local3_biases[];

#endif /* _KERNELS_H_ */
