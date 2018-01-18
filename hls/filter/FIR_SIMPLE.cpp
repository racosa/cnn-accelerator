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

Note that this implementation is a 63-tap filter without an 
expectation of symmetry
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
	a_type acc;
	// guard to ensure enough data is in the input channel
	if(data_in.available(1)) {
		SHIFT:for(int i=(N_TAPS-1);i>=0;i--) {
			taps[i] = (i==0) ? data_in.read() : taps[i-1] ;
		}
		acc = 0 ;
		MAC:for(int i=0;i<N_TAPS;i++) {
			acc += coeffs[i] * taps[i] ;
		}
		data_out.write(acc) ;
	}
}
