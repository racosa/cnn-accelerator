
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
//  Generated date: Wed Jan 24 16:07:57 2018
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
  clk, rst, fsm_output, PAD_for_for_C_3_tr0, PAD_for_C_0_tr0, PAD_C_0_tr0, CONV_K_W_C_2_tr0,
      CONV_K_H_C_0_tr0, CONV_K_D_C_0_tr0, CONV_H_SLIDE_C_1_tr0, CONV_V_SLIDE_C_0_tr0,
      CONV_NB_K_C_0_tr0
);
  input clk;
  input rst;
  output [16:0] fsm_output;
  reg [16:0] fsm_output;
  input PAD_for_for_C_3_tr0;
  input PAD_for_C_0_tr0;
  input PAD_C_0_tr0;
  input CONV_K_W_C_2_tr0;
  input CONV_K_H_C_0_tr0;
  input CONV_K_D_C_0_tr0;
  input CONV_H_SLIDE_C_1_tr0;
  input CONV_V_SLIDE_C_0_tr0;
  input CONV_NB_K_C_0_tr0;


  // FSM State Type Declaration for apply_conv_core_core_fsm_1
  parameter
    main_C_0 = 5'd0,
    PAD_for_for_C_0 = 5'd1,
    PAD_for_for_C_1 = 5'd2,
    PAD_for_for_C_2 = 5'd3,
    PAD_for_for_C_3 = 5'd4,
    PAD_for_C_0 = 5'd5,
    PAD_C_0 = 5'd6,
    CONV_K_W_C_0 = 5'd7,
    CONV_K_W_C_1 = 5'd8,
    CONV_K_W_C_2 = 5'd9,
    CONV_K_H_C_0 = 5'd10,
    CONV_K_D_C_0 = 5'd11,
    CONV_H_SLIDE_C_0 = 5'd12,
    CONV_H_SLIDE_C_1 = 5'd13,
    CONV_V_SLIDE_C_0 = 5'd14,
    CONV_NB_K_C_0 = 5'd15,
    main_C_1 = 5'd16;

  reg [4:0] state_var;
  reg [4:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : apply_conv_core_core_fsm_1
    case (state_var)
      PAD_for_for_C_0 : begin
        fsm_output = 17'b10;
        state_var_NS = PAD_for_for_C_1;
      end
      PAD_for_for_C_1 : begin
        fsm_output = 17'b100;
        state_var_NS = PAD_for_for_C_2;
      end
      PAD_for_for_C_2 : begin
        fsm_output = 17'b1000;
        state_var_NS = PAD_for_for_C_3;
      end
      PAD_for_for_C_3 : begin
        fsm_output = 17'b10000;
        if ( PAD_for_for_C_3_tr0 ) begin
          state_var_NS = PAD_for_C_0;
        end
        else begin
          state_var_NS = PAD_for_for_C_0;
        end
      end
      PAD_for_C_0 : begin
        fsm_output = 17'b100000;
        if ( PAD_for_C_0_tr0 ) begin
          state_var_NS = PAD_C_0;
        end
        else begin
          state_var_NS = PAD_for_for_C_0;
        end
      end
      PAD_C_0 : begin
        fsm_output = 17'b1000000;
        if ( PAD_C_0_tr0 ) begin
          state_var_NS = CONV_K_W_C_0;
        end
        else begin
          state_var_NS = PAD_for_for_C_0;
        end
      end
      CONV_K_W_C_0 : begin
        fsm_output = 17'b10000000;
        state_var_NS = CONV_K_W_C_1;
      end
      CONV_K_W_C_1 : begin
        fsm_output = 17'b100000000;
        state_var_NS = CONV_K_W_C_2;
      end
      CONV_K_W_C_2 : begin
        fsm_output = 17'b1000000000;
        if ( CONV_K_W_C_2_tr0 ) begin
          state_var_NS = CONV_K_H_C_0;
        end
        else begin
          state_var_NS = CONV_K_W_C_0;
        end
      end
      CONV_K_H_C_0 : begin
        fsm_output = 17'b10000000000;
        if ( CONV_K_H_C_0_tr0 ) begin
          state_var_NS = CONV_K_D_C_0;
        end
        else begin
          state_var_NS = CONV_K_W_C_0;
        end
      end
      CONV_K_D_C_0 : begin
        fsm_output = 17'b100000000000;
        if ( CONV_K_D_C_0_tr0 ) begin
          state_var_NS = CONV_H_SLIDE_C_0;
        end
        else begin
          state_var_NS = CONV_K_W_C_0;
        end
      end
      CONV_H_SLIDE_C_0 : begin
        fsm_output = 17'b1000000000000;
        state_var_NS = CONV_H_SLIDE_C_1;
      end
      CONV_H_SLIDE_C_1 : begin
        fsm_output = 17'b10000000000000;
        if ( CONV_H_SLIDE_C_1_tr0 ) begin
          state_var_NS = CONV_V_SLIDE_C_0;
        end
        else begin
          state_var_NS = CONV_K_W_C_0;
        end
      end
      CONV_V_SLIDE_C_0 : begin
        fsm_output = 17'b100000000000000;
        if ( CONV_V_SLIDE_C_0_tr0 ) begin
          state_var_NS = CONV_NB_K_C_0;
        end
        else begin
          state_var_NS = CONV_K_W_C_0;
        end
      end
      CONV_NB_K_C_0 : begin
        fsm_output = 17'b1000000000000000;
        if ( CONV_NB_K_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = CONV_K_W_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 17'b10000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 17'b1;
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
  wire [16:0] fsm_output;
  wire and_dcpl_4;
  wire or_dcpl_16;
  wire or_tmp_41;
  wire or_tmp_49;
  reg [1:0] o_d_1_0_sva_1;
  reg [1:0] PAD_d_1_0_sva_3;
  reg [6:0] PAD_for_r_6_0_sva_4;
  reg [7:0] PAD_for_for_c_7_0_sva_3;
  reg [7:0] PAD_for_for_c_7_0_sva_4;
  reg [6:0] o_r_6_0_lpi_4;
  reg [6:0] CONV_V_SLIDE_j_6_0_sva_3;
  reg [7:0] o_c_7_0_lpi_4;
  reg [7:0] CONV_H_SLIDE_k_7_0_sva;
  reg [1:0] CONV_K_D_l_1_0_sva_3;
  reg [1:0] CONV_K_H_m_1_0_sva_3;
  reg [10:0] temp_1_lpi_7;
  reg [1:0] CONV_K_W_n_1_0_sva;
  reg [10:0] temp_1_sva_2;
  reg [1:0] CONV_K_W_n_1_0_sva_3;
  reg [7:0] CONV_H_SLIDE_k_7_0_sva_5;
  reg PAD_for_for_if_PAD_for_for_if_or_itm;
  reg PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1;
  reg PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1;
  reg [4:0] PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3;
  reg PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm;
  reg PAD_for_for_slc_PAD_for_for_acc_7_itm;
  reg [9:0] CONV_K_W_asn_19_itm_1;
  reg [3:0] CONV_K_W_mux_itm_1;
  reg CONV_K_W_slc_CONV_K_W_acc_2_itm;
  reg CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm_1;
  reg [7:0] CONV_H_SLIDE_acc_5_itm_2;
  reg [13:0] PAD_for_for_if_acc_ncse_2;
  reg [13:0] PAD_for_for_else_else_acc_itm_14_1_1;
  reg PAD_for_for_else_else_acc_itm_0_2;
  reg CONV_K_W_CONV_K_W_conc_4_psp_1_1;
  reg CONV_K_W_CONV_K_W_conc_4_psp_0_1;
  reg [2:0] PAD_for_for_else_else_acc_5_psp_sva_2_7_5;
  reg [2:0] CONV_K_W_acc_18_sdt_1_2_0;
  wire xor_cse_5;
  reg reg_conv_out_rsc_triosy_obj_ld_cse;
  wire or_13_cse;
  wire reg_CONV_H_SLIDE_k_7_CONV_H_SLIDE_k_or_cse;
  wire reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse;
  wire reg_CONV_NB_K_i_1_CONV_NB_K_i_or_cse;
  wire reg_PAD_d_1_PAD_d_or_cse;
  wire [7:0] CONV_H_SLIDE_acc_14_sdt;
  wire [8:0] nl_CONV_H_SLIDE_acc_14_sdt;
  wire [13:0] PAD_for_for_if_acc_ncse;
  wire [14:0] nl_PAD_for_for_if_acc_ncse;
  wire [13:0] CONV_K_W_acc_15_sdt;
  wire [14:0] nl_CONV_K_W_acc_15_sdt;
  wire [13:0] PAD_for_for_if_acc_3_ncse;
  wire [14:0] nl_PAD_for_for_if_acc_3_ncse;
  wire [1:0] z_out;
  wire [2:0] nl_z_out;
  wire [7:0] z_out_1;
  wire [8:0] nl_z_out_1;
  wire [7:0] z_out_2;
  wire [8:0] nl_z_out_2;
  wire [7:0] z_out_3;
  wire [8:0] nl_z_out_3;
  wire [13:0] z_out_4;
  wire [14:0] nl_z_out_4;
  wire [7:0] z_out_5;
  wire [8:0] nl_z_out_5;
  wire [10:0] z_out_6;
  wire [11:0] nl_z_out_6;
  wire [7:0] PAD_for_for_else_else_acc_5_psp_sva;
  wire [8:0] nl_PAD_for_for_else_else_acc_5_psp_sva;
  wire [6:0] CONV_V_SLIDE_j_6_0_sva_1;
  wire [7:0] nl_CONV_V_SLIDE_j_6_0_sva_1;
  wire [3:0] CONV_K_W_acc_18_sdt;
  wire [4:0] nl_CONV_K_W_acc_18_sdt;
  wire [7:0] CONV_H_SLIDE_k_7_0_sva_1;
  wire [8:0] nl_CONV_H_SLIDE_k_7_0_sva_1;
  wire CONV_NB_K_i_1_0_sva_1_1;
  reg CONV_NB_K_i_1_0_sva_4_1;
  reg CONV_NB_K_i_1_0_sva_4_0;
  wire CONV_K_W_or_2_ssc;
  reg reg_PAD_for_for_if_acc_3_ncse_cse;
  wire CONV_K_W_CONV_K_W_or_cse;
  wire CONV_K_W_or_ssc;

  wire[0:0] PAD_for_for_c_nor_nl;
  wire[0:0] PAD_d_not_nl;
  wire[7:0] PAD_for_for_acc_1_nl;
  wire[8:0] nl_PAD_for_for_acc_1_nl;
  wire[0:0] or_nl;
  wire[8:0] PAD_for_for_else_acc_nl;
  wire[9:0] nl_PAD_for_for_else_acc_nl;
  wire[8:0] PAD_for_for_else_oif_acc_nl;
  wire[9:0] nl_PAD_for_for_else_oif_acc_nl;
  wire[10:0] temp_mux_nl;
  wire[0:0] not_nl;
  wire[6:0] CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl;
  wire[7:0] nl_CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl;
  wire[3:0] CONV_H_SLIDE_acc_nl;
  wire[4:0] nl_CONV_H_SLIDE_acc_nl;
  wire[13:0] PAD_for_for_if_PAD_for_for_if_mul_nl;
  wire[1:0] CONV_K_W_acc_21_nl;
  wire[2:0] nl_CONV_K_W_acc_21_nl;
  wire[2:0] CONV_K_W_acc_16_nl;
  wire[3:0] nl_CONV_K_W_acc_16_nl;
  wire[13:0] CONV_K_W_mul_nl;
  wire[6:0] CONV_K_W_acc_1_nl;
  wire[7:0] nl_CONV_K_W_acc_1_nl;
  wire[10:0] CONV_H_SLIDE_mux_nl;
  wire[0:0] CONV_H_SLIDE_and_nl;
  wire[2:0] CONV_H_SLIDE_else_if_acc_nl;
  wire[3:0] nl_CONV_H_SLIDE_else_if_acc_nl;
  wire[0:0] CONV_H_SLIDE_not_2_nl;
  wire[13:0] pad_input_mux1h_nl;
  wire[13:0] CONV_K_W_acc_22_nl;
  wire[14:0] nl_CONV_K_W_acc_22_nl;
  wire[0:0] pad_input_mux1h_1_nl;
  wire[0:0] pad_input_mux1h_2_nl;
  wire[1:0] CONV_NB_K_mux1h_2_nl;
  wire[7:0] PAD_for_for_mux_2_nl;
  wire[6:0] PAD_for_for_mux_3_nl;
  wire[7:0] CONV_K_W_mux_5_nl;
  wire[6:0] CONV_K_W_mux_6_nl;
  wire[6:0] CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl;
  wire[0:0] CONV_V_SLIDE_or_2_nl;
  wire[0:0] CONV_V_SLIDE_nor_1_nl;
  wire[2:0] CONV_V_SLIDE_mux1h_2_nl;
  wire[0:0] CONV_V_SLIDE_or_3_nl;
  wire[1:0] CONV_K_W_mux1h_2_nl;
  wire[0:0] CONV_K_W_or_3_nl;
  wire[0:0] CONV_K_W_nor_3_nl;
  wire[1:0] CONV_K_W_CONV_K_W_mux_1_nl;
  wire[7:0] CONV_H_SLIDE_mux_3_nl;
  wire[10:0] CONV_K_W_mux_7_nl;
  wire[8:0] PAD_for_for_else_else_acc_17_nl;
  wire[9:0] nl_PAD_for_for_else_else_acc_17_nl;
  wire[10:0] CONV_K_W_mux_8_nl;
  wire[10:0] CONV_K_W_mul_13_nl;
  wire signed [13:0] nl_CONV_K_W_mul_13_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_apply_conv_core_core_fsm_inst_PAD_for_for_C_3_tr0;
  assign nl_apply_conv_core_core_fsm_inst_PAD_for_for_C_3_tr0 = ~ PAD_for_for_slc_PAD_for_for_acc_7_itm;
  wire[6:0] PAD_for_acc_nl;
  wire[7:0] nl_PAD_for_acc_nl;
  wire [0:0] nl_apply_conv_core_core_fsm_inst_PAD_for_C_0_tr0;
  assign nl_PAD_for_acc_nl = conv_u2s_6_7(z_out_3[6:1]) + 7'b1000011;
  assign PAD_for_acc_nl = nl_PAD_for_acc_nl[6:0];
  assign nl_apply_conv_core_core_fsm_inst_PAD_for_C_0_tr0 = ~ (readslicef_7_1_6((PAD_for_acc_nl)));
  wire [0:0] nl_apply_conv_core_core_fsm_inst_PAD_C_0_tr0;
  assign nl_apply_conv_core_core_fsm_inst_PAD_C_0_tr0 = ~((z_out[0]) ^ (z_out[1]));
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_K_W_C_2_tr0;
  assign nl_apply_conv_core_core_fsm_inst_CONV_K_W_C_2_tr0 = ~ CONV_K_W_slc_CONV_K_W_acc_2_itm;
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_K_H_C_0_tr0;
  assign nl_apply_conv_core_core_fsm_inst_CONV_K_H_C_0_tr0 = ~((z_out[0]) ^ (z_out[1]));
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_K_D_C_0_tr0;
  assign nl_apply_conv_core_core_fsm_inst_CONV_K_D_C_0_tr0 = ~((z_out[0]) ^ (z_out[1]));
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_1_tr0;
  assign nl_apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_1_tr0 = CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm_1;
  wire[4:0] CONV_V_SLIDE_acc_nl;
  wire[5:0] nl_CONV_V_SLIDE_acc_nl;
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0;
  assign nl_CONV_V_SLIDE_acc_nl = ({1'b1 , (~ (CONV_V_SLIDE_j_6_0_sva_1[6:3]))})
      + 5'b1111;
  assign CONV_V_SLIDE_acc_nl = nl_CONV_V_SLIDE_acc_nl[4:0];
  assign nl_apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0 = readslicef_5_1_4((CONV_V_SLIDE_acc_nl));
  wire [0:0] nl_apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0;
  assign nl_apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0 = ~ xor_cse_5;
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
      .CONV_K_W_C_2_tr0(nl_apply_conv_core_core_fsm_inst_CONV_K_W_C_2_tr0[0:0]),
      .CONV_K_H_C_0_tr0(nl_apply_conv_core_core_fsm_inst_CONV_K_H_C_0_tr0[0:0]),
      .CONV_K_D_C_0_tr0(nl_apply_conv_core_core_fsm_inst_CONV_K_D_C_0_tr0[0:0]),
      .CONV_H_SLIDE_C_1_tr0(nl_apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_1_tr0[0:0]),
      .CONV_V_SLIDE_C_0_tr0(nl_apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0[0:0]),
      .CONV_NB_K_C_0_tr0(nl_apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0[0:0])
    );
  assign reg_PAD_d_1_PAD_d_or_cse = (fsm_output[0]) | (fsm_output[6]);
  assign nl_PAD_for_for_acc_1_nl = conv_u2s_7_8(PAD_for_r_6_0_sva_4) + 8'b11111111;
  assign PAD_for_for_acc_1_nl = nl_PAD_for_for_acc_1_nl[7:0];
  assign or_13_cse = (readslicef_8_1_7((PAD_for_for_acc_1_nl))) | (~ (z_out_2[7]));
  assign reg_CONV_NB_K_i_1_CONV_NB_K_i_or_cse = (fsm_output[6]) | (fsm_output[15]);
  assign reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse = reg_CONV_NB_K_i_1_CONV_NB_K_i_or_cse
      | (fsm_output[14]);
  assign reg_CONV_H_SLIDE_k_7_CONV_H_SLIDE_k_or_cse = (fsm_output[14]) | (fsm_output[15])
      | (fsm_output[6]) | (fsm_output[13]);
  assign nl_PAD_for_for_if_acc_ncse = conv_u2u_13_14(PAD_for_for_if_acc_3_ncse[13:1])
      + z_out_4;
  assign PAD_for_for_if_acc_ncse = nl_PAD_for_for_if_acc_ncse[13:0];
  assign PAD_for_for_if_PAD_for_for_if_mul_nl = conv_u2u_14_14((PAD_for_r_6_0_sva_4)
      * 7'b1010001);
  assign nl_PAD_for_for_if_acc_3_ncse = (PAD_for_for_if_PAD_for_for_if_mul_nl) +
      conv_u2u_7_14(PAD_for_for_c_7_0_sva_3[7:1]);
  assign PAD_for_for_if_acc_3_ncse = nl_PAD_for_for_if_acc_3_ncse[13:0];
  assign nl_PAD_for_for_else_else_acc_5_psp_sva = PAD_for_for_c_7_0_sva_3 + 8'b11111111;
  assign PAD_for_for_else_else_acc_5_psp_sva = nl_PAD_for_for_else_else_acc_5_psp_sva[7:0];
  assign CONV_NB_K_i_1_0_sva_1_1 = CONV_NB_K_i_1_0_sva_4_0 ^ CONV_NB_K_i_1_0_sva_4_1;
  assign nl_CONV_V_SLIDE_j_6_0_sva_1 = CONV_V_SLIDE_j_6_0_sva_3 + 7'b1;
  assign CONV_V_SLIDE_j_6_0_sva_1 = nl_CONV_V_SLIDE_j_6_0_sva_1[6:0];
  assign nl_CONV_K_W_acc_21_nl = CONV_K_H_m_1_0_sva_3 + conv_u2u_1_2(CONV_K_D_l_1_0_sva_3[1]);
  assign CONV_K_W_acc_21_nl = nl_CONV_K_W_acc_21_nl[1:0];
  assign nl_CONV_K_W_acc_16_nl = conv_u2u_2_3(CONV_K_H_m_1_0_sva_3) + conv_u2u_2_3(CONV_K_W_n_1_0_sva);
  assign CONV_K_W_acc_16_nl = nl_CONV_K_W_acc_16_nl[2:0];
  assign nl_CONV_K_W_acc_18_sdt = conv_u2u_3_4({(CONV_K_W_acc_21_nl) , (CONV_K_D_l_1_0_sva_3[0])})
      + conv_u2u_3_4(CONV_K_W_acc_16_nl);
  assign CONV_K_W_acc_18_sdt = nl_CONV_K_W_acc_18_sdt[3:0];
  assign nl_CONV_K_W_acc_1_nl = CONV_V_SLIDE_j_6_0_sva_3 + conv_u2u_2_7(CONV_K_H_m_1_0_sva_3);
  assign CONV_K_W_acc_1_nl = nl_CONV_K_W_acc_1_nl[6:0];
  assign CONV_K_W_mul_nl = conv_u2u_14_14((CONV_K_W_acc_1_nl) * 7'b1010001);
  assign nl_CONV_K_W_acc_15_sdt = (CONV_K_W_mul_nl) + conv_u2u_7_14(z_out_2[7:1]);
  assign CONV_K_W_acc_15_sdt = nl_CONV_K_W_acc_15_sdt[13:0];
  assign nl_CONV_H_SLIDE_k_7_0_sva_1 = CONV_H_SLIDE_k_7_0_sva + 8'b1;
  assign CONV_H_SLIDE_k_7_0_sva_1 = nl_CONV_H_SLIDE_k_7_0_sva_1[7:0];
  assign nl_CONV_H_SLIDE_acc_14_sdt = conv_u2u_7_8(o_r_6_0_lpi_4) + conv_u2u_5_8(z_out_3[6:2]);
  assign CONV_H_SLIDE_acc_14_sdt = nl_CONV_H_SLIDE_acc_14_sdt[7:0];
  assign and_dcpl_4 = ~(PAD_for_for_if_PAD_for_for_if_or_itm | PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1);
  assign or_dcpl_16 = (fsm_output[14:13]!=2'b00);
  assign or_tmp_41 = or_dcpl_16 | reg_CONV_NB_K_i_1_CONV_NB_K_i_or_cse;
  assign or_tmp_49 = (fsm_output[11:10]!=2'b00);
  assign xor_cse_5 = ~(CONV_NB_K_i_1_0_sva_4_0 ^ CONV_NB_K_i_1_0_sva_1_1);
  assign conv_in_rsci_addr_d = {z_out_6 , PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3};
  assign conv_in_rsci_re_d = ~(and_dcpl_4 & (fsm_output[2]));
  assign nl_CONV_H_SLIDE_else_if_acc_nl = ({1'b1 , (~ (temp_1_sva_2[9:8]))}) + 3'b1;
  assign CONV_H_SLIDE_else_if_acc_nl = nl_CONV_H_SLIDE_else_if_acc_nl[2:0];
  assign CONV_H_SLIDE_and_nl = (readslicef_3_1_2((CONV_H_SLIDE_else_if_acc_nl)))
      & (~ (temp_1_sva_2[10]));
  assign CONV_H_SLIDE_mux_nl = MUX_v_11_2_2(temp_1_sva_2, 11'b11111111, CONV_H_SLIDE_and_nl);
  assign CONV_H_SLIDE_not_2_nl = ~ (temp_1_sva_2[10]);
  assign conv_out_rsci_data_in_d = MUX_v_11_2_2(11'b00000000000, (CONV_H_SLIDE_mux_nl),
      (CONV_H_SLIDE_not_2_nl));
  assign conv_out_rsci_addr_d = {z_out_1 , (CONV_H_SLIDE_acc_14_sdt[0]) , (z_out_3[1:0])
      , (o_c_7_0_lpi_4[4:0])};
  assign conv_out_rsci_we_d = ~ (fsm_output[12]);
  assign pad_input_rsci_data_in_d = MUX_v_10_2_2(10'b0000000000, conv_in_rsci_data_out_d,
      (fsm_output[3]));
  assign nl_CONV_K_W_acc_22_nl = conv_u2u_13_14(CONV_K_W_acc_15_sdt[13:1]) + z_out_4;
  assign CONV_K_W_acc_22_nl = nl_CONV_K_W_acc_22_nl[13:0];
  assign pad_input_mux1h_nl = MUX1HOT_v_14_4_2(PAD_for_for_if_acc_ncse, PAD_for_for_if_acc_ncse_2,
      PAD_for_for_else_else_acc_itm_14_1_1, (CONV_K_W_acc_22_nl), {(fsm_output[1])
      , (fsm_output[2]) , (fsm_output[3]) , (fsm_output[7])});
  assign pad_input_mux1h_1_nl = MUX1HOT_s_1_4_2((PAD_for_for_if_acc_3_ncse[0]), reg_PAD_for_for_if_acc_3_ncse_cse,
      PAD_for_for_else_else_acc_itm_0_2, (CONV_K_W_acc_15_sdt[0]), {(fsm_output[1])
      , (fsm_output[2]) , (fsm_output[3]) , (fsm_output[7])});
  assign pad_input_mux1h_2_nl = MUX1HOT_s_1_4_2((PAD_for_for_c_7_0_sva_3[0]), PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1,
      PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm, (z_out_2[0]), {(fsm_output[1])
      , (fsm_output[2]) , (fsm_output[3]) , (fsm_output[7])});
  assign pad_input_rsci_addr_d = {(pad_input_mux1h_nl) , (pad_input_mux1h_1_nl) ,
      (pad_input_mux1h_2_nl)};
  assign pad_input_rsci_re_d = ~ (fsm_output[7]);
  assign pad_input_rsci_we_d = ~((and_dcpl_4 & (fsm_output[3])) | (or_13_cse & (fsm_output[1]))
      | ((~ PAD_for_for_if_PAD_for_for_if_or_itm) & PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1
      & (fsm_output[2])));
  assign CONV_K_W_or_2_ssc = (fsm_output[2]) | (fsm_output[12]);
  assign CONV_K_W_CONV_K_W_or_cse = ~((fsm_output[8]) | CONV_K_W_or_2_ssc);
  assign CONV_K_W_or_ssc = (fsm_output[1]) | (fsm_output[7]);
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
      CONV_K_W_n_1_0_sva <= 2'b0;
      CONV_K_W_CONV_K_W_conc_4_psp_1_1 <= 1'b0;
      CONV_K_W_CONV_K_W_conc_4_psp_0_1 <= 1'b0;
      CONV_K_W_acc_18_sdt_1_2_0 <= 3'b0;
      CONV_K_W_asn_19_itm_1 <= 10'b0;
      CONV_K_W_mux_itm_1 <= 4'b0;
      CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm_1 <= 1'b0;
      CONV_H_SLIDE_k_7_0_sva_5 <= 8'b0;
      CONV_H_SLIDE_acc_5_itm_2 <= 8'b0;
    end
    else begin
      PAD_for_for_c_7_0_sva_3 <= MUX_v_8_2_2(8'b00000000, PAD_for_for_c_7_0_sva_4,
          (PAD_for_for_c_nor_nl));
      reg_conv_out_rsc_triosy_obj_ld_cse <= (~ xor_cse_5) & (fsm_output[15]);
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
      CONV_K_W_n_1_0_sva <= MUX_v_2_2_2(2'b00, CONV_K_W_n_1_0_sva_3, (fsm_output[9]));
      CONV_K_W_CONV_K_W_conc_4_psp_1_1 <= ((CONV_K_D_l_1_0_sva_3[0]) & (CONV_K_W_acc_18_sdt[3]))
          ^ (CONV_K_D_l_1_0_sva_3[1]);
      CONV_K_W_CONV_K_W_conc_4_psp_0_1 <= (CONV_K_D_l_1_0_sva_3[0]) ^ (CONV_K_W_acc_18_sdt[3]);
      CONV_K_W_acc_18_sdt_1_2_0 <= CONV_K_W_acc_18_sdt[2:0];
      CONV_K_W_asn_19_itm_1 <= pad_input_rsci_data_out_d;
      CONV_K_W_mux_itm_1 <= MUX_v_4_81_2(4'b0, 4'b1111, 4'b0, 4'b1111, 4'b101, 4'b1111,
          4'b0, 4'b1111, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0,
          4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0,
          4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b1111, 4'b0, 4'b1111, 4'b101,
          4'b1111, 4'b0, 4'b1111, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0,
          4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0,
          4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b1111, 4'b0, 4'b1111,
          4'b101, 4'b1111, 4'b0, 4'b1111, 4'b0, CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl);
      CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm_1 <= readslicef_4_1_3((CONV_H_SLIDE_acc_nl));
      CONV_H_SLIDE_k_7_0_sva_5 <= CONV_H_SLIDE_k_7_0_sva_1;
      CONV_H_SLIDE_acc_5_itm_2 <= z_out_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      PAD_for_r_6_0_sva_4 <= 7'b0;
    end
    else if ( (fsm_output[5]) | reg_PAD_d_1_PAD_d_or_cse ) begin
      PAD_for_r_6_0_sva_4 <= MUX_v_7_2_2(7'b0000000, (z_out_3[6:0]), (PAD_d_not_nl));
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
    else if ( (fsm_output[0]) | (fsm_output[15]) ) begin
      o_d_1_0_sva_1 <= MUX_v_2_2_2(2'b00, z_out, (fsm_output[15]));
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
      PAD_for_for_if_PAD_for_for_if_or_itm <= or_13_cse;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      PAD_for_for_c_7_0_sva_4 <= 8'b0;
    end
    else if ( fsm_output[1] ) begin
      PAD_for_for_c_7_0_sva_4 <= z_out_5;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_NB_K_i_1_0_sva_4_1 <= 1'b0;
      CONV_NB_K_i_1_0_sva_4_0 <= 1'b0;
    end
    else if ( reg_CONV_NB_K_i_1_CONV_NB_K_i_or_cse ) begin
      CONV_NB_K_i_1_0_sva_4_1 <= CONV_NB_K_i_1_0_sva_1_1 & (fsm_output[15]);
      CONV_NB_K_i_1_0_sva_4_0 <= (~ CONV_NB_K_i_1_0_sva_4_0) & (fsm_output[15]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_V_SLIDE_j_6_0_sva_3 <= 7'b0;
      o_r_6_0_lpi_4 <= 7'b0;
    end
    else if ( reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse ) begin
      CONV_V_SLIDE_j_6_0_sva_3 <= MUX_v_7_2_2(7'b0000000, CONV_V_SLIDE_j_6_0_sva_1,
          (fsm_output[14]));
      o_r_6_0_lpi_4 <= MUX_v_7_2_2(7'b0000000, (z_out_3[6:0]), (fsm_output[14]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_H_SLIDE_k_7_0_sva <= 8'b0;
      o_c_7_0_lpi_4 <= 8'b0;
    end
    else if ( reg_CONV_H_SLIDE_k_7_CONV_H_SLIDE_k_or_cse ) begin
      CONV_H_SLIDE_k_7_0_sva <= MUX_v_8_2_2(8'b00000000, CONV_H_SLIDE_k_7_0_sva_5,
          (fsm_output[13]));
      o_c_7_0_lpi_4 <= MUX_v_8_2_2(8'b00000000, CONV_H_SLIDE_acc_5_itm_2, (fsm_output[13]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_D_l_1_0_sva_3 <= 2'b0;
    end
    else if ( or_tmp_41 | (fsm_output[11]) ) begin
      CONV_K_D_l_1_0_sva_3 <= MUX_v_2_2_2(2'b00, z_out, (fsm_output[11]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_H_m_1_0_sva_3 <= 2'b0;
    end
    else if ( or_dcpl_16 | (fsm_output[11]) | reg_CONV_NB_K_i_1_CONV_NB_K_i_or_cse
        | (fsm_output[10]) ) begin
      CONV_K_H_m_1_0_sva_3 <= MUX_v_2_2_2(2'b00, z_out, (fsm_output[10]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      temp_1_lpi_7 <= 11'b0;
    end
    else if ( or_tmp_41 | (fsm_output[9]) | or_tmp_49 ) begin
      temp_1_lpi_7 <= MUX_v_11_2_2(11'b00000000000, (temp_mux_nl), (not_nl));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_slc_CONV_K_W_acc_2_itm <= 1'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_slc_CONV_K_W_acc_2_itm <= (z_out[0]) ^ (z_out[1]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      CONV_K_W_n_1_0_sva_3 <= 2'b0;
    end
    else if ( fsm_output[7] ) begin
      CONV_K_W_n_1_0_sva_3 <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      temp_1_sva_2 <= 11'b0;
    end
    else if ( ~ or_tmp_49 ) begin
      temp_1_sva_2 <= z_out_6;
    end
  end
  assign PAD_for_for_c_nor_nl = ~((fsm_output[5]) | (fsm_output[0]) | (fsm_output[6]));
  assign nl_PAD_for_for_else_acc_nl = conv_u2s_8_9(PAD_for_for_c_7_0_sva_3) + 9'b111111111;
  assign PAD_for_for_else_acc_nl = nl_PAD_for_for_else_acc_nl[8:0];
  assign nl_PAD_for_for_else_oif_acc_nl = conv_u2s_8_9(PAD_for_for_c_7_0_sva_3) +
      9'b101011111;
  assign PAD_for_for_else_oif_acc_nl = nl_PAD_for_for_else_oif_acc_nl[8:0];
  assign or_nl = (readslicef_9_1_8((PAD_for_for_else_acc_nl))) | (~ (readslicef_9_1_8((PAD_for_for_else_oif_acc_nl))));
  assign nl_CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl = conv_u2u_5_7({CONV_K_W_CONV_K_W_conc_4_psp_1_1
      , CONV_K_W_CONV_K_W_conc_4_psp_0_1 , CONV_K_W_acc_18_sdt_1_2_0}) + conv_u2u_6_7(z_out_4[5:0]);
  assign CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl = nl_CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl[6:0];
  assign nl_CONV_H_SLIDE_acc_nl = ({1'b1 , (~ (CONV_H_SLIDE_k_7_0_sva_1[7:5]))})
      + 4'b101;
  assign CONV_H_SLIDE_acc_nl = nl_CONV_H_SLIDE_acc_nl[3:0];
  assign PAD_d_not_nl = ~ reg_PAD_d_1_PAD_d_or_cse;
  assign temp_mux_nl = MUX_v_11_2_2(z_out_6, temp_1_sva_2, or_tmp_49);
  assign not_nl = ~ or_tmp_41;
  assign CONV_NB_K_mux1h_2_nl = MUX1HOT_v_2_5_2(({1'b0 , (o_d_1_0_sva_1[0])}), PAD_d_1_0_sva_3,
      CONV_K_D_l_1_0_sva_3, CONV_K_H_m_1_0_sva_3, CONV_K_W_n_1_0_sva, {(fsm_output[15])
      , (fsm_output[6]) , (fsm_output[11]) , (fsm_output[10]) , (fsm_output[7])});
  assign nl_z_out = (CONV_NB_K_mux1h_2_nl) + 2'b1;
  assign z_out = nl_z_out[1:0];
  assign PAD_for_for_mux_2_nl = MUX_v_8_2_2(8'b10101111, (z_out_4[7:0]), fsm_output[12]);
  assign PAD_for_for_mux_3_nl = MUX_v_7_2_2((z_out_5[7:1]), (CONV_H_SLIDE_acc_14_sdt[7:1]),
      fsm_output[12]);
  assign nl_z_out_1 = (PAD_for_for_mux_2_nl) + conv_u2u_7_8(PAD_for_for_mux_3_nl);
  assign z_out_1 = nl_z_out_1[7:0];
  assign CONV_K_W_mux_5_nl = MUX_v_8_2_2(CONV_H_SLIDE_k_7_0_sva, 8'b10000111, fsm_output[1]);
  assign CONV_K_W_mux_6_nl = MUX_v_7_2_2(({5'b0 , CONV_K_W_n_1_0_sva}), PAD_for_r_6_0_sva_4,
      fsm_output[1]);
  assign nl_z_out_2 = (CONV_K_W_mux_5_nl) + conv_u2u_7_8(CONV_K_W_mux_6_nl);
  assign z_out_2 = nl_z_out_2[7:0];
  assign CONV_V_SLIDE_or_2_nl = (fsm_output[5]) | (fsm_output[2]);
  assign CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl = MUX_v_7_2_2(o_r_6_0_lpi_4, PAD_for_r_6_0_sva_4,
      CONV_V_SLIDE_or_2_nl);
  assign CONV_V_SLIDE_nor_1_nl = ~((fsm_output[14]) | (fsm_output[5]) | (fsm_output[12]));
  assign CONV_V_SLIDE_or_3_nl = (fsm_output[14]) | (fsm_output[5]);
  assign CONV_V_SLIDE_mux1h_2_nl = MUX1HOT_v_3_3_2(3'b1, PAD_for_for_else_else_acc_5_psp_sva_2_7_5,
      (o_c_7_0_lpi_4[7:5]), {(CONV_V_SLIDE_or_3_nl) , (fsm_output[2]) , (fsm_output[12])});
  assign nl_z_out_3 = conv_u2u_7_8(CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl) + conv_s2u_4_8({(CONV_V_SLIDE_nor_1_nl)
      , (CONV_V_SLIDE_mux1h_2_nl)});
  assign z_out_3 = nl_z_out_3[7:0];
  assign CONV_K_W_or_3_nl = (fsm_output[2:1]!=2'b00);
  assign CONV_K_W_mux1h_2_nl = MUX1HOT_v_2_4_2(({CONV_NB_K_i_1_0_sva_4_1 , CONV_NB_K_i_1_0_sva_4_0}),
      PAD_d_1_0_sva_3, o_d_1_0_sva_1, CONV_K_D_l_1_0_sva_3, {(fsm_output[8]) , (CONV_K_W_or_3_nl)
      , (fsm_output[12]) , (fsm_output[7])});
  assign CONV_K_W_nor_3_nl = ~(CONV_K_W_or_ssc | CONV_K_W_or_2_ssc);
  assign CONV_K_W_CONV_K_W_mux_1_nl = MUX_v_2_2_2(2'b1, 2'b10, CONV_K_W_or_ssc);
  assign nl_z_out_4 = (CONV_K_W_mux1h_2_nl) * ({CONV_K_W_CONV_K_W_or_cse , 2'b0 ,
      ({{1{CONV_K_W_CONV_K_W_or_cse}}, CONV_K_W_CONV_K_W_or_cse}) , 1'b0 , (~ (fsm_output[8]))
      , 1'b0 , (CONV_K_W_nor_3_nl) , 1'b1 , (CONV_K_W_CONV_K_W_mux_1_nl) , 1'b1});
  assign z_out_4 = nl_z_out_4[13:0];
  assign CONV_H_SLIDE_mux_3_nl = MUX_v_8_2_2(o_c_7_0_lpi_4, PAD_for_for_c_7_0_sva_3,
      fsm_output[1]);
  assign nl_z_out_5 = (CONV_H_SLIDE_mux_3_nl) + 8'b1;
  assign z_out_5 = nl_z_out_5[7:0];
  assign nl_PAD_for_for_else_else_acc_17_nl = conv_u2s_7_9(PAD_for_r_6_0_sva_4) +
      conv_s2s_6_9(z_out_3[7:2]);
  assign PAD_for_for_else_else_acc_17_nl = nl_PAD_for_for_else_else_acc_17_nl[8:0];
  assign CONV_K_W_mux_7_nl = MUX_v_11_2_2(temp_1_lpi_7, ({(PAD_for_for_else_else_acc_17_nl)
      , (z_out_3[1:0])}), fsm_output[2]);
  assign nl_CONV_K_W_mul_13_nl = $signed(CONV_K_W_asn_19_itm_1) * $signed(CONV_K_W_mux_itm_1);
  assign CONV_K_W_mul_13_nl = nl_CONV_K_W_mul_13_nl[10:0];
  assign CONV_K_W_mux_8_nl = MUX_v_11_2_2((CONV_K_W_mul_13_nl), ({(z_out_4[7:0])
      , 3'b11}), fsm_output[2]);
  assign nl_z_out_6 = (CONV_K_W_mux_7_nl) + (CONV_K_W_mux_8_nl);
  assign z_out_6 = nl_z_out_6[10:0];

  function [0:0] MUX1HOT_s_1_4_2;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [3:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    MUX1HOT_s_1_4_2 = result;
  end
  endfunction


  function [13:0] MUX1HOT_v_14_4_2;
    input [13:0] input_3;
    input [13:0] input_2;
    input [13:0] input_1;
    input [13:0] input_0;
    input [3:0] sel;
    reg [13:0] result;
  begin
    result = input_0 & {14{sel[0]}};
    result = result | ( input_1 & {14{sel[1]}});
    result = result | ( input_2 & {14{sel[2]}});
    result = result | ( input_3 & {14{sel[3]}});
    MUX1HOT_v_14_4_2 = result;
  end
  endfunction


  function [1:0] MUX1HOT_v_2_4_2;
    input [1:0] input_3;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [3:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    result = result | ( input_3 & {2{sel[3]}});
    MUX1HOT_v_2_4_2 = result;
  end
  endfunction


  function [1:0] MUX1HOT_v_2_5_2;
    input [1:0] input_4;
    input [1:0] input_3;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [4:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    result = result | ( input_3 & {2{sel[3]}});
    result = result | ( input_4 & {2{sel[4]}});
    MUX1HOT_v_2_5_2 = result;
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


  function [3:0] MUX_v_4_81_2;
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
    input [3:0] input_12;
    input [3:0] input_13;
    input [3:0] input_14;
    input [3:0] input_15;
    input [3:0] input_16;
    input [3:0] input_17;
    input [3:0] input_18;
    input [3:0] input_19;
    input [3:0] input_20;
    input [3:0] input_21;
    input [3:0] input_22;
    input [3:0] input_23;
    input [3:0] input_24;
    input [3:0] input_25;
    input [3:0] input_26;
    input [3:0] input_27;
    input [3:0] input_28;
    input [3:0] input_29;
    input [3:0] input_30;
    input [3:0] input_31;
    input [3:0] input_32;
    input [3:0] input_33;
    input [3:0] input_34;
    input [3:0] input_35;
    input [3:0] input_36;
    input [3:0] input_37;
    input [3:0] input_38;
    input [3:0] input_39;
    input [3:0] input_40;
    input [3:0] input_41;
    input [3:0] input_42;
    input [3:0] input_43;
    input [3:0] input_44;
    input [3:0] input_45;
    input [3:0] input_46;
    input [3:0] input_47;
    input [3:0] input_48;
    input [3:0] input_49;
    input [3:0] input_50;
    input [3:0] input_51;
    input [3:0] input_52;
    input [3:0] input_53;
    input [3:0] input_54;
    input [3:0] input_55;
    input [3:0] input_56;
    input [3:0] input_57;
    input [3:0] input_58;
    input [3:0] input_59;
    input [3:0] input_60;
    input [3:0] input_61;
    input [3:0] input_62;
    input [3:0] input_63;
    input [3:0] input_64;
    input [3:0] input_65;
    input [3:0] input_66;
    input [3:0] input_67;
    input [3:0] input_68;
    input [3:0] input_69;
    input [3:0] input_70;
    input [3:0] input_71;
    input [3:0] input_72;
    input [3:0] input_73;
    input [3:0] input_74;
    input [3:0] input_75;
    input [3:0] input_76;
    input [3:0] input_77;
    input [3:0] input_78;
    input [3:0] input_79;
    input [3:0] input_80;
    input [6:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      7'b0000000 : begin
        result = input_0;
      end
      7'b0000001 : begin
        result = input_1;
      end
      7'b0000010 : begin
        result = input_2;
      end
      7'b0000011 : begin
        result = input_3;
      end
      7'b0000100 : begin
        result = input_4;
      end
      7'b0000101 : begin
        result = input_5;
      end
      7'b0000110 : begin
        result = input_6;
      end
      7'b0000111 : begin
        result = input_7;
      end
      7'b0001000 : begin
        result = input_8;
      end
      7'b0001001 : begin
        result = input_9;
      end
      7'b0001010 : begin
        result = input_10;
      end
      7'b0001011 : begin
        result = input_11;
      end
      7'b0001100 : begin
        result = input_12;
      end
      7'b0001101 : begin
        result = input_13;
      end
      7'b0001110 : begin
        result = input_14;
      end
      7'b0001111 : begin
        result = input_15;
      end
      7'b0010000 : begin
        result = input_16;
      end
      7'b0010001 : begin
        result = input_17;
      end
      7'b0010010 : begin
        result = input_18;
      end
      7'b0010011 : begin
        result = input_19;
      end
      7'b0010100 : begin
        result = input_20;
      end
      7'b0010101 : begin
        result = input_21;
      end
      7'b0010110 : begin
        result = input_22;
      end
      7'b0010111 : begin
        result = input_23;
      end
      7'b0011000 : begin
        result = input_24;
      end
      7'b0011001 : begin
        result = input_25;
      end
      7'b0011010 : begin
        result = input_26;
      end
      7'b0011011 : begin
        result = input_27;
      end
      7'b0011100 : begin
        result = input_28;
      end
      7'b0011101 : begin
        result = input_29;
      end
      7'b0011110 : begin
        result = input_30;
      end
      7'b0011111 : begin
        result = input_31;
      end
      7'b0100000 : begin
        result = input_32;
      end
      7'b0100001 : begin
        result = input_33;
      end
      7'b0100010 : begin
        result = input_34;
      end
      7'b0100011 : begin
        result = input_35;
      end
      7'b0100100 : begin
        result = input_36;
      end
      7'b0100101 : begin
        result = input_37;
      end
      7'b0100110 : begin
        result = input_38;
      end
      7'b0100111 : begin
        result = input_39;
      end
      7'b0101000 : begin
        result = input_40;
      end
      7'b0101001 : begin
        result = input_41;
      end
      7'b0101010 : begin
        result = input_42;
      end
      7'b0101011 : begin
        result = input_43;
      end
      7'b0101100 : begin
        result = input_44;
      end
      7'b0101101 : begin
        result = input_45;
      end
      7'b0101110 : begin
        result = input_46;
      end
      7'b0101111 : begin
        result = input_47;
      end
      7'b0110000 : begin
        result = input_48;
      end
      7'b0110001 : begin
        result = input_49;
      end
      7'b0110010 : begin
        result = input_50;
      end
      7'b0110011 : begin
        result = input_51;
      end
      7'b0110100 : begin
        result = input_52;
      end
      7'b0110101 : begin
        result = input_53;
      end
      7'b0110110 : begin
        result = input_54;
      end
      7'b0110111 : begin
        result = input_55;
      end
      7'b0111000 : begin
        result = input_56;
      end
      7'b0111001 : begin
        result = input_57;
      end
      7'b0111010 : begin
        result = input_58;
      end
      7'b0111011 : begin
        result = input_59;
      end
      7'b0111100 : begin
        result = input_60;
      end
      7'b0111101 : begin
        result = input_61;
      end
      7'b0111110 : begin
        result = input_62;
      end
      7'b0111111 : begin
        result = input_63;
      end
      7'b1000000 : begin
        result = input_64;
      end
      7'b1000001 : begin
        result = input_65;
      end
      7'b1000010 : begin
        result = input_66;
      end
      7'b1000011 : begin
        result = input_67;
      end
      7'b1000100 : begin
        result = input_68;
      end
      7'b1000101 : begin
        result = input_69;
      end
      7'b1000110 : begin
        result = input_70;
      end
      7'b1000111 : begin
        result = input_71;
      end
      7'b1001000 : begin
        result = input_72;
      end
      7'b1001001 : begin
        result = input_73;
      end
      7'b1001010 : begin
        result = input_74;
      end
      7'b1001011 : begin
        result = input_75;
      end
      7'b1001100 : begin
        result = input_76;
      end
      7'b1001101 : begin
        result = input_77;
      end
      7'b1001110 : begin
        result = input_78;
      end
      7'b1001111 : begin
        result = input_79;
      end
      default : begin
        result = input_80;
      end
    endcase
    MUX_v_4_81_2 = result;
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


  function  [1:0] conv_u2u_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_2 = {1'b0, vector};
  end
  endfunction


  function  [2:0] conv_u2u_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_3 = {1'b0, vector};
  end
  endfunction


  function  [6:0] conv_u2u_2_7 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_7 = {{5{1'b0}}, vector};
  end
  endfunction


  function  [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction


  function  [6:0] conv_u2u_5_7 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_7 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [7:0] conv_u2u_5_8 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_8 = {{3{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_7 = {1'b0, vector};
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



