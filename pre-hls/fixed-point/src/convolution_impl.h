/* convolution_impl.h
 * Convolution and ReLU layer template function.
 * 
 * authors: Rafael COSTA SALES
 *          Duc Huy DAO
 */

template <typename IP, typename OP>
void Convolution::conv_layer(IP input[],
                             OP output[]) {

///// Zero padding /////

/***** VERY QUESTIONABLE DECLARATION *****/
	IP pad_input[(input_size+2*ZERO_PADDING)*(input_size+2*ZERO_PADDING)*input_depth];
///////////////////////////////////////////

	for (int d = 0; d < input_depth; d++) { // depth
		for (int r = 0; r < input_size+2*ZERO_PADDING; r++) { // row
			for (int c = 0; c < input_size+2*ZERO_PADDING; c++) { // column
				if (r < ZERO_PADDING || r >= input_size+ZERO_PADDING) pad_input[d*(input_size+2*ZERO_PADDING)*(input_size+2*ZERO_PADDING) + r*(input_size+2*ZERO_PADDING) + c] = 0;
				else if (c < ZERO_PADDING || c >= input_size+ZERO_PADDING) pad_input[d*(input_size+2*ZERO_PADDING)*(input_size+2*ZERO_PADDING) + r*(input_size+2*ZERO_PADDING) + c] = 0;
				else pad_input[d*(input_size+2*ZERO_PADDING)*(input_size+2*ZERO_PADDING) + r*(input_size+2*ZERO_PADDING) + c] = input[d*input_size*input_size + (r-ZERO_PADDING)*input_size + (c-ZERO_PADDING)];
			}
		}
	}

///// end of zero padding /////

/* ------------------------------- */

///// Convolution calculation /////

	// output[number_of_kernels][output_size][output_size]

	unsigned int o_r = 0; // output row index
	unsigned int o_c = 0; // output column index
	unsigned int o_d = 0; // output depth index

	for (int i = 0; i < number_of_kernels; i++) { // kernel canals
		for (int j = 0; j <= input_size+2*ZERO_PADDING-KERNEL_SIZE; j+=STRIDE) { // vertical slide of convolution second
			for (int k = 0; k <= input_size+2*ZERO_PADDING-KERNEL_SIZE; k+=STRIDE) { // horizontal slide of convolution first
				output[o_d*output_size*output_size + o_r*output_size + o_c] = 0;
				/////// begin conv op ////////
				for (int l = 0; l < input_depth; l++){ // operation with kernel depth last
					for (int m = 0; m < KERNEL_SIZE; m++) { // operation with kernel height second
						for (int n = 0; n < KERNEL_SIZE; n++) { // operation with kernel width first
							output[o_d*output_size*output_size + o_r*output_size + o_c] += pad_input[l*(input_size+2*ZERO_PADDING)*(input_size+2*ZERO_PADDING) + (j+m)*(input_size+2*ZERO_PADDING) + (k+n)]*kernel[i*KERNEL_SIZE*KERNEL_SIZE*input_depth + l*KERNEL_SIZE*KERNEL_SIZE + m*KERNEL_SIZE + n];
						}
				 	}
				}
				output[o_d*output_size*output_size + o_r*output_size + o_c] += bias[i]; // adding bias
				// RELU
				if (output[o_d*output_size*output_size + o_r*output_size + o_c] < 0) output[o_d*output_size*output_size + o_r*output_size + o_c] = 0;
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

///// end of calculation /////

}
