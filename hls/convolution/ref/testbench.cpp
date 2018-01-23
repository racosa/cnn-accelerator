#include <iomanip>
#include <fstream>
#include <iostream>
#include "math.h"
//#include "mc_scverify.h"
#include "convolution.h"
#include "image.h"

//CCS_MAIN(int argc, char *argv) {
int main() {
    std::cout << "# Starting Testbench \n";
    std::ofstream input("input.txt");
    std::ofstream output("output.txt");
    
    in_t *conv_in = image;
    out_t conv_out[DATA_SIZE];
    for (int i = 0; i < DATA_SIZE; i++) {
      conv_out[i] = 0;
    }
 
    //CCS_DESIGN(apply_conv)(conv_in, conv_out);
    apply_conv(conv_in, conv_out);
    
    for (int z = 0; z < INPUT_DEPTH; z++) {
        for (int y = 0; y < INPUT_SIZE_Y; y++) {
            for (int x = 0; x < INPUT_SIZE_X; x++) {
                input << conv_in[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x] << " ";
                output << conv_out[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x] << " "; 
            }
            input << std::endl;
            output << std::endl;
        }
        input << std::endl;
        output << std::endl;
    }
    std::cout << "# End of Testbench \n";
    
    //CCS_RETURN(0);
    return 0;
}
