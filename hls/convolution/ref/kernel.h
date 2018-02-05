/* kernel.h
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#include "ac_fixed.h"

#define KERNEL_W 3
#define KERNEL_I 3

typedef const ac_fixed<KERNEL_W, KERNEL_I, true> kernel_t;

extern kernel_t kernel[];
extern kernel_t bias[];
