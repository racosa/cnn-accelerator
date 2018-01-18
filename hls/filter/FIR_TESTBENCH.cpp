//
// Copyright 2003-2015 Mentor Graphics Corporation
//
// All Rights Reserved.
//
// THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
// MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
// 

#include "FIR_TYPES.h"
#include "COEFFS_DOUBLE.h"
#include "math.h"
#include <fstream>
#include <iostream>
#include <iomanip>
using namespace std ;
#include "mc_scverify.h"

#define MY_2PI 2*3.14159265358979323846

CCS_MAIN(int argc, char *argv) {

	cout << "Starting Test" << endl ;
	ofstream INPUT_SIGNAL("input_signal.txt");
	ofstream OUTPUT_SIGNAL("output_signal.txt");

	c_type coeffs_fixed[N_TAPS] ;

	for (int i=0;i<N_TAPS;i++) {
		coeffs_fixed[i] = coeffs_double[i] ;
	}

	static ac_channel<d_type> data_in ;
	static ac_channel<d_type> data_out ;

	double double_in,double_out;
	double fixed_out ;
	double worst_error = 0 ;
	double diff ;

	d_type channel_read = 0;

	// here we create two sine waves of a given amplitude and frequency
	double wave1_amp = 100 ;
	double wave2_amp = 40 ;

	double sample_freq = 800 ;
	double wave1_freq = 1 ;
	double wave2_freq = 300 ;
	for (int i=0; i<sample_freq*3;i++) {
		double wave = sin(((double)i)/(sample_freq/wave1_freq)*MY_2PI) * wave1_amp 
					+ sin(((double)i)/(sample_freq/wave2_freq)*MY_2PI) * wave2_amp ;
		d_type temp = wave ;
		// reference double precision filter
		double_in = temp.to_double() ; 
		double_out = FIR_SIMPLE_REFERENCE(double_in,coeffs_double) ;
		data_in.write(temp) ;
		INPUT_SIGNAL << temp.to_int() << endl ;

		CCS_DESIGN(FIR_HARDWARE)(data_in,coeffs_fixed,data_out) ;

		if (data_out.available(1)) {
			channel_read = data_out.read() ;
			// compare with double precision reference
			fixed_out = channel_read.to_double() ;
			diff = fixed_out - double_out ;
			diff = (diff<0) ? -diff : diff ;
			worst_error = (diff > worst_error) ? diff : worst_error ;
			OUTPUT_SIGNAL << channel_read.to_int() << endl ;
		}
	}
	cout << "Simulation Done" << endl ;
	cout << "Worst error compared with double precision = " << worst_error << endl ;
	INPUT_SIGNAL.close() ;
	OUTPUT_SIGNAL.close() ;
	CCS_RETURN(0) ;
}
