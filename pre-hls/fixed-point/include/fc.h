/* fc.h
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#include "../include/fixed_point.h"

void reshape(ac_fixed<FIXP_MP3_W, FIXP_MP3_I, true, AC_RND_ZERO> input[],
             ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true, AC_RND_ZERO> output[]);

void fully_connected(ac_fixed<FIXP_RESHAPE_W, FIXP_RESHAPE_I, true, AC_RND_ZERO> input[],
                     const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I,true, AC_RND_ZERO> matrix[],
                     ac_fixed<FIXP_FC_W, FIXP_FC_I,true, AC_RND_ZERO> output[],
                     const ac_fixed<FIXP_KERNELS_W, FIXP_KERNELS_I,true, AC_RND_ZERO> bias[]);
