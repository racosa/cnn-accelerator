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

This implementation is a "Circular Buffer" FIR architecture
It is designed to use only one multiply/accumulate and implements
the taps as a circular buffer in a SPRAM

A SPRAM can be used as the reading of data is conditional to
allow the write of the input sample to occur without
needing a subsequent read.

the architecture is ideal for large-tap, low data rate filters
where efficient implementations are desired.

It does not implement folding due to the bandwidth limitation of
redaing one tap per cylce from SRAM.

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
#if 1
#ifdef __SYNTHESIS__
	static bool taps_dummy = ac::init_array<AC_VAL_DC>(taps, N_TAPS) ; // Do not initialize tap memory
#endif
#endif
	static ac_int<ac::nbits<(N_TAPS)>::val,false> write_index = 0 ;

	// guard to ensure enough data is in the input channel
	if(data_in.available(1)) {
		a_type acc = 0;
		d_type temp_data ;
		ac_int<ac::nbits<(N_TAPS)>::val,false> read_index = write_index ;
		// Implement circular buffer logic
		MAC:for (int i = 0 ; i < N_TAPS ; i++ ) {
			if (i==0) {
				temp_data = data_in.read() ;
				taps[write_index] = temp_data ; // store it
				if (write_index == (N_TAPS-1))
					write_index = 0 ;
				else
					write_index++ ;
			} else {
				temp_data = taps[read_index] ;
			}
			acc += temp_data * coeffs[i] ;
			// update read index for circular buffer
			if (read_index == 0)
				read_index = (N_TAPS-1) ;
			else
				read_index-- ;
		}
		data_out.write(acc) ; // Assign to different type
	}
}
