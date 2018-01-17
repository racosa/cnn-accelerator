#ifndef _PRINT_ARRAY_H_
#define _PRINT_ARRAY_H_

#include <iostream>

template <typename T>
int print_array(T array, int heigth, int width, int depth) {    
    for (int d=0; d < depth; d++) {
        for (int x=0; x < heigth; x++) {
            for (int y=0; y < width; y++) {
                //std::cout << " " << x*heigth + y + d*heigth*width;
                std::cout << " " << array[x*heigth + y + d*heigth*width];
            }
            std::cout << "\n";
        }
        std::cout << "\n";
    }
    return 0;
}


#endif
