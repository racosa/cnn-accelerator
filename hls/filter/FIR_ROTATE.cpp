//
// Copyright 2003-2015 Mentor Graphics Corporation
//
// All Rights Reserved.
//
// THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
// MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
// 

/*
A simple function for a FIR filter using the FIR_TYPES.h
static for the taps means you need multiple unique functions
for different filters in the same design

This implementation is a "rotational" FIR architecture
It is designed to use only one multiply/accumulate and
"rotates" the taps so that no multiplexing is required.

This reduces area, but increase power consumption significantly
it also adds an extra cycle to the number of iterations

This architecture is sometimes seen in FPGA documentation
but is seldom used.
*/

// Include files for data types
#include "FIR_TYPES.h"

// optional pragma to specify the top level of the design
#pragma hls_design top
void FIR_HARDWARE (
	ac_channel<d_type>		&data_in,
	c_type					coeffs[N_TAPS],
	ac_channel<d_type>		&data_out
) {

	static d_type taps[N_TAPS];
// Optional "uninitialize" of taps memory
#if 0
#ifdef __SYNTHESIS__
	static bool taps_dummy = ac::init_array<AC_VAL_DC>(taps, N_TAPS) ; // Do not initialize tap memory
#endif
#endif
	a_type acc = 0;
	d_type temp_rotate ;
	// guard to ensure enough data is in the input channel
	if(data_in.available(1)) {
		MAC:for (int i=N_TAPS ; i>=0 ; i-- ) { //
			if (i==N_TAPS) {
				temp_rotate = data_in.read() ;
			} else {
				temp_rotate = taps[(N_TAPS-1)] ; // always the same index
				acc += temp_rotate * coeffs[i] ;
			}
			// Now the rotate right
			ROTATE:for (int j=(N_TAPS-1);j>=0;j--) {
				taps[j] = (j==0) ? temp_rotate : taps[j-1] ;
			}
		}
		data_out.write(acc) ; // Assign to different type
	}
}
