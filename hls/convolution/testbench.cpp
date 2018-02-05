/* testbench.cpp
 * Convolution + ReLU layer testbench.
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

#include <iomanip>
#include <fstream>
#include <iostream>
#include "math.h"
#include "mc_scverify.h"
#include "convolution.h"
#include "image.h"

CCS_MAIN(int argc, char *argv) {
    std::cout << "# Starting Testbench \n";
    std::ofstream input("input.txt");
    std::ofstream output("output.txt");
    
    out_t conv_out[DATA_SIZE];
    for (int i = 0; i < DATA_SIZE; i++) {
      conv_out[i] = 0;
    }
 
    CCS_DESIGN(apply_conv)(image, conv_out);
    
    for (int z = 0; z < INPUT_DEPTH; z++) {
        for (int y = 0; y < INPUT_SIZE_Y; y++) {
            for (int x = 0; x < INPUT_SIZE_X; x++) {
                if (z == INPUT_DEPTH-1 && y == INPUT_SIZE_Y-1 && x == INPUT_SIZE_X-1){
                    input << image[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x] << "\n";
                    output << conv_out[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x] << "\n";
                }
                else{
                    input << image[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x] << " ";
                    output << conv_out[z*INPUT_SIZE_X*INPUT_SIZE_Y + y*INPUT_SIZE_X + x] << " ";
                }    
            }
        }    
    }
    CCS_RETURN(0);
}
