#include <iostream>
#include "cifar10.h"

int main() {
    char *images;
    if(read_cifar10(&images)) return 1; // Error: Batch file not found.
          
    int index = 0;
    print_image(images, index);
  
    return 0;
}
