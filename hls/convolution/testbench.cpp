#include <fstream>
#include <iostream>
#include "mc_scverify.h"
#include "convolution.h"
//#include "image.h"

CCS_MAIN(int argc, char *argv) {
    std::cout << "# Starting Testbench \n";
    std::ofstream input("input.txt");
    std::ofstream output("output.txt");
   
    static ac_channel<in_t> data_in;
    static ac_channel<out_t> data_out;
    in_t image[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
    data_in.write(image);

    CCS_DESIGN(apply_conv1)(data_in, data_out);

    for (int z = 0; z < INPUT_DEPTH; z++) {
        for (int y = 0; y < INPUT_SIZE_Y; y++) {
            for (int x = 0; x < INPUT_SIZE_X; x++) {
                input << data_in[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x].to_int() << " ";
                output << data_out[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x].to_int() << " "; 
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
