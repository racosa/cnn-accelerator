/* kernel.h
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#include "ac_fixed.h"

#define KERNEL_W 4
#define KERNEL_I 0

typedef const ac_fixed<KERNEL_W, KERNEL_I, false> kernel_t;

extern kernel_t kernel[];
extern kernel_t bias[];
