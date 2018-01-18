#ifndef _KERNELS_H_
#define _KERNELS_H_
#include "../include/fixed_point.h"

extern const ac_fixed<FIXP_KERNELS_W,FIXP_KERNELS_I,true, AC_RND_ZERO> conv1_weights[];
extern const ac_fixed<FIXP_KERNELS_W,FIXP_KERNELS_I,true, AC_RND_ZERO> conv1_biases[];
extern const ac_fixed<FIXP_KERNELS_W,FIXP_KERNELS_I,true, AC_RND_ZERO> conv2_weights[];
extern const ac_fixed<FIXP_KERNELS_W,FIXP_KERNELS_I,true, AC_RND_ZERO> conv2_biases[];
extern const ac_fixed<FIXP_KERNELS_W,FIXP_KERNELS_I,true, AC_RND_ZERO> conv3_weights[];
extern const ac_fixed<FIXP_KERNELS_W,FIXP_KERNELS_I,true, AC_RND_ZERO> conv3_biases[];
extern const ac_fixed<FIXP_KERNELS_W,FIXP_KERNELS_I,true, AC_RND_ZERO> local3_weights[];
extern const ac_fixed<FIXP_KERNELS_W,FIXP_KERNELS_I,true, AC_RND_ZERO> local3_biases[];

#endif /* _KERNELS_H_ */
