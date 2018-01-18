#ifndef _FIXED_POINT_H_
#define _FIXED_POINT_H_

#include "../lib/ac_fixed.h"

#define FIXP_IMAGES_W 5 //OK 75% FP SOLO (mini W = 5, W = 64 -> 75% aussi)
#define FIXP_IMAGES_I 2

#define FIXP_LABELS_W 4 //OK Integer sur 4 bits (labels de 0 à 9)
#define FIXP_LABELS_I 4

#define FIXP_KERNELS_W 10 // 75% W = 17, I = 3
#define FIXP_KERNELS_I 3

#define FIXP_CONV1_W 11 // 
#define FIXP_CONV1_I 5 //

#define FIXP_MP1_W 64
#define FIXP_MP1_I 10

#define FIXP_CONV2_W 64
#define FIXP_CONV2_I 10

#define FIXP_MP2_W 64
#define FIXP_MP2_I 10

#define FIXP_CONV3_W 64
#define FIXP_CONV3_I 10

#define FIXP_MP3_W 64
#define FIXP_MP3_I 10

#define FIXP_RESHAPE_W 32
#define FIXP_RESHAPE_I 16

#define FIXP_FC_W 32
#define FIXP_FC_I 16

#endif /* _FIXED_POINT_H_ */
