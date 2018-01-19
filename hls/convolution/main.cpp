#include <fstream>
#include <iostream>
#include "mc_scverify.h"
#include "convolution.h"
#include "image.h"

CCS_MAIN(int argc, char *argv) {
    std::cout << "# Starting Testbench \n";
    std::ofstream input("input.txt");
    std::ofstream output("output.txt");
   
    ac_channel<out_t> conv_out[160*120*3];
           
    apply_conv1(image, conv_out);

    for (int z = 0; z < INPUT_DEPTH; z++) {
        for (int y = 0; y < INPUT_SIZE_Y; y++) {
            for (int x = 0; x < INPUT_SIZE_X; x++) {
                input << image[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x].to_int() << " ";
                output << conv_out[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x].to_int() << " "; 
            }
            input << std::endl;
            output << std::endl;
        }
        input << std::endl;
        output << std::endl;
    }
    std::cout << "# End of Testbench \n";
    input.close();
    output.close();
    CCS_RETURN(0);
}
