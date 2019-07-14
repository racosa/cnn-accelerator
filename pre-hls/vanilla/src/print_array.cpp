/* print_array.cpp
 * Functions used to print arrays to cout
 */

#include <iostream>

int print_array(float *array, int heigth, int width, int depth) {
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

int print_array(const float *array, int heigth, int width, int depth) {
    for (int d=0; d < depth; d++) {
        for (int x=0; x < heigth; x++) {
            for (int y=0; y < width; y++) {
                std::cout << " " << array[x*heigth + y + d*heigth*width];
            }
            std::cout << "\n";
        }
        std::cout << "\n";
    }
    return 0;
}
