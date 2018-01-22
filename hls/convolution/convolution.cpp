#include "convolution.h"

#pragma hls_design top
void apply_conv1(ac_channel<in_t> &data_in,
                 ac_channel<out_t> &data_out) {
    
    in_t input = data_in.read();        
    in_t pad_input[(INPUT_SIZE_X+2*ZERO_PADDING)*(INPUT_SIZE_Y+2*ZERO_PADDING)*INPUT_DEPTH];
    //out_t output[160*120*3];
    out_t output[24];
    
    for (int d = 0; d < INPUT_DEPTH; d++) { // depth
        for (int r = 0; r < INPUT_SIZE_Y+2*ZERO_PADDING; r++) { // row
            for (int c = 0; c < INPUT_SIZE_X+2*ZERO_PADDING; c++) { // column
                if (r < ZERO_PADDING || r >= INPUT_SIZE_Y+ZERO_PADDING) pad_input[d*(INPUT_SIZE_X+2*ZERO_PADDING)*(INPUT_SIZE_Y+2*ZERO_PADDING) + r*(INPUT_SIZE_X+2*ZERO_PADDING) + c] = 0;
                else if (c < ZERO_PADDING || c >= INPUT_SIZE_X+ZERO_PADDING) pad_input[d*(INPUT_SIZE_X+2*ZERO_PADDING)*(INPUT_SIZE_Y+2*ZERO_PADDING) + r*(INPUT_SIZE_X+2*ZERO_PADDING) + c] = 0;
                else pad_input[d*(INPUT_SIZE_X+2*ZERO_PADDING)*(INPUT_SIZE_Y+2*ZERO_PADDING) + r*(INPUT_SIZE_X+2*ZERO_PADDING) + c] = (in_t)input[d*INPUT_SIZE_X*INPUT_SIZE_Y + (r-ZERO_PADDING)*INPUT_SIZE_X + (c-ZERO_PADDING)];
            }
        }
    }

    int o_r = 0; // output row index
    int o_c = 0; // output column index
    int o_d = 0; // output depth index

    for (int i = 0; i < NB_KERNELS; i++) { // kernel canals
        for (int j = 0; j <= INPUT_SIZE_Y+2*ZERO_PADDING-KERNEL_SIZE; j+=STRIDE) { // vertical slide of convolution second
            for (int k = 0; k <= INPUT_SIZE_X+2*ZERO_PADDING-KERNEL_SIZE; k+=STRIDE) { // horizontal slide of convolution first
                output[o_d*OUTPUT_SIZE_X*OUTPUT_SIZE_Y + o_r*OUTPUT_SIZE_X + o_c] = 0;
                /////// begin conv op ////////
                for (int l = 0; l < INPUT_DEPTH; l++){ // operation with kernel depth last
                    for (int m = 0; m < KERNEL_SIZE; m++) { // operation with kernel height second
                        for (int n = 0; n < KERNEL_SIZE; n++) { // operation with kernel width first
                            output[o_d*OUTPUT_SIZE_X*OUTPUT_SIZE_Y + o_r*OUTPUT_SIZE_X + o_c] = output[o_d*OUTPUT_SIZE_X*OUTPUT_SIZE_Y + o_r*OUTPUT_SIZE_X + o_c] + pad_input[l*(INPUT_SIZE_X+2*ZERO_PADDING)*(INPUT_SIZE_Y+2*ZERO_PADDING) + (j+m)*(INPUT_SIZE_X+2*ZERO_PADDING) + (k+n)]*kernel[i*KERNEL_SIZE*KERNEL_SIZE*INPUT_DEPTH + l*KERNEL_SIZE*KERNEL_SIZE + m*KERNEL_SIZE + n];
                        }
                    }
                }
                output[o_d*OUTPUT_SIZE_X*OUTPUT_SIZE_Y + o_r*OUTPUT_SIZE_X + o_c] = output[o_d*OUTPUT_SIZE_X*OUTPUT_SIZE_Y + o_r*OUTPUT_SIZE_X + o_c] + bias[i]; // adding bias
                // RELU
                if (output[o_d*OUTPUT_SIZE_X*OUTPUT_SIZE_Y + o_r*OUTPUT_SIZE_X + o_c] < 0) output[o_d*OUTPUT_SIZE_X*OUTPUT_SIZE_Y + o_r*OUTPUT_SIZE_X + o_c] = 0;
                ////// end of conv op ///////
                o_c+=1;
            }
            o_c = 0;
            o_r+=1;
        }
        o_c = 0;
        o_r = 0;
        o_d+=1;
    }
    data_out.write(output);
}
