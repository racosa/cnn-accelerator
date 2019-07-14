/* fixed_point.h
 * Fixed point parameters.
 */

#ifndef _FIXED_POINT_H_
#define _FIXED_POINT_H_

#include "../lib/ac_fixed.h"
/* - 72/100: Images<8,2>, Kernels<9,3>, Conv1/Mp1<11,5>,
 * Conv2-3<11,8>
 */

#define FIXP_IMAGES_W 8
#define FIXP_IMAGES_I 2

#define FIXP_LABELS_W 4
#define FIXP_LABELS_I 4

#define FIXP_KERNELS_W 9
#define FIXP_KERNELS_I 3

#define FIXP_CONV1_W 11
#define FIXP_CONV1_I 5

#define FIXP_MP1_W 11
#define FIXP_MP1_I 5

#define FIXP_CONV2_W 11
#define FIXP_CONV2_I 8

#define FIXP_MP2_W 11
#define FIXP_MP2_I 8

#define FIXP_CONV3_W 11
#define FIXP_CONV3_I 8

#define FIXP_MP3_W 11
#define FIXP_MP3_I 8

#define FIXP_RESHAPE_W 11
#define FIXP_RESHAPE_I 8

#define FIXP_FC_W 11
#define FIXP_FC_I 8

#endif /* _FIXED_POINT_H_ */
