#include <fstream>
#include <iostream>
#include "convolution.h"
#include "image.h"

int main() {
    std::ofstream input("input.txt");
    std::ofstream output("output.txt");

    ac_fixed<OUT_W, OUT_I, false> conv_out[160*120*3];

    apply_conv1(image, conv_out);

    for (int z = 0; z < INPUT_DEPTH; z++) {
        for (int y = 0; y < INPUT_SIZE_Y; y++) {
            for (int x = 0; x < INPUT_SIZE_X; x++) {
                input << image[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x] << " ";
                output << conv_out[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x] << " ";
            }
            input << std::endl;
            output << std::endl;
        }
        input << std::endl;
        output << std::endl;
    }
    input.close();
    output.close();
    return 0;
}
