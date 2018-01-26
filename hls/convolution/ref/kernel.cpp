#include "kernel.h"

// Identity
//kernel_t kernel[81] = {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0};

// Sharpen
//kernel_t kernel[81] = {0, -1, 0, -1, 5, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 5, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 5, -1, 0, -1, 0};

// Edge
//kernel_t kernel[81] = {-1, -1, -1, -1, 8, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//                       0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, 8, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, 8, -1, -1, -1, -1};

// Gaussian Blur
//kernel_t kernel[81] = {0.0625, 0.125, 0.0625, 0.125, 0.25, 0.125, 0.0625, 0.125, 0.0625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0625, 0.125, 0.0625, 0.125, 0.25, 0.125, 0.0625, 0.125, 0.0625, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0.0625, 0.125, 0.0625, 0.125, 0.25, 0.125, 0.0625, 0.125, 0.0625};

// Emboss Effect
kernel_t kernel[81] = {-2, -1, 0, -1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, -2, -1, 0, -1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, -1, 0, -1, 1, 1, 0, 1, 2};




kernel_t bias[3] = {0, 0 ,0};
    
