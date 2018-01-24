
//------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/siflibs/mgc_io_sync_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v1 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


module mgc_in_sync_v1 (vd, vz);
    parameter valid = 1;

    output vd;
    input  vz;

    wire   vd;

    assign vd = vz;

endmodule



//------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_generic_reg_beh.v 
`define POS_CLK_POS_ASYNC 0
`define POS_CLK_NEG_ASYNC 1
`define NEG_CLK_POS_ASYNC 2
`define NEG_CLK_NEG_ASYNC 3
`define POS_CLK_NO_ASYNC 4
`define NEG_CLK_NO_ASYNC 5
`define N_COMBS 6

module mgc_generic_reg (d, clk, en, a_rst, s_rst, q);
   parameter width = 8;
   parameter ph_clk = 1;//clock polarity, 1=rising_edge
   parameter ph_en = 1;
   parameter ph_a_rst = 1;  // 0 to 1 IGNORED
   parameter ph_s_rst = 1;  // 0 to 1 IGNORED
   parameter a_rst_used = 1;
   parameter s_rst_used = 0;
   parameter en_used = 0;

   input  [width-1:0] d;
   input              clk;
   input              en;
   input              a_rst;
   input              s_rst;
   output [width-1:0] q;

   reg [width-1:0] q_temp [`N_COMBS-1:0];

   always@(posedge a_rst or posedge clk)
   begin
     if (a_rst)
       q_temp[`POS_CLK_POS_ASYNC] <= {width{1'b0}};
     else if (s_rst == ph_s_rst)
       q_temp[`POS_CLK_POS_ASYNC] <= {width{1'b0}};
     else begin
       if (((ph_en!=0) & en) | ((ph_en==0) & (en==0))) begin
         q_temp[`POS_CLK_POS_ASYNC] <= d;
       end
     end
   end

   always@(negedge a_rst or posedge clk)
   begin
     if (!a_rst)
       q_temp[`POS_CLK_NEG_ASYNC] <= {width{1'b0}};
     else if (s_rst == ph_s_rst)
       q_temp[`POS_CLK_NEG_ASYNC] <= {width{1'b0}};
     else begin
       if (((ph_en!=0) & en) | ((ph_en==0) & (en==0))) begin
         q_temp[`POS_CLK_NEG_ASYNC] <= d;
       end
     end
   end

   always@(posedge a_rst or negedge clk)
   begin
     if (a_rst)
       q_temp[`NEG_CLK_POS_ASYNC] <= {width{1'b0}};
     else if (s_rst == ph_s_rst)
       q_temp[`NEG_CLK_POS_ASYNC] <= {width{1'b0}};
     else begin
       if (((ph_en!=0) & en) | ((ph_en==0) & (en==0))) begin
         q_temp[`NEG_CLK_POS_ASYNC] <= d;
       end
     end
   end

   always@(negedge a_rst or negedge clk)
   begin
     if (!a_rst)
       q_temp[`NEG_CLK_NEG_ASYNC] <= {width{1'b0}};
     else if (s_rst == ph_s_rst)
       q_temp[`NEG_CLK_NEG_ASYNC] <= {width{1'b0}};
     else begin
       if (((ph_en!=0) & en) | ((ph_en==0) & (en==0))) begin
         q_temp[`NEG_CLK_NEG_ASYNC] <= d;
       end
     end
   end

   assign q = ph_clk ?
		   (ph_a_rst ?
		     q_temp[`POS_CLK_POS_ASYNC]: q_temp[`POS_CLK_NEG_ASYNC]) :
		   (ph_a_rst ?
		     q_temp[`NEG_CLK_POS_ASYNC]: q_temp[`NEG_CLK_NEG_ASYNC]);
endmodule

//------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/siflibs/ram_singleport_be_fpga.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module singleport_ram_be ( data_in, addr, re, we, data_out, clk, a_rst, s_rst, en);

parameter ram_id          = 1;
parameter words           = 'd256;
parameter width           = 8;
parameter addr_width      = 8;
parameter [0:0] a_reset_active  = 0;
parameter [0:0] s_reset_active  = 1;
parameter [0:0] enable_active   = 1;
parameter [0:0] re_active   = 1;
parameter [0:0] we_active   = 1;
parameter num_byte_enables = 1;
parameter clock_edge = 1;
parameter num_input_registers         = 1;
parameter num_output_registers        = 0;
parameter no_of_singleport_readwrite_port  = 1;

localparam byte_width = width / num_byte_enables;

  input [(width*no_of_singleport_readwrite_port)-1:0] data_in;
  input [(addr_width*no_of_singleport_readwrite_port)-1:0] addr;
  input [(no_of_singleport_readwrite_port*num_byte_enables)-1:0] re;
  input [(no_of_singleport_readwrite_port*num_byte_enables)-1:0] we;
  output [(width*no_of_singleport_readwrite_port)-1:0] data_out;
  input clk;
  input a_rst;
  input s_rst;
  input en;

  reg  [width-1:0] mem [words-1:0];

  reg [addr_width-1        :0] addr_reg;
  reg [num_byte_enables-1:0] re_reg;

// synopsys translate_off
  integer count;
  initial
  begin
    for (count = 0; count < words; count = count + 1) 
      mem[count] = 0;
  end
// synopsys translate_on

  reg [width-1:0] data_in_inreg [((num_input_registers > 1) ? num_input_registers - 2 : 0): 0];
  reg [addr_width-1:0] addr_inreg [((num_input_registers > 1) ? num_input_registers - 2 : 0): 0];
  reg [num_byte_enables-1:0] re_inreg [((num_input_registers > 1) ? num_input_registers - 2 : 0): 0];
  reg [num_byte_enables-1:0] we_inreg [((num_input_registers > 1) ? num_input_registers - 2 : 0): 0];

  genvar i;
  generate
    if (num_input_registers > 1)
    begin
      for( i=num_input_registers-2; i >= 1; i = i - 1)
      begin : SHIFT_MSBs // Verilog 2000 syntax requires that GENERATE_LOOP_STATEMENT be a named block
                         // Modelsim seems to allow it though it should be a bug
        wire [width-1:0] data_in_i;
        wire [addr_width-1:0] addr_i;
        wire [num_byte_enables-1:0] re_i;
        wire [num_byte_enables-1:0] we_i;
  
        mgc_generic_reg #(width,      clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b0) i_data_in_inreg (data_in_inreg[i-1], clk, en, a_rst, s_rst, data_in_i);
        mgc_generic_reg #(addr_width, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b0) i_addr_inreg    (addr_inreg[i-1],    clk, en, a_rst, s_rst, addr_i);
        mgc_generic_reg #(num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b0) i_re_inreg      (re_inreg[i-1],      clk, en, a_rst, s_rst, re_i);
        mgc_generic_reg #(num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b0) i_we_inreg      (we_inreg[i-1],      clk, en, a_rst, s_rst, we_i);
  
        always@(data_in_i)
          data_in_inreg[i] = data_in_i;
  
        always@(addr_i)
          addr_inreg[i] = addr_i;
  
        always@(re_i)
          re_inreg[i] = re_i;
        always@(we_i)
          we_inreg[i] = we_i;
      end // end for loop

      // SHIFT for the first stage
      wire [width-1:0] data_in_init;
      wire [addr_width-1:0] addr_init;
      wire [num_byte_enables-1:0] re_init;
      wire [num_byte_enables-1:0] we_init;
    
      mgc_generic_reg #(width,      clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_data_in_inreg_i (data_in, clk, en, a_rst, s_rst, data_in_init);
      mgc_generic_reg #(addr_width, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_addr_inreg_i    (addr,    clk, en, a_rst, s_rst, addr_init);
      mgc_generic_reg #(num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_re_inreg_i      (re,      clk, en, a_rst, s_rst, re_init);
      mgc_generic_reg #(num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_we_inreg_i      (we,      clk, en, a_rst, s_rst, we_init);
    
      always@(data_in_init)
        data_in_inreg[0] = data_in_init;
    
      always@(addr_init)
        addr_inreg[0] = addr_init;
    
      always@(re_init)
        re_inreg[0] = re_init;

      always@(we_init)
        we_inreg[0] = we_init;
    end
  endgenerate

  wire [width-1:0]      data_in_f = (num_input_registers > 1) ? data_in_inreg[num_input_registers-2] : data_in;
  wire [addr_width-1:0] addr_f    = (num_input_registers > 1) ? addr_inreg[num_input_registers-2]    : addr;
  wire [num_byte_enables-1:0]            re_f      = (num_input_registers > 1) ? re_inreg[num_input_registers-2]      : re;
  wire [num_byte_enables-1:0]            we_f      = (num_input_registers > 1) ? we_inreg[num_input_registers-2]      : we;

  reg addr_NotDontCare;
  reg addr_NotDontCare2;
  integer j, k, l, m, n, o, p, q;

  generate
    if (clock_edge == 1'b1)
      begin: POSEDGE_BLK
        always @(posedge clk)
        begin
          if ( en == enable_active )
          begin
            addr_NotDontCare = 1'b1;
            begin: blk_X
              for (j = 0; j < addr_width; j = j + 1)
              begin
                if ((addr_f[j] === 1'bX) || (addr_f[j] === 1'bZ))
                begin
                  addr_NotDontCare = 1'b0;
                  for (k = 0; k < num_byte_enables; k = k + 1)
                  begin
                    if (we_f[k] == we_active) begin
                      $display($time, " Error: Dont-care addresses for pipelined singleport memory write");
                      $finish;
                    end
                  end
                  disable blk_X;
                end
              end
            end
                                                                                        
            addr_reg <= addr_f;
            re_reg   <= re_f;

            if (addr_NotDontCare)
            begin
              if ((addr_f < words) && (addr_f >= 0)) begin
                for (j = 0; j < num_byte_enables; j = j + 1)
                begin
                  if (we_f[j] == we_active) begin
                    // mem[addr_f] <= data_in_f;
                    mem[addr_f][((j*byte_width)+byte_width)-1-:byte_width] <= data_in_f[((j*byte_width)+byte_width)-1-:byte_width];
                  end
                end
              end else begin
                for (j = 0; j < num_byte_enables; j = j + 1)
                begin
                  if (we_f[j] == we_active) begin
                    $display($time, " Error: Out-of-bound pipelined singleport memory-write");
                    $finish;
                  end
                end
              end
            end
          end
        end
      end
    else
      begin: NEGEDGE_BLK
        always @(negedge clk)
        begin
          if ( en == enable_active )
          begin
            addr_NotDontCare = 1'b1;
            begin: blk_X
              for (n = 0; n < addr_width; n = n + 1)
              begin
                if ((addr_f[n] === 1'bX) || (addr_f[n] === 1'bZ))
                begin
                  addr_NotDontCare = 1'b0;
                  for (o = 0; o < num_byte_enables; o = o + 1)
                  begin
                    if (we_f[o] == we_active) begin
                      $display($time, " Error: Dont-care addresses for pipelined singleport memory write");
                      $finish;
                    end
                  end
                  disable blk_X;
                end
              end
            end
                                                                                        
            addr_reg <= addr_f;
            re_reg   <= re_f;

            if (addr_NotDontCare)
            begin
              if ((addr_f < words) && (addr_f >= 0)) begin
                for (n = 0; n < num_byte_enables; n = n + 1)
                begin
                  if (we_f[n] == we_active) begin
                    // mem[addr_f] <= data_in_f;
                    mem[addr_f][((n*byte_width)+byte_width)-1-:byte_width] <= data_in_f[((n*byte_width)+byte_width)-1-:byte_width];
                  end
                end
              end else begin
                for (n = 0; n < num_byte_enables; n = n + 1)
                begin
                  if (we_f[n] == we_active) begin
                    $display($time, " Error: Out-of-bound pipelined singleport memory-write");
                    $finish;
                  end
                end
              end
            end
          end
        end
      end
  endgenerate

  reg [width-1:0] data_out_f;

  integer r; //TODO: added k to match vhdl
  always@(
          mem[addr_reg]
	       or addr_reg
          //TODO: commented difference// or addr_NotDontCare
	        or re_reg
          )
  begin
   //TODO: added to match VHDL :
    addr_NotDontCare2 = 1'b1;

    for(k= 0; k < addr_width; k = k+ 1)
    begin
      if ((addr_reg[k] === 1'bX) || (addr_reg[k] === 1'bZ)) begin
        addr_NotDontCare2 = 1'b0 ; 
      end
    end //loop

    if (addr_NotDontCare2 )
    //begin
      if ((addr_reg < words) && (addr_reg >= 0))
        for (r = 0; r < num_byte_enables; r = r + 1)
        begin
	        if ( re_reg[r] == re_active )
            data_out_f[((r*byte_width) + byte_width) - 1 -: byte_width] <= mem[addr_reg][((r*byte_width) + byte_width) - 1 -: byte_width];
          else
            data_out_f[((r*byte_width) + byte_width) - 1 -: byte_width] <= {(byte_width){1'bX}};
        end //end for loop
      else
        data_out_f <= {width{1'bX}};
    else
      data_out_f <= {width{1'bX}};
  end


  reg [width-1:0] data_out_outreg [(num_output_registers > 0 ? num_output_registers - 1 : 0): 0];

  genvar t;
  generate
    if (num_output_registers > 0)
    begin
      for( t = num_output_registers-1; t >= 1; t = t - 1)
      begin : SHIFT_MSBs // Verilog 2000 syntax requires that GENERATE_LOOP_STATEMENT be a named block
                         // Modelsim seems to allow it though it should be a bug
        wire [width-1:0] data_out_i;
        mgc_generic_reg #(width, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_data_out_outreg (data_out_outreg[t-1], clk, en, a_rst, s_rst, data_out_i);
  
        always@(data_out_i)
          data_out_outreg[t] = data_out_i;
      end // end for loop

      // SHIFT for the first stage
      wire [width-1:0] data_out_init;
      mgc_generic_reg #(width, clock_edge, enable_active, a_reset_active, s_reset_active, 1'b0, 1'b0, 1'b1) i_data_out_outreg_i (data_out_f, clk, en, a_rst, s_rst, data_out_init);

      always@(data_out_init)
        data_out_outreg[0] = data_out_init;
    end
  endgenerate

  assign data_out = (num_output_registers > 0) ? data_out_outreg[num_output_registers-1] : data_out_f;

endmodule

module singleport_ram_be_port ( data_in_d, addr_d, re_d, we_d, data_out_d, data_in, addr, re, we, data_out, clk, a_rst, s_rst, en);

parameter ram_id          = 1;
parameter words           = 256;
parameter width           = 8;
parameter addr_width      = 8;
parameter [0:0] a_reset_active  = 0;
parameter [0:0] s_reset_active  = 1;
parameter [0:0] enable_active   = 1;
parameter [0:0] re_active   = 1;
parameter [0:0] we_active   = 1;
parameter num_byte_enables = 1;
parameter clock_edge = 1;
parameter num_input_registers         = 1;
parameter num_output_registers        = 0;
parameter no_of_singleport_readwrite_port  = 1;

  input [(width*no_of_singleport_readwrite_port)-1:0] data_in_d;
  input [(addr_width*no_of_singleport_readwrite_port)-1:0] addr_d;
  input [(no_of_singleport_readwrite_port*num_byte_enables)-1:0] re_d;
  input [(no_of_singleport_readwrite_port*num_byte_enables)-1:0] we_d;
  output [(width*no_of_singleport_readwrite_port)-1:0] data_out_d;
  output [(width*no_of_singleport_readwrite_port)-1:0] data_in;
  output [(addr_width*no_of_singleport_readwrite_port)-1:0] addr;
  output [(no_of_singleport_readwrite_port*num_byte_enables)-1:0] re;
  output [(no_of_singleport_readwrite_port*num_byte_enables)-1:0] we;
  input[(width*no_of_singleport_readwrite_port)-1:0] data_out;
  input clk;
  input a_rst;
  input s_rst;
  input en;

  assign data_in    = data_in_d;
  assign addr       = addr_d;
  assign re         = re_d;
  assign we         = we_d;
  assign data_out_d = data_out;

endmodule

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.0a/269363 Production Release
//  HLS Date:       Wed Nov  9 17:38:00 PST 2016
// 
//  Generated by:   xph3sei702@cimeld95
//  Generated date: Wed Jan 24 16:08:30 2018
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen
// ------------------------------------------------------------------


module ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen
    (
  en, data_out, we, re, addr, data_in, data_in_d, addr_d, re_d, we_d, data_out_d,
      en_d
);
  output en;
  input [9:0] data_out;
  output we;
  output re;
  output [15:0] addr;
  output [9:0] data_in;
  input [9:0] data_in_d;
  input [15:0] addr_d;
  input re_d;
  input we_d;
  output [9:0] data_out_d;
  input en_d;



  // Interconnect Declarations for Component Instantiations 
  assign en = (en_d);
  assign data_out_d = data_out;
  assign we = (we_d);
  assign re = (re_d);
  assign addr = (addr_d);
  assign data_in = (data_in_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen
// ------------------------------------------------------------------


module ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen
    (
  we, addr, data_in, data_in_d, addr_d, we_d
);
  output we;
  output [15:0] addr;
  output [10:0] data_in;
  input [10:0] data_in_d;
  input [15:0] addr_d;
  input we_d;



  // Interconnect Declarations for Component Instantiations 
  assign we = (we_d);
  assign addr = (addr_d);
  assign data_in = (data_in_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen
// ------------------------------------------------------------------


module ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen
    (
  data_out, re, addr, addr_d, re_d, data_out_d
);
  input [9:0] data_out;
  output re;
  output [15:0] addr;
  input [15:0] addr_d;
  input re_d;
  output [9:0] data_out_d;



  // Interconnect Declarations for Component Instantiations 
  assign data_out_d = data_out;
  assign re = (re_d);
  assign addr = (addr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    apply_conv_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module apply_conv_core_core_fsm (
  clk, rst, fsm_output, PAD_for_for_C_3_tr0, PAD_for_C_0_tr0, PAD_C_0_tr0, CONV_H_SLIDE_C_30_tr0,
      CONV_V_SLIDE_C_0_tr0, CONV_NB_K_C_0_tr0
);
  input clk;
  input rst;
  output [40:0] fsm_output;
  reg [40:0] fsm_output;
  input PAD_for_for_C_3_tr0;
  input PAD_for_C_0_tr0;
  input PAD_C_0_tr0;
  input CONV_H_SLIDE_C_30_tr0;
  input CONV_V_SLIDE_C_0_tr0;
  input CONV_NB_K_C_0_tr0;


  // FSM State Type Declaration for apply_conv_core_core_fsm_1
  parameter
    main_C_0 = 6'd0,
    PAD_for_for_C_0 = 6'd1,
    PAD_for_for_C_1 = 6'd2,
    PAD_for_for_C_2 = 6'd3,
    PAD_for_for_C_3 = 6'd4,
    PAD_for_C_0 = 6'd5,
    PAD_C_0 = 6'd6,
    CONV_H_SLIDE_C_0 = 6'd7,
    CONV_H_SLIDE_C_1 = 6'd8,
    CONV_H_SLIDE_C_2 = 6'd9,
    CONV_H_SLIDE_C_3 = 6'd10,
    CONV_H_SLIDE_C_4 = 6'd11,
    CONV_H_SLIDE_C_5 = 6'd12,
    CONV_H_SLIDE_C_6 = 6'd13,
    CONV_H_SLIDE_C_7 = 6'd14,
    CONV_H_SLIDE_C_8 = 6'd15,
    CONV_H_SLIDE_C_9 = 6'd16,
    CONV_H_SLIDE_C_10 = 6'd17,
    CONV_H_SLIDE_C_11 = 6'd18,
    CONV_H_SLIDE_C_12 = 6'd19,
    CONV_H_SLIDE_C_13 = 6'd20,
    CONV_H_SLIDE_C_14 = 6'd21,
    CONV_H_SLIDE_C_15 = 6'd22,
    CONV_H_SLIDE_C_16 = 6'd23,
    CONV_H_SLIDE_C_17 = 6'd24,
    CONV_H_SLIDE_C_18 = 6'd25,
    CONV_H_SLIDE_C_19 = 6'd26,
    CONV_H_SLIDE_C_20 = 6'd27,
    CONV_H_SLIDE_C_21 = 6'd28,
    CONV_H_SLIDE_C_22 = 6'd29,
    CONV_H_SLIDE_C_23 = 6'd30,
    CONV_H_SLIDE_C_24 = 6'd31,
    CONV_H_SLIDE_C_25 = 6'd32,
    CONV_H_SLIDE_C_26 = 6'd33,
    CONV_H_SLIDE_C_27 = 6'd34,
    CONV_H_SLIDE_C_28 = 6'd35,
    CONV_H_SLIDE_C_29 = 6'd36,
    CONV_H_SLIDE_C_30 = 6'd37,
    CONV_V_SLIDE_C_0 = 6'd38,
    CONV_NB_K_C_0 = 6'd39,
    main_C_1 = 6'd40;

  reg [5:0] state_var;
  reg [5:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : apply_conv_core_core_fsm_1
    case (state_var)
      PAD_for_for_C_0 : begin
        fsm_output = 41'b10;
        state_var_NS = PAD_for_for_C_1;
      end
      PAD_for_for_C_1 : begin
        fsm_output = 41'b100;
        state_var_NS = PAD_for_for_C_2;
      end
      PAD_for_for_C_2 : begin
        fsm_output = 41'b1000;
        state_var_NS = PAD_for_for_C_3;
      end
      PAD_for_for_C_3 : begin
        fsm_output = 41'b10000;
        if ( PAD_for_for_C_3_tr0 ) begin
          state_var_NS = PAD_for_C_0;
        end
        else begin
          state_var_NS = PAD_for_for_C_0;
        end
      end
      PAD_for_C_0 : begin
        fsm_output = 41'b100000;
        if ( PAD_for_C_0_tr0 ) begin
          state_var_NS = PAD_C_0;
        end
        else begin
          state_var_NS = PAD_for_for_C_0;
        end
      end
      PAD_C_0 : begin
        fsm_output = 41'b1000000;
        if ( PAD_C_0_tr0 ) begin
          state_var_NS = CONV_H_SLIDE_C_0;
        end
        else begin
          state_var_NS = PAD_for_for_C_0;
        end
      end
      CONV_H_SLIDE_C_0 : begin
        fsm_output = 41'b10000000;
        state_var_NS = CONV_H_SLIDE_C_1;
      end
      CONV_H_SLIDE_C_1 : begin
        fsm_output = 41'b100000000;
        state_var_NS = CONV_H_SLIDE_C_2;
      end
      CONV_H_SLIDE_C_2 : begin
        fsm_output = 41'b1000000000;
        state_var_NS = CONV_H_SLIDE_C_3;
      end
      CONV_H_SLIDE_C_3 : begin
        fsm_output = 41'b10000000000;
        state_var_NS = CONV_H_SLIDE_C_4;
      end
      CONV_H_SLIDE_C_4 : begin
        fsm_output = 41'b100000000000;
        state_var_NS = CONV_H_SLIDE_C_5;
      end
      CONV_H_SLIDE_C_5 : begin
        fsm_output = 41'b1000000000000;
        state_var_NS = CONV_H_SLIDE_C_6;
      end
      CONV_H_SLIDE_C_6 : begin
        fsm_output = 41'b10000000000000;
        state_var_NS = CONV_H_SLIDE_C_7;
      end
      CONV_H_SLIDE_C_7 : begin
        fsm_output = 41'b100000000000000;
        state_var_NS = CONV_H_SLIDE_C_8;
      end
      CONV_H_SLIDE_C_8 : begin
        fsm_output = 41'b1000000000000000;
        state_var_NS = CONV_H_SLIDE_C_9;
      end
      CONV_H_SLIDE_C_9 : begin
        fsm_output = 41'b10000000000000000;
        state_var_NS = CONV_H_SLIDE_C_10;
      end
      CONV_H_SLIDE_C_10 : begin
        fsm_output = 41'b100000000000000000;
        state_var_NS = CONV_H_SLIDE_C_11;
      end
      CONV_H_SLIDE_C_11 : begin
        fsm_output = 41'b1000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_12;
      end
      CONV_H_SLIDE_C_12 : begin
        fsm_output = 41'b10000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_13;
      end
      CONV_H_SLIDE_C_13 : begin
        fsm_output = 41'b100000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_14;
      end
      CONV_H_SLIDE_C_14 : begin
        fsm_output = 41'b1000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_15;
      end
      CONV_H_SLIDE_C_15 : begin
        fsm_output = 41'b10000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_16;
      end
      CONV_H_SLIDE_C_16 : begin
        fsm_output = 41'b100000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_17;
      end
      CONV_H_SLIDE_C_17 : begin
        fsm_output = 41'b1000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_18;
      end
      CONV_H_SLIDE_C_18 : begin
        fsm_output = 41'b10000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_19;
      end
      CONV_H_SLIDE_C_19 : begin
        fsm_output = 41'b100000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_20;
      end
      CONV_H_SLIDE_C_20 : begin
        fsm_output = 41'b1000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_21;
      end
      CONV_H_SLIDE_C_21 : begin
        fsm_output = 41'b10000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_22;
      end
      CONV_H_SLIDE_C_22 : begin
        fsm_output = 41'b100000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_23;
      end
      CONV_H_SLIDE_C_23 : begin
        fsm_output = 41'b1000000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_24;
      end
      CONV_H_SLIDE_C_24 : begin
        fsm_output = 41'b10000000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_25;
      end
      CONV_H_SLIDE_C_25 : begin
        fsm_output = 41'b100000000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_26;
      end
      CONV_H_SLIDE_C_26 : begin
        fsm_output = 41'b1000000000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_27;
      end
      CONV_H_SLIDE_C_27 : begin
        fsm_output = 41'b10000000000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_28;
      end
      CONV_H_SLIDE_C_28 : begin
        fsm_output = 41'b100000000000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_29;
      end
      CONV_H_SLIDE_C_29 : begin
        fsm_output = 41'b1000000000000000000000000000000000000;
        state_var_NS = CONV_H_SLIDE_C_30;
      end
      CONV_H_SLIDE_C_30 : begin
        fsm_output = 41'b10000000000000000000000000000000000000;
        if ( CONV_H_SLIDE_C_30_tr0 ) begin
          state_var_NS = CONV_V_SLIDE_C_0;
        end
        else begin
          state_var_NS = CONV_H_SLIDE_C_0;
        end
      end
      CONV_V_SLIDE_C_0 : begin
        fsm_output = 41'b100000000000000000000000000000000000000;
        if ( CONV_V_SLIDE_C_0_tr0 ) begin
          state_var_NS = CONV_NB_K_C_0;
        end
        else begin
          state_var_NS = CONV_H_SLIDE_C_0;
        end
      end
      CONV_NB_K_C_0 : begin
        fsm_output = 41'b1000000000000000000000000000000000000000;
        if ( CONV_NB_K_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = CONV_H_SLIDE_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 41'b10000000000000000000000000000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 41'b1;
        state_var_NS = PAD_for_for_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= main_C_0;
    end
    else begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    apply_conv_core
// ------------------------------------------------------------------


module apply_conv_core (
  clk, rst, conv_in_rsc_triosy_lz, conv_out_rsc_triosy_lz, conv_in_rsci_addr_d, conv_in_rsci_re_d,
      conv_in_rsci_data_out_d, conv_out_rsci_data_in_d, conv_out_rsci_addr_d, conv_out_rsci_we_d,
      pad_input_rsci_data_in_d, pad_input_rsci_addr_d, pad_input_rsci_re_d, pad_input_rsci_we_d,
      pad_input_rsci_data_out_d
);
  input clk;
  input rst;
  output conv_in_rsc_triosy_lz;
  output conv_out_rsc_triosy_lz;
  output [15:0] conv_in_rsci_addr_d;
  output conv_in_rsci_re_d;
  input [9:0] conv_in_rsci_data_out_d;
  output [10:0] conv_out_rsci_data_in_d;
  output [15:0] conv_out_rsci_addr_d;
  output conv_out_rsci_we_d;
  output [9:0] pad_input_rsci_data_in_d;
  output [15:0] pad_input_rsci_addr_d;
  output pad_input_rsci_re_d;
  output pad_input_rsci_we_d;
  input [9:0] pad_input_rsci_data_out_d;


  // Interconnect Declarations
  wire [40:0] fsm_output;
  wire and_dcpl_4;
  wire and_dcpl_28;
  wire and_dcpl_36;
  wire or_tmp_76;
  reg [1:0] o_d_1_0_sva_1;
  reg [1:0] PAD_d_1_0_sva_3;
  reg [6:0] PAD_for_r_6_0_sva_4;
  reg [7:0] PAD_for_for_c_7_0_sva_3;
  reg [7:0] PAD_for_for_c_7_0_sva_4;
  reg [1:0] CONV_NB_K_i_1_0_sva_3;
  reg [6:0] o_r_6_0_lpi_4;
  reg [6:0] CONV_V_SLIDE_j_6_0_sva_2;
  reg [7:0] o_c_7_0_lpi_4;
  reg [7:0] CONV_H_SLIDE_k_7_0_sva_1;
  reg [7:0] CONV_K_W_acc_2_psp_5_sva;
  reg [6:0] CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva;
  reg PAD_for_for_if_PAD_for_for_if_or_itm;
  reg PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1;
  reg PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1;
  reg [4:0] PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3;
  reg PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm;
  reg PAD_for_for_slc_PAD_for_for_acc_7_itm;
  reg [5:0] CONV_K_D_1_CONV_K_W_acc_itm_1;
  wire [6:0] nl_CONV_K_D_1_CONV_K_W_acc_itm_1;
  reg [13:0] CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm;
  reg CONV_K_W_mux_itm;
  reg [13:0] CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm;
  reg CONV_K_W_mux_1_itm;
  reg [13:0] CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm;
  reg [3:0] CONV_K_W_mux_2_itm;
  reg [13:0] CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm;
  reg [10:0] CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1;
  reg [10:0] CONV_K_W_acc_53_itm;
  reg [10:0] CONV_K_W_acc_62_itm_1;
  reg CONV_K_W_mux_4_itm;
  reg [3:0] CONV_K_W_mux_5_itm;
  reg CONV_K_W_mux_7_itm;
  reg [10:0] CONV_K_W_acc_51_itm;
  reg [10:0] CONV_K_W_acc_61_itm;
  reg [3:0] CONV_K_W_mux_8_itm;
  reg [10:0] CONV_K_D_2_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_itm_1;
  reg CONV_K_W_mux_10_itm;
  reg [3:0] CONV_K_W_mux_11_itm;
  reg [10:0] CONV_K_W_acc_49_itm;
  reg CONV_K_W_mux_13_itm;
  reg [3:0] CONV_K_W_mux_14_itm;
  reg [10:0] CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1;
  reg [10:0] CONV_K_W_acc_47_itm;
  reg [10:0] CONV_K_W_acc_59_itm;
  reg [10:0] CONV_K_W_acc_65_itm;
  reg CONV_K_W_mux_16_itm;
  reg [3:0] CONV_K_W_mux_17_itm;
  reg CONV_K_W_mux_19_itm;
  reg [10:0] CONV_K_W_acc_45_itm;
  reg [10:0] CONV_K_W_acc_58_itm_1;
  reg [3:0] CONV_K_W_mux_20_itm;
  reg [10:0] CONV_K_D_3_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1;
  reg CONV_K_W_mux_22_itm;
  reg [10:0] CONV_K_D_1_CONV_K_H_1_CONV_K_W_1_CONV_K_W_and_itm;
  reg [10:0] CONV_K_W_acc_57_itm;
  reg [3:0] CONV_K_W_mux_23_itm;
  reg [10:0] CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1;
  reg [10:0] CONV_K_W_acc_56_itm_1;
  reg [3:0] CONV_K_W_mux_26_itm;
  reg [10:0] CONV_K_W_acc_55_itm;
  reg [10:0] CONV_K_W_acc_63_itm;
  reg [10:0] CONV_K_W_acc_67_itm;
  reg CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm;
  reg [7:0] CONV_H_SLIDE_acc_5_itm_1;
  reg [13:0] CONV_K_W_acc_29_sdt;
  reg [13:0] CONV_K_W_acc_30_sdt;
  reg [13:0] CONV_K_W_acc_26_sdt;
  reg [13:0] CONV_K_W_acc_27_sdt;
  reg [13:0] CONV_K_W_acc_28_sdt;
  reg [13:0] CONV_K_W_acc_72_psp;
  wire [14:0] nl_CONV_K_W_acc_72_psp;
  reg [13:0] CONV_K_W_acc_71_psp;
  wire [14:0] nl_CONV_K_W_acc_71_psp;
  reg [13:0] CONV_K_W_acc_85_psp;
  wire [14:0] nl_CONV_K_W_acc_85_psp;
  reg [13:0] CONV_K_W_acc_84_psp;
  wire [14:0] nl_CONV_K_W_acc_84_psp;
  reg [13:0] CONV_K_W_acc_83_psp;
  wire [14:0] nl_CONV_K_W_acc_83_psp;
  reg [7:0] CONV_H_SLIDE_acc_15_psp_1;
  reg [13:0] CONV_K_W_acc_79_psp;
  wire [14:0] nl_CONV_K_W_acc_79_psp;
  reg [13:0] CONV_K_W_acc_78_psp;
  wire [14:0] nl_CONV_K_W_acc_78_psp;
  reg [13:0] CONV_K_W_acc_77_psp;
  wire [14:0] nl_CONV_K_W_acc_77_psp;
  reg [13:0] CONV_K_W_acc_73_psp;
  wire [14:0] nl_CONV_K_W_acc_73_psp;
  reg [13:0] PAD_for_for_if_acc_ncse_2;
  reg [13:0] PAD_for_for_else_else_acc_itm_14_1_1;
  reg PAD_for_for_else_else_acc_itm_0_2;
  reg [11:0] CONV_K_W_acc_82_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_82_psp_11_0;
  reg [11:0] CONV_K_W_acc_81_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_81_psp_11_0;
  reg [11:0] CONV_K_W_acc_80_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_80_psp_11_0;
  reg [11:0] CONV_K_W_acc_76_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_76_psp_11_0;
  reg [11:0] CONV_K_W_acc_75_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_75_psp_11_0;
  reg [11:0] CONV_K_W_acc_74_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_74_psp_11_0;
  reg [11:0] CONV_K_W_acc_88_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_88_psp_11_0;
  reg [11:0] CONV_K_W_acc_87_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_87_psp_11_0;
  reg [11:0] CONV_K_W_acc_86_psp_11_0;
  wire [12:0] nl_CONV_K_W_acc_86_psp_11_0;
  reg [2:0] PAD_for_for_else_else_acc_5_psp_sva_2_7_5;
  wire [2:0] CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2;
  wire [3:0] nl_CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2;
  wire [3:0] CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1;
  wire [5:0] nl_CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1;
  wire CONV_K_W_conc_87_1;
  reg [1:0] reg_CONV_H_SLIDE_acc_12_psp_tmp_5;
  reg reg_CONV_H_SLIDE_acc_14_sdt_tmp_7;
  wire [1:0] CONV_K_W_acc_23_psp_sva;
  wire [2:0] nl_CONV_K_W_acc_23_psp_sva;
  wire [3:0] CONV_K_W_acc_69_psp;
  wire [4:0] nl_CONV_K_W_acc_69_psp;
  reg reg_conv_out_rsc_triosy_obj_ld_cse;
  wire or_9_cse;
  wire reg_o_c_7_o_c_or_cse;
  wire reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse;
  wire reg_PAD_d_1_PAD_d_or_cse;
  wire [13:0] PAD_for_for_if_acc_ncse;
  wire [14:0] nl_PAD_for_for_if_acc_ncse;
  wire [13:0] PAD_for_for_if_acc_3_ncse;
  wire [14:0] nl_PAD_for_for_if_acc_3_ncse;
  wire [1:0] z_out;
  wire [2:0] nl_z_out;
  wire [7:0] z_out_1;
  wire [8:0] nl_z_out_1;
  wire [7:0] z_out_2;
  wire [8:0] nl_z_out_2;
  wire [7:0] z_out_4;
  wire [8:0] nl_z_out_4;
  wire [10:0] z_out_5;
  wire signed [13:0] nl_z_out_5;
  wire [10:0] z_out_6;
  wire [11:0] nl_z_out_6;
  wire [10:0] z_out_7;
  wire [11:0] nl_z_out_7;
  wire [10:0] z_out_8;
  wire [11:0] nl_z_out_8;
  wire [10:0] z_out_9;
  wire [11:0] nl_z_out_9;
  wire [10:0] z_out_10;
  wire [11:0] nl_z_out_10;
  wire [10:0] z_out_11;
  wire [11:0] nl_z_out_11;
  wire [13:0] z_out_12;
  wire [13:0] z_out_13;
  wire [14:0] nl_z_out_13;
  wire [13:0] z_out_14;
  wire [14:0] nl_z_out_14;
  wire [13:0] z_out_15;
  wire [14:0] nl_z_out_15;
  wire [2:0] z_out_16;
  wire [4:0] nl_z_out_16;
  wire [7:0] PAD_for_for_else_else_acc_5_psp_sva;
  wire [8:0] nl_PAD_for_for_else_else_acc_5_psp_sva;
  wire [6:0] CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3;
  wire [7:0] nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3;
  wire [7:0] CONV_H_SLIDE_acc_14_sdt_mx0w0;
  wire [8:0] nl_CONV_H_SLIDE_acc_14_sdt_mx0w0;
  wire [13:0] CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0;
  wire [14:0] nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0;
  wire [7:0] CONV_K_W_acc_2_psp_5_sva_mx0w0;
  wire [8:0] nl_CONV_K_W_acc_2_psp_5_sva_mx0w0;
  wire [13:0] CONV_K_W_acc_29_sdt_mx0w0;
  wire [14:0] nl_CONV_K_W_acc_29_sdt_mx0w0;
  wire [13:0] CONV_K_W_acc_30_sdt_mx0w0;
  wire [14:0] nl_CONV_K_W_acc_30_sdt_mx0w0;
  wire [6:0] CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0;
  wire [7:0] nl_CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0;
  wire [10:0] CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm;
  wire [10:0] CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21;
  wire [11:0] nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21;
  wire [10:0] CONV_K_D_3_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_2;
  wire [10:0] CONV_K_D_2_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_2;
  reg [10:0] reg_CONV_K_D_1_CONV_K_H_2_CONV_K_W_2_mul_10_cse;
  reg [10:0] reg_CONV_K_W_acc_44_cse;
  reg reg_PAD_for_for_if_acc_3_ncse_cse;
  wire or_dcpl;
  wire or_dcpl_11;
  wire [7:0] z_out_3_7_0;
  wire [8:0] nl_z_out_3_7_0;

  wire[0:0] PAD_for_for_c_nor_nl;
  wire[0:0] PAD_d_not_nl;
  wire[7:0] PAD_for_for_acc_1_nl;
  wire[8:0] nl_PAD_for_for_acc_1_nl;
  wire[7:0] PAD_for_for_oif_acc_nl;
  wire[8:0] nl_PAD_for_for_oif_acc_nl;
  wire[0:0] or_nl;
  wire[8:0] PAD_for_for_else_acc_nl;
  wire[9:0] nl_PAD_for_for_else_acc_nl;
  wire[8:0] PAD_for_for_else_oif_acc_nl;
  wire[9:0] nl_PAD_for_for_else_oif_acc_nl;
  wire[3:0] CONV_H_SLIDE_acc_nl;
  wire[4:0] nl_CONV_H_SLIDE_acc_nl;
  wire[13:0] PAD_for_for_if_mul_nl;
  wire[14:0] nl_PAD_for_for_if_mul_nl;
  wire[13:0] PAD_for_for_if_PAD_for_for_if_mul_nl;
  wire[10:0] PAD_for_for_else_else_acc_10_nl;
  wire[11:0] nl_PAD_for_for_else_else_acc_10_nl;
  wire[8:0] PAD_for_for_else_else_acc_14_nl;
  wire[9:0] nl_PAD_for_for_else_else_acc_14_nl;
  wire[10:0] CONV_H_SLIDE_mux_nl;
  wire[0:0] CONV_H_SLIDE_and_nl;
  wire[2:0] CONV_H_SLIDE_else_if_acc_nl;
  wire[3:0] nl_CONV_H_SLIDE_else_if_acc_nl;
  wire[0:0] CONV_H_SLIDE_not_2_nl;
  wire[0:0] pad_input_or_nl;
  wire[0:0] pad_input_mux1h_nl;
  wire[11:0] pad_input_mux1h_2_nl;
  wire[0:0] pad_input_mux1h_3_nl;
  wire[0:0] pad_input_or_1_nl;
  wire[0:0] pad_input_or_2_nl;
  wire[0:0] pad_input_or_3_nl;
  wire[0:0] pad_input_or_4_nl;
  wire[0:0] pad_input_or_5_nl;
  wire[0:0] pad_input_or_6_nl;
  wire[0:0] pad_input_or_7_nl;
  wire[0:0] pad_input_or_8_nl;
  wire[0:0] pad_input_or_9_nl;
  wire[0:0] pad_input_mux1h_4_nl;
  wire[0:0] pad_input_or_10_nl;
  wire[0:0] pad_input_or_11_nl;
  wire[0:0] pad_input_or_12_nl;
  wire[0:0] pad_input_or_13_nl;
  wire[0:0] pad_input_or_14_nl;
  wire[0:0] pad_input_or_15_nl;
  wire[0:0] pad_input_or_16_nl;
  wire[0:0] pad_input_or_17_nl;
  wire[0:0] pad_input_or_18_nl;
  wire[0:0] pad_input_mux1h_1_nl;
  wire[0:0] pad_input_or_19_nl;
  wire[0:0] pad_input_or_20_nl;
  wire[0:0] CONV_NB_K_CONV_NB_K_and_1_nl;
  wire[0:0] CONV_NB_K_mux1h_2_nl;
  wire[7:0] PAD_for_for_mux_2_nl;
  wire[6:0] PAD_for_for_mux_3_nl;
  wire[6:0] CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl;
  wire[0:0] CONV_V_SLIDE_or_2_nl;
  wire[0:0] CONV_V_SLIDE_nor_1_nl;
  wire[2:0] CONV_V_SLIDE_mux1h_2_nl;
  wire[0:0] CONV_V_SLIDE_or_3_nl;
  wire[1:0] CONV_H_SLIDE_mux_10_nl;
  wire[7:0] CONV_H_SLIDE_mux_11_nl;
  wire[3:0] CONV_K_W_mux1h_10_nl;
  wire[10:0] and_325_nl;
  wire[10:0] mux_1_nl;
  wire[10:0] CONV_K_W_or_9_nl;
  wire[10:0] CONV_K_W_mux1h_11_nl;
  wire[10:0] CONV_K_W_acc_89_nl;
  wire[11:0] nl_CONV_K_W_acc_89_nl;
  wire[10:0] CONV_K_W_acc_90_nl;
  wire[11:0] nl_CONV_K_W_acc_90_nl;
  wire[0:0] CONV_K_W_or_10_nl;
  wire[0:0] CONV_K_W_or_11_nl;
  wire[0:0] or_148_nl;
  wire[0:0] nor_25_nl;
  wire[10:0] CONV_K_W_mux1h_12_nl;
  wire[0:0] CONV_K_W_or_12_nl;
  wire[10:0] CONV_K_W_CONV_K_W_mux_1_nl;
  wire[10:0] CONV_K_W_mux1h_13_nl;
  wire[10:0] CONV_K_W_mux1h_14_nl;
  wire[0:0] CONV_K_W_or_13_nl;
  wire[10:0] CONV_K_W_mux_92_nl;
  wire[0:0] CONV_K_W_or_14_nl;
  wire[10:0] CONV_K_W_mux_93_nl;
  wire[10:0] CONV_K_W_mux_94_nl;
  wire[10:0] CONV_K_W_mux_95_nl;
  wire[10:0] CONV_K_W_mux_96_nl;
  wire[5:0] CONV_K_W_mux1h_15_nl;
  wire[0:0] CONV_K_W_mux1h_16_nl;
  wire[1:0] CONV_K_W_mux_97_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_apply_conv_core_core_fsm_inst_PAD_for_for_C_3_tr0;
  assign nl_apply_conv_core_core_fsm_inst_PAD_for_for_C_3_tr0 = ~ PAD_for_for_slc_PAD_for_for_acc_7_itm;
  wire[6:0] PAD_for_acc_nl;
  wire[7:0] nl_PAD_for_acc_nl;
  wire [0:0] nl_apply_conv_core_core_fsm_inst_PAD_for_C_0_tr0;
  assign nl_PAD_for_acc_nl = conv_u2s_6_7(z_out_2[6:1]) + 7'b1000011;
  assign PAD_for_acc_nl = nl_PAD_for_acc_nl[6:0];
  assign nl_apply_conv_core_core_fsm_inst_PAD_for_C_0_tr0 = ~ (readslicef_7_1_6((PAD_for_acc_nl)));
  wire [0:0] nl_apply_conv_core_core_fsm_inst_PAD_C_0_tr0;
  assign nl_apply_conv_core_core_fsm_inst_PAD_C_0_tr0 = ~((z_out[0]) ^ (z_out[1]));
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_30_tr0;
  assign nl_apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_30_tr0 = CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm;
  wire[4:0] CONV_V_SLIDE_acc_nl;
  wire[5:0] nl_CONV_V_SLIDE_acc_nl;
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0;
  assign nl_CONV_V_SLIDE_acc_nl = ({1'b1 , (~ (CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3[6:3]))})
      + 5'b1111;
  assign CONV_V_SLIDE_acc_nl = nl_CONV_V_SLIDE_acc_nl[4:0];
  assign nl_apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0 = readslicef_5_1_4((CONV_V_SLIDE_acc_nl));
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0;
  assign nl_apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0 = ~ (z_out_16[2]);
  mgc_io_sync_v1 #(.valid(32'sd0)) conv_in_rsc_triosy_obj (
      .ld(reg_conv_out_rsc_triosy_obj_ld_cse),
      .lz(conv_in_rsc_triosy_lz)
    );
  mgc_io_sync_v1 #(.valid(32'sd0)) conv_out_rsc_triosy_obj (
      .ld(reg_conv_out_rsc_triosy_obj_ld_cse),
      .lz(conv_out_rsc_triosy_lz)
    );
  apply_conv_core_core_fsm apply_conv_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .PAD_for_for_C_3_tr0(nl_apply_conv_core_core_fsm_inst_PAD_for_for_C_3_tr0[0:0]),
      .PAD_for_C_0_tr0(nl_apply_conv_core_core_fsm_inst_PAD_for_C_0_tr0[0:0]),
      .PAD_C_0_tr0(nl_apply_conv_core_core_fsm_inst_PAD_C_0_tr0[0:0]),
      .CONV_H_SLIDE_C_30_tr0(nl_apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_30_tr0[0:0]),
      .CONV_V_SLIDE_C_0_tr0(nl_apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0[0:0]),
      .CONV_NB_K_C_0_tr0(nl_apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0[0:0])
    );
  assign reg_PAD_d_1_PAD_d_or_cse = (fsm_output[0]) | (fsm_output[6]);
  assign nl_PAD_for_for_acc_1_nl = conv_u2s_7_8(PAD_for_r_6_0_sva_4) + 8'b11111111;
  assign PAD_for_for_acc_1_nl = nl_PAD_for_for_acc_1_nl[7:0];
  assign nl_PAD_for_for_oif_acc_nl = conv_u2s_7_8(PAD_for_r_6_0_sva_4) + 8'b10000111;
  assign PAD_for_for_oif_acc_nl = nl_PAD_for_for_oif_acc_nl[7:0];
  assign or_9_cse = (readslicef_8_1_7((PAD_for_for_acc_1_nl))) | (~ (readslicef_8_1_7((PAD_for_for_oif_acc_nl))));
  assign reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse = (fsm_output[6]) | (fsm_output[39])
      | (fsm_output[38]);
  assign reg_o_c_7_o_c_or_cse = (fsm_output[38]) | (fsm_output[6]) | (fsm_output[39])
      | (fsm_output[37]);
  assign nl_PAD_for_for_if_mul_nl = (PAD_d_1_0_sva_3) * 13'b1001101001101;
  assign PAD_for_for_if_mul_nl = nl_PAD_for_for_if_mul_nl[13:0];
  assign nl_PAD_for_for_if_acc_ncse = conv_u2u_13_14(PAD_for_for_if_acc_3_ncse[13:1])
      + (PAD_for_for_if_mul_nl);
  assign PAD_for_for_if_acc_ncse = nl_PAD_for_for_if_acc_ncse[13:0];
  assign PAD_for_for_if_PAD_for_for_if_mul_nl = conv_u2u_14_14((PAD_for_r_6_0_sva_4)
      * 7'b1010001);
  assign nl_PAD_for_for_if_acc_3_ncse = (PAD_for_for_if_PAD_for_for_if_mul_nl) +
      conv_u2u_7_14(PAD_for_for_c_7_0_sva_3[7:1]);
  assign PAD_for_for_if_acc_3_ncse = nl_PAD_for_for_if_acc_3_ncse[13:0];
  assign nl_PAD_for_for_else_else_acc_5_psp_sva = PAD_for_for_c_7_0_sva_3 + 8'b11111111;
  assign PAD_for_for_else_else_acc_5_psp_sva = nl_PAD_for_for_else_else_acc_5_psp_sva[7:0];
  assign nl_CONV_K_W_acc_23_psp_sva = CONV_NB_K_i_1_0_sva_3 + 2'b1;
  assign CONV_K_W_acc_23_psp_sva = nl_CONV_K_W_acc_23_psp_sva[1:0];
  assign nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3 = CONV_V_SLIDE_j_6_0_sva_2 + 7'b1;
  assign CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3 = nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3[6:0];
  assign nl_CONV_H_SLIDE_acc_14_sdt_mx0w0 = conv_u2u_7_8(o_r_6_0_lpi_4) + conv_u2u_5_8(z_out_2[6:2]);
  assign CONV_H_SLIDE_acc_14_sdt_mx0w0 = nl_CONV_H_SLIDE_acc_14_sdt_mx0w0[7:0];
  assign nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0 = z_out_12 + conv_u2u_7_14(CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0);
  assign CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0 = nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0[13:0];
  assign nl_CONV_K_W_acc_2_psp_5_sva_mx0w0 = CONV_H_SLIDE_k_7_0_sva_1 + 8'b1;
  assign CONV_K_W_acc_2_psp_5_sva_mx0w0 = nl_CONV_K_W_acc_2_psp_5_sva_mx0w0[7:0];
  assign nl_CONV_K_W_acc_29_sdt_mx0w0 = z_out_12 + conv_u2u_7_14(CONV_H_SLIDE_k_7_0_sva_1[7:1]);
  assign CONV_K_W_acc_29_sdt_mx0w0 = nl_CONV_K_W_acc_29_sdt_mx0w0[13:0];
  assign nl_CONV_K_W_acc_30_sdt_mx0w0 = z_out_12 + conv_u2u_7_14(CONV_K_W_acc_2_psp_5_sva_mx0w0[7:1]);
  assign CONV_K_W_acc_30_sdt_mx0w0 = nl_CONV_K_W_acc_30_sdt_mx0w0[13:0];
  assign nl_CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0 = (CONV_H_SLIDE_k_7_0_sva_1[7:1])
      + 7'b1;
  assign CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0 = nl_CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0[6:0];
  assign nl_CONV_K_W_acc_69_psp = conv_u2u_2_4(z_out_16[2:1]) + ({CONV_NB_K_i_1_0_sva_3
      , 2'b1});
  assign CONV_K_W_acc_69_psp = nl_CONV_K_W_acc_69_psp[3:0];
  assign nl_CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1 = ({CONV_NB_K_i_1_0_sva_3
      , 2'b10}) + conv_u2u_1_4(CONV_NB_K_i_1_0_sva_3[1]) + 4'b1;
  assign CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1 = nl_CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1[3:0];
  assign CONV_K_W_conc_87_1 = (CONV_NB_K_i_1_0_sva_3[0]) ^ (CONV_NB_K_i_1_0_sva_3[1]);
  assign nl_CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2 = conv_u2u_1_3(z_out_16[2])
      + ({CONV_NB_K_i_1_0_sva_3 , 1'b1});
  assign CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2 = nl_CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2[2:0];
  assign CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm = MUX_v_11_2_2(11'b00000000000,
      CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_22_itm);
  assign nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21 =  -conv_s2s_10_11(pad_input_rsci_data_out_d);
  assign CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21 = nl_CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21[10:0];
  assign CONV_K_D_3_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_2 = MUX_v_11_2_2(11'b00000000000,
      CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_16_itm);
  assign CONV_K_D_2_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_2 = MUX_v_11_2_2(11'b00000000000,
      CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_4_itm);
  assign and_dcpl_4 = ~(PAD_for_for_if_PAD_for_for_if_or_itm | PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1);
  assign and_dcpl_28 = ~((fsm_output[1]) | (fsm_output[6]) | (fsm_output[39]));
  assign and_dcpl_36 = ~((fsm_output[4]) | (fsm_output[40]));
  assign or_tmp_76 = ~((~ and_dcpl_36) | (fsm_output[0]) | (fsm_output[38]) | (fsm_output[37])
      | (fsm_output[7]) | (fsm_output[5]) | (fsm_output[3]) | (fsm_output[2]) | (~
      and_dcpl_28));
  assign nl_PAD_for_for_else_else_acc_14_nl = conv_u2s_7_9(PAD_for_r_6_0_sva_4) +
      conv_s2s_6_9(z_out_2[7:2]);
  assign PAD_for_for_else_else_acc_14_nl = nl_PAD_for_for_else_else_acc_14_nl[8:0];
  assign nl_PAD_for_for_else_else_acc_10_nl = ({(PAD_for_for_else_else_acc_14_nl)
      , (z_out_2[1:0])}) + ({z_out_3_7_0 , 3'b11});
  assign PAD_for_for_else_else_acc_10_nl = nl_PAD_for_for_else_else_acc_10_nl[10:0];
  assign conv_in_rsci_addr_d = {(PAD_for_for_else_else_acc_10_nl) , PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3};
  assign conv_in_rsci_re_d = ~(and_dcpl_4 & (fsm_output[2]));
  assign nl_CONV_H_SLIDE_else_if_acc_nl = ({1'b1 , (~ (z_out_6[9:8]))}) + 3'b1;
  assign CONV_H_SLIDE_else_if_acc_nl = nl_CONV_H_SLIDE_else_if_acc_nl[2:0];
  assign CONV_H_SLIDE_and_nl = (readslicef_3_1_2((CONV_H_SLIDE_else_if_acc_nl)))
      & (~ (z_out_6[10]));
  assign CONV_H_SLIDE_mux_nl = MUX_v_11_2_2(z_out_6, 11'b11111111, CONV_H_SLIDE_and_nl);
  assign CONV_H_SLIDE_not_2_nl = ~ (z_out_6[10]);
  assign conv_out_rsci_data_in_d = MUX_v_11_2_2(11'b00000000000, (CONV_H_SLIDE_mux_nl),
      (CONV_H_SLIDE_not_2_nl));
  assign conv_out_rsci_addr_d = {CONV_H_SLIDE_acc_15_psp_1 , reg_CONV_H_SLIDE_acc_14_sdt_tmp_7
      , reg_CONV_H_SLIDE_acc_12_psp_tmp_5 , (o_c_7_0_lpi_4[4:0])};
  assign conv_out_rsci_we_d = ~ (fsm_output[36]);
  assign pad_input_rsci_data_in_d = MUX_v_10_2_2(10'b0000000000, conv_in_rsci_data_out_d,
      (fsm_output[3]));
  assign pad_input_mux1h_nl = MUX1HOT_s_1_12_2((PAD_for_for_if_acc_ncse[13]), (PAD_for_for_if_acc_ncse_2[13]),
      (PAD_for_for_else_else_acc_itm_14_1_1[13]), (CONV_K_W_acc_79_psp[13]), (CONV_K_W_acc_78_psp[13]),
      (CONV_K_W_acc_77_psp[13]), (CONV_K_W_acc_73_psp[13]), (CONV_K_W_acc_72_psp[13]),
      (CONV_K_W_acc_71_psp[13]), (CONV_K_W_acc_85_psp[13]), (CONV_K_W_acc_84_psp[13]),
      (CONV_K_W_acc_83_psp[13]), {(fsm_output[1]) , (fsm_output[2]) , (fsm_output[3])
      , (fsm_output[22]) , (fsm_output[23]) , (fsm_output[24]) , (fsm_output[25])
      , (fsm_output[26]) , (fsm_output[27]) , (fsm_output[28]) , (fsm_output[29])
      , (fsm_output[30])});
  assign pad_input_or_nl = ((pad_input_mux1h_nl) & (~((fsm_output[8]) | (fsm_output[9])
      | (fsm_output[10]) | (fsm_output[11]) | (fsm_output[12]) | (fsm_output[31])
      | (fsm_output[32]) | (fsm_output[33]) | (fsm_output[34])))) | (fsm_output[21:13]!=9'b000000000);
  assign pad_input_mux1h_2_nl = MUX1HOT_v_12_30_2((PAD_for_for_if_acc_ncse[12:1]),
      (PAD_for_for_if_acc_ncse_2[12:1]), (PAD_for_for_else_else_acc_itm_14_1_1[12:1]),
      (CONV_K_W_acc_30_sdt[13:2]), (CONV_K_W_acc_29_sdt[13:2]), (CONV_K_W_acc_28_sdt[13:2]),
      (CONV_K_W_acc_27_sdt[13:2]), (CONV_K_W_acc_26_sdt[13:2]), CONV_K_W_acc_82_psp_11_0,
      CONV_K_W_acc_81_psp_11_0, CONV_K_W_acc_80_psp_11_0, CONV_K_W_acc_76_psp_11_0,
      CONV_K_W_acc_75_psp_11_0, CONV_K_W_acc_74_psp_11_0, CONV_K_W_acc_88_psp_11_0,
      CONV_K_W_acc_87_psp_11_0, CONV_K_W_acc_86_psp_11_0, (CONV_K_W_acc_79_psp[12:1]),
      (CONV_K_W_acc_78_psp[12:1]), (CONV_K_W_acc_77_psp[12:1]), (CONV_K_W_acc_73_psp[12:1]),
      (CONV_K_W_acc_72_psp[12:1]), (CONV_K_W_acc_71_psp[12:1]), (CONV_K_W_acc_85_psp[12:1]),
      (CONV_K_W_acc_84_psp[12:1]), (CONV_K_W_acc_83_psp[12:1]), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm[13:2]),
      (CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm[13:2]), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm[13:2]),
      (CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm[13:2]), {(fsm_output[1]) , (fsm_output[2])
      , (fsm_output[3]) , (fsm_output[8]) , (fsm_output[9]) , (fsm_output[10]) ,
      (fsm_output[11]) , (fsm_output[12]) , (fsm_output[13]) , (fsm_output[14]) ,
      (fsm_output[15]) , (fsm_output[16]) , (fsm_output[17]) , (fsm_output[18]) ,
      (fsm_output[19]) , (fsm_output[20]) , (fsm_output[21]) , (fsm_output[22]) ,
      (fsm_output[23]) , (fsm_output[24]) , (fsm_output[25]) , (fsm_output[26]) ,
      (fsm_output[27]) , (fsm_output[28]) , (fsm_output[29]) , (fsm_output[30]) ,
      (fsm_output[31]) , (fsm_output[32]) , (fsm_output[33]) , (fsm_output[34])});
  assign pad_input_or_1_nl = (fsm_output[8]) | (fsm_output[17]);
  assign pad_input_or_2_nl = (fsm_output[9]) | (fsm_output[18]);
  assign pad_input_or_3_nl = (fsm_output[10]) | (fsm_output[19]);
  assign pad_input_or_4_nl = (fsm_output[11]) | (fsm_output[20]);
  assign pad_input_or_5_nl = (fsm_output[12]) | (fsm_output[21]);
  assign pad_input_or_6_nl = (fsm_output[13]) | (fsm_output[31]);
  assign pad_input_or_7_nl = (fsm_output[14]) | (fsm_output[32]);
  assign pad_input_or_8_nl = (fsm_output[15]) | (fsm_output[33]);
  assign pad_input_or_9_nl = (fsm_output[16]) | (fsm_output[34]);
  assign pad_input_mux1h_3_nl = MUX1HOT_s_1_21_2((PAD_for_for_if_acc_ncse[0]), (PAD_for_for_if_acc_ncse_2[0]),
      (PAD_for_for_else_else_acc_itm_14_1_1[0]), (CONV_K_W_acc_30_sdt[1]), (CONV_K_W_acc_29_sdt[1]),
      (CONV_K_W_acc_28_sdt[1]), (CONV_K_W_acc_27_sdt[1]), (CONV_K_W_acc_26_sdt[1]),
      (CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm[1]), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm[1]),
      (CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm[1]), (CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm[1]),
      (CONV_K_W_acc_79_psp[0]), (CONV_K_W_acc_78_psp[0]), (CONV_K_W_acc_77_psp[0]),
      (CONV_K_W_acc_73_psp[0]), (CONV_K_W_acc_72_psp[0]), (CONV_K_W_acc_71_psp[0]),
      (CONV_K_W_acc_85_psp[0]), (CONV_K_W_acc_84_psp[0]), (CONV_K_W_acc_83_psp[0]),
      {(fsm_output[1]) , (fsm_output[2]) , (fsm_output[3]) , (pad_input_or_1_nl)
      , (pad_input_or_2_nl) , (pad_input_or_3_nl) , (pad_input_or_4_nl) , (pad_input_or_5_nl)
      , (pad_input_or_6_nl) , (pad_input_or_7_nl) , (pad_input_or_8_nl) , (pad_input_or_9_nl)
      , (fsm_output[22]) , (fsm_output[23]) , (fsm_output[24]) , (fsm_output[25])
      , (fsm_output[26]) , (fsm_output[27]) , (fsm_output[28]) , (fsm_output[29])
      , (fsm_output[30])});
  assign pad_input_or_10_nl = (fsm_output[8]) | (fsm_output[17]) | (fsm_output[26]);
  assign pad_input_or_11_nl = (fsm_output[9]) | (fsm_output[18]) | (fsm_output[27]);
  assign pad_input_or_12_nl = (fsm_output[10]) | (fsm_output[19]) | (fsm_output[28]);
  assign pad_input_or_13_nl = (fsm_output[11]) | (fsm_output[20]) | (fsm_output[29]);
  assign pad_input_or_14_nl = (fsm_output[12]) | (fsm_output[21]) | (fsm_output[30]);
  assign pad_input_or_15_nl = (fsm_output[13]) | (fsm_output[22]) | (fsm_output[31]);
  assign pad_input_or_16_nl = (fsm_output[14]) | (fsm_output[23]) | (fsm_output[32]);
  assign pad_input_or_17_nl = (fsm_output[15]) | (fsm_output[24]) | (fsm_output[33]);
  assign pad_input_or_18_nl = (fsm_output[16]) | (fsm_output[25]) | (fsm_output[34]);
  assign pad_input_mux1h_4_nl = MUX1HOT_s_1_12_2((PAD_for_for_if_acc_3_ncse[0]),
      reg_PAD_for_for_if_acc_3_ncse_cse, PAD_for_for_else_else_acc_itm_0_2, (CONV_K_W_acc_30_sdt[0]),
      (CONV_K_W_acc_29_sdt[0]), (CONV_K_W_acc_28_sdt[0]), (CONV_K_W_acc_27_sdt[0]),
      (CONV_K_W_acc_26_sdt[0]), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm[0]),
      (CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm[0]), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm[0]),
      (CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm[0]), {(fsm_output[1]) , (fsm_output[2])
      , (fsm_output[3]) , (pad_input_or_10_nl) , (pad_input_or_11_nl) , (pad_input_or_12_nl)
      , (pad_input_or_13_nl) , (pad_input_or_14_nl) , (pad_input_or_15_nl) , (pad_input_or_16_nl)
      , (pad_input_or_17_nl) , (pad_input_or_18_nl)});
  assign pad_input_or_19_nl = (fsm_output[8]) | (fsm_output[11]) | (fsm_output[14])
      | (fsm_output[17]) | (fsm_output[20]) | (fsm_output[23]) | (fsm_output[26])
      | (fsm_output[29]) | (fsm_output[32]);
  assign pad_input_or_20_nl = (fsm_output[9]) | (fsm_output[12]) | (fsm_output[15])
      | (fsm_output[18]) | (fsm_output[21]) | (fsm_output[24]) | (fsm_output[27])
      | (fsm_output[30]) | (fsm_output[33]) | (fsm_output[10]) | (fsm_output[13])
      | (fsm_output[16]) | (fsm_output[19]) | (fsm_output[22]) | (fsm_output[25])
      | (fsm_output[28]) | (fsm_output[31]) | (fsm_output[34]);
  assign pad_input_mux1h_1_nl = MUX1HOT_s_1_5_2((PAD_for_for_c_7_0_sva_3[0]), PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1,
      PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm, (CONV_K_W_acc_2_psp_5_sva[0]),
      (CONV_H_SLIDE_k_7_0_sva_1[0]), {(fsm_output[1]) , (fsm_output[2]) , (fsm_output[3])
      , (pad_input_or_19_nl) , (pad_input_or_20_nl)});
  assign pad_input_rsci_addr_d = {(pad_input_or_nl) , (pad_input_mux1h_2_nl) , (pad_input_mux1h_3_nl)
      , (pad_input_mux1h_4_nl) , (pad_input_mux1h_1_nl)};
  assign pad_input_rsci_re_d = (~ and_dcpl_36) | (fsm_output[0]) | (fsm_output[38])
      | (fsm_output[37]) | (fsm_output[36]) | (fsm_output[35]) | (fsm_output[7])
      | (fsm_output[5]) | (fsm_output[3]) | (fsm_output[2]) | (~ and_dcpl_28);
  assign pad_input_rsci_we_d = ~((and_dcpl_4 & (fsm_output[3])) | (or_9_cse & (fsm_output[1]))
      | ((~ PAD_for_for_if_PAD_for_for_if_or_itm) & PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1
      & (fsm_output[2])));
  assign or_dcpl = (fsm_output[23]) | (fsm_output[25]);
  assign or_dcpl_11 = (fsm_output[10]) | (fsm_output[35]);
  always @(posedge clk) begin
    if ( rst ) begin
      PAD_for_for_c_7_0_sva_3 <= 8'b0;
      reg_conv_out_rsc_triosy_obj_ld_cse <= 1'b0;
      PAD_for_for_if_acc_ncse_2 <= 14'b0;
      reg_PAD_for_for_if_acc_3_ncse_cse <= 1'b0;
      PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1 <= 1'b0;
      PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm <= 1'b0;
      PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3 <= 5'b0;
      PAD_for_for_else_else_acc_5_psp_sva_2_7_5 <= 3'b0;
      PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1 <= 1'b0;
      PAD_for_for_else_else_acc_itm_14_1_1 <= 14'b0;
      PAD_for_for_else_else_acc_itm_0_2 <= 1'b0;
      CONV_K_W_acc_2_psp_5_sva <= 8'b0;
      CONV_K_D_1_CONV_K_W_acc_itm_1 <= 6'b0;
      reg_CONV_K_D_1_CONV_K_H_2_CONV_K_W_2_mul_10_cse <= 11'b0;
      CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 <= 11'b0;
      CONV_K_W_acc_56_itm_1 <= 11'b0;
      CONV_K_D_3_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 <= 11'b0;
      reg_CONV_K_W_acc_44_cse <= 11'b0;
      CONV_K_W_acc_58_itm_1 <= 11'b0;
      CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 <= 11'b0;
      CONV_K_D_2_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_itm_1 <= 11'b0;
      CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 <= 11'b0;
      CONV_K_W_acc_62_itm_1 <= 11'b0;
    end
    else begin
      PAD_for_for_c_7_0_sva_3 <= MUX_v_8_2_2(8'b00000000, PAD_for_for_c_7_0_sva_4,
          (PAD_for_for_c_nor_nl));
      reg_conv_out_rsc_triosy_obj_ld_cse <= (~ (z_out_16[2])) & (fsm_output[39]);
      PAD_for_for_if_acc_ncse_2 <= PAD_for_for_if_acc_ncse;
      reg_PAD_for_for_if_acc_3_ncse_cse <= PAD_for_for_if_acc_3_ncse[0];
      PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1 <= PAD_for_for_c_7_0_sva_3[0];
      PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm <= MUX_s_1_2_2((PAD_for_for_c_7_0_sva_3[0]),
          PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm, fsm_output[2]);
      PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3 <= PAD_for_for_else_else_acc_5_psp_sva[4:0];
      PAD_for_for_else_else_acc_5_psp_sva_2_7_5 <= PAD_for_for_else_else_acc_5_psp_sva[7:5];
      PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1 <= MUX_s_1_2_2((or_nl), PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1,
          fsm_output[2]);
      PAD_for_for_else_else_acc_itm_14_1_1 <= PAD_for_for_if_acc_ncse_2;
      PAD_for_for_else_else_acc_itm_0_2 <= reg_PAD_for_for_if_acc_3_ncse_cse;
      CONV_K_W_acc_2_psp_5_sva <= MUX_v_8_2_2(CONV_K_W_acc_2_psp_5_sva_mx0w0, CONV_K_W_acc_2_psp_5_sva,
          or_tmp_76);
      CONV_K_D_1_CONV_K_W_acc_itm_1 <= nl_CONV_K_D_1_CONV_K_W_acc_itm_1[5:0];
      reg_CONV_K_D_1_CONV_K_H_2_CONV_K_W_2_mul_10_cse <= z_out_5;
      CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 <= CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm;
      CONV_K_W_acc_56_itm_1 <= z_out_7;
      CONV_K_D_3_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 <= MUX_v_11_2_2(11'b00000000000,
          CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_19_itm);
      reg_CONV_K_W_acc_44_cse <= z_out_8;
      CONV_K_W_acc_58_itm_1 <= z_out_10;
      CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 <= MUX_v_11_2_2(11'b00000000000,
          CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_13_itm);
      CONV_K_D_2_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_itm_1 <= MUX_v_11_2_2(11'b00000000000,
          CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_7_itm);
      CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 <= MUX_v_11_2_2(11'b00000000000,
          CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_1_itm);
      CONV_K_W_acc_62_itm_1 <= z_out_9;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      PAD_for_r_6_0_sva_4 <= 7'b0;
    end
    else if ( (fsm_output[5]) | reg_PAD_d_1_PAD_d_or_cse ) begin
      PAD_for_r_6_0_sva_4 <= MUX_v_7_2_2(7'b0000000, (z_out_2[6:0]), (PAD_d_not_nl));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      PAD_d_1_0_sva_3 <= 2'b0;
    end
    else if ( reg_PAD_d_1_PAD_d_or_cse ) begin
      PAD_d_1_0_sva_3 <= MUX_v_2_2_2(2'b00, z_out, (fsm_output[6]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      o_d_1_0_sva_1 <= 2'b0;
    end
    else if ( (fsm_output[0]) | (fsm_output[39]) ) begin
      o_d_1_0_sva_1 <= MUX_v_2_2_2(2'b00, z_out, (fsm_output[39]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      PAD_for_for_slc_PAD_for_for_acc_7_itm <= 1'b0;
    end
    else if ( fsm_output[1] ) begin
      PAD_for_for_slc_PAD_for_for_acc_7_itm <= z_out_1[7];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      PAD_for_for_if_PAD_for_for_if_or_itm <= 1'b0;
    end
    else if ( fsm_output[1] ) begin
      PAD_for_for_if_PAD_for_for_if_or_itm <= or_9_cse;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      PAD_for_for_c_7_0_sva_4 <= 8'b0;
    end
    else if ( fsm_output[1] ) begin
      PAD_for_for_c_7_0_sva_4 <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_NB_K_i_1_0_sva_3 <= 2'b0;
    end
    else if ( (fsm_output[6]) | (fsm_output[39]) ) begin
      CONV_NB_K_i_1_0_sva_3 <= MUX_v_2_2_2(2'b00, CONV_K_W_acc_23_psp_sva, (fsm_output[39]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_V_SLIDE_j_6_0_sva_2 <= 7'b0;
      o_r_6_0_lpi_4 <= 7'b0;
    end
    else if ( reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse ) begin
      CONV_V_SLIDE_j_6_0_sva_2 <= MUX_v_7_2_2(7'b0000000, CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3,
          (fsm_output[38]));
      o_r_6_0_lpi_4 <= MUX_v_7_2_2(7'b0000000, (z_out_2[6:0]), (fsm_output[38]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      o_c_7_0_lpi_4 <= 8'b0;
      CONV_H_SLIDE_k_7_0_sva_1 <= 8'b0;
    end
    else if ( reg_o_c_7_o_c_or_cse ) begin
      o_c_7_0_lpi_4 <= MUX_v_8_2_2(8'b00000000, CONV_H_SLIDE_acc_5_itm_1, (fsm_output[37]));
      CONV_H_SLIDE_k_7_0_sva_1 <= MUX_v_8_2_2(8'b00000000, CONV_K_W_acc_2_psp_5_sva,
          (fsm_output[37]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm <= readslicef_4_1_3((CONV_H_SLIDE_acc_nl));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_H_SLIDE_acc_15_psp_1 <= 8'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_H_SLIDE_acc_15_psp_1 <= z_out_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_itm <= MUX_s_1_12_2x0x4x8(1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
          1'b0, 1'b0, 1'b0, {CONV_NB_K_i_1_0_sva_3 , CONV_K_W_conc_87_1 , (~ (CONV_NB_K_i_1_0_sva_3[0]))});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_1_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_1_itm <= MUX_s_1_22_2x0x1x6x7x8x9x14x15x16x17(1'b0, 1'b0, 1'b0,
          1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, {CONV_NB_K_i_1_0_sva_3
          , z_out , (CONV_NB_K_i_1_0_sva_3[0])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm <= 14'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm <= CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_2_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_2_itm <= MUX_v_4_22_2x0x1x6x7x8x9x14x15x16x17(4'b1111, 4'b0, 4'b0,
          4'b0, 4'b0, 4'b0, 4'b1111, 4'b101, 4'b0, 4'b0, 4'b0, 4'b0, {CONV_NB_K_i_1_0_sva_3
          , z_out , (CONV_NB_K_i_1_0_sva_3[0])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_4_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_4_itm <= MUX_s_1_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18(1'b0, 1'b0,
          1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, {CONV_NB_K_i_1_0_sva_3 , z_out_16});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_5_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_5_itm <= MUX_v_4_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18(4'b0, 4'b0,
          4'b0, 4'b0, 4'b1111, 4'b101, 4'b0, 4'b0, 4'b0, {CONV_NB_K_i_1_0_sva_3 ,
          z_out_16});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_7_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_7_itm <= MUX_s_1_11_2x3x7(1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0,
          1'b0, 1'b0, 1'b0, {CONV_NB_K_i_1_0_sva_3 , CONV_NB_K_i_1_0_sva_3});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_8_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_8_itm <= MUX_v_4_11_2x3x7(4'b0, 4'b0, 4'b0, 4'b1111, 4'b101, 4'b1111,
          4'b0, 4'b0, 4'b0, {CONV_NB_K_i_1_0_sva_3 , CONV_NB_K_i_1_0_sva_3});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_71_psp <= 14'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_acc_71_psp <= nl_CONV_K_W_acc_71_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_29_sdt <= 14'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_acc_29_sdt <= CONV_K_W_acc_29_sdt_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_72_psp <= 14'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_acc_72_psp <= nl_CONV_K_W_acc_72_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_30_sdt <= 14'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_acc_30_sdt <= CONV_K_W_acc_30_sdt_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_10_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_10_itm <= MUX_s_1_12_2(1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0,
          1'b0, 1'b0, 1'b0, 1'b0, 1'b0, {(CONV_K_W_acc_69_psp[3:2]) , (CONV_K_W_acc_69_psp[0])
          , (z_out_16[0])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_73_psp <= 14'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_acc_73_psp <= nl_CONV_K_W_acc_73_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_11_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_11_itm <= MUX_v_4_12_2(4'b0, 4'b0, 4'b0, 4'b0, 4'b1111, 4'b101,
          4'b1111, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, {(CONV_K_W_acc_69_psp[3:2]) , (CONV_K_W_acc_69_psp[0])
          , (z_out_16[0])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_13_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_13_itm <= MUX_s_1_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21(1'b0,
          1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, {CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1
          , (CONV_NB_K_i_1_0_sva_3[0])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_14_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_14_itm <= MUX_v_4_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21(4'b0,
          4'b0, 4'b0, 4'b0, 4'b1111, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b1111, 4'b101,
          {CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1 , (CONV_NB_K_i_1_0_sva_3[0])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_16_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_16_itm <= MUX_s_1_26_2x0x1x2x3x6x10x14x18x22(1'b0, 1'b0, 1'b0,
          1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
          1'b0, 1'b1, {CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2 , (z_out_16[1:0])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_17_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_17_itm <= MUX_v_4_26_2x0x1x2x3x6x10x14x18x22(4'b0, 4'b0, 4'b0,
          4'b0, 4'b0, 4'b0, 4'b1111, 4'b101, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0,
          4'b0, 4'b1111, 4'b101, {CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2
          , (z_out_16[1:0])});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_74_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_acc_74_psp_11_0 <= nl_CONV_K_W_acc_74_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_75_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_acc_75_psp_11_0 <= nl_CONV_K_W_acc_75_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_19_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_19_itm <= MUX_s_1_15_2x0x1x2x3x7x11(1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
          1'b0, 1'b0, 1'b1, 1'b0, {CONV_K_W_acc_23_psp_sva , CONV_NB_K_i_1_0_sva_3});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_76_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_acc_76_psp_11_0 <= nl_CONV_K_W_acc_76_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_20_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_20_itm <= MUX_v_4_15_2x0x1x2x3x7x11(4'b0, 4'b0, 4'b0, 4'b0, 4'b0,
          4'b0, 4'b1111, 4'b101, 4'b1111, {CONV_K_W_acc_23_psp_sva , CONV_NB_K_i_1_0_sva_3});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_22_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_22_itm <= MUX_s_1_11_2x3x7(1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0,
          1'b0, 1'b0, 1'b0, {CONV_NB_K_i_1_0_sva_3 , CONV_NB_K_i_1_0_sva_3});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_23_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_23_itm <= MUX_v_4_11_2x3x7(4'b1111, 4'b101, 4'b1111, 4'b0, 4'b0,
          4'b0, 4'b0, 4'b0, 4'b0, {CONV_NB_K_i_1_0_sva_3 , CONV_NB_K_i_1_0_sva_3});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_mux_26_itm <= 4'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_mux_26_itm <= MUX_v_4_12_2x0x4x8(4'b101, 4'b1111, 4'b0, 4'b0, 4'b0,
          4'b0, 4'b0, 4'b0, 4'b0, {CONV_NB_K_i_1_0_sva_3 , CONV_K_W_conc_87_1 , (~
          (CONV_NB_K_i_1_0_sva_3[0]))});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva <= 7'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva <= CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_H_SLIDE_acc_5_itm_1 <= 8'b0;
    end
    else if ( ~ or_tmp_76 ) begin
      CONV_H_SLIDE_acc_5_itm_1 <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm <= 14'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm <= z_out_13;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm <= 14'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm <= z_out_14;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm <= 14'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm <= z_out_15;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_77_psp <= 14'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_W_acc_77_psp <= nl_CONV_K_W_acc_77_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_78_psp <= 14'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_W_acc_78_psp <= nl_CONV_K_W_acc_78_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_79_psp <= 14'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_W_acc_79_psp <= nl_CONV_K_W_acc_79_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_80_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_W_acc_80_psp_11_0 <= nl_CONV_K_W_acc_80_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_81_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_W_acc_81_psp_11_0 <= nl_CONV_K_W_acc_81_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_82_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[8] ) begin
      CONV_K_W_acc_82_psp_11_0 <= nl_CONV_K_W_acc_82_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_83_psp <= 14'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_83_psp <= nl_CONV_K_W_acc_83_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_26_sdt <= 14'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_26_sdt <= z_out_13;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_84_psp <= 14'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_84_psp <= nl_CONV_K_W_acc_84_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_27_sdt <= 14'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_27_sdt <= z_out_14;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_85_psp <= 14'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_85_psp <= nl_CONV_K_W_acc_85_psp[13:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_28_sdt <= 14'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_28_sdt <= z_out_15;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_86_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_86_psp_11_0 <= nl_CONV_K_W_acc_86_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_87_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_87_psp_11_0 <= nl_CONV_K_W_acc_87_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_88_psp_11_0 <= 12'b0;
    end
    else if ( fsm_output[9] ) begin
      CONV_K_W_acc_88_psp_11_0 <= nl_CONV_K_W_acc_88_psp_11_0[11:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_55_itm <= 11'b0;
    end
    else if ( fsm_output[10] ) begin
      CONV_K_W_acc_55_itm <= z_out_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_63_itm <= 11'b0;
    end
    else if ( fsm_output[13] ) begin
      CONV_K_W_acc_63_itm <= z_out_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_D_1_CONV_K_H_1_CONV_K_W_1_CONV_K_W_and_itm <= 11'b0;
    end
    else if ( fsm_output[13] ) begin
      CONV_K_D_1_CONV_K_H_1_CONV_K_W_1_CONV_K_W_and_itm <= CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_57_itm <= 11'b0;
    end
    else if ( fsm_output[16] ) begin
      CONV_K_W_acc_57_itm <= z_out_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_45_itm <= 11'b0;
    end
    else if ( fsm_output[17] ) begin
      CONV_K_W_acc_45_itm <= z_out_8;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_67_itm <= 11'b0;
    end
    else if ( fsm_output[20] ) begin
      CONV_K_W_acc_67_itm <= z_out_11;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_47_itm <= 11'b0;
    end
    else if ( fsm_output[21] ) begin
      CONV_K_W_acc_47_itm <= z_out_11;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_59_itm <= 11'b0;
    end
    else if ( fsm_output[23] ) begin
      CONV_K_W_acc_59_itm <= z_out_9;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_49_itm <= 11'b0;
    end
    else if ( fsm_output[25] ) begin
      CONV_K_W_acc_49_itm <= z_out_6;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_65_itm <= 11'b0;
    end
    else if ( fsm_output[28] ) begin
      CONV_K_W_acc_65_itm <= z_out_10;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_51_itm <= 11'b0;
    end
    else if ( fsm_output[29] ) begin
      CONV_K_W_acc_51_itm <= z_out_8;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_61_itm <= 11'b0;
    end
    else if ( fsm_output[31] ) begin
      CONV_K_W_acc_61_itm <= z_out_7;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_acc_53_itm <= 11'b0;
    end
    else if ( fsm_output[33] ) begin
      CONV_K_W_acc_53_itm <= z_out_7;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_CONV_H_SLIDE_acc_12_psp_tmp_5 <= 2'b0;
    end
    else if ( fsm_output[7] ) begin
      reg_CONV_H_SLIDE_acc_12_psp_tmp_5 <= z_out_2[1:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_CONV_H_SLIDE_acc_14_sdt_tmp_7 <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      reg_CONV_H_SLIDE_acc_14_sdt_tmp_7 <= CONV_H_SLIDE_acc_14_sdt_mx0w0[0];
    end
  end
  assign PAD_for_for_c_nor_nl = ~((fsm_output[0]) | (fsm_output[5]) | (fsm_output[6]));
  assign nl_PAD_for_for_else_acc_nl = conv_u2s_8_9(PAD_for_for_c_7_0_sva_3) + 9'b111111111;
  assign PAD_for_for_else_acc_nl = nl_PAD_for_for_else_acc_nl[8:0];
  assign nl_PAD_for_for_else_oif_acc_nl = conv_u2s_8_9(PAD_for_for_c_7_0_sva_3) +
      9'b101011111;
  assign PAD_for_for_else_oif_acc_nl = nl_PAD_for_for_else_oif_acc_nl[8:0];
  assign or_nl = (readslicef_9_1_8((PAD_for_for_else_acc_nl))) | (~ (readslicef_9_1_8((PAD_for_for_else_oif_acc_nl))));
  assign nl_CONV_K_D_1_CONV_K_W_acc_itm_1  = (CONV_V_SLIDE_j_6_0_sva_2[6:1]) + 6'b1;
  assign PAD_d_not_nl = ~ reg_PAD_d_1_PAD_d_or_cse;
  assign nl_CONV_H_SLIDE_acc_nl = ({1'b1 , (~ (CONV_K_W_acc_2_psp_5_sva_mx0w0[7:5]))})
      + 4'b101;
  assign CONV_H_SLIDE_acc_nl = nl_CONV_H_SLIDE_acc_nl[3:0];
  assign nl_CONV_K_W_acc_71_psp  = conv_u2u_13_14(CONV_K_W_acc_29_sdt_mx0w0[13:1])
      + 14'b1001101001101;
  assign nl_CONV_K_W_acc_72_psp  = conv_u2u_13_14(CONV_K_W_acc_30_sdt_mx0w0[13:1])
      + 14'b1001101001101;
  assign nl_CONV_K_W_acc_73_psp  = conv_u2u_13_14(CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0[13:1])
      + 14'b1001101001101;
  assign nl_CONV_K_W_acc_74_psp_11_0  = (CONV_K_W_acc_29_sdt_mx0w0[13:2]) + 12'b1101001101;
  assign nl_CONV_K_W_acc_75_psp_11_0  = (CONV_K_W_acc_30_sdt_mx0w0[13:2]) + 12'b1101001101;
  assign nl_CONV_K_W_acc_76_psp_11_0  = (CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0[13:2])
      + 12'b1101001101;
  assign nl_CONV_K_W_acc_77_psp  = conv_u2u_13_14(z_out_13[13:1]) + 14'b1001101001101;
  assign nl_CONV_K_W_acc_78_psp  = conv_u2u_13_14(z_out_14[13:1]) + 14'b1001101001101;
  assign nl_CONV_K_W_acc_79_psp  = conv_u2u_13_14(z_out_15[13:1]) + 14'b1001101001101;
  assign nl_CONV_K_W_acc_80_psp_11_0  = (z_out_13[13:2]) + 12'b1101001101;
  assign nl_CONV_K_W_acc_81_psp_11_0  = (z_out_14[13:2]) + 12'b1101001101;
  assign nl_CONV_K_W_acc_82_psp_11_0  = (z_out_15[13:2]) + 12'b1101001101;
  assign nl_CONV_K_W_acc_83_psp  = conv_u2u_13_14(z_out_13[13:1]) + 14'b1001101001101;
  assign nl_CONV_K_W_acc_84_psp  = conv_u2u_13_14(z_out_14[13:1]) + 14'b1001101001101;
  assign nl_CONV_K_W_acc_85_psp  = conv_u2u_13_14(z_out_15[13:1]) + 14'b1001101001101;
  assign nl_CONV_K_W_acc_86_psp_11_0  = (z_out_13[13:2]) + 12'b1101001101;
  assign nl_CONV_K_W_acc_87_psp_11_0  = (z_out_14[13:2]) + 12'b1101001101;
  assign nl_CONV_K_W_acc_88_psp_11_0  = (z_out_15[13:2]) + 12'b1101001101;
  assign CONV_NB_K_CONV_NB_K_and_1_nl = (PAD_d_1_0_sva_3[1]) & (~((fsm_output[39])
      | (fsm_output[7])));
  assign CONV_NB_K_mux1h_2_nl = MUX1HOT_s_1_3_2((o_d_1_0_sva_1[0]), (PAD_d_1_0_sva_3[0]),
      (CONV_NB_K_i_1_0_sva_3[1]), {(fsm_output[39]) , (fsm_output[6]) , (fsm_output[7])});
  assign nl_z_out = ({(CONV_NB_K_CONV_NB_K_and_1_nl) , (CONV_NB_K_mux1h_2_nl)}) +
      2'b1;
  assign z_out = nl_z_out[1:0];
  assign PAD_for_for_mux_2_nl = MUX_v_8_2_2(8'b10101111, z_out_3_7_0, fsm_output[7]);
  assign PAD_for_for_mux_3_nl = MUX_v_7_2_2((z_out_4[7:1]), (CONV_H_SLIDE_acc_14_sdt_mx0w0[7:1]),
      fsm_output[7]);
  assign nl_z_out_1 = (PAD_for_for_mux_2_nl) + conv_u2u_7_8(PAD_for_for_mux_3_nl);
  assign z_out_1 = nl_z_out_1[7:0];
  assign CONV_V_SLIDE_or_2_nl = (fsm_output[5]) | (fsm_output[2]);
  assign CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl = MUX_v_7_2_2(o_r_6_0_lpi_4, PAD_for_r_6_0_sva_4,
      CONV_V_SLIDE_or_2_nl);
  assign CONV_V_SLIDE_nor_1_nl = ~((fsm_output[38]) | (fsm_output[5]) | (fsm_output[7]));
  assign CONV_V_SLIDE_or_3_nl = (fsm_output[38]) | (fsm_output[5]);
  assign CONV_V_SLIDE_mux1h_2_nl = MUX1HOT_v_3_3_2(3'b1, PAD_for_for_else_else_acc_5_psp_sva_2_7_5,
      (o_c_7_0_lpi_4[7:5]), {(CONV_V_SLIDE_or_3_nl) , (fsm_output[2]) , (fsm_output[7])});
  assign nl_z_out_2 = conv_u2u_7_8(CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl) + conv_s2u_4_8({(CONV_V_SLIDE_nor_1_nl)
      , (CONV_V_SLIDE_mux1h_2_nl)});
  assign z_out_2 = nl_z_out_2[7:0];
  assign CONV_H_SLIDE_mux_10_nl = MUX_v_2_2_2(o_d_1_0_sva_1, PAD_d_1_0_sva_3, fsm_output[2]);
  assign nl_z_out_3_7_0 = (CONV_H_SLIDE_mux_10_nl) * 7'b1001011;
  assign z_out_3_7_0 = nl_z_out_3_7_0[7:0];
  assign CONV_H_SLIDE_mux_11_nl = MUX_v_8_2_2(o_c_7_0_lpi_4, PAD_for_for_c_7_0_sva_3,
      fsm_output[1]);
  assign nl_z_out_4 = (CONV_H_SLIDE_mux_11_nl) + 8'b1;
  assign z_out_4 = nl_z_out_4[7:0];
  assign CONV_K_W_mux1h_10_nl = MUX1HOT_v_4_9_2(CONV_K_W_mux_26_itm, CONV_K_W_mux_23_itm,
      CONV_K_W_mux_20_itm, CONV_K_W_mux_17_itm, CONV_K_W_mux_14_itm, CONV_K_W_mux_11_itm,
      CONV_K_W_mux_8_itm, CONV_K_W_mux_5_itm, CONV_K_W_mux_2_itm, {(fsm_output[9])
      , (fsm_output[12]) , (fsm_output[15]) , (fsm_output[18]) , (fsm_output[21])
      , (fsm_output[24]) , (fsm_output[27]) , (fsm_output[30]) , (fsm_output[33])});
  assign nl_z_out_5 = $signed((CONV_K_W_mux1h_10_nl)) * $signed((pad_input_rsci_data_out_d));
  assign z_out_5 = nl_z_out_5[10:0];
  assign nl_CONV_K_W_acc_90_nl = CONV_K_W_acc_62_itm_1 + CONV_K_W_acc_61_itm;
  assign CONV_K_W_acc_90_nl = nl_CONV_K_W_acc_90_nl[10:0];
  assign nl_CONV_K_W_acc_89_nl = (CONV_K_W_acc_90_nl) + CONV_K_W_acc_65_itm;
  assign CONV_K_W_acc_89_nl = nl_CONV_K_W_acc_89_nl[10:0];
  assign CONV_K_W_or_10_nl = (fsm_output[16]) | (fsm_output[28]);
  assign CONV_K_W_mux1h_11_nl = MUX1HOT_v_11_6_2(CONV_K_W_acc_56_itm_1, reg_CONV_K_W_acc_44_cse,
      CONV_K_D_3_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_2, CONV_K_W_acc_58_itm_1, CONV_K_D_2_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_2,
      (CONV_K_W_acc_89_nl), {(fsm_output[13]) , (CONV_K_W_or_10_nl) , (fsm_output[19])
      , (fsm_output[20]) , (fsm_output[31]) , (fsm_output[36])});
  assign CONV_K_W_or_11_nl = (fsm_output[10]) | (fsm_output[35]) | (fsm_output[23])
      | (fsm_output[25]);
  assign CONV_K_W_or_9_nl = MUX_v_11_2_2((CONV_K_W_mux1h_11_nl), 11'b11111111111,
      (CONV_K_W_or_11_nl));
  assign or_148_nl = (CONV_K_W_mux_10_itm & or_dcpl) | (CONV_K_W_mux_itm & or_dcpl_11);
  assign mux_1_nl = MUX_v_11_2_2((CONV_K_W_or_9_nl), CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21,
      or_148_nl);
  assign nor_25_nl = ~(((~ CONV_K_W_mux_10_itm) & or_dcpl) | ((~ CONV_K_W_mux_itm)
      & or_dcpl_11));
  assign and_325_nl = MUX_v_11_2_2(11'b00000000000, (mux_1_nl), (nor_25_nl));
  assign CONV_K_W_or_12_nl = (fsm_output[10]) | (fsm_output[19]) | (fsm_output[25])
      | (fsm_output[31]);
  assign CONV_K_W_mux1h_12_nl = MUX1HOT_v_11_8_2(reg_CONV_K_D_1_CONV_K_H_2_CONV_K_W_2_mul_10_cse,
      CONV_K_W_acc_55_itm, CONV_K_D_1_CONV_K_H_1_CONV_K_W_1_CONV_K_W_and_itm, CONV_K_W_acc_57_itm,
      CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1, CONV_K_W_acc_49_itm, CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1,
      CONV_K_W_acc_67_itm, {(CONV_K_W_or_12_nl) , (fsm_output[13]) , (fsm_output[16])
      , (fsm_output[20]) , (fsm_output[23]) , (fsm_output[28]) , (fsm_output[35])
      , (fsm_output[36])});
  assign nl_z_out_6 = (and_325_nl) + (CONV_K_W_mux1h_12_nl);
  assign z_out_6 = nl_z_out_6[10:0];
  assign CONV_K_W_CONV_K_W_mux_1_nl = MUX_v_11_2_2(z_out_5, z_out_6, fsm_output[31]);
  assign CONV_K_W_mux1h_13_nl = MUX1HOT_v_11_3_2(CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1,
      CONV_K_W_acc_51_itm, CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1, {(fsm_output[12])
      , (fsm_output[31]) , (fsm_output[33])});
  assign nl_z_out_7 = (CONV_K_W_CONV_K_W_mux_1_nl) + (CONV_K_W_mux1h_13_nl);
  assign z_out_7 = nl_z_out_7[10:0];
  assign CONV_K_W_or_13_nl = (fsm_output[15]) | (fsm_output[27]);
  assign CONV_K_W_mux1h_14_nl = MUX1HOT_v_11_3_2(z_out_5, CONV_K_D_3_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_2,
      CONV_K_D_2_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_2, {(CONV_K_W_or_13_nl) , (fsm_output[17])
      , (fsm_output[29])});
  assign CONV_K_W_or_14_nl = (fsm_output[27]) | (fsm_output[29]);
  assign CONV_K_W_mux_92_nl = MUX_v_11_2_2(CONV_K_D_3_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1,
      CONV_K_D_2_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_itm_1, CONV_K_W_or_14_nl);
  assign nl_z_out_8 = (CONV_K_W_mux1h_14_nl) + (CONV_K_W_mux_92_nl);
  assign z_out_8 = nl_z_out_8[10:0];
  assign CONV_K_W_mux_93_nl = MUX_v_11_2_2(CONV_K_W_acc_47_itm, CONV_K_W_acc_53_itm,
      fsm_output[35]);
  assign nl_z_out_9 = z_out_6 + (CONV_K_W_mux_93_nl);
  assign z_out_9 = nl_z_out_9[10:0];
  assign CONV_K_W_mux_94_nl = MUX_v_11_2_2(CONV_K_W_acc_45_itm, CONV_K_W_acc_59_itm,
      fsm_output[28]);
  assign nl_z_out_10 = z_out_6 + (CONV_K_W_mux_94_nl);
  assign z_out_10 = nl_z_out_10[10:0];
  assign CONV_K_W_mux_95_nl = MUX_v_11_2_2(z_out_6, z_out_5, fsm_output[21]);
  assign CONV_K_W_mux_96_nl = MUX_v_11_2_2(CONV_K_W_acc_63_itm, CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1,
      fsm_output[21]);
  assign nl_z_out_11 = (CONV_K_W_mux_95_nl) + (CONV_K_W_mux_96_nl);
  assign z_out_11 = nl_z_out_11[10:0];
  assign CONV_K_W_mux1h_15_nl = MUX1HOT_v_6_3_2((CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3[6:1]),
      CONV_K_D_1_CONV_K_W_acc_itm_1, (CONV_V_SLIDE_j_6_0_sva_2[6:1]), {(fsm_output[7])
      , (fsm_output[8]) , (fsm_output[9])});
  assign CONV_K_W_mux1h_16_nl = MUX1HOT_s_1_3_2((CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3[0]),
      (CONV_V_SLIDE_j_6_0_sva_2[0]), (CONV_V_SLIDE_j_6_0_sva_2[0]), {(fsm_output[7])
      , (fsm_output[8]) , (fsm_output[9])});
  assign z_out_12 = conv_u2u_14_14(({(CONV_K_W_mux1h_15_nl) , (CONV_K_W_mux1h_16_nl)})
      * 7'b1010001);
  assign nl_z_out_13 = z_out_12 + conv_u2u_7_14(CONV_H_SLIDE_k_7_0_sva_1[7:1]);
  assign z_out_13 = nl_z_out_13[13:0];
  assign nl_z_out_14 = z_out_12 + conv_u2u_7_14(CONV_K_W_acc_2_psp_5_sva[7:1]);
  assign z_out_14 = nl_z_out_14[13:0];
  assign nl_z_out_15 = z_out_12 + conv_u2u_7_14(CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva);
  assign z_out_15 = nl_z_out_15[13:0];
  assign CONV_K_W_mux_97_nl = MUX_v_2_2_2(CONV_NB_K_i_1_0_sva_3, CONV_K_W_acc_23_psp_sva,
      fsm_output[39]);
  assign nl_z_out_16 = conv_u2u_2_3(CONV_K_W_mux_97_nl) + conv_u2u_2_3({(fsm_output[39])
      , 1'b1}) + 3'b10;
  assign z_out_16 = nl_z_out_16[2:0];

  function [0:0] MUX1HOT_s_1_12_2;
    input [0:0] input_11;
    input [0:0] input_10;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [11:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    result = result | ( input_10 & {1{sel[10]}});
    result = result | ( input_11 & {1{sel[11]}});
    MUX1HOT_s_1_12_2 = result;
  end
  endfunction


  function [0:0] MUX1HOT_s_1_21_2;
    input [0:0] input_20;
    input [0:0] input_19;
    input [0:0] input_18;
    input [0:0] input_17;
    input [0:0] input_16;
    input [0:0] input_15;
    input [0:0] input_14;
    input [0:0] input_13;
    input [0:0] input_12;
    input [0:0] input_11;
    input [0:0] input_10;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [20:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    result = result | ( input_10 & {1{sel[10]}});
    result = result | ( input_11 & {1{sel[11]}});
    result = result | ( input_12 & {1{sel[12]}});
    result = result | ( input_13 & {1{sel[13]}});
    result = result | ( input_14 & {1{sel[14]}});
    result = result | ( input_15 & {1{sel[15]}});
    result = result | ( input_16 & {1{sel[16]}});
    result = result | ( input_17 & {1{sel[17]}});
    result = result | ( input_18 & {1{sel[18]}});
    result = result | ( input_19 & {1{sel[19]}});
    result = result | ( input_20 & {1{sel[20]}});
    MUX1HOT_s_1_21_2 = result;
  end
  endfunction


  function [0:0] MUX1HOT_s_1_3_2;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [2:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    MUX1HOT_s_1_3_2 = result;
  end
  endfunction


  function [0:0] MUX1HOT_s_1_5_2;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [4:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    MUX1HOT_s_1_5_2 = result;
  end
  endfunction


  function [10:0] MUX1HOT_v_11_3_2;
    input [10:0] input_2;
    input [10:0] input_1;
    input [10:0] input_0;
    input [2:0] sel;
    reg [10:0] result;
  begin
    result = input_0 & {11{sel[0]}};
    result = result | ( input_1 & {11{sel[1]}});
    result = result | ( input_2 & {11{sel[2]}});
    MUX1HOT_v_11_3_2 = result;
  end
  endfunction


  function [10:0] MUX1HOT_v_11_6_2;
    input [10:0] input_5;
    input [10:0] input_4;
    input [10:0] input_3;
    input [10:0] input_2;
    input [10:0] input_1;
    input [10:0] input_0;
    input [5:0] sel;
    reg [10:0] result;
  begin
    result = input_0 & {11{sel[0]}};
    result = result | ( input_1 & {11{sel[1]}});
    result = result | ( input_2 & {11{sel[2]}});
    result = result | ( input_3 & {11{sel[3]}});
    result = result | ( input_4 & {11{sel[4]}});
    result = result | ( input_5 & {11{sel[5]}});
    MUX1HOT_v_11_6_2 = result;
  end
  endfunction


  function [10:0] MUX1HOT_v_11_8_2;
    input [10:0] input_7;
    input [10:0] input_6;
    input [10:0] input_5;
    input [10:0] input_4;
    input [10:0] input_3;
    input [10:0] input_2;
    input [10:0] input_1;
    input [10:0] input_0;
    input [7:0] sel;
    reg [10:0] result;
  begin
    result = input_0 & {11{sel[0]}};
    result = result | ( input_1 & {11{sel[1]}});
    result = result | ( input_2 & {11{sel[2]}});
    result = result | ( input_3 & {11{sel[3]}});
    result = result | ( input_4 & {11{sel[4]}});
    result = result | ( input_5 & {11{sel[5]}});
    result = result | ( input_6 & {11{sel[6]}});
    result = result | ( input_7 & {11{sel[7]}});
    MUX1HOT_v_11_8_2 = result;
  end
  endfunction


  function [11:0] MUX1HOT_v_12_30_2;
    input [11:0] input_29;
    input [11:0] input_28;
    input [11:0] input_27;
    input [11:0] input_26;
    input [11:0] input_25;
    input [11:0] input_24;
    input [11:0] input_23;
    input [11:0] input_22;
    input [11:0] input_21;
    input [11:0] input_20;
    input [11:0] input_19;
    input [11:0] input_18;
    input [11:0] input_17;
    input [11:0] input_16;
    input [11:0] input_15;
    input [11:0] input_14;
    input [11:0] input_13;
    input [11:0] input_12;
    input [11:0] input_11;
    input [11:0] input_10;
    input [11:0] input_9;
    input [11:0] input_8;
    input [11:0] input_7;
    input [11:0] input_6;
    input [11:0] input_5;
    input [11:0] input_4;
    input [11:0] input_3;
    input [11:0] input_2;
    input [11:0] input_1;
    input [11:0] input_0;
    input [29:0] sel;
    reg [11:0] result;
  begin
    result = input_0 & {12{sel[0]}};
    result = result | ( input_1 & {12{sel[1]}});
    result = result | ( input_2 & {12{sel[2]}});
    result = result | ( input_3 & {12{sel[3]}});
    result = result | ( input_4 & {12{sel[4]}});
    result = result | ( input_5 & {12{sel[5]}});
    result = result | ( input_6 & {12{sel[6]}});
    result = result | ( input_7 & {12{sel[7]}});
    result = result | ( input_8 & {12{sel[8]}});
    result = result | ( input_9 & {12{sel[9]}});
    result = result | ( input_10 & {12{sel[10]}});
    result = result | ( input_11 & {12{sel[11]}});
    result = result | ( input_12 & {12{sel[12]}});
    result = result | ( input_13 & {12{sel[13]}});
    result = result | ( input_14 & {12{sel[14]}});
    result = result | ( input_15 & {12{sel[15]}});
    result = result | ( input_16 & {12{sel[16]}});
    result = result | ( input_17 & {12{sel[17]}});
    result = result | ( input_18 & {12{sel[18]}});
    result = result | ( input_19 & {12{sel[19]}});
    result = result | ( input_20 & {12{sel[20]}});
    result = result | ( input_21 & {12{sel[21]}});
    result = result | ( input_22 & {12{sel[22]}});
    result = result | ( input_23 & {12{sel[23]}});
    result = result | ( input_24 & {12{sel[24]}});
    result = result | ( input_25 & {12{sel[25]}});
    result = result | ( input_26 & {12{sel[26]}});
    result = result | ( input_27 & {12{sel[27]}});
    result = result | ( input_28 & {12{sel[28]}});
    result = result | ( input_29 & {12{sel[29]}});
    MUX1HOT_v_12_30_2 = result;
  end
  endfunction


  function [2:0] MUX1HOT_v_3_3_2;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [2:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    MUX1HOT_v_3_3_2 = result;
  end
  endfunction


  function [3:0] MUX1HOT_v_4_9_2;
    input [3:0] input_8;
    input [3:0] input_7;
    input [3:0] input_6;
    input [3:0] input_5;
    input [3:0] input_4;
    input [3:0] input_3;
    input [3:0] input_2;
    input [3:0] input_1;
    input [3:0] input_0;
    input [8:0] sel;
    reg [3:0] result;
  begin
    result = input_0 & {4{sel[0]}};
    result = result | ( input_1 & {4{sel[1]}});
    result = result | ( input_2 & {4{sel[2]}});
    result = result | ( input_3 & {4{sel[3]}});
    result = result | ( input_4 & {4{sel[4]}});
    result = result | ( input_5 & {4{sel[5]}});
    result = result | ( input_6 & {4{sel[6]}});
    result = result | ( input_7 & {4{sel[7]}});
    result = result | ( input_8 & {4{sel[8]}});
    MUX1HOT_v_4_9_2 = result;
  end
  endfunction


  function [5:0] MUX1HOT_v_6_3_2;
    input [5:0] input_2;
    input [5:0] input_1;
    input [5:0] input_0;
    input [2:0] sel;
    reg [5:0] result;
  begin
    result = input_0 & {6{sel[0]}};
    result = result | ( input_1 & {6{sel[1]}});
    result = result | ( input_2 & {6{sel[2]}});
    MUX1HOT_v_6_3_2 = result;
  end
  endfunction


  function [0:0] MUX_s_1_11_2x3x7;
    input [0:0] input_0;
    input [0:0] input_1;
    input [0:0] input_2;
    input [0:0] input_4;
    input [0:0] input_5;
    input [0:0] input_6;
    input [0:0] input_8;
    input [0:0] input_9;
    input [0:0] input_10;
    input [3:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = input_0;
      end
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      default : begin
        result = input_10;
      end
    endcase
    MUX_s_1_11_2x3x7 = result;
  end
  endfunction


  function [0:0] MUX_s_1_12_2;
    input [0:0] input_0;
    input [0:0] input_1;
    input [0:0] input_2;
    input [0:0] input_3;
    input [0:0] input_4;
    input [0:0] input_5;
    input [0:0] input_6;
    input [0:0] input_7;
    input [0:0] input_8;
    input [0:0] input_9;
    input [0:0] input_10;
    input [0:0] input_11;
    input [3:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = input_0;
      end
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0011 : begin
        result = input_3;
      end
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b0111 : begin
        result = input_7;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      default : begin
        result = input_11;
      end
    endcase
    MUX_s_1_12_2 = result;
  end
  endfunction


  function [0:0] MUX_s_1_12_2x0x4x8;
    input [0:0] input_1;
    input [0:0] input_2;
    input [0:0] input_3;
    input [0:0] input_5;
    input [0:0] input_6;
    input [0:0] input_7;
    input [0:0] input_9;
    input [0:0] input_10;
    input [0:0] input_11;
    input [3:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0011 : begin
        result = input_3;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b0111 : begin
        result = input_7;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      default : begin
        result = input_11;
      end
    endcase
    MUX_s_1_12_2x0x4x8 = result;
  end
  endfunction


  function [0:0] MUX_s_1_15_2x0x1x2x3x7x11;
    input [0:0] input_4;
    input [0:0] input_5;
    input [0:0] input_6;
    input [0:0] input_8;
    input [0:0] input_9;
    input [0:0] input_10;
    input [0:0] input_12;
    input [0:0] input_13;
    input [0:0] input_14;
    input [3:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      4'b1100 : begin
        result = input_12;
      end
      4'b1101 : begin
        result = input_13;
      end
      default : begin
        result = input_14;
      end
    endcase
    MUX_s_1_15_2x0x1x2x3x7x11 = result;
  end
  endfunction


  function [0:0] MUX_s_1_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18;
    input [0:0] input_3;
    input [0:0] input_4;
    input [0:0] input_5;
    input [0:0] input_11;
    input [0:0] input_12;
    input [0:0] input_13;
    input [0:0] input_19;
    input [0:0] input_20;
    input [0:0] input_21;
    input [4:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      5'b00011 : begin
        result = input_3;
      end
      5'b00100 : begin
        result = input_4;
      end
      5'b00101 : begin
        result = input_5;
      end
      5'b01011 : begin
        result = input_11;
      end
      5'b01100 : begin
        result = input_12;
      end
      5'b01101 : begin
        result = input_13;
      end
      5'b10011 : begin
        result = input_19;
      end
      5'b10100 : begin
        result = input_20;
      end
      default : begin
        result = input_21;
      end
    endcase
    MUX_s_1_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18 = result;
  end
  endfunction


  function [0:0] MUX_s_1_22_2x0x1x6x7x8x9x14x15x16x17;
    input [0:0] input_2;
    input [0:0] input_3;
    input [0:0] input_4;
    input [0:0] input_5;
    input [0:0] input_10;
    input [0:0] input_11;
    input [0:0] input_12;
    input [0:0] input_13;
    input [0:0] input_18;
    input [0:0] input_19;
    input [0:0] input_20;
    input [0:0] input_21;
    input [4:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      5'b00010 : begin
        result = input_2;
      end
      5'b00011 : begin
        result = input_3;
      end
      5'b00100 : begin
        result = input_4;
      end
      5'b00101 : begin
        result = input_5;
      end
      5'b01010 : begin
        result = input_10;
      end
      5'b01011 : begin
        result = input_11;
      end
      5'b01100 : begin
        result = input_12;
      end
      5'b01101 : begin
        result = input_13;
      end
      5'b10010 : begin
        result = input_18;
      end
      5'b10011 : begin
        result = input_19;
      end
      5'b10100 : begin
        result = input_20;
      end
      default : begin
        result = input_21;
      end
    endcase
    MUX_s_1_22_2x0x1x6x7x8x9x14x15x16x17 = result;
  end
  endfunction


  function [0:0] MUX_s_1_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21;
    input [0:0] input_6;
    input [0:0] input_7;
    input [0:0] input_8;
    input [0:0] input_9;
    input [0:0] input_14;
    input [0:0] input_15;
    input [0:0] input_16;
    input [0:0] input_17;
    input [0:0] input_22;
    input [0:0] input_23;
    input [0:0] input_24;
    input [0:0] input_25;
    input [4:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      5'b00110 : begin
        result = input_6;
      end
      5'b00111 : begin
        result = input_7;
      end
      5'b01000 : begin
        result = input_8;
      end
      5'b01001 : begin
        result = input_9;
      end
      5'b01110 : begin
        result = input_14;
      end
      5'b01111 : begin
        result = input_15;
      end
      5'b10000 : begin
        result = input_16;
      end
      5'b10001 : begin
        result = input_17;
      end
      5'b10110 : begin
        result = input_22;
      end
      5'b10111 : begin
        result = input_23;
      end
      5'b11000 : begin
        result = input_24;
      end
      default : begin
        result = input_25;
      end
    endcase
    MUX_s_1_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21 = result;
  end
  endfunction


  function [0:0] MUX_s_1_26_2x0x1x2x3x6x10x14x18x22;
    input [0:0] input_4;
    input [0:0] input_5;
    input [0:0] input_7;
    input [0:0] input_8;
    input [0:0] input_9;
    input [0:0] input_11;
    input [0:0] input_12;
    input [0:0] input_13;
    input [0:0] input_15;
    input [0:0] input_16;
    input [0:0] input_17;
    input [0:0] input_19;
    input [0:0] input_20;
    input [0:0] input_21;
    input [0:0] input_23;
    input [0:0] input_24;
    input [0:0] input_25;
    input [4:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      5'b00100 : begin
        result = input_4;
      end
      5'b00101 : begin
        result = input_5;
      end
      5'b00111 : begin
        result = input_7;
      end
      5'b01000 : begin
        result = input_8;
      end
      5'b01001 : begin
        result = input_9;
      end
      5'b01011 : begin
        result = input_11;
      end
      5'b01100 : begin
        result = input_12;
      end
      5'b01101 : begin
        result = input_13;
      end
      5'b01111 : begin
        result = input_15;
      end
      5'b10000 : begin
        result = input_16;
      end
      5'b10001 : begin
        result = input_17;
      end
      5'b10011 : begin
        result = input_19;
      end
      5'b10100 : begin
        result = input_20;
      end
      5'b10101 : begin
        result = input_21;
      end
      5'b10111 : begin
        result = input_23;
      end
      5'b11000 : begin
        result = input_24;
      end
      default : begin
        result = input_25;
      end
    endcase
    MUX_s_1_26_2x0x1x2x3x6x10x14x18x22 = result;
  end
  endfunction


  function [0:0] MUX_s_1_2_2;
    input [0:0] input_0;
    input [0:0] input_1;
    input [0:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function [9:0] MUX_v_10_2_2;
    input [9:0] input_0;
    input [9:0] input_1;
    input [0:0] sel;
    reg [9:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_10_2_2 = result;
  end
  endfunction


  function [10:0] MUX_v_11_2_2;
    input [10:0] input_0;
    input [10:0] input_1;
    input [0:0] sel;
    reg [10:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_11_2_2 = result;
  end
  endfunction


  function [1:0] MUX_v_2_2_2;
    input [1:0] input_0;
    input [1:0] input_1;
    input [0:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function [3:0] MUX_v_4_11_2x3x7;
    input [3:0] input_0;
    input [3:0] input_1;
    input [3:0] input_2;
    input [3:0] input_4;
    input [3:0] input_5;
    input [3:0] input_6;
    input [3:0] input_8;
    input [3:0] input_9;
    input [3:0] input_10;
    input [3:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = input_0;
      end
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      default : begin
        result = input_10;
      end
    endcase
    MUX_v_4_11_2x3x7 = result;
  end
  endfunction


  function [3:0] MUX_v_4_12_2;
    input [3:0] input_0;
    input [3:0] input_1;
    input [3:0] input_2;
    input [3:0] input_3;
    input [3:0] input_4;
    input [3:0] input_5;
    input [3:0] input_6;
    input [3:0] input_7;
    input [3:0] input_8;
    input [3:0] input_9;
    input [3:0] input_10;
    input [3:0] input_11;
    input [3:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = input_0;
      end
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0011 : begin
        result = input_3;
      end
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b0111 : begin
        result = input_7;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      default : begin
        result = input_11;
      end
    endcase
    MUX_v_4_12_2 = result;
  end
  endfunction


  function [3:0] MUX_v_4_12_2x0x4x8;
    input [3:0] input_1;
    input [3:0] input_2;
    input [3:0] input_3;
    input [3:0] input_5;
    input [3:0] input_6;
    input [3:0] input_7;
    input [3:0] input_9;
    input [3:0] input_10;
    input [3:0] input_11;
    input [3:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0011 : begin
        result = input_3;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b0111 : begin
        result = input_7;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      default : begin
        result = input_11;
      end
    endcase
    MUX_v_4_12_2x0x4x8 = result;
  end
  endfunction


  function [3:0] MUX_v_4_15_2x0x1x2x3x7x11;
    input [3:0] input_4;
    input [3:0] input_5;
    input [3:0] input_6;
    input [3:0] input_8;
    input [3:0] input_9;
    input [3:0] input_10;
    input [3:0] input_12;
    input [3:0] input_13;
    input [3:0] input_14;
    input [3:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      4'b1100 : begin
        result = input_12;
      end
      4'b1101 : begin
        result = input_13;
      end
      default : begin
        result = input_14;
      end
    endcase
    MUX_v_4_15_2x0x1x2x3x7x11 = result;
  end
  endfunction


  function [3:0] MUX_v_4_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18;
    input [3:0] input_3;
    input [3:0] input_4;
    input [3:0] input_5;
    input [3:0] input_11;
    input [3:0] input_12;
    input [3:0] input_13;
    input [3:0] input_19;
    input [3:0] input_20;
    input [3:0] input_21;
    input [4:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      5'b00011 : begin
        result = input_3;
      end
      5'b00100 : begin
        result = input_4;
      end
      5'b00101 : begin
        result = input_5;
      end
      5'b01011 : begin
        result = input_11;
      end
      5'b01100 : begin
        result = input_12;
      end
      5'b01101 : begin
        result = input_13;
      end
      5'b10011 : begin
        result = input_19;
      end
      5'b10100 : begin
        result = input_20;
      end
      default : begin
        result = input_21;
      end
    endcase
    MUX_v_4_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18 = result;
  end
  endfunction


  function [3:0] MUX_v_4_22_2x0x1x6x7x8x9x14x15x16x17;
    input [3:0] input_2;
    input [3:0] input_3;
    input [3:0] input_4;
    input [3:0] input_5;
    input [3:0] input_10;
    input [3:0] input_11;
    input [3:0] input_12;
    input [3:0] input_13;
    input [3:0] input_18;
    input [3:0] input_19;
    input [3:0] input_20;
    input [3:0] input_21;
    input [4:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      5'b00010 : begin
        result = input_2;
      end
      5'b00011 : begin
        result = input_3;
      end
      5'b00100 : begin
        result = input_4;
      end
      5'b00101 : begin
        result = input_5;
      end
      5'b01010 : begin
        result = input_10;
      end
      5'b01011 : begin
        result = input_11;
      end
      5'b01100 : begin
        result = input_12;
      end
      5'b01101 : begin
        result = input_13;
      end
      5'b10010 : begin
        result = input_18;
      end
      5'b10011 : begin
        result = input_19;
      end
      5'b10100 : begin
        result = input_20;
      end
      default : begin
        result = input_21;
      end
    endcase
    MUX_v_4_22_2x0x1x6x7x8x9x14x15x16x17 = result;
  end
  endfunction


  function [3:0] MUX_v_4_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21;
    input [3:0] input_6;
    input [3:0] input_7;
    input [3:0] input_8;
    input [3:0] input_9;
    input [3:0] input_14;
    input [3:0] input_15;
    input [3:0] input_16;
    input [3:0] input_17;
    input [3:0] input_22;
    input [3:0] input_23;
    input [3:0] input_24;
    input [3:0] input_25;
    input [4:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      5'b00110 : begin
        result = input_6;
      end
      5'b00111 : begin
        result = input_7;
      end
      5'b01000 : begin
        result = input_8;
      end
      5'b01001 : begin
        result = input_9;
      end
      5'b01110 : begin
        result = input_14;
      end
      5'b01111 : begin
        result = input_15;
      end
      5'b10000 : begin
        result = input_16;
      end
      5'b10001 : begin
        result = input_17;
      end
      5'b10110 : begin
        result = input_22;
      end
      5'b10111 : begin
        result = input_23;
      end
      5'b11000 : begin
        result = input_24;
      end
      default : begin
        result = input_25;
      end
    endcase
    MUX_v_4_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21 = result;
  end
  endfunction


  function [3:0] MUX_v_4_26_2x0x1x2x3x6x10x14x18x22;
    input [3:0] input_4;
    input [3:0] input_5;
    input [3:0] input_7;
    input [3:0] input_8;
    input [3:0] input_9;
    input [3:0] input_11;
    input [3:0] input_12;
    input [3:0] input_13;
    input [3:0] input_15;
    input [3:0] input_16;
    input [3:0] input_17;
    input [3:0] input_19;
    input [3:0] input_20;
    input [3:0] input_21;
    input [3:0] input_23;
    input [3:0] input_24;
    input [3:0] input_25;
    input [4:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      5'b00100 : begin
        result = input_4;
      end
      5'b00101 : begin
        result = input_5;
      end
      5'b00111 : begin
        result = input_7;
      end
      5'b01000 : begin
        result = input_8;
      end
      5'b01001 : begin
        result = input_9;
      end
      5'b01011 : begin
        result = input_11;
      end
      5'b01100 : begin
        result = input_12;
      end
      5'b01101 : begin
        result = input_13;
      end
      5'b01111 : begin
        result = input_15;
      end
      5'b10000 : begin
        result = input_16;
      end
      5'b10001 : begin
        result = input_17;
      end
      5'b10011 : begin
        result = input_19;
      end
      5'b10100 : begin
        result = input_20;
      end
      5'b10101 : begin
        result = input_21;
      end
      5'b10111 : begin
        result = input_23;
      end
      5'b11000 : begin
        result = input_24;
      end
      default : begin
        result = input_25;
      end
    endcase
    MUX_v_4_26_2x0x1x2x3x6x10x14x18x22 = result;
  end
  endfunction


  function [6:0] MUX_v_7_2_2;
    input [6:0] input_0;
    input [6:0] input_1;
    input [0:0] sel;
    reg [6:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_7_2_2 = result;
  end
  endfunction


  function [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input [0:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function [0:0] readslicef_3_1_2;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_3_1_2 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_4_1_3;
    input [3:0] vector;
    reg [3:0] tmp;
  begin
    tmp = vector >> 3;
    readslicef_4_1_3 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_7_1_6;
    input [6:0] vector;
    reg [6:0] tmp;
  begin
    tmp = vector >> 6;
    readslicef_7_1_6 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_8_1_7;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_8_1_7 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_9_1_8;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 8;
    readslicef_9_1_8 = tmp[0:0];
  end
  endfunction


  function  [8:0] conv_s2s_6_9 ;
    input [5:0]  vector ;
  begin
    conv_s2s_6_9 = {{3{vector[5]}}, vector};
  end
  endfunction


  function  [10:0] conv_s2s_10_11 ;
    input [9:0]  vector ;
  begin
    conv_s2s_10_11 = {vector[9], vector};
  end
  endfunction


  function  [7:0] conv_s2u_4_8 ;
    input [3:0]  vector ;
  begin
    conv_s2u_4_8 = {{4{vector[3]}}, vector};
  end
  endfunction


  function  [6:0] conv_u2s_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2s_6_7 =  {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_u2s_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2s_7_8 =  {1'b0, vector};
  end
  endfunction


  function  [8:0] conv_u2s_7_9 ;
    input [6:0]  vector ;
  begin
    conv_u2s_7_9 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
  end
  endfunction


  function  [2:0] conv_u2u_1_3 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_3 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [3:0] conv_u2u_1_4 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_4 = {{3{1'b0}}, vector};
  end
  endfunction


  function  [2:0] conv_u2u_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_3 = {1'b0, vector};
  end
  endfunction


  function  [3:0] conv_u2u_2_4 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_4 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [7:0] conv_u2u_5_8 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_8 = {{3{1'b0}}, vector};
  end
  endfunction


  function  [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function  [13:0] conv_u2u_7_14 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_14 = {{7{1'b0}}, vector};
  end
  endfunction


  function  [13:0] conv_u2u_13_14 ;
    input [12:0]  vector ;
  begin
    conv_u2u_13_14 = {1'b0, vector};
  end
  endfunction


  function  [13:0] conv_u2u_14_14 ;
    input [13:0]  vector ;
  begin
    conv_u2u_14_14 = vector;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    apply_conv
// ------------------------------------------------------------------


module apply_conv (
  clk, rst, conv_in_rsc_addr, conv_in_rsc_re, conv_in_rsc_data_out, conv_in_rsc_triosy_lz,
      conv_out_rsc_data_in, conv_out_rsc_addr, conv_out_rsc_we, conv_out_rsc_triosy_lz
);
  input clk;
  input rst;
  output [15:0] conv_in_rsc_addr;
  output conv_in_rsc_re;
  input [9:0] conv_in_rsc_data_out;
  output conv_in_rsc_triosy_lz;
  output [10:0] conv_out_rsc_data_in;
  output [15:0] conv_out_rsc_addr;
  output conv_out_rsc_we;
  output conv_out_rsc_triosy_lz;


  // Interconnect Declarations
  wire [15:0] conv_in_rsci_addr_d;
  wire conv_in_rsci_re_d;
  wire [9:0] conv_in_rsci_data_out_d;
  wire [10:0] conv_out_rsci_data_in_d;
  wire [15:0] conv_out_rsci_addr_d;
  wire conv_out_rsci_we_d;
  wire [9:0] pad_input_rsci_data_in_d;
  wire [15:0] pad_input_rsci_addr_d;
  wire pad_input_rsci_re_d;
  wire pad_input_rsci_we_d;
  wire [9:0] pad_input_rsci_data_out_d;
  wire pad_input_rsc_en;
  wire [9:0] pad_input_rsc_data_out;
  wire pad_input_rsc_we;
  wire pad_input_rsc_re;
  wire [15:0] pad_input_rsc_addr;
  wire [9:0] pad_input_rsc_data_in;


  // Interconnect Declarations for Component Instantiations 
  singleport_ram_be #(.ram_id(32'sd3),
  .words(32'sd59292),
  .width(32'sd10),
  .addr_width(32'sd16),
  .a_reset_active(32'sd0),
  .s_reset_active(32'sd1),
  .enable_active(32'sd0),
  .re_active(32'sd0),
  .we_active(32'sd0),
  .num_byte_enables(32'sd1),
  .clock_edge(32'sd1),
  .num_input_registers(32'sd1),
  .num_output_registers(32'sd0),
  .no_of_singleport_readwrite_port(32'sd1)) pad_input_rsc_comp (
      .data_in(pad_input_rsc_data_in),
      .addr(pad_input_rsc_addr),
      .re(pad_input_rsc_re),
      .we(pad_input_rsc_we),
      .data_out(pad_input_rsc_data_out),
      .clk(clk),
      .a_rst(1'b1),
      .s_rst(rst),
      .en(pad_input_rsc_en)
    );
  ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen
      conv_in_rsci (
      .data_out(conv_in_rsc_data_out),
      .re(conv_in_rsc_re),
      .addr(conv_in_rsc_addr),
      .addr_d(conv_in_rsci_addr_d),
      .re_d(conv_in_rsci_re_d),
      .data_out_d(conv_in_rsci_data_out_d)
    );
  ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen
      conv_out_rsci (
      .we(conv_out_rsc_we),
      .addr(conv_out_rsc_addr),
      .data_in(conv_out_rsc_data_in),
      .data_in_d(conv_out_rsci_data_in_d),
      .addr_d(conv_out_rsci_addr_d),
      .we_d(conv_out_rsci_we_d)
    );
  ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen
      pad_input_rsci (
      .en(pad_input_rsc_en),
      .data_out(pad_input_rsc_data_out),
      .we(pad_input_rsc_we),
      .re(pad_input_rsc_re),
      .addr(pad_input_rsc_addr),
      .data_in(pad_input_rsc_data_in),
      .data_in_d(pad_input_rsci_data_in_d),
      .addr_d(pad_input_rsci_addr_d),
      .re_d(pad_input_rsci_re_d),
      .we_d(pad_input_rsci_we_d),
      .data_out_d(pad_input_rsci_data_out_d),
      .en_d(1'b0)
    );
  apply_conv_core apply_conv_core_inst (
      .clk(clk),
      .rst(rst),
      .conv_in_rsc_triosy_lz(conv_in_rsc_triosy_lz),
      .conv_out_rsc_triosy_lz(conv_out_rsc_triosy_lz),
      .conv_in_rsci_addr_d(conv_in_rsci_addr_d),
      .conv_in_rsci_re_d(conv_in_rsci_re_d),
      .conv_in_rsci_data_out_d(conv_in_rsci_data_out_d),
      .conv_out_rsci_data_in_d(conv_out_rsci_data_in_d),
      .conv_out_rsci_addr_d(conv_out_rsci_addr_d),
      .conv_out_rsci_we_d(conv_out_rsci_we_d),
      .pad_input_rsci_data_in_d(pad_input_rsci_data_in_d),
      .pad_input_rsci_addr_d(pad_input_rsci_addr_d),
      .pad_input_rsci_re_d(pad_input_rsci_re_d),
      .pad_input_rsci_we_d(pad_input_rsci_we_d),
      .pad_input_rsci_data_out_d(pad_input_rsci_data_out_d)
    );
endmodule



