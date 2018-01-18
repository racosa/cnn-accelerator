//
// Copyright 2003-2015 Mentor Graphics Corporation
//
// All Rights Reserved.
//
// THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
// MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
// 

/*
A reference double precision filter for accuracy comparisons to floating point
*/

// Include files for data types
#include "FIR_TYPES.h"

double FIR_SIMPLE_REFERENCE (
	double	&data_in,
	double	coeffs[N_TAPS]
) {

	static double taps[N_TAPS];

	double acc;

	SHIFT:for(int i=(N_TAPS-1);i>=0;i--) {
		taps[i] = (i==0) ? data_in : taps[i-1] ;
	}
	acc = 0 ;
	MAC:for(int i=0;i<N_TAPS;i++) {
		acc += coeffs[i] * taps[i] ;
	}
	return acc ;
}
