#include <iostream>
#include <iomanip>
#include "../include/cifar10.h"
#include "../include/kernels.h"

int main() {
    float images[100*1728];
    float labels[100];
    
    load_file("100-normalized-images.out", images);
    load_file("100-labels.out", labels);
    
    return 0;
}
