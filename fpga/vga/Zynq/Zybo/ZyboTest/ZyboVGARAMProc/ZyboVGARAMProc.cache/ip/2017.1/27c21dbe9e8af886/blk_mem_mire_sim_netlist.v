// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Thu Jan 25 16:34:59 2018
// Host        : cimepe29 running 64-bit Debian GNU/Linux 7.6 (wheezy)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_mire_sim_netlist.v
// Design      : blk_mem_mire
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_mire,blk_mem_gen_v8_3_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_3_6,Vivado 2017.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [15:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [15:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "16" *) 
  (* C_ADDRB_WIDTH = "16" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "14" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.530383 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_mire.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_mire.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "57600" *) 
  (* C_READ_DEPTH_B = "57600" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "57600" *) 
  (* C_WRITE_DEPTH_B = "57600" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_3_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[15:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[15:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bindec
   (ena_array,
    addra);
  output [0:0]ena_array;
  input [4:0]addra;

  wire [4:0]addra;
  wire [0:0]ena_array;

  LUT5 #(
    .INIT(32'h10000000)) 
    \ENOUT_inferred__1/i_ 
       (.I0(addra[1]),
        .I1(addra[0]),
        .I2(addra[3]),
        .I3(addra[2]),
        .I4(addra[4]),
        .O(ena_array));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr
   (douta,
    clka,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [28:28]ena_array;
  wire [7:0]ram_douta;
  wire \ramloop[10].ram.r_n_0 ;
  wire \ramloop[10].ram.r_n_1 ;
  wire \ramloop[10].ram.r_n_2 ;
  wire \ramloop[10].ram.r_n_3 ;
  wire \ramloop[10].ram.r_n_4 ;
  wire \ramloop[10].ram.r_n_5 ;
  wire \ramloop[10].ram.r_n_6 ;
  wire \ramloop[10].ram.r_n_7 ;
  wire \ramloop[11].ram.r_n_0 ;
  wire \ramloop[11].ram.r_n_1 ;
  wire \ramloop[11].ram.r_n_2 ;
  wire \ramloop[11].ram.r_n_3 ;
  wire \ramloop[11].ram.r_n_4 ;
  wire \ramloop[11].ram.r_n_5 ;
  wire \ramloop[11].ram.r_n_6 ;
  wire \ramloop[11].ram.r_n_7 ;
  wire \ramloop[12].ram.r_n_0 ;
  wire \ramloop[12].ram.r_n_1 ;
  wire \ramloop[12].ram.r_n_2 ;
  wire \ramloop[12].ram.r_n_3 ;
  wire \ramloop[12].ram.r_n_4 ;
  wire \ramloop[12].ram.r_n_5 ;
  wire \ramloop[12].ram.r_n_6 ;
  wire \ramloop[12].ram.r_n_7 ;
  wire \ramloop[13].ram.r_n_0 ;
  wire \ramloop[13].ram.r_n_1 ;
  wire \ramloop[13].ram.r_n_2 ;
  wire \ramloop[13].ram.r_n_3 ;
  wire \ramloop[13].ram.r_n_4 ;
  wire \ramloop[13].ram.r_n_5 ;
  wire \ramloop[13].ram.r_n_6 ;
  wire \ramloop[13].ram.r_n_7 ;
  wire \ramloop[14].ram.r_n_0 ;
  wire \ramloop[14].ram.r_n_1 ;
  wire \ramloop[14].ram.r_n_2 ;
  wire \ramloop[14].ram.r_n_3 ;
  wire \ramloop[14].ram.r_n_4 ;
  wire \ramloop[14].ram.r_n_5 ;
  wire \ramloop[14].ram.r_n_6 ;
  wire \ramloop[14].ram.r_n_7 ;
  wire \ramloop[1].ram.r_n_0 ;
  wire \ramloop[1].ram.r_n_1 ;
  wire \ramloop[1].ram.r_n_2 ;
  wire \ramloop[1].ram.r_n_3 ;
  wire \ramloop[1].ram.r_n_4 ;
  wire \ramloop[1].ram.r_n_5 ;
  wire \ramloop[1].ram.r_n_6 ;
  wire \ramloop[1].ram.r_n_7 ;
  wire \ramloop[2].ram.r_n_0 ;
  wire \ramloop[2].ram.r_n_1 ;
  wire \ramloop[2].ram.r_n_2 ;
  wire \ramloop[2].ram.r_n_3 ;
  wire \ramloop[2].ram.r_n_4 ;
  wire \ramloop[2].ram.r_n_5 ;
  wire \ramloop[2].ram.r_n_6 ;
  wire \ramloop[2].ram.r_n_7 ;
  wire \ramloop[3].ram.r_n_0 ;
  wire \ramloop[3].ram.r_n_1 ;
  wire \ramloop[3].ram.r_n_2 ;
  wire \ramloop[3].ram.r_n_3 ;
  wire \ramloop[3].ram.r_n_4 ;
  wire \ramloop[3].ram.r_n_5 ;
  wire \ramloop[3].ram.r_n_6 ;
  wire \ramloop[3].ram.r_n_7 ;
  wire \ramloop[4].ram.r_n_0 ;
  wire \ramloop[4].ram.r_n_1 ;
  wire \ramloop[4].ram.r_n_2 ;
  wire \ramloop[4].ram.r_n_3 ;
  wire \ramloop[4].ram.r_n_4 ;
  wire \ramloop[4].ram.r_n_5 ;
  wire \ramloop[4].ram.r_n_6 ;
  wire \ramloop[4].ram.r_n_7 ;
  wire \ramloop[5].ram.r_n_0 ;
  wire \ramloop[5].ram.r_n_1 ;
  wire \ramloop[5].ram.r_n_2 ;
  wire \ramloop[5].ram.r_n_3 ;
  wire \ramloop[5].ram.r_n_4 ;
  wire \ramloop[5].ram.r_n_5 ;
  wire \ramloop[5].ram.r_n_6 ;
  wire \ramloop[5].ram.r_n_7 ;
  wire \ramloop[6].ram.r_n_0 ;
  wire \ramloop[6].ram.r_n_1 ;
  wire \ramloop[6].ram.r_n_2 ;
  wire \ramloop[6].ram.r_n_3 ;
  wire \ramloop[6].ram.r_n_4 ;
  wire \ramloop[6].ram.r_n_5 ;
  wire \ramloop[6].ram.r_n_6 ;
  wire \ramloop[6].ram.r_n_7 ;
  wire \ramloop[7].ram.r_n_0 ;
  wire \ramloop[7].ram.r_n_1 ;
  wire \ramloop[7].ram.r_n_2 ;
  wire \ramloop[7].ram.r_n_3 ;
  wire \ramloop[7].ram.r_n_4 ;
  wire \ramloop[7].ram.r_n_5 ;
  wire \ramloop[7].ram.r_n_6 ;
  wire \ramloop[7].ram.r_n_7 ;
  wire \ramloop[8].ram.r_n_0 ;
  wire \ramloop[8].ram.r_n_1 ;
  wire \ramloop[8].ram.r_n_2 ;
  wire \ramloop[8].ram.r_n_3 ;
  wire \ramloop[8].ram.r_n_4 ;
  wire \ramloop[8].ram.r_n_5 ;
  wire \ramloop[8].ram.r_n_6 ;
  wire \ramloop[8].ram.r_n_7 ;
  wire \ramloop[9].ram.r_n_0 ;
  wire \ramloop[9].ram.r_n_1 ;
  wire \ramloop[9].ram.r_n_2 ;
  wire \ramloop[9].ram.r_n_3 ;
  wire \ramloop[9].ram.r_n_4 ;
  wire \ramloop[9].ram.r_n_5 ;
  wire \ramloop[9].ram.r_n_6 ;
  wire \ramloop[9].ram.r_n_7 ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bindec \bindec_a.bindec_inst_a 
       (.addra(addra[15:11]),
        .ena_array(ena_array));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux \has_mux_a.A 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[13].ram.r_n_0 ,\ramloop[13].ram.r_n_1 ,\ramloop[13].ram.r_n_2 ,\ramloop[13].ram.r_n_3 ,\ramloop[13].ram.r_n_4 ,\ramloop[13].ram.r_n_5 ,\ramloop[13].ram.r_n_6 ,\ramloop[13].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ({\ramloop[12].ram.r_n_0 ,\ramloop[12].ram.r_n_1 ,\ramloop[12].ram.r_n_2 ,\ramloop[12].ram.r_n_3 ,\ramloop[12].ram.r_n_4 ,\ramloop[12].ram.r_n_5 ,\ramloop[12].ram.r_n_6 ,\ramloop[12].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ({\ramloop[11].ram.r_n_0 ,\ramloop[11].ram.r_n_1 ,\ramloop[11].ram.r_n_2 ,\ramloop[11].ram.r_n_3 ,\ramloop[11].ram.r_n_4 ,\ramloop[11].ram.r_n_5 ,\ramloop[11].ram.r_n_6 ,\ramloop[11].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 ({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 ,\ramloop[1].ram.r_n_2 ,\ramloop[1].ram.r_n_3 ,\ramloop[1].ram.r_n_4 ,\ramloop[1].ram.r_n_5 ,\ramloop[1].ram.r_n_6 ,\ramloop[1].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 (ram_douta),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ({\ramloop[10].ram.r_n_0 ,\ramloop[10].ram.r_n_1 ,\ramloop[10].ram.r_n_2 ,\ramloop[10].ram.r_n_3 ,\ramloop[10].ram.r_n_4 ,\ramloop[10].ram.r_n_5 ,\ramloop[10].ram.r_n_6 ,\ramloop[10].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 ({\ramloop[9].ram.r_n_0 ,\ramloop[9].ram.r_n_1 ,\ramloop[9].ram.r_n_2 ,\ramloop[9].ram.r_n_3 ,\ramloop[9].ram.r_n_4 ,\ramloop[9].ram.r_n_5 ,\ramloop[9].ram.r_n_6 ,\ramloop[9].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 ({\ramloop[8].ram.r_n_0 ,\ramloop[8].ram.r_n_1 ,\ramloop[8].ram.r_n_2 ,\ramloop[8].ram.r_n_3 ,\ramloop[8].ram.r_n_4 ,\ramloop[8].ram.r_n_5 ,\ramloop[8].ram.r_n_6 ,\ramloop[8].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 ({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 ,\ramloop[3].ram.r_n_2 ,\ramloop[3].ram.r_n_3 ,\ramloop[3].ram.r_n_4 ,\ramloop[3].ram.r_n_5 ,\ramloop[3].ram.r_n_6 ,\ramloop[3].ram.r_n_7 }),
        .DOADO({\ramloop[14].ram.r_n_0 ,\ramloop[14].ram.r_n_1 ,\ramloop[14].ram.r_n_2 ,\ramloop[14].ram.r_n_3 ,\ramloop[14].ram.r_n_4 ,\ramloop[14].ram.r_n_5 ,\ramloop[14].ram.r_n_6 ,\ramloop[14].ram.r_n_7 }),
        .addra(addra[15:11]),
        .clka(clka),
        .douta(douta));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (ram_douta),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized9 \ramloop[10].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[10].ram.r_n_0 ,\ramloop[10].ram.r_n_1 ,\ramloop[10].ram.r_n_2 ,\ramloop[10].ram.r_n_3 ,\ramloop[10].ram.r_n_4 ,\ramloop[10].ram.r_n_5 ,\ramloop[10].ram.r_n_6 ,\ramloop[10].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized10 \ramloop[11].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[11].ram.r_n_0 ,\ramloop[11].ram.r_n_1 ,\ramloop[11].ram.r_n_2 ,\ramloop[11].ram.r_n_3 ,\ramloop[11].ram.r_n_4 ,\ramloop[11].ram.r_n_5 ,\ramloop[11].ram.r_n_6 ,\ramloop[11].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized11 \ramloop[12].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[12].ram.r_n_0 ,\ramloop[12].ram.r_n_1 ,\ramloop[12].ram.r_n_2 ,\ramloop[12].ram.r_n_3 ,\ramloop[12].ram.r_n_4 ,\ramloop[12].ram.r_n_5 ,\ramloop[12].ram.r_n_6 ,\ramloop[12].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized12 \ramloop[13].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[13].ram.r_n_0 ,\ramloop[13].ram.r_n_1 ,\ramloop[13].ram.r_n_2 ,\ramloop[13].ram.r_n_3 ,\ramloop[13].ram.r_n_4 ,\ramloop[13].ram.r_n_5 ,\ramloop[13].ram.r_n_6 ,\ramloop[13].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized13 \ramloop[14].ram.r 
       (.DOADO({\ramloop[14].ram.r_n_0 ,\ramloop[14].ram.r_n_1 ,\ramloop[14].ram.r_n_2 ,\ramloop[14].ram.r_n_3 ,\ramloop[14].ram.r_n_4 ,\ramloop[14].ram.r_n_5 ,\ramloop[14].ram.r_n_6 ,\ramloop[14].ram.r_n_7 }),
        .addra(addra[10:0]),
        .clka(clka),
        .dina(dina),
        .ena_array(ena_array),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 ,\ramloop[1].ram.r_n_2 ,\ramloop[1].ram.r_n_3 ,\ramloop[1].ram.r_n_4 ,\ramloop[1].ram.r_n_5 ,\ramloop[1].ram.r_n_6 ,\ramloop[1].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 ,\ramloop[3].ram.r_n_2 ,\ramloop[3].ram.r_n_3 ,\ramloop[3].ram.r_n_4 ,\ramloop[3].ram.r_n_5 ,\ramloop[3].ram.r_n_6 ,\ramloop[3].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized6 \ramloop[7].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized7 \ramloop[8].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[8].ram.r_n_0 ,\ramloop[8].ram.r_n_1 ,\ramloop[8].ram.r_n_2 ,\ramloop[8].ram.r_n_3 ,\ramloop[8].ram.r_n_4 ,\ramloop[8].ram.r_n_5 ,\ramloop[8].ram.r_n_6 ,\ramloop[8].ram.r_n_7 }),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized8 \ramloop[9].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] ({\ramloop[9].ram.r_n_0 ,\ramloop[9].ram.r_n_1 ,\ramloop[9].ram.r_n_2 ,\ramloop[9].ram.r_n_3 ,\ramloop[9].ram.r_n_4 ,\ramloop[9].ram.r_n_5 ,\ramloop[9].ram.r_n_6 ,\ramloop[9].ram.r_n_7 }),
        .wea(wea));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux
   (douta,
    addra,
    clka,
    DOADO,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 );
  output [7:0]douta;
  input [4:0]addra;
  input clka;
  input [7:0]DOADO;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 ;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 ;
  wire [7:0]DOADO;
  wire [4:0]addra;
  wire clka;
  wire [7:0]douta;
  wire \douta[0]_INST_0_i_1_n_0 ;
  wire \douta[0]_INST_0_i_2_n_0 ;
  wire \douta[0]_INST_0_i_3_n_0 ;
  wire \douta[0]_INST_0_i_4_n_0 ;
  wire \douta[0]_INST_0_i_5_n_0 ;
  wire \douta[0]_INST_0_i_6_n_0 ;
  wire \douta[1]_INST_0_i_1_n_0 ;
  wire \douta[1]_INST_0_i_2_n_0 ;
  wire \douta[1]_INST_0_i_3_n_0 ;
  wire \douta[1]_INST_0_i_4_n_0 ;
  wire \douta[1]_INST_0_i_5_n_0 ;
  wire \douta[1]_INST_0_i_6_n_0 ;
  wire \douta[2]_INST_0_i_1_n_0 ;
  wire \douta[2]_INST_0_i_2_n_0 ;
  wire \douta[2]_INST_0_i_3_n_0 ;
  wire \douta[2]_INST_0_i_4_n_0 ;
  wire \douta[2]_INST_0_i_5_n_0 ;
  wire \douta[2]_INST_0_i_6_n_0 ;
  wire \douta[3]_INST_0_i_1_n_0 ;
  wire \douta[3]_INST_0_i_2_n_0 ;
  wire \douta[3]_INST_0_i_3_n_0 ;
  wire \douta[3]_INST_0_i_4_n_0 ;
  wire \douta[3]_INST_0_i_5_n_0 ;
  wire \douta[3]_INST_0_i_6_n_0 ;
  wire \douta[4]_INST_0_i_1_n_0 ;
  wire \douta[4]_INST_0_i_2_n_0 ;
  wire \douta[4]_INST_0_i_3_n_0 ;
  wire \douta[4]_INST_0_i_4_n_0 ;
  wire \douta[4]_INST_0_i_5_n_0 ;
  wire \douta[4]_INST_0_i_6_n_0 ;
  wire \douta[5]_INST_0_i_1_n_0 ;
  wire \douta[5]_INST_0_i_2_n_0 ;
  wire \douta[5]_INST_0_i_3_n_0 ;
  wire \douta[5]_INST_0_i_4_n_0 ;
  wire \douta[5]_INST_0_i_5_n_0 ;
  wire \douta[5]_INST_0_i_6_n_0 ;
  wire \douta[6]_INST_0_i_1_n_0 ;
  wire \douta[6]_INST_0_i_2_n_0 ;
  wire \douta[6]_INST_0_i_3_n_0 ;
  wire \douta[6]_INST_0_i_4_n_0 ;
  wire \douta[6]_INST_0_i_5_n_0 ;
  wire \douta[6]_INST_0_i_6_n_0 ;
  wire \douta[7]_INST_0_i_1_n_0 ;
  wire \douta[7]_INST_0_i_2_n_0 ;
  wire \douta[7]_INST_0_i_3_n_0 ;
  wire \douta[7]_INST_0_i_4_n_0 ;
  wire \douta[7]_INST_0_i_5_n_0 ;
  wire \douta[7]_INST_0_i_6_n_0 ;
  wire [4:0]sel_pipe;
  wire [4:0]sel_pipe_d1;

  MUXF8 \douta[0]_INST_0 
       (.I0(\douta[0]_INST_0_i_1_n_0 ),
        .I1(\douta[0]_INST_0_i_2_n_0 ),
        .O(douta[0]),
        .S(sel_pipe_d1[4]));
  MUXF7 \douta[0]_INST_0_i_1 
       (.I0(\douta[0]_INST_0_i_3_n_0 ),
        .I1(\douta[0]_INST_0_i_4_n_0 ),
        .O(\douta[0]_INST_0_i_1_n_0 ),
        .S(sel_pipe_d1[3]));
  MUXF7 \douta[0]_INST_0_i_2 
       (.I0(\douta[0]_INST_0_i_5_n_0 ),
        .I1(\douta[0]_INST_0_i_6_n_0 ),
        .O(\douta[0]_INST_0_i_2_n_0 ),
        .S(sel_pipe_d1[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[0]_INST_0_i_3 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 [0]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 [0]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 [0]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 [0]),
        .O(\douta[0]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[0]_INST_0_i_4 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 [0]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 [0]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 [0]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 [0]),
        .O(\douta[0]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[0]_INST_0_i_5 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [0]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 [0]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 [0]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 [0]),
        .O(\douta[0]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[0]_INST_0_i_6 
       (.I0(sel_pipe_d1[0]),
        .I1(DOADO[0]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [0]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [0]),
        .O(\douta[0]_INST_0_i_6_n_0 ));
  MUXF8 \douta[1]_INST_0 
       (.I0(\douta[1]_INST_0_i_1_n_0 ),
        .I1(\douta[1]_INST_0_i_2_n_0 ),
        .O(douta[1]),
        .S(sel_pipe_d1[4]));
  MUXF7 \douta[1]_INST_0_i_1 
       (.I0(\douta[1]_INST_0_i_3_n_0 ),
        .I1(\douta[1]_INST_0_i_4_n_0 ),
        .O(\douta[1]_INST_0_i_1_n_0 ),
        .S(sel_pipe_d1[3]));
  MUXF7 \douta[1]_INST_0_i_2 
       (.I0(\douta[1]_INST_0_i_5_n_0 ),
        .I1(\douta[1]_INST_0_i_6_n_0 ),
        .O(\douta[1]_INST_0_i_2_n_0 ),
        .S(sel_pipe_d1[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[1]_INST_0_i_3 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 [1]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 [1]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 [1]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 [1]),
        .O(\douta[1]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[1]_INST_0_i_4 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 [1]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 [1]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 [1]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 [1]),
        .O(\douta[1]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[1]_INST_0_i_5 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [1]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 [1]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 [1]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 [1]),
        .O(\douta[1]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[1]_INST_0_i_6 
       (.I0(sel_pipe_d1[0]),
        .I1(DOADO[1]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [1]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [1]),
        .O(\douta[1]_INST_0_i_6_n_0 ));
  MUXF8 \douta[2]_INST_0 
       (.I0(\douta[2]_INST_0_i_1_n_0 ),
        .I1(\douta[2]_INST_0_i_2_n_0 ),
        .O(douta[2]),
        .S(sel_pipe_d1[4]));
  MUXF7 \douta[2]_INST_0_i_1 
       (.I0(\douta[2]_INST_0_i_3_n_0 ),
        .I1(\douta[2]_INST_0_i_4_n_0 ),
        .O(\douta[2]_INST_0_i_1_n_0 ),
        .S(sel_pipe_d1[3]));
  MUXF7 \douta[2]_INST_0_i_2 
       (.I0(\douta[2]_INST_0_i_5_n_0 ),
        .I1(\douta[2]_INST_0_i_6_n_0 ),
        .O(\douta[2]_INST_0_i_2_n_0 ),
        .S(sel_pipe_d1[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[2]_INST_0_i_3 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 [2]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 [2]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 [2]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 [2]),
        .O(\douta[2]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[2]_INST_0_i_4 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 [2]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 [2]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 [2]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 [2]),
        .O(\douta[2]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[2]_INST_0_i_5 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [2]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 [2]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 [2]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 [2]),
        .O(\douta[2]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[2]_INST_0_i_6 
       (.I0(sel_pipe_d1[0]),
        .I1(DOADO[2]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [2]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [2]),
        .O(\douta[2]_INST_0_i_6_n_0 ));
  MUXF8 \douta[3]_INST_0 
       (.I0(\douta[3]_INST_0_i_1_n_0 ),
        .I1(\douta[3]_INST_0_i_2_n_0 ),
        .O(douta[3]),
        .S(sel_pipe_d1[4]));
  MUXF7 \douta[3]_INST_0_i_1 
       (.I0(\douta[3]_INST_0_i_3_n_0 ),
        .I1(\douta[3]_INST_0_i_4_n_0 ),
        .O(\douta[3]_INST_0_i_1_n_0 ),
        .S(sel_pipe_d1[3]));
  MUXF7 \douta[3]_INST_0_i_2 
       (.I0(\douta[3]_INST_0_i_5_n_0 ),
        .I1(\douta[3]_INST_0_i_6_n_0 ),
        .O(\douta[3]_INST_0_i_2_n_0 ),
        .S(sel_pipe_d1[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[3]_INST_0_i_3 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 [3]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 [3]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 [3]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 [3]),
        .O(\douta[3]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[3]_INST_0_i_4 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 [3]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 [3]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 [3]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 [3]),
        .O(\douta[3]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[3]_INST_0_i_5 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [3]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 [3]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 [3]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 [3]),
        .O(\douta[3]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[3]_INST_0_i_6 
       (.I0(sel_pipe_d1[0]),
        .I1(DOADO[3]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [3]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [3]),
        .O(\douta[3]_INST_0_i_6_n_0 ));
  MUXF8 \douta[4]_INST_0 
       (.I0(\douta[4]_INST_0_i_1_n_0 ),
        .I1(\douta[4]_INST_0_i_2_n_0 ),
        .O(douta[4]),
        .S(sel_pipe_d1[4]));
  MUXF7 \douta[4]_INST_0_i_1 
       (.I0(\douta[4]_INST_0_i_3_n_0 ),
        .I1(\douta[4]_INST_0_i_4_n_0 ),
        .O(\douta[4]_INST_0_i_1_n_0 ),
        .S(sel_pipe_d1[3]));
  MUXF7 \douta[4]_INST_0_i_2 
       (.I0(\douta[4]_INST_0_i_5_n_0 ),
        .I1(\douta[4]_INST_0_i_6_n_0 ),
        .O(\douta[4]_INST_0_i_2_n_0 ),
        .S(sel_pipe_d1[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[4]_INST_0_i_3 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 [4]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 [4]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 [4]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 [4]),
        .O(\douta[4]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[4]_INST_0_i_4 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 [4]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 [4]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 [4]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 [4]),
        .O(\douta[4]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[4]_INST_0_i_5 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [4]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 [4]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 [4]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 [4]),
        .O(\douta[4]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[4]_INST_0_i_6 
       (.I0(sel_pipe_d1[0]),
        .I1(DOADO[4]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [4]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [4]),
        .O(\douta[4]_INST_0_i_6_n_0 ));
  MUXF8 \douta[5]_INST_0 
       (.I0(\douta[5]_INST_0_i_1_n_0 ),
        .I1(\douta[5]_INST_0_i_2_n_0 ),
        .O(douta[5]),
        .S(sel_pipe_d1[4]));
  MUXF7 \douta[5]_INST_0_i_1 
       (.I0(\douta[5]_INST_0_i_3_n_0 ),
        .I1(\douta[5]_INST_0_i_4_n_0 ),
        .O(\douta[5]_INST_0_i_1_n_0 ),
        .S(sel_pipe_d1[3]));
  MUXF7 \douta[5]_INST_0_i_2 
       (.I0(\douta[5]_INST_0_i_5_n_0 ),
        .I1(\douta[5]_INST_0_i_6_n_0 ),
        .O(\douta[5]_INST_0_i_2_n_0 ),
        .S(sel_pipe_d1[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[5]_INST_0_i_3 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 [5]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 [5]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 [5]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 [5]),
        .O(\douta[5]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[5]_INST_0_i_4 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 [5]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 [5]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 [5]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 [5]),
        .O(\douta[5]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[5]_INST_0_i_5 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [5]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 [5]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 [5]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 [5]),
        .O(\douta[5]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[5]_INST_0_i_6 
       (.I0(sel_pipe_d1[0]),
        .I1(DOADO[5]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [5]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [5]),
        .O(\douta[5]_INST_0_i_6_n_0 ));
  MUXF8 \douta[6]_INST_0 
       (.I0(\douta[6]_INST_0_i_1_n_0 ),
        .I1(\douta[6]_INST_0_i_2_n_0 ),
        .O(douta[6]),
        .S(sel_pipe_d1[4]));
  MUXF7 \douta[6]_INST_0_i_1 
       (.I0(\douta[6]_INST_0_i_3_n_0 ),
        .I1(\douta[6]_INST_0_i_4_n_0 ),
        .O(\douta[6]_INST_0_i_1_n_0 ),
        .S(sel_pipe_d1[3]));
  MUXF7 \douta[6]_INST_0_i_2 
       (.I0(\douta[6]_INST_0_i_5_n_0 ),
        .I1(\douta[6]_INST_0_i_6_n_0 ),
        .O(\douta[6]_INST_0_i_2_n_0 ),
        .S(sel_pipe_d1[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[6]_INST_0_i_3 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 [6]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 [6]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 [6]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 [6]),
        .O(\douta[6]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[6]_INST_0_i_4 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 [6]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 [6]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 [6]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 [6]),
        .O(\douta[6]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[6]_INST_0_i_5 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [6]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 [6]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 [6]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 [6]),
        .O(\douta[6]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[6]_INST_0_i_6 
       (.I0(sel_pipe_d1[0]),
        .I1(DOADO[6]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [6]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [6]),
        .O(\douta[6]_INST_0_i_6_n_0 ));
  MUXF8 \douta[7]_INST_0 
       (.I0(\douta[7]_INST_0_i_1_n_0 ),
        .I1(\douta[7]_INST_0_i_2_n_0 ),
        .O(douta[7]),
        .S(sel_pipe_d1[4]));
  MUXF7 \douta[7]_INST_0_i_1 
       (.I0(\douta[7]_INST_0_i_3_n_0 ),
        .I1(\douta[7]_INST_0_i_4_n_0 ),
        .O(\douta[7]_INST_0_i_1_n_0 ),
        .S(sel_pipe_d1[3]));
  MUXF7 \douta[7]_INST_0_i_2 
       (.I0(\douta[7]_INST_0_i_5_n_0 ),
        .I1(\douta[7]_INST_0_i_6_n_0 ),
        .O(\douta[7]_INST_0_i_2_n_0 ),
        .S(sel_pipe_d1[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[7]_INST_0_i_3 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9 [7]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_10 [7]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_11 [7]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12 [7]),
        .O(\douta[7]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[7]_INST_0_i_4 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_5 [7]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_6 [7]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_7 [7]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_8 [7]),
        .O(\douta[7]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \douta[7]_INST_0_i_5 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [7]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 [7]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 [7]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 [7]),
        .O(\douta[7]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[7]_INST_0_i_6 
       (.I0(sel_pipe_d1[0]),
        .I1(DOADO[7]),
        .I2(sel_pipe_d1[2]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [7]),
        .I4(sel_pipe_d1[1]),
        .I5(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [7]),
        .O(\douta[7]_INST_0_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_norm_sel2.has_mem_regs.WITHOUT_ECC_PIPE.ce_pri.sel_pipe_d1_reg[0] 
       (.C(clka),
        .CE(1'b1),
        .D(sel_pipe[0]),
        .Q(sel_pipe_d1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_norm_sel2.has_mem_regs.WITHOUT_ECC_PIPE.ce_pri.sel_pipe_d1_reg[1] 
       (.C(clka),
        .CE(1'b1),
        .D(sel_pipe[1]),
        .Q(sel_pipe_d1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_norm_sel2.has_mem_regs.WITHOUT_ECC_PIPE.ce_pri.sel_pipe_d1_reg[2] 
       (.C(clka),
        .CE(1'b1),
        .D(sel_pipe[2]),
        .Q(sel_pipe_d1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_norm_sel2.has_mem_regs.WITHOUT_ECC_PIPE.ce_pri.sel_pipe_d1_reg[3] 
       (.C(clka),
        .CE(1'b1),
        .D(sel_pipe[3]),
        .Q(sel_pipe_d1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_norm_sel2.has_mem_regs.WITHOUT_ECC_PIPE.ce_pri.sel_pipe_d1_reg[4] 
       (.C(clka),
        .CE(1'b1),
        .D(sel_pipe[4]),
        .Q(sel_pipe_d1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] 
       (.C(clka),
        .CE(1'b1),
        .D(addra[0]),
        .Q(sel_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[1] 
       (.C(clka),
        .CE(1'b1),
        .D(addra[1]),
        .Q(sel_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[2] 
       (.C(clka),
        .CE(1'b1),
        .D(addra[2]),
        .Q(sel_pipe[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[3] 
       (.C(clka),
        .CE(1'b1),
        .D(addra[3]),
        .Q(sel_pipe[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[4] 
       (.C(clka),
        .CE(1'b1),
        .D(addra[4]),
        .Q(sel_pipe[4]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized10
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized10 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized11
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized11 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized12
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized12 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized13
   (DOADO,
    clka,
    ena_array,
    addra,
    dina,
    wea);
  output [7:0]DOADO;
  input clka;
  input [0:0]ena_array;
  input [10:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [7:0]DOADO;
  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [0:0]ena_array;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized13 \prim_init.ram 
       (.DOADO(DOADO),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena_array(ena_array),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized2
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized2 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized3
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized3 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized4
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized4 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized5
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized5 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized6
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized6 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized7
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized7 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized8
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized8 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized9
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized9 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .\douta[7] (\douta[7] ),
        .wea(wea));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h6969707E857E839A96959290857A787E777C888F7F71717677706A6A6B717A82),
    .INIT_01(256'h93A7ABA38E84959F9E968B8A8C8B8F9C9B918E8E98AEB7AA9B84788DA0987C6C),
    .INIT_02(256'h8A98896E799BA89E978F92958E84807E777A8796A09A908C8F9DA6A39C9C9E9D),
    .INIT_03(256'h8D9085868485969890A4A39DACB5A99E968D98AEAA988F8E8A8398A497897E7F),
    .INIT_04(256'h8D8387898E9E9B978981959C8E9093939C99848297968E9DA8A09E97918D807D),
    .INIT_05(256'h646A7079838487938F9195948678747B8283888A7F76716D6E66696F6E727C82),
    .INIT_06(256'hA1AFA7998C8994928D8E8C8B89848796838A908E8D979A927F7B7C828784776F),
    .INIT_07(256'h939789777D91A0A49191928F8585898781858E989B9389848D979A938E969EA2),
    .INIT_08(256'h93948B908D8B9EA2A4A8ADACA9ADA89D8B8E9699979C9D938A869AA092867F80),
    .INIT_09(256'h838088888B9B9E9E8F818F938E95999894958D92A3A0989FAA9C9CA0A0978786),
    .INIT_0A(256'h606D757C888E8C8B898F9594877C7C858D8D8A847A7471716B616A746C696E70),
    .INIT_0B(256'h9BAA9F928D91988D858E928F85777581718187817B797B816C777C7673777772),
    .INIT_0C(256'h8E8B837B797E8C989090908478797F7B898A8D8F8B837E7D858D8C7F7C8A9394),
    .INIT_0D(256'hA0978E95908DA1ABA599A0A29493978C80838F9B9B9C9D9A9389919696968880),
    .INIT_0E(256'h8587908983919597877E909A9CA5A39E94979BA2A9A7A19D958C99A7AAA197A2),
    .INIT_0F(256'h6F7C868E96989290949494918681858F8E8D867C7169707F73676F7D746A6965),
    .INIT_10(256'h91A09C979697988C828E96948C7D757A7A8588898A7F7C8B757B7A72727C7F7A),
    .INIT_11(256'h8F89898C857F8690858485837D82847E8E8E8C87807D7E827F89897F7E8A8F8B),
    .INIT_12(256'hA08F909E98909AA29D9595928B8F938F92919DACAFADACA7938B8F8F949A8C86),
    .INIT_13(256'h909198897E84868777768B95959B97959E9DA4A69F9E9B938F93A6A89A8C8BA1),
    .INIT_14(256'h8A8E949C9D948F969F9A938C84828387837F7674736C72887E73798888817E7A),
    .INIT_15(256'h9B9C969B9F9892847A868D90908A8180818082939D8D7E89817D79777B828789),
    .INIT_16(256'h9491939389848787867D7E878C8F8F8B9395928D84828485848C8E878A969690),
    .INIT_17(256'h8F7D8EA7A3979290979C9389949D9A9DA6ADB0A9AAB7B39F888F988E888A8791),
    .INIT_18(256'h949095887D7E7C7C7A7E8F908B8F8F959E979D9B8B878881838EA09887808599),
    .INIT_19(256'h96908F9390817D8C97918A858585817E80796D7382807C898682838B94929192),
    .INIT_1A(256'hA89D8E989F9992817D87898687837C7A8B7E7887948C8183807F7E7D7C7D8794),
    .INIT_1B(256'h9693958E7E7F857D7E767B8D99A0A5A6B1B5B7B2ADA6A19D9A9B9690949B9A95),
    .INIT_1C(256'h896F829A95908F90919C928B9FAAA4A7B1B1B3AFA8A89E8C8990968B8787828F),
    .INIT_1D(256'h968C90897E7D787A7985979793959197908789887975787773798785868D939F),
    .INIT_1E(256'h958C898E8D7D768187837F818689847F85857673878D8588878E86818D8E8D98),
    .INIT_1F(256'hB3AEA1A1A4A19E918C9691847E7C797C9A8D8282858D8F8A7D81827E77768392),
    .INIT_20(256'h918F96917E7E8781778196ABBCCBD8DEE8EBEBE6E3DED3CAC2BAAEA8AAAEABA6),
    .INIT_21(256'h876878877F8289928C93969EA9B0B0AEB4ACB0B7AB998C878987858188897D85),
    .INIT_22(256'h90828889817C787D6C788A8F939285848679767A726E78838780868B92969399),
    .INIT_23(256'h949091999B8D808482807D7F848885818B9582717E8985868392857683858699),
    .INIT_24(256'hC1CAC4BCAFAAAEA6939F9E8D84858D9794918F85808E95868183837C75747E86),
    .INIT_25(256'h84859494807E89859EB6D3E1E4EFFBFCFEFDF9F4F3F1E7DCE5D7CCC9CACCC9C3),
    .INIT_26(256'h83687E8A7D7E848B7E798DA1A0A4AAA6A5A6A79F908B8780797B7C79807E7685),
    .INIT_27(256'h8578828A85807D87777B82828B8E7E7987756F7171707E959789909A9E9A9399),
    .INIT_28(256'h928C858A938F84808574727D8D8E83898B817C7875797E7A8B938E7E797D8690),
    .INIT_29(256'hECE9E5E5E5E3D8CABDA99B98938D9AAFA3A19481808F99998D898483837B7B85),
    .INIT_2A(256'h8090908B8895B2BFCCE3EBEDFBFFFDFFF8FDF9F8F9F6F0E0EBE2DCDAD7D6E1ED),
    .INIT_2B(256'h827B77867F7C747D7C7878828E96928D92949592887D7A7E746A6A777B717078),
    .INIT_2C(256'h6F70757B7F80838779949D7D829A897D7C7B6F787C707F8E8B868D979A9B968A),
    .INIT_2D(256'h8C898785817D7D7F746B72787D817D84766B6F79746B6E7487908B7F7D828A92),
    .INIT_2E(256'hF8F7F9FBFEFFFAEFE4CEB9AC9D9397A3B0A4948284919A98938B8282827D7B83),
    .INIT_2F(256'h96A5A2A0AABED4D2E6F4F7F7FFFFFBFFFBFFF9FAFAF8F7EAE5E3E0E0DFE1EAF3),
    .INIT_30(256'h88837679757E736D7B84877F7F868C8D92948C848184817A837E7F82807B7D86),
    .INIT_31(256'h6D7A847E716D788583918D888C8B85838A8B7C807F7477797D7D8D9A92909086),
    .INIT_32(256'h978F8F8B7C798181706A787B787F7C766B6267716B676E77878D89818186888C),
    .INIT_33(256'hF2F3F7FDFFFFFFF9FAEEE3D6C7B4A69EA69F96918E8D89828885868E94939192),
    .INIT_34(256'h8A9DAFC4C4C1D8EEF2F7F6F8FCF8F2F8F4FCF4F3F3F2F4EEE5E8E6E3E1E4EBF0),
    .INIT_35(256'h85837D8283887E76898E8672646D81959E97887976797E7F8F99A09E95908B8B),
    .INIT_36(256'h677E8E86746F7C89808778858D838B898C8B7A7983837C71808297A18F87887F),
    .INIT_37(256'hA290909186888C817E7583858089806A6D6C6E6F6F777B768787807D82857F7D),
    .INIT_38(256'hF3F6FAFDFEFFFDFAF8F9FAFAF2E3CCB89D99989893887D7774747F8D949A9FA0),
    .INIT_39(256'hAAB0BAD6DFD5DFEBE8E7E9F3F6F0EBEFEFF7F0F1EEECF1EBEBEDEBE5E3E7EDEF),
    .INIT_3A(256'h858385908C807F8A9D94846F616478919E968E928C8289989AA4A59B96A2AEB3),
    .INIT_3B(256'h637A8B8B838385857C837A7E898F92857F8A81777F88877E777488978F8D9189),
    .INIT_3C(256'h9282878F8A8D8F81867A8585818B87757773777C80878372817E75767F81766F),
    .INIT_3D(256'hF7F8FBFCFDFCF9F8F8F9FAF8FAF9EDDEBDAA988F8B8681806B6B767B7A828F91),
    .INIT_3E(256'hDBEAE5E1DFE2E4D8E2DDE2EDF0ECECF0EFF7F3F4F0EBEDEAEEEDE8E2E0E8EFF2),
    .INIT_3F(256'h8D888B8E857478889B9D968576767F8BA0A1ABB8B29B8E91999F9D9292A2ADB0),
    .INIT_40(256'h627382858688847E84858A83889786757B9295857F878C908A7D8191979D9D8E),
    .INIT_41(256'h7B79858F8B8D918D887B81807C858C908E7B777F82817F797A7771747E7F736D),
    .INIT_42(256'hF2F2F3F7F9F8F6F7FAF9F5F4F8FBF5EBE9CBAA948B867E786D707D7D71767E7A),
    .INIT_43(256'hDFF3F5F1E5DBD9CFE6DEE4EEEDEDF2F4EFF5F3F6F4EBEDE8F4EDE5DFE2E7EAEE),
    .INIT_44(256'h82869091948888868EA1A3908896A2A4B9C0C7CFD1C7B19E939CA5AAB4C0C6C5),
    .INIT_45(256'h5F6D7B7F81828481807A89838087726B828D938D939D9595A392878E999C9488),
    .INIT_46(256'h787E868D8E8F92978D7A787A7C7F87999D887C7974777F827B7D7A7D82807877),
    .INIT_47(256'hF4F2F3F8F9F8F7F8F6F4F2F3F4F5F0E9EDE0CCB39B8A7B727879848172777E74),
    .INIT_48(256'hE1DEDCEEF6E8D8C8DAD9E5F2F1F4F8F6F1F5F3F8F6EEEDE6F8EDE4E5E7E8E7E9),
    .INIT_49(256'h787B8D97A69D9D9B959B9D9FA8BAC8CFD3D6DBE1EDF8F4E8EEE8E0DAD4D2D3D5),
    .INIT_4A(256'h5F697780838283847C7B817C6F7276778984838597A2908B90897C7F8D8C8380),
    .INIT_4B(256'h818383878F8F8E9393786D757F7E7A8D96928B7A717985828286878688827D81),
    .INIT_4C(256'hF5EFEFF4F5F3F1F1F2EEEAEBEFF2F1EFDCE7E8D0AA918482867B7B716472847D),
    .INIT_4D(256'hDCE4E1E1E2E0DDCEC6CCE1F2F2F5F9F1F1F4F2F8F8EFEEE7F2E6E0E8EFEFECEA),
    .INIT_4E(256'h867C8996A192A0B2A9999AB8D1D3D7E1DEDCE1EBF3F9FFFFF8F4F2F2EBDFDDE1),
    .INIT_4F(256'h646A758388837C78838F8779636A8C8C8E86857E8384777E8C8E847F8980767C),
    .INIT_50(256'h827B717D908074888C87757A827165798C93957C74828B919095858E93868E98),
    .INIT_51(256'hFFF6F3ECFDF6F7F5EEEDE3E4E9EFF4ECEAE7E0D4C3AA8F7C7976756E71899686),
    .INIT_52(256'hE8E0F1EBD6D1E9D2BAC4CDF3F0ECF2F3F2F0EBECFBEEF8E9F5DFECE8EDE1EAF4),
    .INIT_53(256'h95949495A27D9293728EC1CCC9D9D7D6DCD2D8E4EAF7FFF9E8F1E5D6DADBE2F8),
    .INIT_54(256'h746972848679707097938C807A81847C81847E838D857C828A80928A8C797D99),
    .INIT_55(256'h918F88868A7C727C84827B7D8372646B7689978477828B97A293858C8B8C9C96),
    .INIT_56(256'hFCFAFBF4FFF6F2EDE1EBE7DEDEECF4EDE9ECE9E6DDC7A384807F828287979F99),
    .INIT_57(256'hE4E4E8DAE0CABCD4AFBCC8E9EAEBEEEDECEDEDF3FDEEF1E4F2E0E6E7EAE9EDF5),
    .INIT_58(256'hA59991868D8A9072718BB4C3C4D0D0CAC7D2CCCFE6F0E8E6E4CABFC3CBE0ECDF),
    .INIT_59(256'h76656278888174718B8C8677728084777783898F978F86898787897A87999BA1),
    .INIT_5A(256'hA8A6A1999691877D75747375756E655E5D6F837C77838B98A2908C92858A9D91),
    .INIT_5B(256'hF0F7FDF6FBF5F1ECE3E5DFDBE2EFEDE3EEF2F0EFF0E8C8A799A4AAAFB4B2ACAB),
    .INIT_5C(256'hD2D4D6BED0C098AEA9B4BFDFE1E7EAE9ECE8E7ECF2E7EEECF4E6E4E8E1EBE8EC),
    .INIT_5D(256'hA2847E8193A582457097BAC6BCBBC2BCB9B2B5B9BFDBEBE1D8DADDD1C6D7E4D2),
    .INIT_5E(256'h867E7582948B7369808883716B7A7D6E7177797B82838286818E8E868FA9A8A8),
    .INIT_5F(256'hC9BEB8B3B1B3A890817B7A77747B7969616572747B89888B8B8A979D887C8788),
    .INIT_60(256'hE9F5F9F2F4F2F0EFEFE0E0E7F0EDE2E4FFFFF8F1F6FCEFD9C9D9DFDEE1D6CBCC),
    .INIT_61(256'hC0BDC6AA9DA79C939496A5C9D3DDE1E6EAE3E2E5E7E1EBF6F3ECE4E9D8EAE1E5),
    .INIT_62(256'h8E74768EA6AD6A446A95B0BDB1A8B0A7B4A4ADAE9FBBE0DFD5DBD0CEE0E0D3D1),
    .INIT_63(256'h8390878190917F787F8381746971756C7E7A74777B7E828B868B8D9FA0A19399),
    .INIT_64(256'hF3E2DBD9CFCDC5AF9E928B847C84856F756C72757E8479777881959C90776E7E),
    .INIT_65(256'hE9F6F7F5F1F0EBECEEE6F0F0EBE5E2F3F9FCF4E8E9F4F6EFEDFFFFF8FAFAF4F7),
    .INIT_66(256'hB1837F988E84847A6C697FB2C8D8DBE5E6E3E6E9E6E4E9F5EBEAE3EBD3E8DEE5),
    .INIT_67(256'h89848594A49B555F88A4AAB5BAB6B4A4B0B9B7AEA4A1B7DCE3CCBACFE8D5BBC1),
    .INIT_68(256'h7F93826A7485807978797C796E6E74747A797F877E767B8A94867B999D907D85),
    .INIT_69(256'hFFFDF9F2E1D8D8D2BCACA29B908E877070666E737B7C7173797D898F8F7D6979),
    .INIT_6A(256'hE4EFF1F7F4F0E7E9E7E4EDDEDDEAEAF3E4EBEEE7E6ECEFECE8FAFFFFFFFFFFFF),
    .INIT_6B(256'h51523F3C405D6E6956526DA2C2DDDAE2E9E6E7E5DDE5E7F6EAE9E7EFD8E7DDE4),
    .INIT_6C(256'h8E948C8B9D8A4456738B9299A7B1B7B8BBC0C1BDAFA3B8DED8CCD1D4C1B09F85),
    .INIT_6D(256'h7B8B7C656D80796B6C6B73797373787E656E7C826D617083938E7D86857D808A),
    .INIT_6E(256'hFFFFFBF1E1DBE0E6DECFC6C6C0B7AC997C6C6E73787B757C827C838281847879),
    .INIT_6F(256'hDFE3E2F0EFECE0E5DCD4D9CBD3EAE4E5DDE3EBEEF1F4F5F3E1E7F1F8F9FCF9F4),
    .INIT_70(256'h52391E1A100D1E56524D6490B5DFDCDFE7E6E6E0D7E8EAF8EAE5E4EDDEE6DCE0),
    .INIT_71(256'h888D8788957A424F618093919BADBBD0C2C0C6C9BCB4C1CFC6C5C4B09B957945),
    .INIT_72(256'h6C787A777E898272626068717277797669707A756163768184948E827B738890),
    .INIT_73(256'hFEFDF2E5DEDDE2E4F1E2DAE2E4DBD0C6AB8C807D81837C828479867C7287887A),
    .INIT_74(256'hE3E0D7E5E1DFD3DCCCC2D0C9CCD8D3E1D8DAE2EAF3F9FBF9FAECEDF3F0F3F9F8),
    .INIT_75(256'h1C0A040A3A7A4E214C475778A1DBDDDCDCE4EBE9E0F3EDF6E3DBDEEBE3EAE0E3),
    .INIT_76(256'h7A7E888E88634B698498A4918D958FA0BBD0C6C5D5C0A2ADD6D0B2998B6E4E42),
    .INIT_77(256'h757A848580807C74605E63697078756873777A70687681767B909287887A8780),
    .INIT_78(256'hFFEEE1DED3C5D2EFF5E5E3DFD4DAE3D5C4A2968B8182858B8478827F7F928F8A),
    .INIT_79(256'hD8E3E2D9EBDED1D3C0C0BEA2B6A4D4E0DDE0EEF8F5F8F9EDF4F1F5F9F1F8FFF8),
    .INIT_7A(256'h0C101D4352595E2D3447516799C2D3E1D5E0E8E5E9EAE3F1EBE2E0DDDFE5E4EA),
    .INIT_7B(256'h7D8677869D604F78838B949CA1A5ABB2ACB9BEC5C1ABB3DED4B7A197754B371E),
    .INIT_7C(256'h72607988837A7E6962605E6169716F677C86757972687E7E83807A6F7F7D817C),
    .INIT_7D(256'hECE9DBC6BECBDCE6F0DED9DDE1E6DEC6B8A9A19B9B948891857C88827D8C8D8E),
    .INIT_7E(256'hE7DEDCDBEFE7CDA8B489897D8EA3BBA4C7D8ECF3F0F6F7ECEBD6D4E9EFF3FCF1),
    .INIT_7F(256'h14232336412D231D274A535B88B1CDE8E1E6EAE7ECEBE0E8DFE0E6E2DFE4E5EF),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0001)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[15]),
        .I3(addra[14]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__0_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h738786909855394D6872798296ACB8B7C4B8BABEB3B4B7ADB7B3A78D5A42360E),
    .INIT_01(256'h6C515767756F70646D615C626B726E63747A75807E7784838F86765E71797977),
    .INIT_02(256'hDECAB4B0BFD0DADBE7DACBC7CCD1CABEA99D9094B2B39897938C918A868B857F),
    .INIT_03(256'hEEDFE5E1E2DBC79676645A5B525E568397ACCEE8E8E7EFF9EDE4E4F0E6DEE7E4),
    .INIT_04(256'h1C18252F292731312D59615E84AECCEAE4E5E8E6EDEFE2E4D0DCECE8E2E9ECF5),
    .INIT_05(256'h75898C83743A2F423F5169849CAFB3B2B5CCD5CBBFB0A09FB3B887605745312D),
    .INIT_06(256'h786057617A6C686E765F59646D7472677377828E89818588868C88646D73707A),
    .INIT_07(256'hB1AEAEB4B6BDCFE1D0CFCAC9D0CDBCB1A5918184A8C1B2A0A098949294928170),
    .INIT_08(256'hE7E1ECE6DAC4B0896C4D4724120B151A627493BBDAECEFE8EEE9E5EBF0F0E7CB),
    .INIT_09(256'h332B3A3B344853473655605D7DB4DAE8DFDFE5E7EEF0E3E1D0DEEEE9E5EEEEF3),
    .INIT_0A(256'h72869A8B63271B293F567B9BA4A0A0A5A2B3B1B6C5B49C9FA39F7D8BA7793B2C),
    .INIT_0B(256'h787671778D7268808369637072777C78777B96A092857E7F7188987A81817177),
    .INIT_0C(256'h9AAEBBB9B8C2CDD1D1CBC2C4D6DCC8B5A7948C818BB8C2A99D9A929197948A7B),
    .INIT_0D(256'hDFD9DEDED9B08666533C1C4B61693F1D144A7990ABCDE4EDE5E2DDE5EAE2D1B3),
    .INIT_0E(256'h3F4D4C485C66595F616E7A757DB2DEDFE0DDE7EBEEEFE4E0E0E7F0EAEAF2EBE9),
    .INIT_0F(256'h77809B987C4F48527384979A91868B92A19397A1A3A4A296A8837C9CA48F7145),
    .INIT_10(256'h6371767A8E716985907C767E7D808A917F7F99A59990857B6F80918595917971),
    .INIT_11(256'hB4B6BAC2CACCC5BFD6CABCBAC5D2CABAA18A8A7E81B5C6A2999E918A8A888F92),
    .INIT_12(256'hE1D8D6C9BB886454422543834C62691B0C1930609CC6DBEBEAE9E3E7DCBEAEA6),
    .INIT_13(256'h565B58606F7174818896AEAB9EBBDAD6DDDAE6E9E9EEE7E3E6E6EBE9EDF5ECE8),
    .INIT_14(256'h8075878D9089919E9CA5A087726A6D6F567392A2A29C9CA28189919897A0996D),
    .INIT_15(256'h59676C697C6D6E828C827A7C828591A49286888E8A969F927A828C8C9286837E),
    .INIT_16(256'hBCC1C9CAC2BBC1CCC1BCBFC2C3C6B997846E6F6C7EABB2939CA391848280929D),
    .INIT_17(256'hE2D7DABE9064615E38438039231B5F2911070D3C7EAAD0F4FCEEDADAD5BEAFA6),
    .INIT_18(256'h8B837B888887989185A1BCC4C1C9D5DDDED5DEE2E2EBEAE5E4E4EDECEEF2EAEC),
    .INIT_19(256'h746F868793949395999C9881614D505E7F7F6C6C848789A683A49F94A0AFAFA2),
    .INIT_1A(256'h5E6C73646B6D7D888C8775718082879C99918482788CB2A785868991866E888B),
    .INIT_1B(256'hBBCAC8B6B2C4CDC7C3AFADB5BDC4AF805E595C5869888C859AA28B828584949C),
    .INIT_1C(256'hE2D5E1BF81606F665C3A4B40382C2B251C1D101C5BA1CCDEF8FFEBD2BCACADAB),
    .INIT_1D(256'hA2B99EA4BBB3AC9C9AB8C3C5D1CDCCE1E5D7DADBD9E3E2DDE6E6F2F0ECEAE2E9),
    .INIT_1E(256'h6C76948B91918C8989858A866035416A644D5E95B2AA9D9BA19C969A9DA4AFA6),
    .INIT_1F(256'h6475826B667190979B9376697B7C77878B98938E7682B1A68F837B9086698B87),
    .INIT_20(256'hBBBCC8CDC5C4C5BCB7A7A3ACAEAE9F855F503748554F7097A1969488868F8382),
    .INIT_21(256'hE1E3E4B68D958E6D6E4E4744403C353A311C1F3C4385CDDCEEF4F5CFBBA4A9B4),
    .INIT_22(256'h9EADB7C2D0C5B3ACAEBDC4C9D4D2CDD6DED5D1D6D7D5D8DFE1DDE4F1F4E9E3E5),
    .INIT_23(256'h87909A9585828885878586827048344D5C8AD1DFC8A69F8A90909CB1B6AAA8B1),
    .INIT_24(256'h72737B9070818A918D9286796E7B8D7F818E879795899C9C7C80919B7F608990),
    .INIT_25(256'hC0B8C7DCE2D9D3D3BFB4B0AEABADA08984714B3D4E6B848B8B92978486998A77),
    .INIT_26(256'hF0E2D8BCA0A39C8B7F7860656558563A3D474A4B4470ACDBDFE7EBD6C4B5B3BC),
    .INIT_27(256'hB4BFCACECEC4B9B7BBBDB5B7C8D3CFD4D3CAC5C9CBC8CBD1CFD6DDE7EBEBE9E7),
    .INIT_28(256'h99A7A19790807B8F9588808FA07F5B70B2DEE2D5A9A68D848F878996A0A5ADBA),
    .INIT_29(256'h7B7A799182908F9793999081787A888F8A858A9E9C8886937D949C9279658F9B),
    .INIT_2A(256'hD2D5CFC6C4C3C2C3BDB8B4B1ACB0A7938681817979837F79747B89857F7F7C81),
    .INIT_2B(256'hE6DBE0E2DBC8A99C9B957B746C6B7E77714D3962939A8CBDD3E0E3D8BDB4B9CB),
    .INIT_2C(256'hBEC4CDD0CAC6C4BFB5BBB8B8C3CDCFD2D2C8C2C1C1BFC3CAC8D6DDDEE1E9EAE5),
    .INIT_2D(256'h92A39896A0847291948B8BA1B69B81A2D1DDD2B9AF9A8F958B817B8494A4B6C4),
    .INIT_2E(256'h84897C8F9AAD9D9D938F887B797E8AA29B8B919996887B888EA1918281758B99),
    .INIT_2F(256'hB5C3BCB2BBC3BDB4ACA39D9D9D9A8E828883918370777F8A78727D8E8D80849B),
    .INIT_30(256'hE8E2E2E8EFE0C2BAC3A4A1886E655662596386B9DFCE92AAC6D0D1DDCBC2B5AE),
    .INIT_31(256'hBCB9C5CCC9C9C7BDB4BBBDBFC6D1D1D0C9C0B8B7B5B3B9C1C5D1D8D9DDE7E8E1),
    .INIT_32(256'h8A958A8D99806C81918B99A5A29093BACFCCC8B3B496959C8B87828895A4B0B7),
    .INIT_33(256'h7A87757D9EBA9F92837274757A8A939C8D9194959AA199909AA2868295848094),
    .INIT_34(256'hB5AEA3AABCBCB5B8A89A9295978B7C75747E988F848E847A7E72718899979595),
    .INIT_35(256'hE3E8E1D7E4E6D0CDC3A3A99F9796787C9CBCD0C1C8DB9E74BECBCAD5C1C3CCCE),
    .INIT_36(256'hB8BBCACFC6C0BEB5C1B8B2BBCAD6D2C6BFBBB9BAB9B6BBC1BFC5CBD4DCE1E2E1),
    .INIT_37(256'h8E93918C8377727B96889BA08D8C9DB1C8CDBDAE8A9695918E8E8D91969EA1A5),
    .INIT_38(256'h70766778A1B39A92776372817F91998A879D9BA5ACACAA8B92A48E8D9F8E7D8F),
    .INIT_39(256'h9D9A928F92949BA5A8A0989B9E91828189848C8C86837F817B6E6B8A95848081),
    .INIT_3A(256'hD5E2E3D7DFE6D3CAD0CBC4BEBABFBEB3A0B9D7D8C9D5B69DB3CBD5DABAA29880),
    .INIT_3B(256'hB6C1CDCCBCB2B2B3B7B0B7C3C8C7C4BBB8BAC0C3C3C1C2C7C3C2C8D2D9D9DADE),
    .INIT_3C(256'h828D9F9A7F7C86858B839A9B828495A0B7B1AA987B869896928F8E92979DA3A9),
    .INIT_3D(256'h6F615E7D9EA2979A877779897F889A87929B90A7AE9FA18C89A0918C9B9C827F),
    .INIT_3E(256'h61697477787F8785909A98918F8882878C827A837E686C7D7C7B7F9992767B87),
    .INIT_3F(256'hE0DEDDD3D6DBD6D8C2CEDCDAD0D3D3CECFBDC6E4DAD3CED7CFCABEC7D0CFCA98),
    .INIT_40(256'hB5C0C0BBB3ABA9B1ABABC1CEC0B0B3B5B7B8BCBDBCBBBDC4C6C7CBD0D1D2D6DE),
    .INIT_41(256'h8289959280818C8B7D81959580727894B5A7A58A8D839BA09B928A8F98A3AFB9),
    .INIT_42(256'h64535B7685888D929C8F74878C84978F8D837D99A59B9FA08D9A918E94A1897E),
    .INIT_43(256'h89675C6C726F6B657F9B9E8A80807F88858E7C7E847A7B79768B8E938E89958D),
    .INIT_44(256'hE3D7D6D8D9D6D1DCD7C4E6DDD5DDC3D1D0D6D3DDD7DED6C5D2D2C8C2CBD4EEC9),
    .INIT_45(256'hC2C1B1A8AEABA6AAB6ACB9C5B6A7AEB3C5C2C0BCB7B7BFC7BBC2C7C8C6CDD8E3),
    .INIT_46(256'hA192817571777E827D848988836A5D84A1B1937A7A979DA6AB998B8E9AA5B2BD),
    .INIT_47(256'h645A68727081938B9B956887A58D908C927F8598A39D919892999A9C8F958D94),
    .INIT_48(256'hDA915C5B59484D6586949E9A8B78758290A2907E8788797C7F8185899399948B),
    .INIT_49(256'hE8D7CACCD4D8D8D5DFD1DAD3E2DFD3D7CABDC1D0D5CEC3BACFC6C4CACDD9EDFE),
    .INIT_4A(256'hB9B2B0ADA08CACB4B9BDB1BCA49BA8AFC3C4C4C0BDBCBBBCB3C2C5C7CFD0D7EA),
    .INIT_4B(256'h91867B6D626C787472737B798480646676837B88959DB1B0AAA3908CA0B3B3AB),
    .INIT_4C(256'h5C6382827B7C8A75828E8584A1A2879298917E939A898E877D8C91949A968F94),
    .INIT_4D(256'hFEC87F545155668394918A83817E8593A2AB9C8D8C857778837B7D8A93918B8F),
    .INIT_4E(256'hEBE6D8C7BFC5D2DCD6DADFE1EEDCD7D2D7CEBA9F98B1C9CCBDD0CBBDCBE7F0EC),
    .INIT_4F(256'hAEBAA39D8AA8AA9FB0B5B5B3948597ADB8BEBEBABAB7B2B5B3BFC4C9D2D4D6DF),
    .INIT_50(256'h79706F756F68676A60646F728A9A816F616C6C718FADACA2A2A29A97A1AFB5B8),
    .INIT_51(256'h5A6D87796C748F89858D8D81889087849B957F8A8E838F8A7581898B8D8D8D90),
    .INIT_52(256'hFAECA96A687784988E867C79828A919DAAA79E998F8783879186828789868890),
    .INIT_53(256'hE9EDEEE2D0C3C6CED9E3DEE0E3D1DCD9DEC9B9B2AEB2BEC4D0DBC9B9CAE4F1F9),
    .INIT_54(256'hB5B1A995979F9FA0A7A0A3948E959FA2A9B1ACA3A6A39EA5A2AEB5BBC5CCD5E0),
    .INIT_55(256'h7B78757773656067606B7A7785A299856856546492AD9DA69B9B9DA1A9B2BBC1),
    .INIT_56(256'h676F756D727E8F9186848D7D71838875929991958F838D8A7E7E818281888C86),
    .INIT_57(256'hF3F6CF9A878C8A87797771778690949AA99E9EA2968D949C8A91928B878B959B),
    .INIT_58(256'hE6DEDCDDD2C3C3CEDEE7DEDBD7CDD9E1EBCCC4CEC9B9BBC6CFD2D1CCD1E2F2F9),
    .INIT_59(256'hB1999E92A99C9BABAA939C919FA3998D878F847B8082838F90A0B0BBC5D1DDE6),
    .INIT_5A(256'h818B83746D6666706B717F7F829494878261516896A69CB0A39B9AA5AFB6B8B7),
    .INIT_5B(256'h7772696D7F827F817B7A83766D80827188999FA19180888C8C898B84787D8A8B),
    .INIT_5C(256'hF4E8D2B194949A8D7C74676E84929091A69CA3A9978B92978B9CA79C8C848B92),
    .INIT_5D(256'hCECBCBC9C9C9CED4D7DFE9E1DCDAD2DFDBDBD9CFC0C3CBCCC9CBD3CABCD6F6F2),
    .INIT_5E(256'hA9A18F8E97AE8D8A907D928C8065585F5E645E5A5F656A767D8CA4B8C8D2D6D2),
    .INIT_5F(256'h76817E716C676B7B7F7378898F8F8D848A826B7D9BA4AAABAA9D9EA9ABACAAA6),
    .INIT_60(256'h7A857F787A776E72687078747478757A8B8F8E8D8279848B878890856C6B8290),
    .INIT_61(256'hE6CCBFAF969AABA38E7E6D728C988E829899A3A38E81838493989E9B86717585),
    .INIT_62(256'hAABBC0B3AEBBC3C0CDD6E7E3DCE2CDD8C3D0DAD6D2DCDFD3DECECDC5B0BCDDE7),
    .INIT_63(256'hA7A69A9196A08C7C858A8D6E524D545956575B5B5B5F636575778297ABC3CBC0),
    .INIT_64(256'h797470726D646F8884787383877E88908C8A829FA89CA7A8A09BA3ABA4A2A5A2),
    .INIT_65(256'h77928E7E7981756F596B7572756F6A858B867F7A7B818485817977786F6C7683),
    .INIT_66(256'hCEC2BAB1A0A1A69D978C7D7F8F968A7E8891988E7D787D7F84858C90897E7F8A),
    .INIT_67(256'hC0D0D3C3B8BFCBCFC7D4D9E1DDE1D2D4CDC3C5CFD5D9DEE1E3D6D3D9CFBCB7C3),
    .INIT_68(256'h95929A97A698A69A7B78583B314F6052615C66695F636861766F7175809FBEC5),
    .INIT_69(256'h8575767D7A727883737A73777672879894828DACA6949EAB9B99A7AC9E9FA6A1),
    .INIT_6A(256'h7A878383828B796C5B66707074716D858188877A7C8E8E857E6E646F776D6872),
    .INIT_6B(256'hA8B2B0AAAAADA9A296948881848888898693948171758186818A949A9A948273),
    .INIT_6C(256'hB4BFD2DDD3BDB6BDBFD7D3E8E8E3D9CDCDC2C2C4BDBDCAD6DFEBDBCED9CAADAD),
    .INIT_6D(256'h9192869B98A2A6937B5826333C4C544B605863685B636F656969695F5673A0B5),
    .INIT_6E(256'h857E8894928C81716C847F828F949D9D9A869BA090989FA7A09DA8AB9FA2A49A),
    .INIT_6F(256'h7978758A847D68656662676C747D79817B92987D77929A937772717C7C645F74),
    .INIT_70(256'h978B90A0AAA698888A9382707C86868E9F998E8B887D7A828082898D8C9E8681),
    .INIT_71(256'hABB0BDCACECAC6C1BBC2C9E2E7DEE4DED4D8C5B9CCD7D5DACEE0A7A6C6C9A991),
    .INIT_72(256'h90838F88A79F93875D2D252F333F474D5258544F555E646A796A6051484F72AC),
    .INIT_73(256'h978A7D9493848D7C818EA29896A69EA19F98A09D939FA59D96949B959FA2AA9B),
    .INIT_74(256'h75777669706F5C6971706B70818A857D848881737797A79C83667FA3936A617C),
    .INIT_75(256'h7A80929E988A817F8E9187858F897F869D9BA0A18D7273888374747E839A99A4),
    .INIT_76(256'hA0B7C6CDCFCFC6BEC9CCC7D6DBD8E5ECDCE5D6C5CEDCDAD6E0DEB196A2C1A989),
    .INIT_77(256'h818B8990A98F8D633C181A28282F353C3941403F48545B6270645D50443F4A73),
    .INIT_78(256'h808985898792B0A28B97A79E9CA197989B98989B928F9085958E959694878682),
    .INIT_79(256'h76767364666C646E72777F858383868A7F7A6F6875939F998A7A85908D857B76),
    .INIT_7A(256'h9293999D958B8A8E9A8A7A8594887B848B8B969A887578837A626A868B9396A2),
    .INIT_7B(256'h89B5CAC6C8C6BAAFBEC8C4CDD6D5DEE9EEC8D2E0C9D8F4EAD4DBE3C09DA7927F),
    .INIT_7C(256'h73808497B29E9C712A10161D16151820262E2E2C343B3E4249474A4640383247),
    .INIT_7D(256'h74898F938F9EB8A8989FAAA69F98888497907E8A918B928A8489928E8E8B8F8F),
    .INIT_7E(256'h74757C756D726F6D6D6F818B807C828487786B69718390908F847F7174898C84),
    .INIT_7F(256'hAAA29C9A95919199A3856D7385827D8A847F7F7F82898474715F6E8E8F847D7A),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__0_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0004)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__0 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[15]),
        .I3(addra[14]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__0_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__1_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h83B9D1CCCBC6B4ADADC4C7C7D3D4D3D9DED5C7CED9D1D1EAE1E1E8C0857785A4),
    .INIT_01(256'h878099A3B8B09679281415130803040D1D25252023221D1B151D282A2F302B3A),
    .INIT_02(256'h96918D939099ADA9B2ABA49B938E8B91988D6E859B939E979D9D978B847D7F87),
    .INIT_03(256'h7C7683887B7A7C76756E7A857C7B7B6F857B7C8586888D8E91857E706A788695),
    .INIT_04(256'h9FA3A7A7A19289909F8F807C7E7E8391908B85848E968A7683757887887D7972),
    .INIT_05(256'h81B5D2D2D1C7B6B7B5CDCEC3CED7D3D7CDDBD4CDDAE0D6D2CED9D9C8A78286A1),
    .INIT_06(256'h8F93AAAEB8B590622715130E06020009131F1D1A1A160C06000512121821263C),
    .INIT_07(256'hA1938F989595A2A2A8A39E9F9D95959A9A937A93A3939995ABA296958E807C8C),
    .INIT_08(256'h87757A8576748280827E858371737A7379747F98A3A19B948D8283807A767B93),
    .INIT_09(256'h96999CA2A897828097A1A89F8F878A8F969A9CA3A494858898948C8A96929890),
    .INIT_0A(256'h7EA9CAD3D3CABCBCBACBD2CAD3DED7DDCEBACBD3BED2E2C0C7DBD1B6AE9491A1),
    .INIT_0B(256'h94AFACABAEB0A1552315100C080600050F1A19161712070001050D0B0E192643),
    .INIT_0C(256'h96969FA298999F9993989AA5A59C9C9D968F8495988B989E91A2988D8E968F8F),
    .INIT_0D(256'h8C78717B6F6B797279818F866B687C8A8A7775879BA29D9382797A7B84858190),
    .INIT_0E(256'h938E878D9D9685879FAFBAB3A097918C97A5A9B0B69E8A999FA99D9AB4AFB3AD),
    .INIT_0F(256'h89B0D1DEDDDBCEC4B8B7C5CCD0D4CCD5DDDED5D7DFD9D1D9BCD0D8ADA69D9199),
    .INIT_10(256'hAABDB1ADA8ADA25820150F09070600030F1716121310050004050D0E111A2949),
    .INIT_11(256'hA2A1A69D93A0ACAAA3A69B9D9D98A5A89887849190909DA295A7927B75857E7E),
    .INIT_12(256'h887A6A6C6A6E7C6E6E75858B7B6D778F9882737583959890817771758C98909A),
    .INIT_13(256'h949892939D9A99ADB4B2B1ABA3A1998BA1B4AEAFC3B6989A9CADA2A2C2B9BBB6),
    .INIT_14(256'h90B5D6E3E2E3D7C1BEAAB6C0BEB9B3C5B8D0D6D5E2DFD0CFC5C7E4B9B1B39CA0),
    .INIT_15(256'hACA7B5B5B2B9986A1A130B030406000B0E15120D100F080400000B0E141A2646),
    .INIT_16(256'hA49FA7AAA5AFB1ACABB5AFB4AD9FA19AA6878995989B978C9C907476767780AB),
    .INIT_17(256'h877D625B647B938477727B95987F717E88837D7C82949B95887E7C86A0A597A0),
    .INIT_18(256'hB6A3928D9C9E9CB7B9A3A3AEA9A59F91A2B1A499A8A7979B9D969299C0C9C8C4),
    .INIT_19(256'hB0B8BFD9DAD2DDDBCDC2B6BBC7C4BEC5C4CFD9CCCCD8CBC0D0D2C5C0AFBDA1B0),
    .INIT_1A(256'hAFB2B0BECCB99065241D1017170F11110F0E0D0F1013181E010C01051D24244C),
    .INIT_1B(256'hA79FA5B2B0AEA89AABA5A9B0B3B4AEA29D8B8F929197928D948B767A827E9AAD),
    .INIT_1C(256'h7B8A7A7167749786836A82B3A28D937B83877E7A8D917E808F8D93A0A49D9A9E),
    .INIT_1D(256'hB6B2B2AEB3A48C93A79B9FAAA69E968BA3B09E8C9FB0A5948F9CA6A9C1C2C2C3),
    .INIT_1E(256'hB2D4CACEEBEEE3E0CDC1AAA8BEC3BDC2BCC3CDC6C5CCC4C0C1D2D2C6A5A8C4AC),
    .INIT_1F(256'hA1B7C1C2BBB19461362414242F1C0F0C15110C0B0D141E29272F233A432B307F),
    .INIT_20(256'h9F9AA4ACA8A4A1989BA1ADB4AFACA8A59890989B9698928C8D867F8B8D879AA5),
    .INIT_21(256'h788B8A83787B8F8A907E91AF9075848085918B829398867C8B959B9792929495),
    .INIT_22(256'hB9B1ACA5ACA68F8D9D96969A968B8486AEAB988DA2BAB7A19AA4A8A6BBBBB7B4),
    .INIT_23(256'hA8C5DAE1DBD8E9F4E4C6C6C9B1ACB5AEAEB2C0BEC2CACAD1C5D1CCB7B6A2C2C1),
    .INIT_24(256'hA5B4BAB9B1B3A475573E1818221913160D0B0A0C0D10171E3B46292325264397),
    .INIT_25(256'h8E94A5B2B3B4B8B89EA5B4BCB3ABA6A29C99A1A097938A878285899284829BA6),
    .INIT_26(256'h6D6E7686887B80958D818A967760717B8596908393A0988B7D929A8C8993958C),
    .INIT_27(256'hA4A7AAA1A3A69B9EACA99D958C848593AB9389949FAAB3B3A8A29C9BB7BBC0C4),
    .INIT_28(256'hBABCCDDBD8D9E2DFD1E5E4C7B3AD9D8798A2B3B0B0BCBFC7CFC3C6AEC2B4ABB6),
    .INIT_29(256'h96A8B2BDC1B2997B645F351916100F0D0A090A0D0C0B0D0F15261D2030516D95),
    .INIT_2A(256'h8D97A6AFAFB0B0B5A3A2ACB8BAB8B0A5A39FA39C9492878588807F857B8F9F98),
    .INIT_2B(256'h68606270817F7A8D7C78818C847A7872909C8F8080878B8885918C7B7D959F97),
    .INIT_2C(256'hA8B3BCA6999FA5B3ABA99D91867F8697A086889F9C98AABBB6ABA3A1B8B7C0CF),
    .INIT_2D(256'hC9DCD1CAE2EBD6D1CFB2C4D1BEC5BF8C9AAFC5BDBAC0BCB9C6BDD3C4B8BFB29A),
    .INIT_2E(256'h96B2B2B1B59E8A87817A512A160D0C09120D090909090D10170D1944597D98AB),
    .INIT_2F(256'h93A0AAADAEAAA6A89F99A1B0BBBDB8B1A29E9D9798998B86697C9092788C9186),
    .INIT_30(256'h797B756D7B898283686C7D8D989A856D828C85837B717C837B888D8A8C969793),
    .INIT_31(256'hB3B0B29E949C9B9E989A9B94857F8490978C97A79B93A0B2B4A9A2A5BDB5B2B8),
    .INIT_32(256'hC2D2DCD9DBDDDBECEACFBFC0BFB299837E9EBCBBBBC1B7AEB8D1D0D9C0B7C1BB),
    .INIT_33(256'hB3C2AA9CA6A2999799825D472C13100D0B08060709080A0D0E0F3C7B8A9DA7A9),
    .INIT_34(256'h93A3AEB2B6B4B0B2ABA6AAB5B7B5B1B0A59F9A949B9C837C77878A7853748DA3),
    .INIT_35(256'h88837F8A8F8B8D99706D7B858D978B7D717E86988B727F89707E8D989996918F),
    .INIT_36(256'hC6C3CCCBCBCAB6A6A7A3A9A4918D95978B8B97A69E91919A9F9E9C9DBAB9B1AB),
    .INIT_37(256'hCFBACCDEDADBE0EBCFD0CFB18E9FA3797893B7BEC2CAC3C0BFD9CED9D2BDC4DE),
    .INIT_38(256'hB2AB9FA8B5B4A992877872725230220D090506090B0B0C0D1F385B808FACBFCA),
    .INIT_39(256'h879CA8A9ABA69FA5AFAAAEB7B6AFAAA9A7A094899292776E747E858871837D8E),
    .INIT_3A(256'h8879779BA08B96A388737B82818B8E937F888EA3906E797D8C8380868E93979A),
    .INIT_3B(256'hBDC1D2CEC5C6C1BDBFB2B3AA9392A0A18E8996ADAD998E95A3B2B4A2ABA8A8A5),
    .INIT_3C(256'hD6D5D3CEDCDECBDBDED8D4C49E85838B8396B2BBC0C4C2C5CCC9DED8CDD3C8BF),
    .INIT_3D(256'hA98C91B1AEA5A99679777F7E594441281B110B090D1118203A5F77909BA5A7BF),
    .INIT_3E(256'h728B9A9EA19D9BA199939CADB5B3AEA9A49A897B8588726B6F899FA1757175A7),
    .INIT_3F(256'h837F778E938E9B8685626F807C7D818B818686978568787B9E897D85979C8F83),
    .INIT_40(256'hD7CFC0BDC8CDC3BCB7B9AEA0A2A3A1A5838591A79F99AFA7ACB0A89097AEAAA0),
    .INIT_41(256'hC9DAE9DBC8D2B3B6BFCECCBDB7A7877382ABB7A9B3C8CFCDC9C8C3BFC1CACECE),
    .INIT_42(256'h878CA9B292AC8F897D7678644547513C3B2403142B23293549677780A8AEB2AF),
    .INIT_43(256'h8093A8AAAEAAA8BBB2ABACAFB0ADA9ABB69B8982756F73707BAFA47F7B7B7F8A),
    .INIT_44(256'h85786A64818E8D676367747C7E8B876C68868C95897B8A86968F82808C887C7F),
    .INIT_45(256'hC4C2C0C3C7C5BDBAB3A9A7A9A5AAAFA8917E839D9F98A5AEA3A5A18C8A9EA3A1),
    .INIT_46(256'hCAD6D5DED6D9CDA1AEB6A9977E86A59D8184A4BFC0CBD9D3D9D9D4CDCACFD6D6),
    .INIT_47(256'h678A9F87A5A38983816E65533F4B533A272C121E3E403F394F787F867F8CC7B9),
    .INIT_48(256'h7B8DA3A5A6A6A5B3AEB9BCB7B6B8B4A9A69E99886A63748496A2857E8F7C6F82),
    .INIT_49(256'h827C726778857C65638C836A7F8E817A737D87848A908988788E7B6C6E747F78),
    .INIT_4A(256'hC5B7ADB1B7B6B1B0AC99A0A6979AA79D90888D91969FA5B0B6A29D958F969188),
    .INIT_4B(256'hB1C1C5D2D8D1CDA6AD9578756075B0A69A9E9B9FB6CBCCC4C8D0D5D5D1D0D2CF),
    .INIT_4C(256'h4688837FA980907F685A574F475257402B3F283257584B4046787A8B837EB0CE),
    .INIT_4D(256'h8795ABACA8AFB0B5AEB8B8B0ADB1B3B0A9A49A877171808D86737B93806B7880),
    .INIT_4E(256'h767876707E8D726A7181836D68869481787484727F92757D7885737F80728385),
    .INIT_4F(256'hC4B5B4BBB9AC9D92968B939A8D8D9A9E8D8D938995ABA8AFBA9A9AA19A989592),
    .INIT_50(256'hADB5C5BBCECCC1C0A16234405480B1AB97ADA69EB7CAC2BABFC9D2DADBDBDBD8),
    .INIT_51(256'h39496786857C6F68515057564D545A4F424C31446B5B4A50415E6A7980898BB9),
    .INIT_52(256'h8C95AEB0A9B5B9B5BFBDBAB8B3ABABB0B1A99B8D8688847B616D848267777A3C),
    .INIT_53(256'h6979837D8292737F848274686D74787E8079846E7B8D6C73756C6B8D97807D84),
    .INIT_54(256'hD4C5C1B79E91969F989594959389848C9586888C9CA9A2AFA8A0AAA18C929A9C),
    .INIT_55(256'hB1AAB1A3B1C1C3A8986C5252749B9D9DA89EAFC0B5B2BEC3BDBFC2C9CED3D9D9),
    .INIT_56(256'h2F2B3078726D663F44454642383A423F41462A40634E4150555A6464608C918F),
    .INIT_57(256'h7B87A4AAA7B3B2A9AFAFB5BDBEB6B0B1A9ACA397928A7C71778778686B737058),
    .INIT_58(256'h697C867870827494866C677679797A778D8884767D8777776E6E7E85919B867C),
    .INIT_59(256'hBAB1B8B69F9292909E9C9397A0947C798E909692939FA3A58B9BAE9987949283),
    .INIT_5A(256'h93979AA3949FBE784F61776E87A89AA2B7A4A5BABDB0B0BCCACACCD2D7D8D9D6),
    .INIT_5B(256'h2D0F2935455B4348393431312D2C2A242B361C2945372F35505D4B4F576B8481),
    .INIT_5C(256'h808DA9B5B9BFB4ACA7B1B6B3B6BBB5ACAAA99A8C8E8E8A86917E6A717069767D),
    .INIT_5D(256'h6E6B65596278798E7A576D8F848B967888909086746E7A848685998788A4938A),
    .INIT_5E(256'hC1AEABA6989AA098918C8F99A0A19386788C979798A9AF9574859992909A9187),
    .INIT_5F(256'h788882947666856E6B81907C859B9AA598A19CACCFCDB7B4BFC4CCD4D5CEC8C3),
    .INIT_60(256'h1E100D0E1B19344B403A373838342C26232F181F30272626304032374E455B79),
    .INIT_61(256'hA1AABAC2C9CABCBCC2C9C5B9B1B2AEA6AEA691869096959B8877787A6F828647),
    .INIT_62(256'h64564E516A7A838274807F8A9B8A778882889A98786A78868F85918C8D9E9E9E),
    .INIT_63(256'hCBC3C7C0A9A6AAA098909BA094989B896E697197B2BEBA8C808492948C83859F),
    .INIT_64(256'h7A7A5A5B4D2C2E74908B80828A919191A09DA6B2B7C5CEC4C1C6CFD5D3CCC9C7),
    .INIT_65(256'h2A070C1C1410274749433B36312F2E302D2F1B2633292F353128443538465B74),
    .INIT_66(256'hB9BDBEBDC5C3B8C2B2B5BCBEB7ADABB0A5A69B9498928D948F868285757F9586),
    .INIT_67(256'h5154616A7A7988827D838791947A78968B7B94A3918A86817E7C828F9AADB7AD),
    .INIT_68(256'hCEBDB2B6B9B0A0968892899D9C797B84706682AFBDBCB3A28D907B7F9092928B),
    .INIT_69(256'h7740292D442E2277A290707994A49B7994ACB6B5BEC0BFC5BEBCC0CCD8DBDBDA),
    .INIT_6A(256'h2A0D15040818144A4D463D402F3B38342C372227323A3436383B443F5058577A),
    .INIT_6B(256'hB1B3B6BEC1C1C0C1C0C1C0BAB9BCBBB8B1A39C928999A79D8F8E8E817A909983),
    .INIT_6C(256'h6B565F71817F8E9588879198937178908F8F76919E8F76737B7B90909BA59BB3),
    .INIT_6D(256'hCAC1BAB1A89D938C9E998C9F977481947F8CA2A79DA5B5B7A495797B909B9E91),
    .INIT_6E(256'h3B2B1D203413389DA47E748980839A8DA0AEA7AAB3AFAFADC4C1BFC3CACFCFCB),
    .INIT_6F(256'h460911130C101B3955594A4C443D3E3D353927323F40363B3D3A464C616E5B55),
    .INIT_70(256'hA2A7AFB8BFBFC1C4C5C3BFB6B6B6B6B4B5A99D8D848E99939EA19382818A8779),
    .INIT_71(256'h654E668088879C9D938383849484746F728B8D8A8A8B746580818C898E8F8592),
    .INIT_72(256'hCFCFCDC3B8AFA59FA8A19DAFA38C989F8596A0958C99B1BDB8A3919699989E9A),
    .INIT_73(256'h270F1B132E2556C3A775688482839B999FB2ADB2BCC3CDC7CBDAE2D9CDCBD1D4),
    .INIT_74(256'h631A10191D080F20546058535245463D3A3A2A3C4641373E3E47514A58766D49),
    .INIT_75(256'hA3A8B1B8BBBCBCC1BFBDB5AEABABACABAFA99E908B9196969DA79989908E817E),
    .INIT_76(256'h6A597484787599A9958D907B817E717073818E8484847D737A8388888B8C898F),
    .INIT_77(256'hD1D0CECBC3BBB3AFA7A6A2A9A5A5A8937B8A939596969EACAFA2A4B0A59A9C9B),
    .INIT_78(256'h361614261A3BA3A58E85787E878A98AF96AFBBADACB9BAB5BBC8D3DFEBF5EBDA),
    .INIT_79(256'h83572E111C032E6E625C685C5E59523F413F32444847424A5D5C617072604D3B),
    .INIT_7A(256'hAEB3B7BABABABBBEBBB6ADA5A09D9D9C9B9D98949598999FA3A9A39A94877773),
    .INIT_7B(256'h6C6C879492808B99A0969881888A79777E838B8D988D8C756D7D82899298A2A8),
    .INIT_7C(256'hE2DAD2CABFB5B6BDB6A899989DACAA8E7890A3A3988F8F999898A3A5A1A5A090),
    .INIT_7D(256'h1115222B4DA2C1CC908C807D8D979DB0A0A4C2BBB6C3B6BFB8BCB9BBCAE2E9E1),
    .INIT_7E(256'h82958A4D260C79F6996374716D6A5C4F47483D484A525A606A726A7570492F20),
    .INIT_7F(256'hB5BBBEBCBCBDC1C4C2BCB1A9A1999494939592929495979E9E9DA3A08B827F78),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__1_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0004)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__1 
       (.I0(addra[12]),
        .I1(addra[13]),
        .I2(addra[15]),
        .I3(addra[14]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__1_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized10
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__10_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h4138373E393133372D30393749553622111A1C1F3E5B5A4E4E4E453E47545C5D),
    .INIT_01(256'h22354F4037405C57545C5D4F51564845605D4752544D57543E4A525455575558),
    .INIT_02(256'hA19A5D24253A495D50483A363F474D58635F585249413C40493D393C3E3A3B42),
    .INIT_03(256'h9197958974676A7480918F97A1929F9C9E8671675E5C62626D746250627E8B98),
    .INIT_04(256'h5755503C414A4D525C585E514E576165727D767174716D7168706F6F72757984),
    .INIT_05(256'h413E3D3F3B2F2A342D38464049625540210D0B19475F4D524744434449515A61),
    .INIT_06(256'h31383D343B485A5E54525C49394A4A375861595D554C54534646494A4952544E),
    .INIT_07(256'h949D7D4E414B4D4A3C372F34434C4E546255575B4E454C524147463F383C464C),
    .INIT_08(256'h958D8A8778656570808D8A8A8C8998A0A7867A82776460666E6D6A6368788993),
    .INIT_09(256'h513D453B544E50666857625D6E73695F5C645B545A5C5B64616C74787A7F8690),
    .INIT_0A(256'h49534B3C35302F3A383D4B4947565345401E0B224E594D5E4E423E484F535556),
    .INIT_0B(256'h443D3336474A484B47465041374846374E5F656756474D52524F514C3F445152),
    .INIT_0C(256'h8F85775E474F5A4E3E33272C414F4C4C5E545B614F42494E41525A4F3C343940),
    .INIT_0D(256'h83807B76706D6C71747F8D8A898C87958F8F8B7D6C6D716F69686E61536B8A88),
    .INIT_0E(256'h4B4536394563484C584B65645C43373F4046433F464C4F575C64737E868A8882),
    .INIT_0F(256'h404C473A332F3343493D415154534E434A3F273653585B595546444C4E4E4C46),
    .INIT_10(256'h49534B41423D353A3039433F3F423C4150545352473F49524E4F574D32314858),
    .INIT_11(256'h79625C55445065614E3E2C324A574D3E52505A5A45393B3B494C514B35202333),
    .INIT_12(256'h65737561575D605A67708485838C7B88717E86827D858677806C6A5E4853707B),
    .INIT_13(256'h4A4A433C485B4E4457606A4F37363E4441464A4D4D5154535D585C6773838578),
    .INIT_14(256'h45403B3B342B344D4C403B494A4049504B473C565D4E58564B434B514A484A46),
    .INIT_15(256'h49625C4941473A3420333F3D4239324C4F4A433E3E46494A463E3D3E33303C4C),
    .INIT_16(256'h5B4F4E4F49525D59554D3E404F574C3D42495046353236363B393D40382B2B34),
    .INIT_17(256'h7E8A8A73606066675C6A717C7D867A7C756B6D787C8285868678727368524B55),
    .INIT_18(256'h3C3643455B566B6751553D251E3F5347575660645A5E6559675B524D50698283),
    .INIT_19(256'h5344424841373A45383F383A38334656503C456159444C5646435155494A524C),
    .INIT_1A(256'h4D5A514E4A4F3D2F202C383A3F3C394D464B4A3D3F53524942322A353B312D3A),
    .INIT_1B(256'h36414648525F626054554B4245494A49444D4D3C2C313B3F3840474C4942301F),
    .INIT_1C(256'h777D8B907F625353526A667E81837C727065656862626F7B838E7B6B74634540),
    .INIT_1D(256'h3D3F365056677467583D12232F434D465D5564695D656F62615A55403248707F),
    .INIT_1E(256'h4F4A525B544D42322E46414450525958563E515341484E534D4853584D505448),
    .INIT_1F(256'h4C4743554D442C2A2B282F363F4843473E555B403C5960593D36353E3E26233A),
    .INIT_20(256'h2E2631495B5F584A4B5645333D46464E5F574D4A473B373E3A3B3F413C4D352E),
    .INIT_21(256'h75707B8583786B5E4E5259737C79847F7476655B6F7B7B8074854A466466442B),
    .INIT_22(256'h473D4C4C716F6D67451B18262C3A444C51595550565F63677261513E30345384),
    .INIT_23(256'h58493B4F4F404938404F655956635A5C5A5156524851554C444049434E51594E),
    .INIT_24(256'h414342353C3926313938333949524B4245494639416371664B2B40645329223E),
    .INIT_25(256'h18223A4D4E47424251544A474F493F465F5D60624C3131453D2C2B3335494851),
    .INIT_26(256'h6F7C8A8D8A826F5E5F5C56656E70848C79807465707F807E87855639425F4627),
    .INIT_27(256'h3D4D4F5C7B696D492A0D1221252E353C3A42414049555A5F695D5243322C3652),
    .INIT_28(256'h3D463E413E4B695E4957685E595E515054504F5045414035443E454545383937),
    .INIT_29(256'h40403F3033392F393B40484D4A484B4D403A34303F5F6D63503E474F4A443935),
    .INIT_2A(256'h3539444D4C484B525C4C3A4453473A434C4C555A4633353F321920393C43434E),
    .INIT_2B(256'h5A7D908A867D6550575B545C696D7B888B6370806B7B9A907C8389653E473222),
    .INIT_2C(256'h35464E66867B7F5B18050E1814131820252D2D2B333A3B3F42403F392E251E28),
    .INIT_2D(256'h3146494D48567063545D6A655C53403D4C45333F463F443C353B444144404748),
    .INIT_2E(256'h42434A433A3F3C3A383A49534842484847372F303A4E5A595448413031484A42),
    .INIT_2F(256'h514E4B4D4F4E525C64462A30423F3C49413E3C3E3F46402E281323403F332926),
    .INIT_30(256'h58889D948E8165554A5A5858686C70787B72656E7C74779089898F66281A284A),
    .INIT_31(256'h4D4C6676928F7B6317090D0E0601040D1C24221F22211A181016201F201E181F),
    .INIT_32(256'h544F474E4A5167656F6962584E4843474C4122394F47504A50524E443D373B45),
    .INIT_33(256'h4A4451564A4749434038444B4240403242383D494E52555555463D2D27374455),
    .INIT_34(256'h4B545B5F5D5049505D4D3A363A3B404E4C473F3F484F432D392A2B37372A271E),
    .INIT_35(256'h5D8AA3A19C896E6356686358637170766A78726D7D837C79778284714E292C4A),
    .INIT_36(256'h5C647D869596784E180A0B0904010007101A181718140A0400000A070B121524),
    .INIT_37(256'h61514A544F4E5C5D65625D5C574F4C4D4B432A4355454C48605B51534C403E52),
    .INIT_38(256'h58464B564945514F4E4A514B3839403537303F5B69675F5A5043423B37343953),
    .INIT_39(256'h494F545D6555403E525C60584943454A5054545B5B4B3C3E4D473C3A4340443C),
    .INIT_3A(256'h5F85A2A8A5947C6F626A6C616B78777D6D596B736176896772867C61573D3A4D),
    .INIT_3B(256'h658686898F958D43140A0A07050500030A1314111310050000010703040C1730),
    .INIT_3C(256'h54545B5D52555955505756615F53504F443D3244493D4B554A5F5750555E595C),
    .INIT_3D(256'h5D49424C423E4841454D594F312C404B453232485C676155453A353640434150),
    .INIT_3E(256'h4A4A424A5C55434459677069574F4C464E5C5F666C533D4A51594D49605B5F5A),
    .INIT_3F(256'h6E90B0BAB7AB957F685E64666B716C767D7E777A837D78806579825750473B48),
    .INIT_40(256'h849B918E8D958E46110A0904040300000A11100D0F0C02000001070607101D38),
    .INIT_41(256'h606061594D5C666661645659544D575844302E3D4041505B5168564341534E53),
    .INIT_42(256'h5C4E3E403E424D3F3C43515643333D50543C2F3544585B5142362C3048565059),
    .INIT_43(256'h4C5550515C5856696B69666159595345586A63647869494A4C5C515170676863),
    .INIT_44(256'h7898BBC4C1B9A48375565B605E5C5A6A5B737979868377766E708E635D5F4851),
    .INIT_45(256'h8B89989C9AA586580D08050000030008090F0C070C0B0501000005080A101A35),
    .INIT_46(256'h645E6466616C6D6A69726B6D635152474D2E3040444D4C465B543D44484B5685),
    .INIT_47(256'h5B51362F384F6455453E465F6045363F443D3A3C45575E56493D39435E655861),
    .INIT_48(256'h6E60524D5A5C5871705856635F5D584A5764554A595747494D4541486E777573),
    .INIT_49(256'h9C9FA7C0BFAFB0A58B776465716E6A706C757F73737F746977796D6857654D61),
    .INIT_4A(256'h929997A8B6A67E5317120A11130B0E0E0A06080A0C0F151B00080000131A173B),
    .INIT_4B(256'h696064706E6D65596A64656968665C4C422E353B3D4949495652424B5658768C),
    .INIT_4C(256'h4F5E4E453B48685753384D7D6A53583C40433C3A50544141504C505D635E5D61),
    .INIT_4D(256'h6D6E6F6D7061464D5E50525F5C564F4458634F3D4F6053423E4B555871727272),
    .INIT_4E(256'h9CBCB4B8D3CFBFB1937E605A707670756B707A7170756D696879796D4C4F6C5A),
    .INIT_4F(256'h89A1ADAEA89E824F27170A1E2A180C081009070609101B25232A1D30391E236E),
    .INIT_50(256'h635D656C686360575A5F696C635C554C3C313D44424A494A50514E6065647986),
    .INIT_51(256'h4C5F5C574C4D605A5E4C5C79583B4941434F4B45585F4B404C5458565354595A),
    .INIT_52(256'h6C6B666167614947544D4B4E4B423E3F615C473C5068654F495357556B6B6765),
    .INIT_53(256'h90ADC4CDC7BFC9CCB38C86846C6771686466716F7075737A6A76705B5A46666B),
    .INIT_54(256'h91A1A8A69EA0926348310E101C130F12080605070A0D131A3640211918153284),
    .INIT_55(256'h55596874737478785E647074675B51483E3946484345444749515A695F627C8B),
    .INIT_56(256'h3E3F47585A4D5165594D55603F26363E4659534A5A685E5140555B4D4B575D55),
    .INIT_57(256'h525C60595B605558645E5149423B3F4D5F4438434E58616157524D4C6A6E7377),
    .INIT_58(256'h9FA1B5C7C5C3C7BDA6B4AC8B7772644C555B6A64616A6A6E7466695062564B5B),
    .INIT_59(256'h8296A0ABAE9F87695350280F0E0A0B09050405080908090B0F1E13131F3F5A7F),
    .INIT_5A(256'h545D6B7271707275636168706E665A4B433E4442404441454F4E535C5970807F),
    .INIT_5B(256'h3931334153514A5D48444C574C403E375563574A4C5356514A55503E435B6961),
    .INIT_5C(256'h52636D5B4F575E6D635F53473D383E4F5337394E4B465869655B54546D6B7485),
    .INIT_5D(256'hACBFB9B4CFD6BFB3A987939E8B938F585E6E81766C7067606A5F7162535C4D39),
    .INIT_5E(256'h83A19F9EA18A76746F6B421F0E0507070E0A06060606090C11050E3546678092),
    .INIT_5F(256'h5D687173726D6A6B61595D686D6B6255423D3E3D444B4547314A646A586F746E),
    .INIT_60(256'h484A433B4B595051343846565E5E49334C585251493F484D414D524E5460645E),
    .INIT_61(256'h585C5E4F485354585052514B3E393E484A3E49584C4250606459545A726B6A70),
    .INIT_62(256'hA2B2C3C3C8CCC6D1C9A9949593866F5647607B77707162525A6F6B72594F5957),
    .INIT_63(256'hA0B19889928E858386704E3A210C0B0A080503040605060806042D6974848E8C),
    .INIT_64(256'h5E6D76797C7874766E66686D69625B54453E3B3A474E3F3D3F555F503356708B),
    .INIT_65(256'h56514D585F5B5B673C39454E545D51453C4D55695E454F573A44535F62625E5E),
    .INIT_66(256'h686A787B7E816F605F5C605C4A474F51403B47554F4041484F4E4E5370706A66),
    .INIT_67(256'hAE99B1C8C7CACDD4B1AFAB8966787F50455A797D7B7C6E645F76676F68525975),
    .INIT_68(256'hA0998D959F9E937E7365626547281B0A080605080A0A0808172D4B6D7993A2AA),
    .INIT_69(256'h52667070726C6468726A6C70685C544D473F352F3E44312E3C4C5A604F656076),
    .INIT_6A(256'h544544686C576471543D43494851545C4D595F7664424A4C574D484F59616669),
    .INIT_6B(256'h5F677C7E7A7E7977776C6B614B4B5A59463E495F604A3E455465695762606160),
    .INIT_6C(256'hB8B8BCB9CBCDBAC6C7BBB4A17C636363525D757977756B686B64776E63695E5A),
    .INIT_6D(256'h977A7F9E988F938066646E6F4E3B392318100806090D12182F50647B858C8CA2),
    .INIT_6E(256'h3C55616568635E645B5358656660574D433A2C23333C2C2B3455707851535991),
    .INIT_6F(256'h4F4C445C615C6A55522F39484343455149525468563B494B6A53434B5F655A4F),
    .INIT_70(256'h7C7A6F707F857E766F7165575757585F40424B5E524B5F585D655F475068625A),
    .INIT_71(256'hB5C8D8CCB9C3A4A5ACB8B2A19987674B4E6E76636775766D66635E585C656C6E),
    .INIT_72(256'h757A969E7A94797469666A583A3E47343720000D23191E263954646B939A9E9A),
    .INIT_73(256'h465C6D70716C697C726A65645E554D4D563B302F27262D303C777052555C6876),
    .INIT_74(256'h50433632505F5D3731343F44424D482C23434F5B54485954605747434D493F43),
    .INIT_75(256'h6D707278807F78766D615E5E5A606762503D3F565349555E565A574442585C58),
    .INIT_76(256'hBBC5C4CDC7CABD919CA2917B616683744D46617671767E7376756F68666D7579),
    .INIT_77(256'h57788C738D8B716D6D5C5645323E473120240914323330293C656C736C79B5A6),
    .INIT_78(256'h3F52676A686765726D75746B625F564B444041371E192F4154674E4E665D5770),
    .INIT_79(256'h4E48403649574C3531594E32435040362C374648545C57564456402D2F35403A),
    .INIT_7A(256'h706660676F716D6C6653595E4F535F574D454747484F545F6854504B454C463F),
    .INIT_7B(256'h9DABB1BEC4BDBA93977D605943558E7C625E575667767164656C70706D6E7172),
    .INIT_7C(256'h35796F6A8F667667514645403643473321351E284A493B3034666778706B9DBA),
    .INIT_7D(256'h4C5B706F686F70766D7470635A5A57504746413425273B4A4435426357495E6C),
    .INIT_7E(256'h4648443E4D5E4139404E4D352C4856423535483B4C60464C444F394443354849),
    .INIT_7F(256'h7067697473685A4F53474D54464754594A484B3F475B555D6A4B4D564F4E4947),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__10_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0080)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__10 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[15]),
        .I3(addra[14]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__10_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized11
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__11_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h9599ADA3B6B4AAA887461722345C8B7E5E6C6053657365585C656D7577797A7B),
    .INIT_01(256'h2A3C56726D62554E393842433A42483F343F24375B4B3A402F4C57666D7578A3),
    .INIT_02(256'h515A7171697678747D78706A5E524E514F4B423A3A3E3C361D2D4B4E3C555D24),
    .INIT_03(256'h3A49514B5061404C504E3C2F32383C42433E4D3B4A5E3D42413633535D45444A),
    .INIT_04(256'h8278756F584E545D55504F4F4D44414952403E3F4C574D5B564F5B5540474F50),
    .INIT_05(256'h968D958797A7A88D7D4D31304E74746C6B5A6674635A61615A595D646A71787C),
    .INIT_06(256'h201F21665D574C2429282D2C22262E2E30371B31543F303F4247504E4A747B77),
    .INIT_07(256'h414A656A66716E676C6B6C70695D5351474E4A444240342930433B313C4D4F40),
    .INIT_08(256'h3C4D57483E4E3E5E4F352E3D40403F3C54545245505A4A483C38464C5A655245),
    .INIT_09(256'h68646D6E594D504E5A584D515B4F3A364B4A4D45454D5051394C604D3B4A4838),
    .INIT_0A(256'h767A7E877883A15B2E3F53465D7B6B6D765B5A6B685651596464676F73767879),
    .INIT_0B(256'h1F061D2633452B2D1D1715171415141119250C1934261C223B4733363E506764),
    .INIT_0C(256'h444E6974777A7168616A6A646060574C484B41393E423F3E49372A383E3E5063),
    .INIT_0D(256'h423E36292E434156401D33554B535C425660615947414C54524D604D506E5E54),
    .INIT_0E(256'h6D605F5E52555D534D4647515B5C51433748504B49585E4324384D494750473E),
    .INIT_0F(256'h5C6F697B5D4C684F485B664D5266636952544E5A78725751595E6771736E6968),
    .INIT_10(256'h100803020C061D31231C191C1E1C1612111F070E201512121A27171B2F243758),
    .INIT_11(256'h6269777E84847675797F7A695B584F464C4635303E4A4A503D2F343D38535D2C),
    .INIT_12(256'h392A212135444B493945435062524255535A6E6C4C3C4953574B565053676866),
    .INIT_13(256'h77737A776060645A514952584E5358482D272C4D656E6A3C3339494C443B3D58),
    .INIT_14(256'h61674746361213556C61514E5153514D554D545B5C666B615B606A72716C6A6C),
    .INIT_15(256'h1D010413080013302E251D181615171C1C200A152117191F170D251514213350),
    .INIT_16(256'h79797A777F7C6F78686A6E6D60534C4E42463F3E46443F48423B3B413A4B6866),
    .INIT_17(256'h2628343A45414F4740464A575B4443655A4D6675645D554C463F44505D727E73),
    .INIT_18(256'h796C636A6D67574E40483F545433364131263F67746F66534146333B4C4E4E47),
    .INIT_19(256'h63351B1D311806577B633C3E545E532C44575F5B61605C5F58565B69767B7C7E),
    .INIT_1A(256'h1B070E00000B033432291E21121F1F1E1B2A131620271C1E1B1D211B282F2A56),
    .INIT_1B(256'h6E6D71767A7775767574706862615B564E43403B3447554D3F40413A3A58695F),
    .INIT_1C(256'h402A303F4D4853594A49565E5A3B435D5C5E45626F5E413B3F3C4F4F5A676076),
    .INIT_1D(256'h736F6A645D534843514D40554E2C3B51404C5F61545A686C5A4E33394E595C4F),
    .INIT_1E(256'h2B22121323001D7B7A4C3B48383549394B574D4F534C49475E5B5A60686F706F),
    .INIT_1F(256'h3100070B04070C263C3C2A2B24202226232C16212B281B1E1D18202536422D31),
    .INIT_20(256'h5D60656F7374747678756E645D5B565252473F362F3C47414C4F43373C4C5051),
    .INIT_21(256'h3A22364E545061615445464A5B4E3F3A3D565A5759583F2B43404945494C4450),
    .INIT_22(256'h797D7C746B635954595450635C46545E44555C4F424E64726E5C4D5255565C58),
    .INIT_23(256'h160812071F0F39A07A3F293D342F4340455750535B60676163727D766B6B747A),
    .INIT_24(256'h4608010D1300020D3B42362F30242823282917282D26181D182027202E4C4127),
    .INIT_25(256'h5A60666D6E6C6E71716D6258504E4B484B474039363C41414852443B484C4650),
    .INIT_26(256'h3E2B4552443E5E6D595153414A4A3C393A48564E4F4F46393D4142404346434A),
    .INIT_27(256'h7C7E7F7E766F69645A57555F5E6166523A474F4E4A49515F635A5E6C61575959),
    .INIT_28(256'h260C08150522827B5C4C343235313C5239505C4D4955544F5360707C8B958E7E),
    .INIT_29(256'h5F3E19010D001E5A473C423537322E212B2C1C2B2B271E24333238464939261B),
    .INIT_2A(256'h64686C6C6968696D6B65594F45403C39373B3A393F4344494C524C4747413740),
    .INIT_2B(256'h3D3D56625E49505D655B5D475154433F414350556258553C303D3D414A4F5960),
    .INIT_2C(256'h8D88837D726B6D746B5D4F4E5668684D354A5B584B3F3F494B4D5B5F5C625D4C),
    .INIT_2D(256'h00040F1532829B9E594D3A30383B3F4E3F436158515D4E56505454566A828C85),
    .INIT_2E(256'h55736C34130067E07C414C45413E332A2B2F2129252A2F343C453F4D4C281105),
    .INIT_2F(256'h6B6F706D6A6B6E706F685B50453B34312F3334373E3F40474542484A3B383B3E),
    .INIT_30(256'h4044414B705E474B5955605A63594A47384850596B5F5D2D2C3C414951535D65),
    .INIT_31(256'h8782756557525D6A6852424756625D4A3C505D51403E3E3B4058654B41575443),
    .INIT_32(256'h042C1A559095747D7243373C3F4B4A4764495C62595038455B666556505E7685),
    .INIT_33(256'h53585F421D1270C9B4594B4C453E3135282C202824303B413E53586C4E110E15),
    .INIT_34(256'h757A787370727476736C60574C423C393D39373D3C3D40443F384346383D4C50),
    .INIT_35(256'h424E362E62583E4A4D474B56634E4A4B3E40373E4D4C594D3F4550575C5B5A64),
    .INIT_36(256'h87887E706869685E4B46434551554B443A3C433F39414538435966493C494548),
    .INIT_37(256'h260C4C8B807D58505C40464A47494C575D48495F5E555B615D6A76797B7F7D79),
    .INIT_38(256'h54596B5A220554C4C7874B484B473E3B302C2032343E4B5163608FD88A080C2A),
    .INIT_39(256'h7C7F7E7B787A797671685D544A413C3C3D33384542434442454548463F424950),
    .INIT_3A(256'h456155436659424B63452B456A5A543D4A362D28364A577C5C50565B64675A6A),
    .INIT_3B(256'h8189867C83876D4448595C4E51554E4B3626313F3A3D454146434B49504E4051),
    .INIT_3C(256'h2C48817B58554F4E3F3F3D3D575C48564E514154514D7067707C8480797C868F),
    .INIT_3D(256'h53535961481534AEC3B2554857605A4245392F4A4F545E646972B1EF90253326),
    .INIT_3E(256'h797D7E7C7C7E7D7875685A4E43363131281F2E44454548403B4744424D4C4952),
    .INIT_3F(256'h576B5E455E5A4E4F6A563754745B5C45474249303D6C587B6E515352606A596F),
    .INIT_40(256'h79797B7B77664B36422C374151665F554B3F322B372B37534F325550433F4B5F),
    .INIT_41(256'h477D9C8155454545514E4E5254534B4450564F3F393E49544B4B576E796E6B79),
    .INIT_42(256'h525C5F6252421A95C1C096523F5172706B575A7061586A65578EC0E15F1E3A28),
    .INIT_43(256'h86868A8E8C8A8276746F675D4E40393A33291F242E383C3C333E474B4D4C4748),
    .INIT_44(256'h595B645A5E52534C5E706E6459565A4F464F5041516B4A676B5D4F5A7375707A),
    .INIT_45(256'h7A76787C7A6E584A382735454D59595B6A56565043242F41393E4E3C323B3D47),
    .INIT_46(256'h6F8F9E855F525151404A52565251555857574431415B5A47474E4E51667A7C77),
    .INIT_47(256'h565A5E675D51115AB4BB92320A212B4A667754343B2C234270BBC3CB2E0F2941),
    .INIT_48(256'h7D7E82878786837B7D766E6554463D3D36302B2E343734343940434445474649),
    .INIT_49(256'h635C5E5C5F4C54645D6A737563545A59555A4A3C484F3C5466564B5A7374707D),
    .INIT_4A(256'h807B7A807F776A655B454341353D526860505E5B483342443C4035363A3C2D33),
    .INIT_4B(256'h869A9C80686760504D555D5D534E525748483F2D28374F5D585652576D7B7E7E),
    .INIT_4C(256'h474F5D6D6D610A23A497291518070F0E1F31200606000846ACBDCC8E101C3758),
    .INIT_4D(256'h7C7A7F817E7E7E796966605A4E4540412E2D2E35393B393941454A4A47443E3C),
    .INIT_4E(256'h6B5E5D65684B4F6E725D566B6C5B4F3B4E52423B4A3E3746554439455D656772),
    .INIT_4F(256'h7F77737876706A6974655C462828445E5A59604D43424F453C382A40423D302F),
    .INIT_50(256'h9190857166655E5353524F4B47423C3B3D3A3E444549555C6062646F7A79787F),
    .INIT_51(256'h48535D66675300104C775C28130B0B0B1610110C090A153A98B3C3530537758F),
    .INIT_52(256'h79777A7C777777726661574A3E363030252427313940454C3D444A4D4D4B4543),
    .INIT_53(256'h5D5758656D53495D695A59675D4D4E484144463A4C413741564F475064747779),
    .INIT_54(256'h78726D6E6B635D5C59616757372F3F455769674646464E4E32393E4F393C3F36),
    .INIT_55(256'hA1866D635C57575F4F49423F403F3A3732353A3B435861535D6A6F707A82807B),
    .INIT_56(256'h4A514E53624F04271F97DD8C40100F0E1018180C081731538DB3983404509593),
    .INIT_57(256'h727074797472716B635E51453A322E2E2121242D343D454D4A4C4B48484A4847),
    .INIT_58(256'h5B5D5B65706D5E5C5A5D5E5D4D4A5F684344583E4D4C363F565754535F757A71),
    .INIT_59(256'h817E7A79746F665E4E5A615E4743524C475F61494C4752635144515F47424642),
    .INIT_5A(256'h958E78605A636155534F47413C3B3C3D403E43413747626C6D6E687080848285),
    .INIT_5B(256'h494E4A566F66202D2B85D4C1C0865427321C162C334B9ADAC16B85340A5A8B77),
    .INIT_5C(256'h7B787C7E7876706759564C413A3937372322242A2D31353B484949494A4B4B47),
    .INIT_5D(256'h68675E6063736B5D63645043454E5752434D6F5B5F613D42585750434761716A),
    .INIT_5E(256'h878B8C8A878275665658575E5352605646535A47454550535F41484B483E373E),
    .INIT_5F(256'h75837D636171694B4E473C352F2E303138252D4341424C4E6D6A677281818089),
    .INIT_60(256'h575458596B75351311308970CBF288848C6764BFDCA6B3DCA32F793E18699389),
    .INIT_61(256'h7E7A7B7E7871695D5B5950443A37312C252122272A2E3339343A414952585955),
    .INIT_62(256'h695E575B4E5D5A4E596E5C413A3A3E414455706F6A684C526A656158556A7E7F),
    .INIT_63(256'h81878A89898878644D4E5168655A5945484A503B3A4E5B4038333D202B322731),
    .INIT_64(256'h6561616567655E57443A2C2A2D3334312C222F3C42535D4F4C66706C7480827A),
    .INIT_65(256'h524B52494F7A521316142E1F80A36AC5E8ECABD1E76E54AB595A47303398AC86),
    .INIT_66(256'h716C6D706D68605456565048413F3832272222262F364048404040454C555A59),
    .INIT_67(256'h685A5C6B525757515074664D443C3F494D5C616A5F5C55635F626E787175807D),
    .INIT_68(256'h878E8C86888C816F585E5362685E553F3F4A4A4A51557053373C31262B323843),
    .INIT_69(256'h987C696E776E594C4239312D2B2B2C2B223034394B525E78665F606D77788189),
    .INIT_6A(256'h4E4F5A6572846523172C382F3B26367881BF856A98313B64452A213569ABA4A4),
    .INIT_6B(256'h786E6B6F6B5F5D615D554E4D4338373E332D292A2E333B43453D3B474E4F4F51),
    .INIT_6C(256'h574253785E554E4A3F465E5045464E48394A5C4A4B524B6868606A77727B857B),
    .INIT_6D(256'h8A8C8985878D887A70684B42525E5B4F454B5E686354615753442E252F3A3B3A),
    .INIT_6E(256'h887E746863625B51433121202529231C262A31414F4F577078726B707C858C8D),
    .INIT_6F(256'h635D666576867A461D1520325448405A595E65543A517050301E2742A1A58B8B),
    .INIT_70(256'h6D6F6D67666A69625B5B52473F3F3E3C2E2F3136383432332F3A485252525B64),
    .INIT_71(256'h644F4A68575751514A4354504D4C5558482E29293B433C58524A505B636F756C),
    .INIT_72(256'h91918D8A87847F76746B4D3546584E4D5149667163505A6C4F3F33312F302D25),
    .INIT_73(256'h67646259545455524C433A383734302E2B23253542464A536A79807D797D868D),
    .INIT_74(256'h5B545D5F758A947D3618151822222A3F3F5355565F6D43241B1F4489B9B1846D),
    .INIT_75(256'h6268675F636D6B605B5C574E4645413B3C3B3A3B39343336373C424E5861615D),
    .INIT_76(256'h485A5C5F464E5464463C50555A565D6651372E263143404C4E5255555C686E6B),
    .INIT_77(256'h8E8E8E908A827B777775654F59604C5A57496463514E54725F4E494B423E382D),
    .INIT_78(256'h60514D53574F48494D43372E2B2E3A422F2F363D3D454D504E677F847C7A8188),
    .INIT_79(256'h5C585A60657D8B876D3F2814060B0F0B0C1C15191B081324284C79B2B0AA8B6C),
    .INIT_7A(256'h686666686D6D69655F5B5D6158484043454039332F2D31393A464E4F505B6062),
    .INIT_7B(256'h3C5C573831393C3B454A615A554B494C4C40423C3E4A4644445B6052505F6A6F),
    .INIT_7C(256'h86898C8F8D8884837C74675A62614E635349645747534D5C735946413C404137),
    .INIT_7D(256'h655044484B4135302C2A303B413D31262A364C564A444F5E5557647B8C8F8985),
    .INIT_7E(256'h61635761577079878A6A563510120E000D030112131A2F335E8BA69AA4888279),
    .INIT_7F(256'h636466686C6B6862626065695D4C43483D393634312D2F3238434A4D52616666),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__11_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0008)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__11 
       (.I0(addra[14]),
        .I1(addra[15]),
        .I2(addra[12]),
        .I3(addra[13]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__11_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized12
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__12_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h334E4F27332830353D566D564E4C5050583F3F525E5D514C4D6A6D554A555D5E),
    .INIT_01(256'h8C8D8B8B8782817F7A6C5B575D523F494B475C503E565154746B5F4D40424B4F),
    .INIT_02(256'h5C53463C3A3C372E32302F30302E2D3038394C6A71615D6970615D6F88948E86),
    .INIT_03(256'h5C5E5159516B7587807D7D623A3728150F0B101F1E43477A97A6B09E8B77716F),
    .INIT_04(256'h5B656966666E6A5D5C6262594E4A454345424141413E3A3A383A3D475867655B),
    .INIT_05(256'h2537493C53353D512F485A41434E5A6362564A505D655E54515E63564F575B5A),
    .INIT_06(256'h91938E8984807C7576706264614D3C343E3B4A4E3F51566051676B543C343E4D),
    .INIT_07(256'h5B544A3F383A39371E222828231B1C2233302E415D60555574706D717B85898A),
    .INIT_08(256'h5C5D564E525A66706F73797F7C7B533C4020305C669099A4A89FA7A6717A6B63),
    .INIT_09(256'h646D726E6D716E6A5F605C544D4B443E4B4847494946413E303C474C4B515A5E),
    .INIT_0A(256'h332D2738605442463E41473741403F495A6C5B444653544E383547575554606A),
    .INIT_0B(256'h878C8E8B8C8D887F6C73696B5E48423531314558474C53644D6A6E57463E424F),
    .INIT_0C(256'h614E423E352721212423252A2E2F2E2E3B4A3C2F465F6364636F757278848B89),
    .INIT_0D(256'h55545947595161615A646670727D6E7D7576717E918DA9939695A27B7472686F),
    .INIT_0E(256'h6966696F6D62646C695D585D5A4E43423A3B3E46483E32293D3E40444B53585A),
    .INIT_0F(256'h36321C2E4E655A615A4A4A4D604C394062715C4A4947495244384D6A5948566C),
    .INIT_10(256'h8B8C88878C9898928482715C4A3B3C523D2C4751464F5B66687865665D3D414D),
    .INIT_11(256'h614536352F282E37332E1F1B2A3E474B4C534350414F6C637179716B767B8088),
    .INIT_12(256'h575D5051554B4F4A49545E61686F6B62696C767A847A8B8C80747A726E756D6C),
    .INIT_13(256'h67696A66686B6B68616462584D4A47483C41464335313A4345413B4540485F52),
    .INIT_14(256'h3A3A231F4B547E66604D6959514E3D3B4B57484134404A5F6E5D56636C686466),
    .INIT_15(256'h82888B8B87878C959A90785D4A3F393D43394A5858606769465551666E574934),
    .INIT_16(256'h77644B40444940342F39372D272C3B4F555E4F55484A594B5F71777375737783),
    .INIT_17(256'h5A5D4F5451464442444C5253586262615A5E6B71756E6F735654676A5F5F6476),
    .INIT_18(256'h6F71726C6B6A686568655F59555349423E4F4E40383F413B383433352F3D514B),
    .INIT_19(256'h474E483A5758656F63526B5A4F463B415259555F54473E52626969636671766E),
    .INIT_1A(256'h898F95988F85889587858B8D785A43363D585C50495255413C4D5B685643504E),
    .INIT_1B(256'h64634F3B393F3A3414222C35393B425259625652504B584F4A5D6B6F716F727C),
    .INIT_1C(256'h5C5F4C574C453C403C4348494C54585A5152636A66665760493E50615F57525C),
    .INIT_1D(256'h77797B76726E6B686B67625E5A56494146534B3A3C43413F38373C2E273B4A4F),
    .INIT_1E(256'h66625E51717B617C6D555D4C4544464D54615E636058474B4E6670635F6D766F),
    .INIT_1F(256'h81878E989C999A9E938683857F76614139544F556A76796364555057443A4A47),
    .INIT_20(256'h4F534D453C36303731281B1E2B374354555C53484F4B606351555C636D737374),
    .INIT_21(256'h5A59455446473A453C424748484A4C4E4645565C535D49575A4445565D574B43),
    .INIT_22(256'h73777B7876716F6D6A6A6963595149474E4C3A363D37374C35383C211D333C4C),
    .INIT_23(256'h8279746D7A845A64796A69534444555C5E5F504E58574C525162706C686A7076),
    .INIT_24(256'h7F858A90979E9B929695896C586262483339385356383F595C4E3E38353E3D21),
    .INIT_25(256'h453D383D413B291F3E36261E2127384D4F58574B4F4A5C646C65646871747271),
    .INIT_26(256'h5150404C3F463845434446464545474C3E374348404F3D4E594E484C4E525650),
    .INIT_27(256'h6C6E7273726F6F6F6E6D6862574F4A4B50463435392A2B4933383618192D3247),
    .INIT_28(256'h6C7881856D6E5D565F6366514045686E7059404B604A40595B5D646664636870),
    .INIT_29(256'h808B8F8E9095928C8686878169534B432F3036484020274C4C6154384266694E),
    .INIT_2A(256'h4E3D353A3D45412F262B2A292B2C344249545F5E59545A5E716D707571727372),
    .INIT_2B(256'h49483E423A4538434A4542413E3F464C40383D3E39423B494A4D4B4D4E545A4B),
    .INIT_2C(256'h6F6D6F70716E6E6E726A615D58534B4A4D483B36332827373741311A2231354A),
    .INIT_2D(256'h5D6D747D5F636F64645E4C3936426C696B66585A705A4B5B5D5D5855585E6467),
    .INIT_2E(256'h757B81889096999A97796877826A4F464A3D3938474C3B363F5C45254A786B52),
    .INIT_2F(256'h3B262D382B2D3B3930332B24292F3740484C5D695E6364656D68707873757A7B),
    .INIT_30(256'h47474640424D3F454D443E3F3C3C424A4740413F423E40464448464E5356543A),
    .INIT_31(256'h7B757171737070706E68605E58514D4D4E493F362E29282B3B4427192A303549),
    .INIT_32(256'h6E6C636963656C648B71493935355B5356716E596961575B6465615F61666B6D),
    .INIT_33(256'h7B74737F8A8C8B8D848677696A685B533636443E45544D53375A4A375F724C3A),
    .INIT_34(256'h301730513B242C312C38393333373C434B47536456676A6A746A727B7B818783),
    .INIT_35(256'h47494F434C55494B514844464440414746424241483B4443494A42494B4C523E),
    .INIT_36(256'h807871737371707066686762554B4C5454453B362C282A2B464F2B2037373C4A),
    .INIT_37(256'h5E5A56606F6B60656F61494436244F534B69664B55494959615E63696965666E),
    .INIT_38(256'h888A83767481878687797266655C4D5C494E55575A635E48425477787E4E2831),
    .INIT_39(256'h3732343E40352A2422213434373647424D46506C61546A6E7877787980878784),
    .INIT_3A(256'h4B5350505B5C5458595150484E45494447444649454C50484753584749434442),
    .INIT_3B(256'h787675716F6F6D6B706C655F56525052563F343B3A2D2B36433F362C33464F4F),
    .INIT_3C(256'h5249646E6F8B6B6258535E4A364142445149655A4A4A59606D696C646F6C7270),
    .INIT_3D(256'h8787877D76777F85847A73645F5C566A6660544054716359586862696D250020),
    .INIT_3E(256'h423A3435312E292926273432383A4C4F5650556D6A606C6A7276787D84898A88),
    .INIT_3F(256'h525B5B5B605E5C666158574F554B4E4F53504C464A5252564F54574C52463D34),
    .INIT_40(256'h64676A6C70717170706E6A655F5C575455453D413E3431383E393638434E5456),
    .INIT_41(256'h52494D6C767163544D525B4834404B4C4D3C5D6A695E646D47576B6769666B69),
    .INIT_42(256'h8E8E8E8D847A777D7C766D5B55585B706F6756334A6D57575E6C5554463D4853),
    .INIT_43(256'h38352F2B232120222E353C3940404B555D5A57676D696D6A7175787C80858989),
    .INIT_44(256'h565D6162615D6170695E5C595B5257605F565349505A54605F5A5750594A3B30),
    .INIT_45(256'h67686A6B7074787B6E6E6B666463594F4E48413F3B353334393539434E525459),
    .INIT_46(256'h4F5454575B545951544E4543404654554C424B44566D6E53595B6B7272656468),
    .INIT_47(256'h8F8C8D919083756A716F685C575C5D645D63624B4954453F4E6B665B3F5E6447),
    .INIT_48(256'h3237372F2523262C303D43454D494B575D5E595C64686C6F777B7F7C7D82888B),
    .INIT_49(256'h5B5C5F62605D6470685D5B5E5E565F6C63535D5654625C5E66625D50594D4033),
    .INIT_4A(256'h686C7173767778796F6F6B666464574A4A4B453C35343230353A40494F515558),
    .INIT_4B(256'h6D5D6345424246596C52384950475B684C3D3B35414F626151535E68685C5E68),
    .INIT_4C(256'h90939698989386796F6B615B5A5F615B56626C7764595D443A5C5D584E5E3933),
    .INIT_4D(256'h30363B372B282D362E3B414A525253605860615D5F646872787F85838284898E),
    .INIT_4E(256'h645E5E6365676B6F685F5C625E595F6E6C5363665664685E6367635253493F34),
    .INIT_4F(256'h5B6571787C77736F75746E696563594E4D524A3B3437362D323E45464850595B),
    .INIT_50(256'h72474849524752717665494F4C405A716351433A454D58514A5C6B6D5E535865),
    .INIT_51(256'h8D979C9A979798947D6E554A455062604B4E59776B617353374348463B503437),
    .INIT_52(256'h262F3B443D332E32393E3F4B4E54586459616E6A6365666F707A848887868A8D),
    .INIT_53(256'h68606164656B6F6C696662696262616C7661686F5B6171666269695B5A4B4239),
    .INIT_54(256'h656C72757675747477746F6B655F585351554B3B363C382B303D434248576162),
    .INIT_55(256'h5249476465567677746A4D3B3E4650565D62533C46515A43594D4D5E4E3A3B57),
    .INIT_56(256'h8D9192938F8C8D9089795E4F40435D5D413B3B4A46454E333E49504E323B2D17),
    .INIT_57(256'h2E2E384B50473D3E484441504F595D655E5E7373676A696D6E77818485868A8D),
    .INIT_58(256'h626165625E67716A68696570686C676D7776696D645C6F6D6A656561654F4847),
    .INIT_59(256'h747676737373777B726F6D6D645A56594F51493C3C413A282E343A414E5C6466),
    .INIT_5A(256'h3F5660735957745A625D432939514539374853544C38556D6F50415E5E56536B),
    .INIT_5B(256'h9B949097958A838388857A7258495551564F453933322311375A4E5452433537),
    .INIT_5C(256'h3C2A27384848494E4D4444575361666A63596E72676D6E70777E838382868E94),
    .INIT_5D(256'h5E626B645962706B636866736C736E70718567696E57646C725F5B616C544C54),
    .INIT_5E(256'h6A717678777474746F6C6E716759585F51524A4042473B292D2C3142545F6265),
    .INIT_5F(256'h3637556C50646B5A514E432C3C523F39334C54555D525B546A6F636564746B61),
    .INIT_60(256'h938E8F938C8081887F73726D5E504D5F5F5E564A3A4E46433D463F3739332727),
    .INIT_61(256'h553A21264133404C5A504C56585C6C68615A686A746D7676757B848B88848892),
    .INIT_62(256'h63726A645F62716B63676E726F6279706F8779645C58626E61776F5A6A674A50),
    .INIT_63(256'h6A6D7072706D72776C70716D67645B554E50493F4C433B292D293A535A595955),
    .INIT_64(256'h38292637414B786A5C525861695C5536394138406A4D555E666F797B77767066),
    .INIT_65(256'h8C90918F8A8373656D6C61575559585F686F6B5347595143363827293C4C4443),
    .INIT_66(256'h5652483538393B495A4E4A5759596767615B606674797E77787A7E828585878B),
    .INIT_67(256'h6A766A646265706968676B7473647377728576675D50566468757360686F5A50),
    .INIT_68(256'h74685F646E7470696C6E6E6A65615A544B4E4A4749392F262D3E4A5051565F66),
    .INIT_69(256'h241E34293B55746B4E4D5B69705F583B2D40363A6C5C667970747E817B73716F),
    .INIT_6A(256'h8B8D8C8A8784796D707260545352535F69675C3E46594F373F4C3D3A3C4D4A51),
    .INIT_6B(256'h5B615F47393F33455B504B575A5662646262626A727F817D807F7D7D82878886),
    .INIT_6C(256'h77786C66676A6F666F6B657877686B7C727C6D665D4D54645F677A72615C5658),
    .INIT_6D(256'h6A68676A6D6E6B6672706C6663615B574A54514C413B2F2C3C474B52595D6067),
    .INIT_6E(256'h27295E4B494A49574E5A65626460654E37334C38475766827A6D5344546F705D),
    .INIT_6F(256'h8B8686898178777F7C736160573E446571584938525B493139544D4336424150),
    .INIT_70(256'h626358594C4534495D5851565957605F62696974717A7B858585827D82888885),
    .INIT_71(256'h7E776B676B6E6C636D6B607478706576757968625A4F5A685959727C6A4F4558),
    .INIT_72(256'h666E737168676C716E69636163645F5B4C595145384537334E4043565E606871),
    .INIT_73(256'h3F2542545B50222A4D555F6060566C73603580542451667B6B68523A3C52656D),
    .INIT_74(256'h878686897E6E666A7969545F5A414E6E66473F425F533E394659534F4D534545),
    .INIT_75(256'h5C644E67604945515F645A58595B615D63696776777974868285837F82878A86),
    .INIT_76(256'h736A64636A6F6B6567675E6A7378656B7779686058535F65665859697B66454C),
    .INIT_77(256'h72706B67676E72725F5B5B6066665D55535249433F4935374E394557515E787D),
    .INIT_78(256'h3A261F3E4C64434057525F73693F507264438A6F33546D6E6A53485963535169),
    .INIT_79(256'h898A86827E796D6071644D595D5A6A6C4D3D3D4654443D564C5C6262685A4134),
    .INIT_7A(256'h4B645066644C5756626A5E595D5D63626565616D7C7D76848083848585888D8D),
    .INIT_7B(256'h60595D61696E696A626160626D796A667271625E58586567695F504E6D745347),
    .INIT_7C(256'h6C6C69686A6E6C645F5F646A6960524A5E4B494C4D472E3B443A49514D62725B),
    .INIT_7D(256'h3046383B38747861414D5E69684D5C714753667668657A6B61544D5B63525473),
    .INIT_7E(256'h8D8B847F7E7E7970665F4F5A5C616D50414A4F514C434162424E5B52583E3432),
    .INIT_7F(256'h44584F5B6756605E686A5B5E635D626C626B68647B7E7F8384828385878A8C8F),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__12_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0080)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__12 
       (.I0(addra[14]),
        .I1(addra[15]),
        .I2(addra[12]),
        .I3(addra[13]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__12_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized13
   (DOADO,
    clka,
    ena_array,
    addra,
    dina,
    wea);
  output [7:0]DOADO;
  input clka;
  input [0:0]ena_array;
  input [10:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire [7:0]DOADO;
  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [0:0]ena_array;
  wire [0:0]wea;
  wire [15:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h575361666E726A70665E676166726F6B7568575956576B73615F5A474C60584B),
    .INIT_01(256'h616A6F6C6666635E666A6F6E64574F505F50564C4E45323E4144484853625D45),
    .INIT_02(256'h3D4D4C4142767E53586C6C605E4B4C4A525B5776837A857C8878574E67746D6E),
    .INIT_03(256'h8E8986877B6F6A7251514E5F555159313656625B4C4532445F574F2F351C2833),
    .INIT_04(256'h484B4D57726464676B675761685B61745F747661767C858888807E828685868A),
    .INIT_05(256'h59576A6F74766C76695A6C61646D7473846A515551506A7C635A614E3A4C554C),
    .INIT_06(256'h6A6F6A615C61646365696D68595056625555603F41443A3D425149414E55545E),
    .INIT_07(256'h40416258526275644E5154636D514C556D515D6D6D797D839598847070696473),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:8],DOADO}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized2
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__2_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h7276737EA6947E84928E9B949B908182798B8E94A1939163667B848F9B9EA9B1),
    .INIT_01(256'hDAD1C2B0A09CA6B3B39C8C8F9AA29C8B8099A9A09191928D8FA5AF94889D9A87),
    .INIT_02(256'h1A443673B2BA9EB1AB857F8C96A6ABAAC7ACBFC6BFB6A1AEC3CECABBB0BED3DE),
    .INIT_03(256'h87858661362786E1D27E767B777061604A4B424C4D5D6A716F8183936F2E272B),
    .INIT_04(256'hC1C6C6C3C3C7CACAC7C0B8B0A8A09C9CA09B97989594979D9A939E9D8A88918E),
    .INIT_05(256'h75816961988E7481857F85909B8682878185787A827E898176818F9BA6A8A6B2),
    .INIT_06(256'hD9D5CBB9B0B2AFA6958E8B8C939487838287908F8D979B8E96AAB29385918D90),
    .INIT_07(256'h402B6FAFA8A889879986919E9DA6AEBBC1ACAFC5C6BEC4CAC5D2DBDEDBDDDAD2),
    .INIT_08(256'h918D987F3F1D6BDEE8AE797C807E736A5851485E63707E84958FB7FBA61E1E3E),
    .INIT_09(256'hC8CDCFCDCDCFCFCCC7BEB6AEA8A19EA1A09598A09B9A9D9DA2A3A49F94909191),
    .INIT_0A(256'h7A968A789C8F7881997B617BA4948E7B8E7C6C62697C86AD8F88959EACB2A8B8),
    .INIT_0B(256'hD5DAD3C9CED1B68D92A1A49595968B8C7E7280908C909894969399959B9A8C9E),
    .INIT_0C(256'h496BA7A48586868B85888D93B2BCABBBB5B8AABDBAB6D9D0D8E4E9E2D9D9E3E9),
    .INIT_0D(256'h928C8B8A6A344FCBE4D88176878F886D6A5C557379838D95979DD8FFAA3B453A),
    .INIT_0E(256'hC4C9CDCDD0D4D1CCC9BEB2A89F9593948B828EA2A0A0A39B96A29F99A29C9498),
    .INIT_0F(256'h8DA1937A949082839E8A6D8AAA93927F89848768709E89ADA18B9295A7B4A6BC),
    .INIT_10(256'hD1CECFCEC8B699818D77818B9AAFA79D95897D768376829C9A7DA09C908C99AF),
    .INIT_11(256'h649DBFAB877D858C9EA2A7B0B6B6B0ADBBC3BCACA6ABB6BFB3B3BAD0D9CDC9D4),
    .INIT_12(256'h919591907A663BB5E1E1B8725D6D8C8A8571768D817A8E8B7BB2E4FF7E3A5442),
    .INIT_13(256'hCECCD3DBDCDAD4C8C8C3BDB5A89C989C968C82848C9497978C959DA1A2A09993),
    .INIT_14(256'h90929B919589898292A3A1978C8A8C837E89897887A1819EA79A8F9DBABFBBC6),
    .INIT_15(256'hD3D0CFD0CEBFA998857282919AA4A4A5B5A3A09A8C6D758981869988818A8F99),
    .INIT_16(256'h8FB0C2B0948D969E95A3B2BAB8B8BEC4C5C7B4A1AFC9C7B4AFB5B1B3C5D8D8D2),
    .INIT_17(256'h969494978879357AD2D8AC4A20353D5B7A8D6A4C5448436290DDE6ED4F314961),
    .INIT_18(256'hC3C2C9D2D5D7D4CDCFCAC4BBAEA29C9F9A948E919697928F929698999A9C9B97),
    .INIT_19(256'h9A93959396838A9A909DA5A795868C8B8A8F807280877790A4978C9EB9BDBBC5),
    .INIT_1A(256'hD9D3D1D6D4C9BCB5AA92928E838A9FB5AD9FAAA6927E8A8E868A82838A8D8085),
    .INIT_1B(256'hA9C0C6B0A1A7A89FA5B4C0C3BBB7BDC5B8BBB19F98A7BCCAC0BDB5B9CAD7D8D7),
    .INIT_1C(256'h8B8C95A198892E43C1B2432E2F1C23213144331C1E172564CEE1F1B434425C7D),
    .INIT_1D(256'hC2C0C7CCCDD0D0CCBEBBB6B0A8A19FA3949493999C9B97949A9D9F9F9A97908A),
    .INIT_1E(256'hA497969E9F8285A4A691899E9E8D816D83897A738478728293857A89A3ACB0BA),
    .INIT_1F(256'hD6D0CCCFCCC4BDBAC4B4AB96787892ACAAABB09C8F8F9A8F8884778F928E8180),
    .INIT_20(256'hB9BAB3A5A1A9AAA6ADB2B4B5B2AFACABB0ADB1B6B5B9C2C7C8C7C6CDD6D2D0D7),
    .INIT_21(256'h9095989C93791D2D689074412A21211D261F212020223259BAD7EA7A2E5F9FB7),
    .INIT_22(256'hBFBEC4C8C6C9CAC5BBB6ADA39A9390938C8D90969EA3A7AA9A9DA0A2A09D9790),
    .INIT_23(256'h9690919EA48A7F939D8E8C9A8F7F827C787D7E72867C727D948E8892A8B8BCC0),
    .INIT_24(256'hD1C9C5C5C1B8B1B0ACB3B9AA89809096A9BDB99794959B9B7E858D9E8A8E9188),
    .INIT_25(256'hCEB5A19B9D9EA6B6ACACABABADAEABA8A5A9AEAFB5C8CEBEC5CFCFCDD5D9D6D1),
    .INIT_26(256'h95988D8C9075254339AEF5A2562423211C24261B1B2D4B70AED6BF5B2D7BC2C0),
    .INIT_27(256'hB8B9C0C7C5C6C6C2BCB7AA9E969190938A8D90969BA1A8ADA7A5A19D9A9C9996),
    .INIT_28(256'h9395939DA7A49492909292917F7C939E7C7F93798887717D93979797A2B9BFB8),
    .INIT_29(256'hD9D7D3D1CBC5BBB2A0ADB5B09A97A69E9CB3B59C9D959FAE9C8E9EAC94919391),
    .INIT_2A(256'hC5C0B09D9EADB3AEB1B2B0AEACABADB0B6B4B9B5AAB7CFD5D4CFC6CCD9DBD6D9),
    .INIT_2B(256'h95978B8D9D8C3D453F9AE8D3D49969383F25213A425EB2F4E08EA95B3387B8A6),
    .INIT_2C(256'hC1C3C9D0CCCBC7BEB2AFA59D9999999E8E90929698989B9EA8A4A19E9C9D9A94),
    .INIT_2D(256'hA09F96989AAAA1919899847979828D8A7D88AA969A9D79809597918588A4B5B1),
    .INIT_2E(256'hDFE3E3E0DED9CBBDABAEADB3A9A6B5AA9BA7AC9894919C9EA88A929592898189),
    .INIT_2F(256'hA9BBB8A4A8BEBCA5ADACA6A09E9EA0A4AE9CA3B7B4B2B9B7D4CBC5CEDAD6D2DB),
    .INIT_30(256'hA39F999097994F272241987FDCFF9B94976F6ECBE9B7C7F4BC4B9A623E92BEB8),
    .INIT_31(256'hC8C7CAD0CCC8C2B7B4B2ABA099979393909192959797999C9495999EA4A9A6A2),
    .INIT_32(256'hA1968F938594928490A592797070767B7E91ACABA7A58891A9A6A29A96ADC2C3),
    .INIT_33(256'hD8E0E3E0E1DFCEBAA3A3A9BEBCB0AE999B9AA08A8999A4898079836671786F79),
    .INIT_34(256'h9C9CA0A9B0B5B3B0A49D95959BA1A2A3A29BA5B1B3C2C8B7AFC6CDC6C9D5D4CE),
    .INIT_35(256'h9E94937E7B9B6A2525203A2D8DB17AD2F3F4B6DCF37D65BF6F73655055BCD4B3),
    .INIT_36(256'hBBB9BEC4C3C1B9AEAFAFABA4A09F9A97929291959CA1A8ADA19D9A989DA4A5A4),
    .INIT_37(256'hA09294A1898D8D8787AB9E857C74778388989DA79C9B93A29EA1AFB8B2B6C1C1),
    .INIT_38(256'hDEE5E5DEDFE4D8C7AFB5ABB8BFB4AA938F9797969D9FB6987B7E72676C737984),
    .INIT_39(256'hCFBAABB3C1BEAEA5A29C969697999A9B96A7AAAEBCC1C9E0C9BFBDC7CCCDD3DD),
    .INIT_3A(256'h9B9899999CA47B3323364239463243838CC78F74A43F497358403A5089CDC6CE),
    .INIT_3B(256'hC2BCBCC3C3BAB6BBB6AEA9A8A09697A39D9A9495999EA3A8A69A959A9F9C999B),
    .INIT_3C(256'h8E798AAE968D8682787F988A8081878374869987889189A9A89FABB7B3BCC6BF),
    .INIT_3D(256'hE1E5E2DEDEE3DFD2C8BFA298A8B2B0A19396A8B2AD9CA59A95856D636C777776),
    .INIT_3E(256'hC0C0B7AEAFB2AFABA19387889195918D9AA0A6B2BEBABFD5DACFC7CAD3DADFE2),
    .INIT_3F(256'hAEA5A59BA0A6905829202A3C5F534B6563686F5E465D7E5F41333D5CBDC5ABB5),
    .INIT_40(256'hB6BDBCBBBCC3C2BCB4B4ADA29C9D9E9F95979BA0A29E9A989297A2A5A39FA5AE),
    .INIT_41(256'h9C8582A08D8F8989837C8E8A88879093846A66667A827B99928D919DA3AFB6B0),
    .INIT_42(256'hE8E8E4E1DDDAD6CECCC2A38A9AABA09D9C93AFB9A9949DAD8F7E706D6B6C685F),
    .INIT_43(256'hA2AAA8A3A2A5ABAEABA5A09FA19E9D9D9E9698A5B1B1B1B6CCD6DCD7D0D4DDE4),
    .INIT_44(256'hA49B9D96A0AEB091462622242E2D354A4D6062636B794F312A3258A3D6D0A598),
    .INIT_45(256'hABB6B6B3B7C4C4B9B4B5AEA7A2A29F9D9FA0A1A2A09B9A9B9A999CA1A9AEABA5),
    .INIT_46(256'h809094977D878D9D81778B90969299A28C726A626F817F8D8E9596979CA8AFAF),
    .INIT_47(256'hE5E5E5E7E2D8D2CDCDCBB9A1ACB19DA8A392ACAA969297B39D8C86867E787367),
    .INIT_48(256'hA09B98A1A8A3A1A5ADA79E98959AA7B1A19FA6AAA8ADB2B2ACC5DBDED6D2D8DF),
    .INIT_49(256'hA7A09C9996A5AAA18251392513181C181B2B242727142033396091CED0CEB19B),
    .INIT_4A(256'hB0B2B4BAC0C3C0BEB8B4B4B8B3A49EA3A5A099969294969C9AA3A8A2A1A6A9AA),
    .INIT_4B(256'h74938F716A72757480859C9591888587877B7E787C898786859EA49693A0ACB2),
    .INIT_4C(256'hDDDEE3E6E5DFDBD9D1C8BAAAB3B09CB0A094AB9F8C97909FB297857E7A7C7D73),
    .INIT_4D(256'hADA0969CA19A93918E9098A7AFACA0979AA4B9C1B4ABB4C0B3B5C1D6E7EAE3DD),
    .INIT_4E(256'hACAD9B9E8B9E9FA8A7846E4B22241D0C1F141122232A3F4572A5C3BCCBB2AFB0),
    .INIT_4F(256'hAAAFB4BABFC1BDB7B7B5B9BEB6A6A0A5999593929190919498A0A4A0A3ACAFAE),
    .INIT_50(256'h6B8687616D626A6F7891A9928A8A8C8C9178798C9C9C928E90ADB1998D969EA2),
    .INIT_51(256'hE4E2E2E0DDD8D6D5CFBFABA6AD9F8A959793A497869C9599B5AC9F8E7F81878B),
    .INIT_52(256'hA9A89D949398979299989B9EA1A1A0A0A6A6B7D2D8C6BFCBCEBFBACCE5EFE9E1),
    .INIT_53(256'hA8AA989A8A9CA0AFA39E9A7D534D3A27211D202F2E55598FAFC3D2C5B8A9A7AE),
    .INIT_54(256'hA1AFB7B5B9C2BEB2B1B7B6ADA5A3A19D9E9B9A9D9E9E9C9C9897979AA9B4AEA3),
    .INIT_55(256'h5D6F81748B6F778B6A84967F818C989F9A8E848C9CA6A09796A4A79C949A9E9E),
    .INIT_56(256'hE9E8E5DEDAD5D1CBCAC3B2B1B099867F88879697889B9CA696AAAD957C757C8B),
    .INIT_57(256'hADADA39A979C9D9C878E989A968F9094A19B97A9C4C3B7B5D2CECBCEDAE4E8E7),
    .INIT_58(256'hAAA99E918D90969D97999CA09894694F5333416D79A3AFBDC3BFCED3A7B2A8A9),
    .INIT_59(256'hABB7BDBDC0C5C2BDB1B2AEA6A2A29E98A09D9CA2A5A3A19E8E99A19F9C9EA3A8),
    .INIT_5A(256'h6B655F71998D7D81797D83757F7F7E8692A2937E839296917D7B8B9D9A99A5B0),
    .INIT_5B(256'hE2E4E5E2E2E0DCD3BFC5BABAAE958F827B7A8DA08E9498A890ADB098867F8590),
    .INIT_5C(256'hB3A79C99958A868A908F959CA1A2A19FA8B3A496ABC4C7C8C3D1D5D4D8E5ECE8),
    .INIT_5D(256'hA3A2A38C9A8E99958C92939998A08F9B92928B99ACAAC7B2BABED1B1AEB1AAB7),
    .INIT_5E(256'hB2B1B5BEBEB6B7BFBBAFAAAFAFA59D9C8F8E939DA19A8F869B9A99999CA0A4A7),
    .INIT_5F(256'h6C6A546688A0959D9888888B9E8B767E9AA9968588878A95897C93AF9F8C9AB1),
    .INIT_60(256'hEBE9E4E0E2E9EAE4D4D5C5AF9D8E8FA287718A9489909BA5A9B9A6A79F7F8591),
    .INIT_61(256'hAE978B8E8D8B95A19F9C8D8999ADB4B7B3B8AAB5A6B6D3CAD7E0D7D2DBE2E5EB),
    .INIT_62(256'hA6A89A9A9C8F918A868F97999CA19D939799A2A7B1A7B8BCB1A8B3AEADB8B1B3),
    .INIT_63(256'hB2B7B9B8BAC0C0BDB5B8B6ACA4A3A3A291949B9A8E8B949DA19B949C959AB1A1),
    .INIT_64(256'h6D6E5957858FBBA39D8AA7958C8977748390837E717E8BA1B4A29AA7B1ADAAAD),
    .INIT_65(256'hE3E7E8E4DBD6DCE3EBE2CCB1A0938F8E8B7C8D9B999FA6A7859492A8B09A8E79),
    .INIT_66(256'hC4B49F97A2ABA79C9DA7A59A9498A6B8BAC1B4BAAFB1C2B4C8DAE0DCDEDCDEE8),
    .INIT_67(256'hA7AA999E9A8F8987878D9293979F9F9C9496A3A7ABA4A5AB8F8FA5A9A2A3A9BD),
    .INIT_68(256'hBCC0C2BFBFBFBFBCBCB9B3AEACADA59C95A2A59791989B95928E8C8C8490A39C),
    .INIT_69(256'h7B837E729294A2ACA18FA7968A8075798C92909C92867F94A6AFADA8AAB7BBB4),
    .INIT_6A(256'hE9ECEFEDDFD3D6E1D6D5DEE0CCAE9687889EA2968E9596807C8D9BAA98879694),
    .INIT_6B(256'hB3B3A39295A0A19C82909AA2A6A7ADBBBEC5BBB7B7B2C1B8B3C6D2D6D8D6D7DF),
    .INIT_6C(256'hA9AA96A1958E818580878A8A8D9498998F8E9FA4A0A0919B847B8EA0A29B97A4),
    .INIT_6D(256'hC4C8CBC9C6C3C2BFBFBBB6B3B1B0A59B9DA8A291969D9B99929193857C8E9CA0),
    .INIT_6E(256'h9C98968AAAB59EB9AB929A8A817F81868E9C99A0A0998A8F92ACB4A8A3B3BBB5),
    .INIT_6F(256'hE1E2E6EBEBE7E5E9E0D5D2D5D0C7B190849E999DB0BBBCA4A6979299867C8E8D),
    .INIT_70(256'h9EA7A39C9A97979F9D96898B98A3AEBDBABFB8ADB6B2C9CCBABEC3CAD4D8D8D7),
    .INIT_71(256'hA5A48F9E8F907F8A80868B8A8A8C90918985969B929C869497828497A19D928D),
    .INIT_72(256'hC0C6CBCBCAC6C6C4BEBEBDB8B0ABA5A1A7A1918D979191A68F92937870868D9B),
    .INIT_73(256'hBBB2AFA8B4BE96A0B7A7A68F8080939898998B8997978D9695A7B4B2ADB0B6BC),
    .INIT_74(256'hDCDEE1E2E6EAE4DDE2E2D7BAA6B0AF958086839C9F7F859D9F8F7F79767F7E63),
    .INIT_75(256'h94918E969F9C8E87AAA2938B8C91A1B6B4BBBCB0B6B1C5CDD5CECBCFD6D9D7D2),
    .INIT_76(256'h9C988793888F818E8A8B8D8C8B8B8F94867F898C84917D8F9A918B9092989D9B),
    .INIT_77(256'hB9BDC2C6C6C4C4C4C0BFBCB7AEA9A6A5A99D8B8C938485A38D928D6F6C808396),
    .INIT_78(256'hA6B2BBBFA7A8978F9A9EA38E7E83A7ACAC937D889F8A819D9FA2A8ACA9A9AEB8),
    .INIT_79(256'hDDE4E6E0DFE0DDD7D2D3D6CFB6A0968E7D7F819189676D908FA2957781A5A68D),
    .INIT_7A(256'h9D918B939BA8A6989197979495969DABAEB7C4C3C0BBC3C7DAD4D7DAD6D5D6D3),
    .INIT_7B(256'h93908589838E818C918C898A878A8F998D85888782897F8C8D918F93949BA296),
    .INIT_7C(256'hBABCBFC3C5C3C3C3C4BCB5B2AFADA7A5A49F928D8D8281919199886F75838697),
    .INIT_7D(256'h98A8AFB7999CA69B9C9686767581ACA8A7A09497AD9A8C9EA1A19D999CA3A8AE),
    .INIT_7E(256'hD4D5DADCDFE3E5E6E3C6B7C7CFB99A93958B84839094817A809B826186B4A68E),
    .INIT_7F(256'h8B7A83918990A0A29B9E968F9399A0A7AFB3C4D0C5CACBCCD4CFD7DDD8D8DDDC),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__2_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0008)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__2 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[15]),
        .I3(addra[14]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__2_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized3
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__3_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h8F8D8D878994888E988F898B898A8F989790908D8D87878B898F8C959B9E9C87),
    .INIT_01(256'hC4C2C1C4C7C5C5C5C0BAB4B3AFABA7A8A5A0968D88838285939C7E6C7C818494),
    .INIT_02(256'hA9A79DA3999AA098C1A7817574749D9292ADAA96A8A2999EA8A9A6A3A5ABAFB4),
    .INIT_03(256'hD9D0CCD5DBDCD9DBD4D7C6B7B9B5A69E80808E888D9A91957698867198A98371),
    .INIT_04(256'h826C87AC9986909895A3A49E9DA0A3AAB2AEBACBBDCED1D1DBD1D7E0DEE2E8E3),
    .INIT_05(256'h8E8F968A939C92949C939092928E8F979A9696919787908C9092899093959B8B),
    .INIT_06(256'hC9C5C1C4C7C6C5C5B8BABBB7ACA5A6AFAC9C928D868284859EA67E7388868994),
    .INIT_07(256'h98948F99A49E9398A396807E74638F9387A3A087938A8B9CA4A2A7AEADA9AAB5),
    .INIT_08(256'hE6E7DDCCC9D3D9D7D9CBC4B7B6AB99A791959C9E9EA59E878090AFAEB3835B64),
    .INIT_09(256'h8B888D999E978E8B8B8A9C9C9E9DACA7B4ADB7D3CABDD1D5DFDEDCDDE2E7E7E4),
    .INIT_0A(256'h92979494A2A39DA1A39B9C949C9397949C999B9B96999D928F9BA090928C8F90),
    .INIT_0B(256'hC1C3C3C2C3C2C2C0C2BEB7B2ABAAAAADAE978C93948785909A96897F84959C99),
    .INIT_0C(256'h8B829BA4A2BD9D948A879483727F81838D85A19888899AA3B2ADB0A9B3B0B6B6),
    .INIT_0D(256'hE4E5E1D4CBC9D1D7D6CDC5B5B1ABA3B4ACA3978396B3A29894A49A9FA2582F52),
    .INIT_0E(256'h96918F9091908E8F8E909C9A9FA1B1B4BDB7BCD4D3C9D3D1D9DBDCDFE4E9E9E5),
    .INIT_0F(256'h989F9F9FA7A5A5AFAAA2A19BA1979C9EA8A7A1999BA39FA1999CA0959B8F8A84),
    .INIT_10(256'hAFB4B8BDC2C4C6C5C2C0BCB8B4B4B1AFAD9D9599988E8B929590898A929B9F9E),
    .INIT_11(256'h887F83A0A9A395867F8893816F7C8889887798A6A59DA5AF8A9CAFABAEAAAFB0),
    .INIT_12(256'hEBEAE8E4D9CDCBCFCFCAC0ACA4A6A7B8B2A998758BAE96969AA88D8A7B707B86),
    .INIT_13(256'h8D8C8A8683838588969DA3A0A5A5B0BAC4C2BFCFD6D2D4D1D6DADCDEE0E5E6E6),
    .INIT_14(256'h9CA1A5A6A6A2A6B7B0A5A3A2A49BA2ACB1ABA89CA1ABA1ABA9A4A29BA6978A80),
    .INIT_15(256'hB2B5B8BCC2C7CCCFBFBFBDB9B9BBB3AAA6A09B9996908D8E908C8C959D9D9EA1),
    .INIT_16(256'h858A8A8C90898E868A857E7E7C829291877D878193ACAE969CA0AFB6B7A9A8AD),
    .INIT_17(256'hEBE7E6E7E4D5C5BBC3C1B9ACA4A7A6AA9FA3A28B8A95847E8CA9A0957695997C),
    .INIT_18(256'h888E928C85838B9198A5AAACB2AEB0BEC4C6C1C4CDD1D3D6DCE0E1DEDDE1E5E8),
    .INIT_19(256'h9FA0A3A6A5A2A9B5AFA4A2A5A39DA4B6B4A6B0A7A5AFA7A9B0ACA89BA69A8F85),
    .INIT_1A(256'hB3B9BFC4C8CACCCDC0C0BDB9B9BCB1A5A2A39F96908F8C888C8F92999A9C9DA0),
    .INIT_1B(256'hA393997B78787C91A48C74868D8599A6877776717E8EA2A39496A3ACACA1A1AD),
    .INIT_1C(256'hE9EBEBEAE8E4D5C8BFBCB1A8A5A9A99F97A1ADB8A4999D867B9D9C978A9A736D),
    .INIT_1D(256'h879198948B88929B95A2A8B1B7B7B6C5BFC8CBC7C8CDD1DBDDE4E7E5E0E1E6E9),
    .INIT_1E(256'hA9A3A2A7A9ABAFB3ACA3A0A6A19DA2B5B9A4B4B3A3AEB2A8ABAFAD9DA2989086),
    .INIT_1F(256'hA4B0BFC9CECAC7C3C6C5C0BCBABBB1A7A6ABA5968F928E8589939796939BA1A3),
    .INIT_20(256'hA97F80838D828FAFB5A48A8F8D819BB19E8C7E76848E9A938D9FB0B1A2989BAA),
    .INIT_21(256'hE4ECEEEAE5E4E4E1CABBA2948E97A6A18B8F9AB9ABA3B7977C888B897A8F7174),
    .INIT_22(256'h7F8A98A19D939397A0A5A6B2B3B9BBC9C0C9D8D4CCCECFD8D5DFE6E8E4E3E5E6),
    .INIT_23(256'hADA5A5A8A9AFB3B0ADA8A3AAA3A1A2B0C0AEB5B9A5ABBBB0AAB1B3A5A79A938B),
    .INIT_24(256'hADB7C0C6C8C8C8C8C8C5C1BEBAB7B0ACAAAEA696919790838591959193A0A9A9),
    .INIT_25(256'h8981819FA295B7B8B7AF9180848995969A9B8E7784909B859B9190A2927E7E9C),
    .INIT_26(256'hE1E2E2E0DAD5D7DBD4C3A79686879C9C807B7B8C8A8B957A848F96947780705A),
    .INIT_27(256'h878995A8B0A7A0A1ADA9A6B5B2BCC0CAC5C6DDDDD0D3D2D6D3DCE3E4E2E3E5E6),
    .INIT_28(256'hA7A6AAA7A2ABB2ABA9AAA4ADA5A7A4AEBEC0B3B6ADA3B6B4B1ACAFABB29E9999),
    .INIT_29(256'hBCC1C4C4C5C6CBCFC3C0BFC0B9B2AEB2AAACA497979C938083888C9099A5ACAC),
    .INIT_2A(256'h79909DB29A9BBAA1ABA58A7180978A7A74818E8F8A7796AFB19484A2A29A96B0),
    .INIT_2B(256'hEEE4E0E4E2D5CDCED3CFC3B99E8C969095908579757669587EA1959B99897A7C),
    .INIT_2C(256'h92838095A5A8AAB1B2ABA9BCB6C4C9CFCAC1D8DCD0D6D7D7DCE1E3E2DFE3E9ED),
    .INIT_2D(256'hA4A7B0A99DA6B1ACA4A9A5B0A9B0A9AFB7CDB1B2B59EABB3B8A5A3A9B7A19DA6),
    .INIT_2E(256'hB2BCC4C9C9C7C8C8C1BDC0C4BEB1B0B8ACADA59B9DA29682858183919FA8AAAB),
    .INIT_2F(256'h707293AB93A8B1A19A978C758297857C70858F90998F9A93ABAFA4A6A4B6ACA5),
    .INIT_30(256'hE8E1E1E3DDD2D0D6CBBEBDB7A79691A29F9C9387788D8785838C888081796B6B),
    .INIT_31(256'hA78F777F9E93A1B1C1B8B3BDBDC1CFCDC8C4D2D4DBD4DBD9D7DBE2E8E5DFE2EA),
    .INIT_32(256'hAAB8B0AAA3A6B4AEA6A8AFB1AEA2B8B0B4CFC2ACA6A2A9B4A5BBB29FB2B299A2),
    .INIT_33(256'hB2B9BFC2C2C0C6CBC0C2C3BFBCBAB3AEA9ABA69CA99E9682857E8CA3A7A2A29C),
    .INIT_34(256'h6D5F61758390BEB2A2989DA7ADA09978747B717CA68991989FA6B2B6B3B5B1A8),
    .INIT_35(256'hE1E4E5E1DDD5C5B4BDB9AFA29FA29FA4A7ABA68E819590837A7D6F7183938887),
    .INIT_36(256'hA8A69E8C93999CAEC2B6B2BFBEBECACCCAC5CAD0DBE0E1DAD8DADBDFE0E0E1E4),
    .INIT_37(256'hB1BBB0AAA6A9B3ACABAAACB5B3A4B3B9B7CBBFB0A79A9DAAACB7B4A3AEB8A9A1),
    .INIT_38(256'hBAB3AEB4C2C9C4BEC0C2C0BCBAB7B2ADA6A9A7A4A6968A8185949DA0A0A3A8AF),
    .INIT_39(256'h58556D667D99B9B193929EACB3A29D7E6A7A7175AA97A1B0A7AAB6BAB5B0B0B3),
    .INIT_3A(256'hE0E1DEDCDAD6CBBCC0BFAE9F9D9B9AA4AAA5997B80958E77818F838081928C93),
    .INIT_3B(256'hADB5B59E949F94AAC2B7B2BEBFBBC5C9CBCCCAD2D9E6E4E0E0DFDADADCE1E2DF),
    .INIT_3C(256'hBEBFB2ACABAEB2A9B0ACA6B9B7A8ABBEB7C2B6AFA7979BAAA3A9BBB5A7A5A5A9),
    .INIT_3D(256'hB0B3B6BAC1C3BFBBC6C4BEB8B8B7B3B0A5AFACA79E988A87949D9EA2A8AAA9B0),
    .INIT_3E(256'h5D61998A8B8E8E9D939FA8A4A7A3AA91756E88748694A3BBB3A58B7E91AFB1A3),
    .INIT_3F(256'hE0DAD8DBD4CAC9CFCCC2AFABA1878BAAB29786748E9788717B9791897B868392),
    .INIT_40(256'hB6B8AEB2A9A295ACC2BFB8BDBEBCC3C4CBD3D1DCD8E1DEE8E5E5DFDADCE2E2DC),
    .INIT_41(256'hC5BEB1ADAFB2AFA6AEACA1B5B8B0A5B8BABFB1ABA499A1AE9D9CB3C0B09A94AA),
    .INIT_42(256'hAEB9C2C1BCBCC0C6C2BDB5B3B8BAB7B4A7B4ACA095A2928EA69696A8ADADB3BA),
    .INIT_43(256'h775F80959E9568709298A1A2A299AFB69F73BD93658FA5B8A5A18B747992A6B3),
    .INIT_44(256'hDCD8D8DBD1C0B8BAC9B8A2AAA48A95B4A9887E809B8F7C78879B969390958584),
    .INIT_45(256'hB1BAA6C0BDA6A6B2C4C9BFBDBEC0C4C2CCD3CFDEDCDED7E9E2E4E0DCDCE1E2DD),
    .INIT_46(256'hBAB1AAA9AEB3ACA6A8A89FABB3B8A5ADBCBFB0A8A29DA6ABAB9B9AADC1B1949E),
    .INIT_47(256'hBABBBAB7BBC3C6C7B3AFADB2BBBCB5AEAEADA49E9AA49092A68F98A9A0ABC3C6),
    .INIT_48(256'h77655E8090A989849A939FB3AB8294B5A584CAB17695AFAEA78E8295A29494AF),
    .INIT_49(256'hDCDCD8D4D1CDBFB2C3B39BA4A7A3B1B2917F7D8490807B958D9FA7A7AB9C8173),
    .INIT_4A(256'hA1BAA9BFC1A9B7B7C7CFC3BEC2C2C6C7CCCFC9D5E1E2D9E5DFE2E1E0DFE2E5E4),
    .INIT_4B(256'hA8A0A3A7ADB2AAABA3A2A1A3ADB9AAA8B7B7AAA6A2A2ACADAEA29292B5C0A39B),
    .INIT_4C(256'hB4B7B8B8BEC3C0B9B3B3B6BCBEB6AAA3B9A6A4A7A8A289969C929CA39CB1BDA6),
    .INIT_4D(256'h70877A7D7CB9BCA4828D9DA8A98FA0B48B95A9BBACA9BFAD9F928A98A39398B9),
    .INIT_4E(256'hE0DDD6D1D1D2CBC1B8B09EA6A7ABB496868E919089807FA3828F9E959A7F7370),
    .INIT_4F(256'h9AB1AAB6C4B3C0BEC9CBBEC1C6C0C5D1C9D3CFCBE0E3E0E4E3E1DEE0E1E2E3E6),
    .INIT_50(256'h9F9BA7ACB0B4ABB1A59DA6A0A8B4B1AFBAAE9FA1A0A1B3BAA6A29C8B94ACA89F),
    .INIT_51(256'hA9B5BEBCBABBB7B3BABEC1C0B9ADA7A9B8A9B1A7A9A08D99999C9B9AA2B1A890),
    .INIT_52(256'h7E90908486BBC19696A9AB9F9F8E9290959E9BBCCAC0CBC0C9B8968EA8B7B2B5),
    .INIT_53(256'hE0DBD8D9CFC1BEC3A5A29DABA09BA0777D9CA39C898470859F989272775D6771),
    .INIT_54(256'hA0A4A8B2CFC1C4C7CCC8BAC4CBBEC4D9C6DCDDC8DBE1E6E9E7DFD9DDDEDDDDE1),
    .INIT_55(256'hA19FB0B5B6B8ADB7A899ABA0A6AFB6B7C9B0999D9B9AB2C3A89DA3948298A7A1),
    .INIT_56(256'hB4BAB9B1B0B6B8B8B9BDBFBAAEA6AEBBAEAEBB9A9C9F95989AA99C939FA49FA9),
    .INIT_57(256'h8385A69C96A7B8A58C8E91A0AF94919BB095A2B5B5C1C5C9D6D9C4B1B1ADA9BA),
    .INIT_58(256'h817F839094898EA39F9E9F9F978D8E948A8F9EA5998B8B90928B838283868E96),
    .INIT_59(256'hA0B4B8B09C92A3ADACA499989D9CA0ADB1A8A4A4ABC1CABCAD968FA4B9B19885),
    .INIT_5A(256'hB1BEAE8E94B1BBAFA5A0A5ACA7A19F9F989BA6B5BDB7ACA5A8B3B9B1AAA8A8A7),
    .INIT_5B(256'h9EA496959490A09F96AAA8A2B3BCAFA8A9A1ABBDB9A59A999792AABAB1A59FA1),
    .INIT_5C(256'h958B91939CACABA79991A3A89A9A9B99A29D89879E9D98A6B1A9A8A19E9A8D8D),
    .INIT_5D(256'h7B80838B9291929C989CA2A3988B8A9195969EA099908B878880828685878F95),
    .INIT_5E(256'hAFBCB5A79A9AA5A29E9F9D9C9C979AA99AA1A6A4A3AAADA491909199A09D9388),
    .INIT_5F(256'hB4B7A89395A8B5B7A4A4A9A8A0A2A8A8A0A4ADB7B8B0A6A0A6AEAFA6A0A6AEB0),
    .INIT_60(256'hA3A39A9D9895A5A9ABAFB4B3B3B6B3AA9CA1A7A7A4A9A89E9795ACB6AAA29DA1),
    .INIT_61(256'h8C8892949AAAAEAE9F919EA29A9FA3A19A9B9499AAAAA2A9B3A5A7ABADA49593),
    .INIT_62(256'h7782888D969B9796949AA2A3998F929BA3A3A09A938D8B8B857B828B837D8183),
    .INIT_63(256'hAEB9B1A39EA4ABA09BA4A9A79F918F998A999F97918F9096818C918B8A8E908B),
    .INIT_64(256'hA49E96918F95A4B1A9ACACA195999E9AA5A6A9ABA7A09B9AA2AAA79A97A2ABAB),
    .INIT_65(256'hAAA1989C9795A7B3ADA3ACADA1A2A89D90919DA7A7A7A9A6A197A2A9ACAEA299),
    .INIT_66(256'h90919C9592A0A6A8988F9FA9A8B0AEA99DA0A4ACB3B3ADA8A097A4B2B5ACA3AE),
    .INIT_67(256'h8491999FA7A69F9B9FA1A3A099949BA5A3A29B93888289988C7E8793877D7B77),
    .INIT_68(256'hA4AEABA8A7AAAEA299A7AFB0A99C9497949EA0A1A29593A08A908F8789939691),
    .INIT_69(256'h9C95969B9997A2AEA3A2A29F989A9C94A2A2A29D9693969B9AA4A49A9BA7AAA3),
    .INIT_6A(256'hA79697A6A098A2AAA8A1A3A29DA0A7A09F9DA9B8BBB9B8B5A49CA0A2AAB0A49A),
    .INIT_6B(256'h9D9DA5988D95979888879CA5A5A8A4A2AAA9B1B3ADACA99F9A9EB1B3A59897AC),
    .INIT_6C(256'h9FA3A6ACADA29BA2ACA7A29B9896999D98948D8B8A838BA1958A909D9B948F8B),
    .INIT_6D(256'hA9A8A3A9ADA9A59A92A0AAAFB2ACA5A29E9A9CADB6A497A09894908E90979C9E),
    .INIT_6E(256'hA099A0A39D9EA6A5A499979D9D9B9992989998938D8C9093949EA09CA1ACAEA5),
    .INIT_6F(256'h9B8998B2AEA29D9CA4AAA199A6AFAFAEB1B6BAB4B5C4C3AF9BA2ABA49EA09DA3),
    .INIT_70(256'hA49FA5998E9290908F92A4A29D9F9FA5AFA8ADAB9B98998F909BABA3918A90A4),
    .INIT_71(256'hABA5A1A5A08F8B98A49E999799999794958E848A999794A19D9998A0A6A4A1A2),
    .INIT_72(256'hB0A396A0AAA5A094939FA3A3A6A59F9DA89892A1AEA59A9C9996959491929CA9),
    .INIT_73(256'hA4A0A4A195989F97968989959A9B9D9AA6AAACA9A4A09D9A9B9C99969BA5A69F),
    .INIT_74(256'h9A8295ABA6A19E9EA0ADA39CB0BAB6B7BCBABCBAB8BAB3A3A0A7AEA39F9D99A1),
    .INIT_75(256'hA79DA19A92918D8F8E9AACACA8A7A3A9A49B9E9D8E888B888386929190989EAC),
    .INIT_76(256'hA9A09A9F9D8A848F959191939A9D9A959C9C8D8A9EA49C9F9EA59B969FA09FAA),
    .INIT_77(256'hAEA99DA0A5A4A49C99A5A59B9797979AB5A69C9CA1A9ABA6989A99958C8B95A3),
    .INIT_78(256'hA8A6ADA895959B90828593A1A9B2BCBEC9CCCCCAC7C3BAB1AEA69C989CA0A09D),
    .INIT_79(256'hA08596A3989A9FA5A0A5A7ACB7BEBCBABFB7BDC6BFAFA7A4A6A5A39EA5A3969C),
    .INIT_7A(256'hA4969C9D97928E93828EA0A4A8A79A999E918E9189848B94978D92979CA19EA8),
    .INIT_7B(256'hA8A4A2AAAD9D909293918F91989C9B97A3AD9A8996A09C9D9AA99B8B969899AC),
    .INIT_7C(256'hACB9B5ADA5A2A9A594A5A79A9498A2ACABA8A79D9AAAB1A29D9E9B938A898F97),
    .INIT_7D(256'h9E9FACAB928B908597A8BFC6C4CAD1D0D2D1CFCAC8C6BDB4BDB2A7A6AAACAAA9),
    .INIT_7E(256'hA18AA0AB9B9A9EA3948FA0B2B1B2B8B2B0B3B6B0A6A6A7A09B9E9F9A9F9B909E),
    .INIT_7F(256'h9A8C969E9A96939D8D919898A0A3938F9F90878A898894A8AA999DA6AAA59EAB),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__3_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0004)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__3 
       (.I0(addra[12]),
        .I1(addra[14]),
        .I2(addra[13]),
        .I3(addra[15]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__3_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized4
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__4_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hA6A0999BA5A1969098878590A3A4999FA39B94908D919490A1A9A4948F939CA6),
    .INIT_01(256'hCACAC9C9CECDC4BBB2A197989692A2B8B2B3A89798A9B5B5AAA49C9A98908C96),
    .INIT_02(256'h9CA9A3978E92A7ADB3C3C7C6D1D4D1D2CACFC9C8C8C3BDABB7AEA8A8A5A6B3C3),
    .INIT_03(256'h9E9C98A79D9A919A96919098A3A9A49D9FA1A6A7A0989BA1988D8D999A8E8A92),
    .INIT_04(256'h86858A909495989C8EAAB39398B09F9597968791948895A19E969BA5A8A8A39C),
    .INIT_05(256'hA09D9B99938F8F91877E858B9397939A908587918C83858A9EA6A2959398A0A8),
    .INIT_06(256'hCDD0D2D6DBDFDBD5CDBBA99E948A90A1B7B1A19498A9B3B4B0A89D9A99929094),
    .INIT_07(256'hABB5ACA1A2AEB9B1C0C9CACAD3D5D3D5CFD4CCCAC9C4C2B4ACA8A8A8A7A9B4C0),
    .INIT_08(256'hA09D9093929B908997A0A39A989EA4A29F9F9C96969D9D98A49F9DA09D95959C),
    .INIT_09(256'h8390999386828D9A98A6A39EA2A19D9BA2A39597978A8D8F908F9DA8A39E9F98),
    .INIT_0A(256'hACA4A4A0918E969686808E918E95928C857C818A847E858E9BA19D95989DA0A4),
    .INIT_0B(256'hC0C5C9CFD6DBDAD6D9D2CAC0B1A09490A4A39F9CA0A3A29EA6A2A3A9ACA9A6A7),
    .INIT_0C(256'h909CA8B4ADA1B2C1C2C5C6CCD6D6D4D8D2D6CDC9C6C3C4B9AFAFB0ADABAEB5BB),
    .INIT_0D(256'h94928C94979E9690A5AAA38F838CA0ADAA9E9083828A9192A5AFB6B4ABA39E98),
    .INIT_0E(256'h7D94A49C88848F9C939A8D9AA49AA2A1A2A1918E999992849394A9B1A2989A91),
    .INIT_0F(256'hB7A5A5A69B9DA196948B999B969F968287868888888E928D9B9B9491999C9896),
    .INIT_10(256'hC1C4C8CCD0D1D1D0D3D6DADAD4C5B1A494979A9FA09A959392959FAAAFB2B6B5),
    .INIT_11(256'hA4A1A7BDBFAEB1BBB6B5BBC8D4D2D2D6D2D6CDCAC5C0C2BBB7B9B7B1AFB2B8BB),
    .INIT_12(256'h928C909D9B9293A0B5AD9D8A7C7E92A5A3938D928E868D9FA3ACADA3A0ACB5B5),
    .INIT_13(256'h7990A19F9896989890979094A1A7AA9B949C938A929B9A918A869AA9A2A3A79B),
    .INIT_14(256'hA7979CA4A1A4A6989E929D9D97A19D8D918F9194989E97869592898A96988F88),
    .INIT_15(256'hC7C8CBCECFCECDCED1D4D5D6D8D7CDC3ADA1948F92949799898C979B979DA8A8),
    .INIT_16(256'hC9D1CBC3BDBAB9ACB6B1B8C7CFCFD0D5D2D6D1CFCAC0C1BABBBAB5AFB0B8C0C3),
    .INIT_17(256'h9A93989B94838A99ACAEA69283818A9098939BA8A48D81848E96938A8C9CA8A6),
    .INIT_18(256'h7889979A9B9B988F95969E979EAD9E8B8B9FA59691999DA19D8F96A6ACB4B5A4),
    .INIT_19(256'h928E9BA5A2A4A8A4A0939998929BA2A8A79790979A97938D8E8B858895968C86),
    .INIT_1A(256'hC5C5C8CBCDCCCCCDD3D2D0CFD3D6D3CDD3BCA0908F9191918B919F9F91939993),
    .INIT_1B(256'hC6D8DAD2C4B8B5A9C0B8BEC9CACCD1D3CED3CED0C9BFBDB5C1BAB2AFB2B8BEC1),
    .INIT_1C(256'h9597A1A2A599969299A7A68F848D9895A2A5ACB2B4AA948176818B939FAEB3B1),
    .INIT_1D(256'h7684909495969592918C9E98979E8B808F979F99A1ACA6A6B5A49CA4B0B5ADA0),
    .INIT_1E(256'h8F949EA5A6A7AAAFA592909294979DB1B6A495908C8D92968D8F8E9199979190),
    .INIT_1F(256'hCBC9CACED2D1D0D1D1CFCDCED2D3CEC9D3CCBDAC9D928D8A969AA6A392949B90),
    .INIT_20(256'hC7C6C4D4DDCEBEACBDB8C2CBC7C9CDCBC6CAC7C9C6BBB9B0C2B7AFB2B6B9BBBC),
    .INIT_21(256'h9598AAB2BDB0ABA39796928C8F9AA7ABAFB0B3B7C3CCC8BCC2BDB9B4B2B1B4B7),
    .INIT_22(256'h76808C96979694968E8D969186898F8C958B8D90A4AF9E9CA29B9195A6A89F9E),
    .INIT_23(256'h96999A9EA6A6A6ABAB90878D999692A7B3AFA491848A949191989B9C9E9A9599),
    .INIT_24(256'hCCC9C8CDD0CECCCCCDC9C5C6CACDCCCABACCD4C5AA99979BA49E9D917F8A9B92),
    .INIT_25(256'hBEC8C7C7CAC9C6B6ACAEBFCCC8C8C9C2C4C7C3C7C5BAB8B1BCB0ABB5BEBEBDBF),
    .INIT_26(256'hA79DAAB3BCA7ACB5A4898197A9A7A8B2B2B0B3BBC3C6CCD1C7C4C4C7C2BAB9BF),
    .INIT_27(256'h7A808B979C97918D98A49D8F7A81A49F9A8E8F8A9092858F9EA39995A19B9299),
    .INIT_28(256'h93918794A8998DA1A5A192949F8C8098AEB4B091808A92999DA39AA5AA9DA5AD),
    .INIT_29(256'hD5CFCEC7D8D1D2D0C9C8BCBABFC5C9C0C0C2C4C3BFB5A5989A99938781949B8C),
    .INIT_2A(256'hC4BCCFCBBBB7D1BAA1A9AED0CCC4C8C7C6C4BEBFCCBDC5B6C0ACB9B7BCB0BBC7),
    .INIT_2B(256'hAFB0B0B0BA8F9C9263739DA19CAAAAAAAFA3A9B5BAC7D0CABCC6BBAEB3B6BED4),
    .INIT_2C(256'h857A83989A8D8686AEAAA39790979A8F92928F949E958C949C94A6A0A29195B1),
    .INIT_2D(256'h93989191978C838F9A9A959AA091848D9CACB49A858A939FAFA49AA3A2A2B1AB),
    .INIT_2E(256'hD2D2D5CED9D1CDC8BCC6C0B4B4C0C8BFBBBFC6CBCEC4AB9392918E88868E928E),
    .INIT_2F(256'hC0C1C6BAC4B0A4BC97A2AACAC7C5C6C2C2C1C1C7D0BEC0B3BFADB5B6B9B8BEC8),
    .INIT_30(256'hBCB0AB9EA49A976D5C6B899393A1A59E98A19A9DB6C0B9BAB9A1989DA7BDC8BB),
    .INIT_31(256'h857473899C978C89A3A59F8E8A969A8A8A969CA2AAA1989B9B9B9D8E9DAFB1B7),
    .INIT_32(256'h9195928D8E8D88838185898E939188828595A5988D959DA7B4A3A2A89B9FB2A6),
    .INIT_33(256'hC8D1D7D0D8D2CEC9C0BFBAB4BBC5C3B6BCC0C3C8D0CDB2958A92989999928A8A),
    .INIT_34(256'hB3B4B8A2B8AA8298939CA4C0BEC1C2BFC2BEBBC0C5B7BDBBC3B5B3B7B2BBB8BF),
    .INIT_35(256'hBA9E9999A8B3853D59758F978D8C97928B83858990ACBFB5ADB1B8AEA4B6C2B2),
    .INIT_36(256'h958D8693A8A18B819BA19C8883929584878D8F919798979B95A2A49CA5BFBEBE),
    .INIT_37(256'hA0989493969E9A888081888A8D98998B888C969599A3A0A1A29EABB09B929D9E),
    .INIT_38(256'hC1CFD3CED1D0CECDCDBEBDC4CAC7BCBBD3D2CCC6CCD2C6B1A1B1B7B5B6AB9FA1),
    .INIT_39(256'hA4A3AE9488958A8180808BACB2B9BBBFC0B9B6B9BAB4BCC5C2BBB3B8A8BAB1B8),
    .INIT_3A(256'hA98F91A6B8B76B385073858E857C887F86747C7D708BB3B4ACB5AEADC0C2B4B3),
    .INIT_3B(256'h929F9895A6A797909A9E9D8D828A8F8496908C8D929399A09B9FA3B5B6B7A9B1),
    .INIT_3C(256'hBEABA6A8A4A7A799908A8C8988949786938F9599A3A79A949198A7AEA28A8496),
    .INIT_3D(256'hC1CFD3D1CFCFCACBCDC5CFCFC8C2BFD2DBDED5C5C3C9C9BEBCCECFC9CDCFCACA),
    .INIT_3E(256'h9D716F897F7575695A556794A7B4B5BDBBB8BABDB9B7B9C5BBBAB3BBA6BBB1B9),
    .INIT_3F(256'hA5A0A1ABB4A0514E6C7F7F888F8E907E8489877E77748BB1BDA799B0CBB9A1A7),
    .INIT_40(256'h90A4967E8A9B9894959699958A8A90909491989F978D93A1AB9C92AFB4A7949E),
    .INIT_41(256'hCFBFBEBBAEA9B0B1A19793918A8D8777817F8C969FA1969593949B9EA1918191),
    .INIT_42(256'hBCC8CDD5D3D2C8CCCAC7D0C1BECBCBD8D3DCDBCEC5C5C2BBB6C6CECFD8E0DED8),
    .INIT_43(256'h424734303751625C453D5587A3B9B4BABEBBBBB9B0B8B7C6BAB9B7BFABBAB0B8),
    .INIT_44(256'hACB2A5A0A88C3B415466686E7E8B96949093938F81778CB4B3AAB2B7A5968670),
    .INIT_45(256'h8C9C907983989486898890969491999C8188989B867A899BABA5949D9C9497A3),
    .INIT_46(256'hD0C8C5BCAEABB4BCB8ABA6A8A59E93897C77818C999E989D9C909591939A9192),
    .INIT_47(256'hB9BFBFCDCECDC2CAC1B9BFB1B7CEC8D0D4DFE3E0DAD7D1CBB6BBC7D1D7DDDDD2),
    .INIT_48(256'h463318140805144A423A4E7496BCB8B6BCBBBAB4AABBBAC8BAB5B7C0B2BAB0B5),
    .INIT_49(256'hA6ABA09A9E773438415A6C6A768B9BAE9B949A9D908997A8A1A3A494817E6433),
    .INIT_4A(256'h808C908D96A19D8D7F80889194989B97878C98917D7F919A9DADA79B948C9FA9),
    .INIT_4B(256'hD0C9C0B3ABADB2B6C2B3AEB6B9B0A5A599878489979C989E9C8D988E859DA196),
    .INIT_4C(256'hBDBCB4C4C2C1B8C2B2AABAB3B3BFBACDCFD4D8DBDFDFDAD5D4C5C6CECED3DBD7),
    .INIT_4D(256'h14060005337143143B34405C81B7B8B3B1B8BFBBB3C6BDC6B3ABB1BEB7BEB4B8),
    .INIT_4E(256'h9C9FA19E8E5D3C516676816E6C74707F96A99F9BAB957B88B3AF957D72593A31),
    .INIT_4F(256'h8B909A9D989897917D7E858B929A978A9495988E84929C9194A9ABA0A1939F9A),
    .INIT_50(256'hD4BFB2AFA496A2BDC2B2B0AC9FA5AEA6A38C8886848E969E9789939095A9AAA7),
    .INIT_51(256'hB1BFBFB8CCC0B5B8AAAAA98DA18FC1CBC8C8D7DDD8D9D6C9CECACBD0C9D0DECF),
    .INIT_52(256'h030B183E4A4F531E2130374A799EAEB8AAB4BCB8BCBAB3C1BBB2B3B0B3B9BAC2),
    .INIT_53(256'h9FA79095A2594061696D777F84888E928A94999E9A848EB9B196837D5B35210D),
    .INIT_54(256'h897791A29D949A857F7F80838D9593899DA491958E8499999F9C968B98979B99),
    .INIT_55(256'hBDBAAC978F99AAB4BEABA5A8ACB1A9958D8583868F908B9B918C989494A4A8A9),
    .INIT_56(256'hC0BAB9B9D0CBB28F9F76766C7C91AB8FABB5CAD1CED3D5C9C6AFABBEC3C5CEC2),
    .INIT_57(256'h091B1B2D3721150B1231373C658BA5BFB5B9BDB7BCBBB0B8AFB0B9B5B3B8BBC4),
    .INIT_58(256'h95A59F9F9D512D3B545A626B7D939C99A59797998D8E92889491897040282000),
    .INIT_59(256'h866B71818F898C808A7E7B848D9592859196919C9A939F9EABA2927A8B939394),
    .INIT_5A(256'hA996817D8C9EA8A9B7AA9D999DA29E927C70677296A08E969A99A3A09CA39D97),
    .INIT_5B(256'hC8BBC2BFC2BFAC7C6051484B424E48707686A8C2C5C4CDD6C8BEBCC4B8ACB3AF),
    .INIT_5C(256'h0E0E1A231B171F1C163E443D6089A5BFB6B5B8B6BEBEB1B39FABBCB8B5BCC0CA),
    .INIT_5D(256'h97A7A5927937263632435B738997999698B0B6AA9C8A7B7A909669433D2B1B1A),
    .INIT_5E(256'h937B737D94868288917B75838C9594878F909BA7A29A9EA1A1A8A480898F8D98),
    .INIT_5F(256'h7A777A7F838A9DB2A2A3A09FA8A596887A6454577FA19B96A3A3A8AAACA89581),
    .INIT_60(256'hBFBAC8C3BAA89572563B36160400080844507098BBCECFC7CCC5BDC1C2BDB395),
    .INIT_61(256'h221C2B2922353B2E1B373F3A588DB1BDB2AFB5B6BDBFB2B09FADBFB9B8C1C2C7),
    .INIT_62(256'h96A5B39A6B27192239507491968D888B89989496A391767A807C5D6C8B5E2318),
    .INIT_63(256'h98948F93A98C829A9D847F8C91969B959092ADB7A99E97988CA3B4969D9D8F99),
    .INIT_64(256'h65758484858E9BA1A6A19A9EB2B8A693826A5F505A8CA2969CA5A8ACAFA99787),
    .INIT_65(256'hB7B2BABBB9916B4F3F290E3E545F35100033627A94B5CBD0C5C1B8BDC0B6A280),
    .INIT_66(256'h29393831454D3E43444D5750568AB7B3B0ACB6B8BBBCB1ADADB3BFB9BAC2BEBD),
    .INIT_67(256'h9B9FB4AA86544B55778999988777747989797B8381807C7183605A7B8675572E),
    .INIT_68(256'h84909495A98C839FA7949098999CA6AC9694AEBAAEA79C928899ADA1B3AF9A93),
    .INIT_69(256'h8081858E989A9591AAA29694A1ADA89882675E4A4A829E8995AAA9A6A29A9998),
    .INIT_6A(256'hB6AFAFA69869483C2E14347641576012020D235089AFC2CCC8C3BBBDB0928175),
    .INIT_6B(256'h3C413E4653555761677389847691B1ABAEA6B3B6B6BBB4B0B3B3BAB8BDC5BFBC),
    .INIT_6C(256'hA495A1A09D929AA7A7B1AA8C6D5D59563D5A7783817A797C5C646E787A857F54),
    .INIT_6D(256'h7A888C8797888899A39992969CA1ADBCA7989AA09FABB6A9939BA8A8B0A4A4A0),
    .INIT_6E(256'h8E929A9C948D93A0979196999A9C90756953483B4474867997AFA9A19B90989D),
    .INIT_6F(256'hB8AFB3996D4545462432712C181258220C03062F6A91B0CFD1C2ABAAA48D7F76),
    .INIT_70(256'h6F675F6C6968776E617C989E9AA0ADB1ADA2ABADADB6B6B0AFAFBABBBEC2BDC0),
    .INIT_71(256'h978FA09DA3A1A0A2AAADA68B61433C446767504E656465805C7F7D7382929688),
    .INIT_72(256'h828D92828688979FA39C8B88979CA1B4ABA194928AA1C8BD9D9FA5AEA78FA9AD),
    .INIT_73(256'h91A2A08C889AA39D9B89879198A28E634C443D323D5E6D739AB0A49E9D969DA0),
    .INIT_74(256'hB6AAB89A5E41544C46273A31291F1E1A1516060C4586AAB7CDD1BBA28B7B7D7E),
    .INIT_75(256'h869D82869D938A7975919B9EA8A3A2B5B5A4A7A6A6B0AFAAB3B3BFBFBCBAB5BC),
    .INIT_76(256'h8C94ADA1A2A19E9EA19B9D92622E2F534C334376918677747B7671797D88958D),
    .INIT_77(256'h83929D847D88A6ADB1A98C8193948F9D9DA8A39E8894C6BDA79C97ACA487A9A6),
    .INIT_78(256'h979BA6A99F9E9F9896888893999D927753442A3946446C99AAA5AB9F9DA39691),
    .INIT_79(256'hB5B8BB91697571515336302D29251E261D080B242867ACB9C7CBCBA38D767A8A),
    .INIT_7A(256'h85949EA8B2A690888793999EA9A6A1A7AEA29EA3A6A4A7AEB0ACB3C1C4B9B3B8),
    .INIT_7B(256'h9FA6B0A89898A09EA39E9B8F7545283C4671B5BFA57F76616767778E968E8E98),
    .INIT_7C(256'h87878DA07F909BA3A4A99F918691A29493A09AA9A89CB1B19397AAB49B7CA5AA),
    .INIT_7D(256'h9C98A5BABDB4B1B3A19B9DA0A2A89F88816E4B3F53738F989AA5AC999BAD9E8B),
    .INIT_7E(256'hC2B5AF957C807D6E635D484D4A3D3B1F252E322F28528BB9BAC1C3AC98878792),
    .INIT_7F(256'h9EA8B1B4B1A395919192898B9CA4A3A5A399949A9C999CA1A2A6B0B7BBBBB9BA),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__4_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0008)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__4 
       (.I0(addra[14]),
        .I1(addra[12]),
        .I2(addra[13]),
        .I3(addra[15]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__4_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized5
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__5_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hAEBAB7ADA69898ABB1A1959CA2784D5B97BFC2B0837E6359645D6474828895A2),
    .INIT_01(256'h8C89879C8E9D9FA9A8B0A99A8F8F9AA19C989DB1AF9B9CA994ABB3A9927EA8B2),
    .INIT_02(256'hACB0AAA19FA1A2A5A7A5A9A9ABB2AD9B8C888A838591918B888F9D9991918E92),
    .INIT_03(256'hB9ADB4BAB7A5897D8079615A5150635C5B352247757B6A97ACB7B8AD92888EA0),
    .INIT_04(256'hA8ABB3B5ABA49E988A8F8C89959DA1A3A39993949492969D9DA9B1B1B4BCBDB8),
    .INIT_05(256'hA9B8AFADB89E8FADB0A29CA8B28B6983ADB7AA8F8570636A625A5864778B9FAC),
    .INIT_06(256'h989B8C9BA6BAADAFA8A6A19490939CB2AB9BA3ABA89A909DA3B6A899988CA4B2),
    .INIT_07(256'h8B99958B95A09E9D9998989EA4A59D939893A396838D95A18F8893A19E9195A9),
    .INIT_08(256'hB9B3B5BCC7BC9F9AA789866E544B3C4B424D6E9EC0AC6C839CA5A6B2A0978B84),
    .INIT_09(256'hA29DA7ADA7A3A093888C8F8F969EA1A09C938D8B89898F979BA5ACADB1BABBB4),
    .INIT_0A(256'hA3ACA3A6B39C8A9FABA1A5A696797191A39C9883866869726562626A7B8D9BA2),
    .INIT_0B(256'h909C858CADC7AFA498898C8D919FA5AC9DA1A6A7ACB3AEA5AFB79D99AC9B99AD),
    .INIT_0C(256'h8B827882999C9AA49E97959FA7A0928D8D97B4ABA1ABA194988A879BAAA7A2A0),
    .INIT_0D(256'hB3B5B1AAB9BEACAAA4858F847E7D616687A7B7A4A7B87449919E9DAA9599A4A6),
    .INIT_0E(256'h9D9CA8ACA09994899288828998A2A096928F8F908F8E9399979BA1A8B0B5B5B2),
    .INIT_0F(256'hA7ACADA8A1959399B09BA39B7A6C727E9295857956666969696B70747D868C8D),
    .INIT_10(256'h8A8D7B89B0C2ABA38B798A9996A4AA9897ADABB5BEBEBC9DA7B9A5A4B6A594A8),
    .INIT_11(256'h726D676970798798A4A3A3ACB3A99D9EA7A2AAAAA5A29E9E9586839DA7948D8C),
    .INIT_12(256'hA3AEB1A7B3BBACA6ADACA9A4A0A6A89D8BA2BDBAA8AE8B6E849CA6AD907B755A),
    .INIT_13(256'h949DA9A695888584878085919493908B8C8F959B9B999CA19D9A9EA8ADACADAF),
    .INIT_14(256'h9DA8BBB7A09DA7A6A796A2966E60666A7A736E6047566C6E6D6E71767D848B8F),
    .INIT_15(256'h8B7C7491AFB1A8AE9D8D919F969BAB95A2ABA0B7C0B1B39E9EB5A8A3B2B39996),
    .INIT_16(256'h363E4C555A6A7A8093A5A9A7A8A49FA4A89F97A09B85899A969397ACA5868894),
    .INIT_17(256'hACAAA9A0A6AEAAB09EABBDBCB6B8BAB6B8A5AAC4B5A89FA49C978F9BA7A8A772),
    .INIT_18(256'h91989891877E7D827B7B8E9B8D7D7F848B9094969694999DA09FA1A4A4A3A7AE),
    .INIT_19(256'h9DA4B2AFA1A4AFAE9B99A2926E534E60786968525955717A79716D717C86929A),
    .INIT_1A(256'h8470738C9699A1A5B1A68C9DA397A89D9D938DA9B6ACB0B1A2AFA6A3AAB79F95),
    .INIT_1B(256'h623F384E5B5E646789A9B2A29A999BA19FA694969E9495938EA3A4A69F9AA39B),
    .INIT_1C(256'hAFA1A2A4A6A5A4B0AFA0C3BEB9C3A8B7B8BCB5BBB0B1A5929D9F9896A3AECCA7),
    .INIT_1D(256'h9795857C817E777B877D899586777B849A9B999590939BA3979C9F9C999CA7B0),
    .INIT_1E(256'hBAAD9E92929AA3A7A0A09A8C78513C586B765A464A6B758089796C6E78839099),
    .INIT_1F(256'h857783898492A79EB2AC7F9FBCA0A29AA28F95A8B4AEA2A9A7AEAFB1A5ABA3AC),
    .INIT_20(256'hB56B3C42463E4C6C94A7B5B2A3908D98A2B1A2909B9C90939698999DA5ABA69D),
    .INIT_21(256'hB4A39697A1A7A7A8B3A8B6B0C2C1B7BBAFA1A1ADAEA192859B94959CA4B4CCDD),
    .INIT_22(256'h8C858380735F7F888D91848F776E7B839AA0A09B989998978F9C9D9BA09FA4B6),
    .INIT_23(256'hAA9F978A83909F9B99959487847550474A4F4A5B6A748B8C88816E67798C897F),
    .INIT_24(256'h7D819E9990909E8999A59F9CB8B599A0A8A190A5AC9BA39C93A2A8ABB2AEA7AC),
    .INIT_25(256'hD8A55F3B404E678EA5A7A29C989599A5ADB4A7989B94898A968E909DA6A19E9F),
    .INIT_26(256'hB8B3A5948C91A1ABA8AEB6BCCBBCB9B4BAB098796E849898899E9C90A1C0CCC9),
    .INIT_27(256'h7F8B746E5D7B7F74868B8E8C6C5D6F86939A9B9898959393909B9E9FA5A3A3AC),
    .INIT_28(256'h92898B92908B8E93898B9089959B7A5C3F42454A6A88877E7E7E746F77838989),
    .INIT_29(256'h7B8BA3908288A39F9CA4A79C9FA59895ABA7919CA098A49F8C98A0A2A6A5A6A9),
    .INIT_2A(256'hD2C58852587289A5A19E9592999EA3AAB1ABA5A09B939195A19692989A95999F),
    .INIT_2B(256'hB9BDBDB19C8F929DA8B5B2B7BEAEBAB7BDA6958C84858D919EA99A8B9DBAC9D0),
    .INIT_2C(256'h85807A666A747579817C81716D737D8089928E878A878489848C9193999FA4AF),
    .INIT_2D(256'h949191939186849089949E949BAE9F8052363445738C7B82777573757B828B91),
    .INIT_2E(256'h888C91848993A5A79E9FA9988A9A9B88A4AEA6AAA49AA4A197979A9B9DA3A8A2),
    .INIT_2F(256'hC5CAAA7E788891958F8F8C909DA2A3A6B0A2A5A99F99A0A8989FA19A9498A2A8),
    .INIT_30(256'hBAB2AEADA190909BABB6B1AFAFA9B6BEC7A89EA69F8E8C969FA3A29EA3B4C6CC),
    .INIT_31(256'h7E686F657E75758989747E7585887E726D756D646B6D6E79778491989FA7B0B9),
    .INIT_32(256'h9DA79F908B8789949498A3A09BA7A28A754A39507B877C8B7D73707981878987),
    .INIT_33(256'h978F8484949796999695A093889998869DAEB4B6A8979FA5A5A2A4A09499A6A7),
    .INIT_34(256'hBEB4A691818FA09E948E84899BA6A29EB2A8AFB5A399A0A597A8B1A6958D9198),
    .INIT_35(256'hA6A3A19D9A989BA0A3ACB8B4B0B3ACB9B3B3B2A59698A1A09B9CA4998BA5C3BF),
    .INIT_36(256'h797060636D886B6B75657C776D52474D4C524D4951575C666C778A9AA7AEAFA8),
    .INIT_37(256'h97A19B8E88858C9CA3979BAAABA7A08C8472596783888A868474747D7F817F78),
    .INIT_38(256'h96A0978F8F8C858B848D989191938C91A2A6A5A49B929DA7A3A4ACA38A89A0B1),
    .INIT_39(256'hA88F8D8A7D91AFB2A69B8D8FA7AFA294ABA9B3B39E9193929FA2A6A18A757787),
    .INIT_3A(256'h88979A89818B918C99A2B5B3B0B7A6B199A6B0ACA9B3B7A9B3A09E937D87A6AD),
    .INIT_3B(256'h78756D666F7E6D616F757C5E443F474C494C505252565C5C6967707F90A2A79C),
    .INIT_3C(256'h9D96908F89808BA4A59994A1A1969B9C8B7F738B918087837A7078817A787D78),
    .INIT_3D(256'h93ACA6948E968C8875899692958A839CA39E9792959AA0A19D9595968D8A97A6),
    .INIT_3E(256'h8A7E80838393A8ACB0AB9F9EACB0A295A0A9B0A6928D908F928F91948B7D7C85),
    .INIT_3F(256'hA2B0B09C8D91999C92A1A6AFAFB5A7A9A2989AA6ADB3B9B9BAABA3A59A827A83),
    .INIT_40(256'h69616D6D8077898066674A2E2746594A595660655B5F675E6F65616068849FA4),
    .INIT_41(256'hAC9B989D968B909B8F968F918E889BA5937A819C8F797C85726E7C837879827B),
    .INIT_42(256'h94A19B9997A1918677849191948E889E9AA2A19499AAACA39C8C8590998F8B97),
    .INIT_43(256'h69747D8392A4B0B4AFB1AAA0A1A2A0A1A1AEAE9A8A8C969991969C9D9C917F6D),
    .INIT_44(256'h97A1B0B7A991878A8BA39FB5B6B5ADA1A196969A9595A2AEB5BFAB9CA392736F),
    .INIT_45(256'h67665C7577858E7F6A4A1C2A354750475C5461665B636F6466625F4F435D889A),
    .INIT_46(256'hA9A2A9B0AAA29787849C979AA5A6ACA5967A8C8D7A7D7F837A747F857A7D8275),
    .INIT_47(256'h938F8DA09B94807E8280888D949A949A95ACB29793AEB8B195908F9B9B837D95),
    .INIT_48(256'h6663718DA3ADAAA0A4B09F8D969E9EA6B7B2A8A5A29893999595979792A08880),
    .INIT_49(256'h908F9CA8A8A39A92878B92ABB2ACB6B0A6AA978EA0ADABB0A4B478769395735D),
    .INIT_4A(256'h6D5F6C698C87817751241E2A2F3B464B5056524D535C6269756559473C416297),
    .INIT_4B(256'hB1A496A8A5969F8E95A4B8ABA8B3A9A295848B867C83877D747076707A7D8578),
    .INIT_4C(256'h8D8F8E848B8A77858F8E898D9FA69E969EA29A8C92B2C2B79F7F99BDAB817794),
    .INIT_4D(256'h56657F969B979799A8ABA19DA7A1979EB5B3B8BBA78C8EA19B89848B8B9E9BA3),
    .INIT_4E(256'h8698A7ACADA99D9096958F9EA7A5B5BEADB6A897A3B0B0ABB4B28567728E775B),
    .INIT_4F(256'h606C6B74937D7D5733131724272D353C373F3E3D465259616C6058493B354062),
    .INIT_50(256'h97A0989995A0BEB19DA9BAB0A9AC9E958A80818178737267756C73717262635F),
    .INIT_51(256'h8E8E8E7F8389818B8F949CA19F9C9FA4999288818DABBAB1A3929DA7A1998D8A),
    .INIT_52(256'h727C8B9799989DA6B2A2929CAB9F929BA1A1ADB2A18E919A8F7578909097959F),
    .INIT_53(256'h7097ACA7A7A391818C948D95A2A2ACB9BF99A4B29EACCAC0A9B0B9946F776256),
    .INIT_54(256'h5462697D9E8D8F67210B131C16151820242C2C2A32393D414543453F372E2837),
    .INIT_55(256'h889DA2A29DAAC4B5A7AEBCB4AAA08C7F84766470776F736B6468716B6D686D6D),
    .INIT_56(256'h8F9097908A8F8C8A8A8C9DA79C959B9C9F8F83808899A8A7A69C9788889D9E96),
    .INIT_57(256'h919394989E9EA4AFB99B8187999694A19893939699A09B89846E7B9693867A77),
    .INIT_58(256'h6D9FB5AEAEA48F827E9190909EA1A1A9AFA699A0ADA5A7C0B6B6C096594B597F),
    .INIT_59(256'h69647F8DA69F886F210F12120803040D1B23241E21201C1A141925252827232C),
    .INIT_5A(256'hA8A39CA09CA2B9B4BFB8B1A69B928B88837152697F777F787E7E776B645D5E66),
    .INIT_5B(256'h97919EA3979799939289959E95929285998F8F989B9DA2A5A99B95847E8C98A7),
    .INIT_5C(256'h8D9CA5ABACA19BA2B1A18F8B90929AA5A29D9898A3A99D869182828D8A7C766C),
    .INIT_5D(256'h6E9FB9B8B7A8948D879B998E99A3A1A79EACA69FAEB4ACAAA5B0B39F7F5A5C80),
    .INIT_5E(256'h757A9499A7A584582010100D06040109121B1C191A160C0601040F0D141A1F30),
    .INIT_5F(256'hB3A29CA39E9CABAAB3AEA9A7A195908C81755C7584747A768C85797770625D6E),
    .INIT_60(256'hA39196A195939E9C9D99A09C88888F868B8391A9B5B3AEA9A3989A948E888DA5),
    .INIT_61(256'h8B99A0AAB5A6918FA4AEB4AD9E999EA3A5A9ACB3B4A49596A59E928E958F928A),
    .INIT_62(256'h6E96B5BDBDAF9E968F9B9E95A0AAA7AD9E8A9DA592A8BA98A1B5AB90886E6B83),
    .INIT_63(256'h7B9897989EA2974C1C100F0B0A0801050E1618151812070002060C080B15223B),
    .INIT_64(256'hA5A3AAAA9F9FA69F9BA0A0A8A597938A786D6275786C798174867C73737B7475),
    .INIT_65(256'hA8948D978E8A958E949CA79D807B8F9B97848295A9B2B0A6988F8E8F969793A2),
    .INIT_66(256'h8E948F98ABA49494ABB8C3BCAEA7A59FA5B3B7BEC4AB97A3A7AFA19CB1A9ADA5),
    .INIT_67(256'h7B9EC0CBCBC3B3A2918B95989EA29CA7AFB0AAABB5AFA9B196AAB48982796D80),
    .INIT_68(256'h95AA9F9D9AA1984F19100E0809080205101615111411070105060C0B0E172642),
    .INIT_69(256'hAFACAEA397A3B0ADA9A99C9C958D95927761606D6E707E85798D7A625D6D6668),
    .INIT_6A(256'hA698888A888C988A89909DA1907F899DA38E7E8191A3A9A1948B85899EAAA2A8),
    .INIT_6B(256'h91A09FA0ABA7A6B8BBB9B9B4AFB1AC9EAFC0BBBCD0C0A2A3A2B1A4A1BFB3B3AE),
    .INIT_6C(256'h84A5C8D3D1CEBDA29B8087908E8A87998CA4AAABB8B5A8A79FA1C09590927B8A),
    .INIT_6D(256'h9995A5A7A6AF8F61160E0A020508040D0F14110C11100A0601010A0D1117233F),
    .INIT_6E(256'hB0A7AFADA8B0B4AFAEB6AEAFA48F8D80815F616F747A787183785D6160636B96),
    .INIT_6F(256'hA59B80798299AFA0928A91AAAD91818C938C888890A2ACA69B92909AB2B7A8AE),
    .INIT_70(256'hB3AB9E99A9ABA7C0C0A8A8B6B5B5B2A4AFBBAEA3B2B0A0A1A39A9498BDC3C0BC),
    .INIT_71(256'hA6AAB3CBCCC1C7C0AC9C8C909C99949C99A5AFA4A4B0A59AABADA19C8B99809A),
    .INIT_72(256'h9FA4A2B1BFAF875C20180F1618101313100E0E1011141A20020D00041A212045),
    .INIT_73(256'hB3A6ADB5B3AFA99BACA6A5A8A5A19583755F65696D7675717C7461666E6C879C),
    .INIT_74(256'h96A5988F8592B3A29D8298C8B79FA3898E928B869B9F8F91A2A1A7B4B8B0ABAC),
    .INIT_75(256'hB1B8BAB9BEAF959CAEA0A4B2B2AEA99EB0BAA896A8B9AB9A939EA8A8BEBCBCBB),
    .INIT_76(256'hA8C8BDC1DFDED0C7AF9E8481979D979C979DA7A09FA69E9A9CADADA18083A093),
    .INIT_77(256'h95AAB7B8B1A78B582F201123301D110D16110D0C0E15202A282E223740272C78),
    .INIT_78(256'hABA4ABB2ABA5A2999CA0A9AA9F968E826E626C727277757377726C7A7B768995),
    .INIT_79(256'h93A6A6A19697ABA4A896A7C4A587948E929E9790A0A8968F9EA9AFABA5A5A4A2),
    .INIT_7A(256'hAEB1B0ABB4AE9896A49D9EA4A39B9999BBB5A398ABC3BDA79EA6AAA5B8B5B1AD),
    .INIT_7B(256'h9CB9CDD7D1CAD7DFCAA8A5A78F8A948E8D919E9C9DA4A4AB9DA9A48F8E7A9AA2),
    .INIT_7C(256'h9BAAB1AFA7A99B6C503A1515211814170E0C0B0D0F12181F3C452920211F3C8F),
    .INIT_7D(256'h9B9EACB7B6B7BBBBA1A6B0B2A395897D7169757573726F706E72788273728B98),
    .INIT_7E(256'h878890A2A4979CAFA599A0AB8C72818993A49E93A3B2AAA093A8B0A29CA6A79C),
    .INIT_7F(256'h92A0A7A1A7ADA4A7B5B1A79F9A949AA8BA9D949FAAB3B9B9ACA69D99B5B7BCC0),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__5_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0008)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__5 
       (.I0(addra[14]),
        .I1(addra[13]),
        .I2(addra[12]),
        .I3(addra[15]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__5_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized6
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__6_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hACAEC1D1CECCD1CCBBCBC6A89490826D7C85938F8E97999FA79A9D8397898093),
    .INIT_01(256'h8C9FA9B4B7A890725D583116130F100E0B0A0B0E0E0D0E1014231A1C2948658B),
    .INIT_02(256'h9AA2B0B6B4B3B5B8A6A3A8AEAA9F9180756F757270716C6E747070756C7F8F8A),
    .INIT_03(256'h827A7C8A9D9B94A7949097A2998C8A82A0ACA191949BA19F9CA9A49192A7B0A8),
    .INIT_04(256'h90A4B2A299A3ACBCB4B2A99D96929BACB19395AAA7A1B0C1BAAFA4A2B9B5BECC),
    .INIT_05(256'hB9CCC5BDD8DEC8BFBA9CAAB7A4ADAA778296A9A0999E96919C92A59689908371),
    .INIT_06(256'h8EABAAA9AB94807D78734A25130A0B09130F0B0B0B0B0E11160A143D4F708C9D),
    .INIT_07(256'hA2ADB5B6B5AFADADA49C9DA6A8A49989746E6F6D74787070576C81846B7F847A),
    .INIT_08(256'h90928D8595A39D9E808494A4ADAD987F97A09B999187949B949FA4A0A1ABABA4),
    .INIT_09(256'h939BA094929EA2A7A4A6A7A298949CA5A89BA6B4A89EA9B8BAADA5A6BEB5B2B8),
    .INIT_0A(256'hB0C0CECCD1D2CEDBD7BAA9AAAB9E87726A86A39F9C9F91848DA3A1A78E848E8E),
    .INIT_0B(256'hABBBA4949C988F8D91795640270F0F0C0D0A08090B0A0B0C0B0A35727D8F9999),
    .INIT_0C(256'hA4B2BBBDBFBBB7B9B2A9A9ABA49B9288776F6C6A777B6B6665777C6A46678097),
    .INIT_0D(256'h9E9997A2A9A5A8B48885939CA4ACA09287959DAFA58C99A48B97A6AFB0AAA5A3),
    .INIT_0E(256'hA2A6B7BCC4CCBDAFB3B1B7B4A4A2ADAF9F9AA6B4AB9C9AA0A5A29FA0BDBBB3AC),
    .INIT_0F(256'hBEA9BED1D0D0D3DDBDBDBC9C7C8F9469657F9FA5A5A99D9691AA9CA69F888FAD),
    .INIT_10(256'hACA599A0ABAA9F887D6E696B4D2B1E0C0B0A080B0D0D0D0C1C335276829EAFB8),
    .INIT_11(256'h98ABB5B4B6AFA9ACB6ADADAFA3958B817970665F6E715F59626E777A65767082),
    .INIT_12(256'h9C8D8DB1B8A3B1BEA38B949998A0A3AA97A2A8BDAB899599A99E999DA4A9ABAE),
    .INIT_13(256'h99A3BABFBEC6C5C6C8BEBFB8A3A5B5B6A39DA7BCBAA3979BA8B7B9A7AFACAAA6),
    .INIT_14(256'hC4C5C5C1D1D3C0CED0C8C4B38F76767D73829CA2A0A299999C97ACA59AA09590),
    .INIT_15(256'hA3868BA9A49B9F8C716F7877543F3C241D160D0B0E12171D35586D838E9799AF),
    .INIT_16(256'h839AA7A9ACA6A2A89E9698A3A1998D81746A5A506067575459768E916664699D),
    .INIT_17(256'h97958DA6AEA9B7A2A27F8A99939294A09AA1A1B19F829295B9A4969EB0B3A597),
    .INIT_18(256'hB7B5ACAFC0CAC4C0BBBDB2A7AAADAFB89A9CA4B5A9A1B5ACB1B8AF979EB5AEA4),
    .INIT_19(256'hBACBDBCDBDC7A8ABB5C1C0B1AA9A7A657298A08E92A2A39D9796918D929BA3A7),
    .INIT_1A(256'h8186A1A886A0858177727661404249373E2A06152B20242E405D6D739BA4A8A2),
    .INIT_1B(256'h92A3B5B5B5AFAABDB2AAA4A19A8E848086685A564E4C53525E968C6B6C707884),
    .INIT_1C(256'h9B8E827F9DADAE8885879195949E987E7C9DA2AA9F91A19EAEA89B9AA6A29697),
    .INIT_1D(256'hA7ACB0B8C2C2BEBDB7ADABAEADB3BBB7A89595ABA99DA9B2ABADAA9593A7AAA5),
    .INIT_1E(256'hBFC8C7D0CBCEC498A5ACA08B7379998F71718DA29EA2AAA0A7A5A29B9DA4ADB3),
    .INIT_1F(256'h6384977D99977D797B6B63513B444935282F141E3B3C3830456E757C7582BEAF),
    .INIT_20(256'h8E9AAFAFABA8A5B2ADB3B2A79E988D7E736B695C423D526175856C697F716A7F),
    .INIT_21(256'h9A948D8397A69D8685ACA08395A18F8986929B9A9FA49F9E90A794868B919C90),
    .INIT_22(256'hABA39FA8B4B7B7B6B3A0A7AFA3A8B7B0A79FA09D9EA5A9B4BEAAA7A19B9F998F),
    .INIT_23(256'hA7B4BBC8CEC7C59EA38C6F695568A4968889838294A29D91969CA3A3A4A5A9AC),
    .INIT_24(256'h44867D779D7484766154514B404B4E39283C252F535142373D6F72837B76A8C4),
    .INIT_25(256'h97A0B5B3ABAFB0B3AAAFAC9D93908B8276716B5B494B5E6A6554607E705F717D),
    .INIT_26(256'h9092918B9AAC9189909E9E867E99A7948C8A9A8995A88C94909D8C989A8C9C9B),
    .INIT_27(256'hACA5A9B6B9AFA59DA1969FA69B9CADB2A4A1A3959DB1ACB5C3A4A7AEA7A49F9A),
    .INIT_28(256'hA4A9BCB2C5C3BAB7985629334771A29A83968B7F92A193878D95A0A8AEB0B2B5),
    .INIT_29(256'h3A4A65807C70635C48474F4E454B514639452A3D6252414738556271787F83AF),
    .INIT_2A(256'h999FB5B2A9B3B5B1B9B3ABA3968882827E766C615E626059404F696A566B7237),
    .INIT_2B(256'h85939E989DAE909C9F9D8D7F848A8E9496909B8492A4838A8D8484A6B0979496),
    .INIT_2C(256'hBEB7B8B4A299A3ACA5A2A1A4A69D9BA3AC999696A5AFA7B5B1ABB7B09B9FA7A6),
    .INIT_2D(256'hA9A2AB9DAABABBA090614746658B8D8A9286929F90878F908B8B9097A1A8B0B6),
    .INIT_2E(256'h302D31756A635A31363538352B30383433381C32584336454B505A5A56808786),
    .INIT_2F(256'h868EA6AAA6ADA9A0A4A2A4A69F9187817679746B6864584D55665B4F57646553),
    .INIT_30(256'h8898A2928B9A8CAC9D837E8D9090918EA4A09C8D97A191918986979CA8B09A8C),
    .INIT_31(256'hA4A3B1B3A39A9F9FADABA2A6B4A89590A5A3A49C9BA5A7AB94A8BDA896A2A090),
    .INIT_32(256'h888F949D8E99B67044556B607797868E9E8786989786828A96969AA3AAADB0B3),
    .INIT_33(256'h30162B333F51373727201F1E1C1E1D1719230C193729222843503F41495A7474),
    .INIT_34(256'h878FA9B1B3B5A99F98A0A19A95938A7C77766B60646664626D5C4C565B586776),
    .INIT_35(256'h8E8A81737A8E8EA38C6982A49BA4AF93A3AAAAA08E88969EA19EB09C9DB5A496),
    .INIT_36(256'hA99EA2A39CA2ADA5A09B9FA9B4B5AC9D8F9EA5A19DADB39B7D92A8A2A0A89F95),
    .INIT_37(256'h6C817B8D6F5F7D666175806B7287838D7D827B87A6A187828B909AA5A7A39FA0),
    .INIT_38(256'h2116110E1711263829211E2023231D17111A050C20181717212F21253A2F4366),
    .INIT_39(256'hA3A9B6B9BFBBADABAEB4AE9B8D8880767B736059666E6F756253575D566E763F),
    .INIT_3A(256'h86766D6B808F95928490929FB2A394A59EA4B5B3938697A3AB9EA8A29FAEAAA7),
    .INIT_3B(256'hB3B1BCBBABADB6ACA69EA9B0A7ACB2A0827B7EA0B7C2BE928A91A2A49C9395AD),
    .INIT_3C(256'h6C72525346232669847B6F6F76797A75817B81898B979C928D929DA6A5A1A0A4),
    .INIT_3D(256'h2B0D0F1E110718342F251D1817171B1E1A1C081321171D231E142D1C1D293D59),
    .INIT_3E(256'hB9B7B5B1B6B2A4AD9D9EA09E91837D7D71736A676E6B666C696060645B678179),
    .INIT_3F(256'h73748084908B988F8B9198A6AB9595B5A797B0BFB0A9A59E9C969AA2ABBAC2B3),
    .INIT_40(256'hB4A9A4ADB7B2A79F949E95ABAC8C8F9883788FB8C4C1B8A7979C8B91A2A1A19A),
    .INIT_41(256'h683820243A24166A927F5D637D89805A72868D8B8F908D918A888E9DAAB0B2B5),
    .INIT_42(256'h281016050511063530261A1D0F1D1E1F1927121420261F21212227202F35325B),
    .INIT_43(256'hADABACAFB0ACA9AAA9A7A29893908B857D706B655E6F7D736867685F5C758474),
    .INIT_44(256'h8B747B89958F9BA19493A1AAAA8C95B0ACAB92ADBDAE96919995A7A4A9B1A5B8),
    .INIT_45(256'hADABA8A6A49D9893A6A396ABA58494A8929EAFB0A4AABABFADA3888DA2AAADA0),
    .INIT_46(256'h2B21131529062A8E92695D7065647A6C7A857D7E837D7B79908D8D949CA4A6A6),
    .INIT_47(256'h3E0611130C0B0D25383622231C1A20232129141F29281C1F1F1B25293C473433),
    .INIT_48(256'h9D9DA0A7AAA8A7A8ABA79F948E8A868181766D6059646F6974776C5C5F6B6E67),
    .INIT_49(256'h856C80989C97A9A99D8F9196AB9F918C8FA8AAA7A9AB94839D9BA39B9B9A8D95),
    .INIT_4A(256'hB0B6B9B5B1ADA8A4ADA9A5B9B19BAAB399AAAFA195A1B6C5C1B1A0A5A8A7ADA7),
    .INIT_4B(256'h14041107231846B2935E4E6763627774758681848C91999398A7B0AA9FA0A8AF),
    .INIT_4C(256'h56110C161D03040C373B2D25271C211E262716262C24171C17212922304E462A),
    .INIT_4D(256'h9B9CA1A5A4A1A0A3A39F958A837F7C797B766E6360666B6B727C6E626C6D6468),
    .INIT_4E(256'h88758E9A8C85A6B5A1999E8D98998E8D8F9DAA9FA1A19A91979C9D9897959090),
    .INIT_4F(256'hB2B5BABDBCB9B6B4ACABAAB2B3B4BAA7929EA5A3A09EA6B4B9AEB3BFB4A7A9A8),
    .INIT_50(256'h260A08180D2D9290766A5A5D656570866A818D7D7A8586818895A4B0C0CAC2B2),
    .INIT_51(256'h7049260D1A01255C45383B2D2F2A271A282B192728231B20302F37484C3D2A1F),
    .INIT_52(256'hA5A5A7A5A19C9D9E9D968C8178716D6A676A68656A6D6E72767C766E6E635959),
    .INIT_53(256'h86869EAAA69098A5ADA3A8939FA29493989BA4A9B3AAA991879596999E9FA6A8),
    .INIT_54(256'hC3BFBEBCB8B5BAC4BEB0A2A1ABBBBCA291A8B8B4A59898A2A2A5B3B4AEB2AD9B),
    .INIT_55(256'h040A181E3F92AFB6776F605A676D728270749289848F838A85898A8C9FB7C0B9),
    .INIT_56(256'h69827D46250A73E77D3F473E3A372D26292E1F252125292D37413E4D4E2C160C),
    .INIT_57(256'hACABABA6A19FA1A3A29B9084796E66625F626263696A6A71726E7473645C5E5A),
    .INIT_58(256'h888C8992B7A58E91A29EABA6B0A7989990A2A6ABB9AEAC7E7F91989EA4A6ACAF),
    .INIT_59(256'hBAB8AFA59B9CAABABBA5959BA9B4AFA29BB3BFB19F9C9B969CB2BDA296A9A692),
    .INIT_5A(256'h103B2A66A3A98C9990675D656D7A7B78957A8D928B826C79909B9B8C8593AAB9),
    .INIT_5B(256'h686C7659342680D5B95B484640392D3226281B211E283238384E576D5217161E),
    .INIT_5C(256'hB8B6B3ADA9A8A9A9A69F948B80756E6A6E68676969676A6E6B646F7060626F6C),
    .INIT_5D(256'h89957D75A99F8591979197A2B09B979D95998C909896A3998D97A2AAAFADA9AE),
    .INIT_5E(256'hBBBEB8AEADB4B6AF9E9A979AA5A79F9D9EA3A9A49BA3A598A4B8C1A1939D9999),
    .INIT_5F(256'h392365A39A9776707F666E7472777B878D787B9193898F95929FACAFB0B2B1AD),
    .INIT_60(256'h6F7184753E1D69D5D28B4B4548433B382E281B2B2B3440465C5A8DD98E0F1538),
    .INIT_61(256'hBFBDBBB4B0B0AEABA69D93898176706F6E6268716F6D716E7373737069696D6E),
    .INIT_62(256'h8BA79B89ADA08992AE907690B6A6A08EA08F7F777F929DC4A59DA6ABB5B7ABB4),
    .INIT_63(256'hB7C1C0BBC7D1BA949BADB0A3A4AAA1A3968B94A29C9EA6A2A5A2A8A4A8A496A6),
    .INIT_64(256'h41619B9674736F716565666883897785808375888581A49BA5B1BAB4AEB0BAC4),
    .INIT_65(256'h6F6C737C65304AC0D1BA5A48575D573F41332841464B555E6471B2F3972E3F37),
    .INIT_66(256'hB9B9B9B4B2B3B0ABA89D8E83776C6565594E5E727171746C6773706C77756E74),
    .INIT_67(256'h9CB0A48BA5A19697B29E829FBFA5A7919B969A7D86B4A0C3B79DA0A0AEB7A7B8),
    .INIT_68(256'hB2B4B7BABBAE9582927F8A97A8BDB7ADA1958A83928793AFAE91B1AB9D96A1B5),
    .INIT_69(256'h598DAE966F62676A78787B8083827A75838C85756F747F8A80808BA2AEA4A2B1),
    .INIT_6A(256'h6C72757A6C5A30A8CFCB9D543F4F6D6B644D5368595367645993C9EC6E2E4B39),
    .INIT_6B(256'hC2BDBFC1BEB8AFA3A49F999183746F6E64584E515C636868606872767976726D),
    .INIT_6C(256'hA0A2ABA1A5999A93A6B7B7ADA29EA297939EA08F9FB998B5BAAB9BA5BCBCB7BD),
    .INIT_6D(256'hB3B2B5BBBCB2A19486778A9BA4B1B1B1BDA8A9A69A7D8A9E969BAD978E94989F),
    .INIT_6E(256'h7F9FAF9A7A7074786C7782868483868A8C8E7B687690907D7C8382859CB1B3AF),
    .INIT_6F(256'h7170767F776B296DC5C899350B1F29445F6F4C2F372A254677C5D0DA3E223C54),
    .INIT_70(256'hB7B2B5B8B4B2AFA6AAA6A097897A7371665E5A5D63646260666B6F7071737270),
    .INIT_71(256'hAAA3A5A3A6939BABA4B1BBBDAB9CA2A1A0A5988A99A08EA6B7A597A4B9B8B4BB),
    .INIT_72(256'hB9B4B7BEC1BAB2AFA89397968B94A9BFB5A4B4B3A08F9FA39B9F969499988B8E),
    .INIT_73(256'h98AEB1988689867A7A86918F8882858C7F8075635F6E85938D8B868BA1AFB3B4),
    .INIT_74(256'h676A7A89877B2236B4A1301B1C08110D1D2E1D0306000C4BB6C9DA9F21304B6C),
    .INIT_75(256'hB6B1B1B2ADABABA69895928C83797675605C5D63686867656E72767674716963),
    .INIT_76(256'hB1A4A3ABAF9296B5BAA59FB4B6A5998599A0938C9D918998A693858FA3A7A8B0),
    .INIT_77(256'hB5B0AFB5B7B2B0B2C1B2AC9A7E7E9AB4B0B1B9A69EA0AEA49E9A8BA0A19C8F8E),
    .INIT_78(256'hA7A89D8D878B8980838485827D7873727572767A7C808B92959598A2AEADACB3),
    .INIT_79(256'h6C747E85846D12225C82632E170F0F0E160F110E0D0D1B42A2BFD363174A8AA5),
    .INIT_7A(256'hB3ADAFACA6A4A49F9590897E726A656457555860686F747A6B7175797A76706A),
    .INIT_7B(256'hA39D9EABB49A90A4B1A2A2B0A7979A948F94978B9F938993A79C9398A7B4B7B6),
    .INIT_7C(256'hAEA8A6A8A9A5A2A4A4ADB6A98B84949AAFC3C2A2A3A6AFAF949BA1B29C9EA198),
    .INIT_7D(256'hBAA18982817E848D807D7A78797773706A6C7172798F9789929DA1A1ADB3B2B0),
    .INIT_7E(256'h7278737581691A372DA0E49044151414121A1D100E1B385C98C0A8441665ACAA),
    .INIT_7F(256'hACA8ABABA5A2A099948F85796E6865645553565E666D767D7879767473757471),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__6_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0080)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__6 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[14]),
        .I3(addra[15]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__6_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized7
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__7_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hA0A2A0AAB7B4A5A3A5A8AAA99A97AEB69396AA909F9E8890A4A39F9AA3B5BAAE),
    .INIT_01(256'hB5B4B3B2B1ADA8A396A5AFAD9996A5A0A1B9BEA7ABA4B0C2B0A3B2C0A8A2A7A2),
    .INIT_02(256'hB0AB9783808C8E8686837F7A7574757579777C786F7E98A0A29F9BA2B1B5B5B8),
    .INIT_03(256'h747772798E80353C358DD9C4C58C5C2D382019313751A1E1CC7893441C6E9F8D),
    .INIT_04(256'hB5B0B2B2ABA59E958A878075706E6E6C5957595C6063676C7878767575767571),
    .INIT_05(256'hADACA3A5AABAB2A5AEAF9C91949DA8A3969FC1ADB1B38F93A6A3998889A0AFA7),
    .INIT_06(256'hBBBFC2C1C1BFB6AA9DA2A4ACA4A3B3A9A0ADB5A3A1A0ABAFBB9DA7AAA79D969D),
    .INIT_07(256'h91A29E88889B967B7F7A736B67656769715E667A79798282A29B9AA4B2B0B0B9),
    .INIT_08(256'h8280807C888D461D17338A71CEF8918B8F6A66C1DEA9B8E3AB39874C297BA89F),
    .INIT_09(256'hB9B4B4B2ABA29A8D8C8A8378706C68615B58595C6062656A64696E757D84837F),
    .INIT_0A(256'hAEA39CA095A4A499A7BCAA928B8B929497A9C4C3BDBB9EA2B7B1AA9D97A9BCBA),
    .INIT_0B(256'hB2BBC0BFC2C2B6A592959DB5B5ABAC989FA3A99493A6B297908C987B868D848E),
    .INIT_0C(256'h838283888D8E8A84746B605D62686967655D68767B8B93848098A19CA3AFAFAA),
    .INIT_0D(256'h7D747A6A6C90611C1A142E1F82A871CBEBEBACD2E76F57B06062533E42A9BF9D),
    .INIT_0E(256'hACA6A5A69F9991848787837C77746F685D595A5E656C757B71717072787F8281),
    .INIT_0F(256'hAD9FA1B0999EA29C9EC2B79E9890939CA1B0B5BDB2AEA6B3ACABB7BBB3B5BDB8),
    .INIT_10(256'hB8BFC0BABEC5BEAF9CA49FAFB8AFA89295A1A1A0A7A8C2A58A90867B838A909B),
    .INIT_11(256'hB69B8A919B9483766F68605E5D5D5E5F59696D73848A94AD9A91919DA6A7AEB9),
    .INIT_12(256'h78787F848C97712A192A362D3C283C7B82BB836895313B654B312C4279BEB7BC),
    .INIT_13(256'hB3A9A3A59F928E918E868180776B6C746A635F6064697076766E6B747A79787A),
    .INIT_14(256'h9E899ABFA89F9B978F96B1A3999AA39C8D9EAF9D9EA49CB7B4A9B3BAB4BBC2B6),
    .INIT_15(256'hB8BDBDB9BDC4C2BAB3AE948FA3AFAEA39BA3B4BBB6A5B0A5A2937E76828D8F8E),
    .INIT_16(256'hA59F948A8788827A6E5D4E4E5458554F5D636B7A87858CA3ACA39DA0AAB4B9BC),
    .INIT_17(256'h8B8388848E99864F1F161E30554B465D5759604F374E705133263050B1B89EA3),
    .INIT_18(256'hABAAA69D9B9E9A928C8C857A737273706364686D6F6B6766636B787F7E7C848D),
    .INIT_19(256'hAE9694B2A2A49E9E9A93A7A3A1A0A9AC9C827C7C8D958CA79E9599A0A6AFB5AA),
    .INIT_1A(256'hBFBFBEBBBCBBB9B6B7B1978397AAA2A3A9A1BDC5B59FA8B89B8C818081827F78),
    .INIT_1B(256'h8586847D77797B7A766F676464615F5F615B5D6C7A7C7F879EAAB2ADA7ABB4BB),
    .INIT_1C(256'h81797F7D8F9FA4873D1D1718242530423F5052535C6A43261F284E97CBC59A87),
    .INIT_1D(256'hA0A3A095969E9C918C8D887F7876746F706E6F706E6968696B6D727B848B8A83),
    .INIT_1E(256'h95A5A9AC949EA4B4988EA2A7AEAAB1BAA38980788294909B9A9D9E9A9FA8AEA9),
    .INIT_1F(256'hBCBCBFC1BEB9B5B5B8BAB09BABB3A1B0B2A2BCB8A39DA2BEA9989496918D8A80),
    .INIT_20(256'h8275727A7C767071766E635B585D697365666D73737A8384819AB1B4ACA7AFB6),
    .INIT_21(256'h817C7B7E83979F987A482E1A0C111811101D16191B0815282E5685C2C3C2A587),
    .INIT_22(256'hA6A29F9FA09F9A96908C8E928B7A737577726B676362676D6C777E7C7C838988),
    .INIT_23(256'h8DAAA88881898C8B979CB3ACA99E9D9E9E92948E8F9A959390A6AA9994A1ABAE),
    .INIT_24(256'hB4B5BAC0C1BEBEC1BEB9B2A7B5B5A4BDB1A8BEAF99A29BA7BCA3938F8D92958B),
    .INIT_25(256'h8B796F72746B605C58575E6A736E62595E6B828C81798592888A95AABBBEB9B2),
    .INIT_26(256'h86877A84788F939D9F7B65411C1E1905160908191A21363C6899B6ADBBA29E99),
    .INIT_27(256'hA09F9F9F9F9D9791918F95988E7C74796F6B6767636163666A747A7A7E898F8C),
    .INIT_28(256'h879FA37A867B83888FA8BFA8A09DA2A2A88F8EA1AFADA09B9BB5B79C8E979F9E),
    .INIT_29(256'hB9B9B9BAB9B7B9BDBCB2A5A4B1A797A4ADA9B9AA96A8A0A1C0B7AB9C90949FA3),
    .INIT_2A(256'h867F74696767645C615E5E62636463646D6F829FA697919DA3948EA0B9C3BDB5),
    .INIT_2B(256'h8082767E768E95A69C9792754C4737241E1A1C2B2A4F5387A6B8C3B5A4949091),
    .INIT_2C(256'h99A0A29C999E9A8C8B9192897F7B77737673727372706E6E6A6B6D7484918E81),
    .INIT_2D(256'h7B8B9D90A78890A4819AAC92949FABB2AFA3999FADB4ADA29EABADA0959B9F9A),
    .INIT_2E(256'hBEBFBCB8B6B6B4B3B8B6ACB2B5A39490A0A0ACAA98A7A8AF9EB5BAA38E8994A3),
    .INIT_2F(256'h88857B6E696969664F545C5E59525358686362769294898AA7A3A0A2ACB6BAB8),
    .INIT_30(256'h83817C757A818D9591939599928F664E5535426E78A2A9B6BBB2BEBF90998B89),
    .INIT_31(256'hA3A8AAA4A0A19E978C8D89817C79746E7A77767A7B777370636D7779777B8387),
    .INIT_32(256'h8C837D8DB5A9969A9093998892908F97A7B7A89094A0A39C858291A19B9AA6AD),
    .INIT_33(256'hB6B9BCBCBEC0BEBBABB6B2B8B29F9C939394A5B5A1A4A5B39BB8BDA6989399A7),
    .INIT_34(256'h8E7F726D655850525655596066676667717E71647C959A9B98A3AAA6AAB5BCBA),
    .INIT_35(256'h7C7B826F837B8A898088898E8F96889591928B97AAA6C1AAAEAEBD9A96948C95),
    .INIT_36(256'hA7A1A0A59E929199968A858A897C737269686D747970635A70707173777D8384),
    .INIT_37(256'h8D887082A1B7ACB3AB9B9B9EB19E8C91AFBBA8959693959D918297B09F8B99AC),
    .INIT_38(256'hBDBDBAB8BEC9CCC9BEC1B6A79C929AB19C8AA3AB9DA4ADB6B7C7B4B5AE8E94A0),
    .INIT_39(256'h8B7062625D575D676560545062768084818678867787A49BAAB1AAA3ACB0B3BC),
    .INIT_3A(256'h8185797A7F737873707C83878C918D858D919A9DA79DABADA1959C96939C9393),
    .INIT_3B(256'hA2A2A09A989A9A97919492887E7B79786B6E757166616A7377716C736F758C7F),
    .INIT_3C(256'h8A89716C979FC9B1AB9BBAABA5A5959098A0938C7F8A93A7B8A399A3ACA8A2A3),
    .INIT_3D(256'hB3B9BCBCB7B6BEC7D2CCBAA59B96969CA095A6B2B0B5B9BA96A5A0B7BFA79B86),
    .INIT_3E(256'hA18D756A6F756F62616B6C63606575878B92858B808294869AACB2AEADABACB6),
    .INIT_3F(256'h8487787D7A6F6C6A6B747B7C81898C89858794989C9596997B798D8F86858C9D),
    .INIT_40(256'hA9AAA79F9B99969398958F8886837B726C7C7C6E6970716B686464635E6A7E77),
    .INIT_41(256'h939993849FA0ACB6AD9DBAACA39E9697A1A2A0AA9E90879AA9AFACA3A4AFB1A8),
    .INIT_42(256'hB9BDC5C7BDB2B7C5BDBFCAD3C6AD9A929CB6BAABA2A9AA938E9FADBCAA96A5A3),
    .INIT_43(256'h8E8C7965646B69624654616B72747C8A8F968C888883938A8598A3A7A9A7A8B0),
    .INIT_44(256'h86877580756E6468646B7173767D83837C7D8E928E8E7F8871657686867D7A82),
    .INIT_45(256'hB1B2B0A9A29D99969B97928D8B867B71748279686C73716F68676A5C5668777B),
    .INIT_46(256'hB1ADA89AB7C0A8C3B7A0AB9D99989DA2A3ACA9AEACA4929595ACB3A39DABB1A9),
    .INIT_47(256'hB1B3BBC5C9C6C9CDC6BCBEC6C8C6B59A98B3AEB2C5CFD0B8B8A9A4AB988EA09C),
    .INIT_48(256'h797D786F6A625F65635A505464707D8C8B90897E87839B9E8C90949BA5A9A9A8),
    .INIT_49(256'h82816E7D6F70626D646A6F717173787A727081857C86707E816A6A7B837D726C),
    .INIT_4A(256'hADB0B0ABA6A09D9B9A9A99928A817B777F7B68646D67677C65686A4F4A606876),
    .INIT_4B(256'hCBC2BCB5BFC9A2ACC3B5B7A29698ABB0ADAB9B99A5A3989C98A8B3AFA8A8AEB0),
    .INIT_4C(256'hADB2B8BDC4C9C7C1C6C8C2AA9DACB09D919A97AFB29298AFB3A3938D8A939275),
    .INIT_4D(256'h6F6763676F67584D70685C54575E7085858C8D818782979FA7A09CA0A7AAA8A2),
    .INIT_4E(256'h79766773686F616E6D6E7071707074796B6471746C78667681756F7274787D78),
    .INIT_4F(256'hA6A7A7A6A29E9B9B9B9A9891887F7C7B81746263695A5B7963686446465A5E71),
    .INIT_50(256'hB1BDC6CAB2B3A29CA7AEB49F9196BABFBFA58E99AD968CA3A2A3A7A9A4A1A6AC),
    .INIT_51(256'hAEB8BDBBBDC1C1BBB6B9C0BCAB9C97968C9095A49C7A80A2A3B6A98A94B8BCA0),
    .INIT_52(256'h786760646B747060595D605F62636C7A7F889594918C9599ACA5A8ABA7A6A7A3),
    .INIT_53(256'h726E6569636E616C746F6C6A6A6B727A6E666C6A656C63707173717374798073),
    .INIT_54(256'hAAA6A4A3A19D9A9A9F97918C89837D797B76696463585767676E5F464F5C6174),
    .INIT_55(256'hA2B2B9C2A4A9B6ABAEA898878692BEB9BAB2A7A8BEA697A6A7A49E98989EA2A4),
    .INIT_56(256'hA6ABB2B8BFC4C9CAC7ACA1B5C4B29B98A29A9594A0A4948C94AE98779CCABDA4),
    .INIT_57(256'h64505862595C6A6A6366615A60666F787D81929E969B9C9DA5A0A8AEA9A9AEAC),
    .INIT_58(256'h6D6D6D676974686E79706A6A6A697077756E706C6E676A6E6C6F6C73797C7A61),
    .INIT_59(256'hB3ABA6A4A39F9C9C9B95908D89817D7C7C776D645E59585B68715546575C6271),
    .INIT_5A(256'hB3B1A8AEA8ABB4ACD6BC96888585ACA3A5C0BDA7B9B0A6A6AEACA7A2A1A6A9AA),
    .INIT_5B(256'hAEA6A7B1BBBEBDBFB9BEB2A7AFB1A7A38C8E9C969DA9A3A789AB9C86AFC09A88),
    .INIT_5C(256'h5B415A7D69535C63606B6F696A6F747B807C88998E9FA2A2ACA2A8B1AFB2B8B5),
    .INIT_5D(256'h6E6F766A737C72747D746F71716D6E757672726F75666F6C7070676E71727865),
    .INIT_5E(256'hB8AEA6A4A3A09C9C93959791867B7C83817369645C585A5B737D584D63616673),
    .INIT_5F(256'hA39F9CA6B5B2A9AEBBAC97938774A1A59DB8B59AA69898A7ACA8AAAFACA5A6AB),
    .INIT_60(256'hBBBEB8ABAAB5BEBEC0B5B2AAAEA99CAF9DA3AAACADB4B09893A3C4C3C999717A),
    .INIT_61(256'h615D616A6E645A56565569696C6B7D78827B85A1998CA2A6B0AFAFB0B4B9B9B6),
    .INIT_62(256'h7279767682837D81827A7B737B7276727673757671767A716D797E6D6F696C69),
    .INIT_63(256'hB0ACA7A29F9C99979D99928C857F8081836C61686A5D5B66716D63595F707978),
    .INIT_64(256'h988FABB5B8D5B5ACA59FAC9A88929496A39BB7AB9B9AA8AEBAB3B3AAB2ACB2AE),
    .INIT_65(256'hBBBEBCB3ACAEB8C1C0B9B6ABABACA8BDB8B0A490A5C2B3A9A7B7AFB4B86E4568),
    .INIT_66(256'h6C646061615D5C5B5B5B69676D6F82858B858AA2A298A4A2AAACAFB1B6BBBBB9),
    .INIT_67(256'h788181818785858F8A81807A80767B7C827E7B73767E7C7E787A7D72786C645D),
    .INIT_68(256'h9F9D9C9D9D9E9D9C9D9B97928E89878382726A6E6E6461686C6763636D757C7C),
    .INIT_69(256'h999094B4BFBBAD9E9AA0AC9886929E9F9F8EAFBCBBAEB3BC95A4B5AEAFA9AEA8),
    .INIT_6A(256'hC2C2C3C3BCB3B3B9BBB8B3A4A2A9B1C4BFB6A58299BCA7A7ADBBA29F9186919C),
    .INIT_6B(256'h625F5B5753505354636A716E7676818B928F8C9CA5A1A5A2A7ABAFB0B2B7BABA),
    .INIT_6C(256'h7C8387888985899790858382847B838B8C8582767C867E8888837F7880716559),
    .INIT_6D(256'hA29E9C9C9DA1A2A59A9A98939390897E7B75716F6A6463646763666E787A7D7F),
    .INIT_6E(256'h9A9F9FA2A69FA49CA29C9595949AAAA99E949F97A9BFC0A3A7A8B5B9B8A8A7A8),
    .INIT_6F(256'hC1BFC1C6C6BCAFA7B1B2AFA6A5AFB4B9ACAFAE9798A3958F9FBCB5AA8DACAF92),
    .INIT_70(256'h5D61635D5553595F6572787A837F818C92938E919CA0A4A7ADB1B3B0AFB3B9BC),
    .INIT_71(256'h8182858888858C988F848285867D87958F808A82808C84868F8B857880746A5E),
    .INIT_72(256'hA3A2A3A4A3A4A2A39B9B9893939187797778756C6463625D63666B7277797B7E),
    .INIT_73(256'hB8A8AE908D8D91A3B9A18A9CA39DB1BEA0908F8994A1B4B2A1A1ABB2AFA2A2A8),
    .INIT_74(256'hBDC0C5C8CDCBBFB4B0AFA9A6AAB2B9B1A5AFBBC6B6ABAF988FB1AFAAA0B08882),
    .INIT_75(256'h5A6269655B5860696370767F888887938D959894979CA0AAAEB5B9B7B5B5BABD),
    .INIT_76(256'h8C8684898B8D91958E858288857F8695967F8F90808D9187898D8C7A7D736B5F),
    .INIT_77(256'h9399A3A9A9A49D99A1A09B969490867B7A7F796A6366635A606A706F70787F81),
    .INIT_78(256'hC09495959D929DBBC3B298A1A198B2C9B7A5978E9AA2ACA29AAAB8B7A5999CA5),
    .INIT_79(256'hB7C1C7C8C9CDCFCEBCB09B9495A5B8B59D9DA8C8BDB5C9A9909C9F9D90A5878A),
    .INIT_7A(256'h535B69726D6361656E737480848A8C978E96A5A19B9D9EA7A6B0B8BAB8B7B9BA),
    .INIT_7B(256'h9088878A8B9195928F8A878E878486929F8B9298848A9A8F888F928484756E64),
    .INIT_7C(256'h9EA0A4A6A3A29E9EA3A09C98948C85807E827A6A656B65585C676E6C707D8789),
    .INIT_7D(256'hA09693AFB09FBFC0BFB79C8D939DA9AEB4B7A7909CA6AF97AA9C9BA898817F97),
    .INIT_7E(256'hB4B6BBBDBEBEC2C8C6BAA2988F96B2B2938D8D9E9C9EA88D99A4ABA98B94846E),
    .INIT_7F(256'h5B5A6679807771727E7A7786838D91989393AAAA9FA2A1A5A4ADB5B6B6B7B9BA),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__7_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0004)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__7 
       (.I0(addra[12]),
        .I1(addra[15]),
        .I2(addra[13]),
        .I3(addra[14]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__7_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized8
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__8_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h8A898D8A848D968F8D8E8A938B8D8A929E9F92968D839694918C8E8A8F7C7472),
    .INIT_01(256'hADAAA8A4A0A0A1A59E9B9A9A938783867E80786B6B7067555A5E656B76828A8C),
    .INIT_02(256'h8EA5AEC0A5A1BEA3ADA9917A8EA69E918E9DA7A8A28DAAC1C09F8FA8A89D97AB),
    .INIT_03(256'hC2BAB9C1C3BBB8BBC5C6BEBBA599AAA3A69E978B87887C6B91B4A8AEAC9C8E90),
    .INIT_04(256'h6757546676787A8283797A8D87959A9D988EA5A99FA5A6A5ADB2B5B4B3B7BDC1),
    .INIT_05(256'h848A938C7F889590888D8B968F938F9297AB9092957E8B9398858187947E787F),
    .INIT_06(256'hA3A5A8A9A4A19E9E9A989B9E9586858C8081796F71766A565A585C6C7C85888B),
    .INIT_07(256'h8989A6B99EAEB5A39C99907C8EA494908AA1A8A9B1A5ADA4B9BBAFAEAAB9AD9F),
    .INIT_08(256'hBFBBBCC1BDB4B7C1BBB3B6B4A99D9CADABA8A1988BA09B97929B968E91887D7D),
    .INIT_09(256'h80664C536F63717F8F85818B8B8FA09B96919FA1A9A2ACAAA9ADB7BCB9B3B8BF),
    .INIT_0A(256'h8898908A858898928A8C939491849B9292AB9F8A85818994849A8F7D8E8F747B),
    .INIT_0B(256'hA3A4A6A49D9A9CA1969B9C98938F88827D7F7A707D726A565A55657C817F7F7A),
    .INIT_0C(256'h8F807A889298C5B6A99FA5B0B8ABA48790998D94BC9CA4AAAFB6BFC0BAB7B0A2),
    .INIT_0D(256'hBBC0C1BFBDB7AA9EABABA69E9FA4A6ACB1B7B39E96ABA395898A7B7D91A19A99),
    .INIT_0E(256'h817C735F67696C7C8F837F8C8C8C9B9A9992979DA9AEB2ABAAACAFB3B4B4B7BC),
    .INIT_0F(256'h8F99908A888B97908F8E90999586959895A79C8D86797D8A8B9691808A95847C),
    .INIT_10(256'hAEA095969EA09A9396989995918C87817A7D7B787A6A5E555A6977797B7D858C),
    .INIT_11(256'h7F78897C8CA4C1B89B9AA9B7BEADA58B84988A8CBDA7B1C0B7B9C3C5BBB2AEAA),
    .INIT_12(256'hBABDBCBABAB8B0A6AEB1A59B9D9DA1ACB5B1A78C95ABA189909C8F8C8E9F9EA5),
    .INIT_13(256'h868B8A71686F64789085808C8D8996979A99979FA7B4B5B1B2B1AEAEB2B7B8B7),
    .INIT_14(256'h9C9D928C8D90968D94908A9D998A8D9D959E938C86767B8A8288989283828084),
    .INIT_15(256'hA4A09D9C9D9A95909C9A97918F8C88847983807B726C5E5B6972787B8384868D),
    .INIT_16(256'h8182B5A09A9996A49BA7B3B1B2AEB29E8D8AA08A97A2B1C8C0B2988796AFB09B),
    .INIT_17(256'hBAB6B6B9B4ACAEB9BAB4A6A7A18992B2BDA59787A4AD9B838AA49C95889595A4),
    .INIT_18(256'h8C8D83867A73657A908D868B8C8A94929AA09EA9A6AFAFB9B7B7B3AEB2B8B8B3),
    .INIT_19(256'hA39C918D9194938A929085999A928797989B8E888378818E7C79909C8C746F83),
    .INIT_1A(256'h9FA6A9A39893969B98938E8C8F8F8C887B888074697666627B6B708188879097),
    .INIT_1B(256'h987D98A9AB9D6F779AA3AEAFAFA4BAC3B58BD3A4739BAFC2B0AC967D7E92A5AB),
    .INIT_1C(256'hB6B3B6B9B1A29DA4B7AA99A6A48C9CBDB4968F93B1A58F8995A8A19E9DA49797),
    .INIT_1D(256'h888F7B948E77768292978D8B8C8E95909BA09CABAAACA8BAB4B6B4B0B2B7B7B4),
    .INIT_1E(256'h988F8A899095908A8C8C838F959A878C9A9B8E86817C868B897877899D8B6F77),
    .INIT_1F(256'hABA8A199979A9C9C8985868B92918A82828178726E7864667B6472827B85A0A3),
    .INIT_20(256'h947F74929BB1908AA29EABBFB88D9FC2B998DCBE819DB5B4AE988B9CA49390A7),
    .INIT_21(256'hB6B7B6B2B1AFA69CB1A592A0A7A5B8BB9C8E8F97A6968EA69BAAAFAFB8AB9386),
    .INIT_22(256'h768F7D93927A8787959D918C909097959A9C96A2AFB0AAB5B1B4B5B4B5B8BABB),
    .INIT_23(256'h867E83878F948E8F878685878F9B8C879593888481818C8D8C7F6D6E8E987C71),
    .INIT_24(256'hA5A49F9A9A9A968E89898F95958B7F778D7A787B7C765D6A7167767C778C9A83),
    .INIT_25(256'h889E8C8C87C1C2AC8D99ABB6B79CABC19AA4B6C3B2ACC0B0A4978F9DA39292B1),
    .INIT_26(256'hBAB8B4AFB1B4B2ADA6A397A4A8AEBB9F939DA3A39F9692B18E9AA69DA78D8483),
    .INIT_27(256'h6F857E8A9584908E999B8F929791969F97A09D99AEB1B0B4B5B3B2B4B7B7BABD),
    .INIT_28(256'h7D79878C92968F95888089838A96938E988A7D7F7F809198847F77676D848175),
    .INIT_29(256'h9AA2A59E96928D8890949A9990827C7D8C7D857B7D74616D6E7175737D8C856D),
    .INIT_2A(256'h95A49F9191C3C99EA2B7B9ADAD9B9E9CA2ABA6C3CCC0CBBFCABB988EA7B3ADAB),
    .INIT_2B(256'hBBB6B6B7B1A6A6AF939596A9A19EA7808BABB7B09F978393ABA39A7A846B7884),
    .INIT_2C(256'h75787C86A09294979C988B959C8F95A794A9AB96A9AFB6B9B9B1ADB1B3B2B4B8),
    .INIT_2D(256'h7F7D9095989A919B8B7C8E8388919896A78C777B7A7990A1867A7E6D5B707D76),
    .INIT_2E(256'hA5A7A0938C8D8E8D8F939893857B838F82828F6E7073696C6F7E766C7A7F7C86),
    .INIT_2F(256'h9797B5A7A1AFC0B0989CA2B1BEA19EA7BDA0AAB9B5BEC2C6D7DAC4B0B0A7A4B0),
    .INIT_30(256'h2D2C313E433A3F54504F4F4E453B3B41383D495040323035352E252425292F37),
    .INIT_31(256'h516469614F45586261594E4D4F4E525D5C504F5159727B70614A415668604432),
    .INIT_32(256'h6071604247666C615852565C564F4F4E474A56656B65585255616A645F5E615E),
    .INIT_33(256'h575D50504D4B59595064655F70796F63584C596C68554B4A474158675A4E464B),
    .INIT_34(256'h594F54565E6E6C685A52656A5C5D5F5D66604945585753636E68696259544544),
    .INIT_35(256'h292E31394141434D494D52524639373E43444B4B4239322E2D25262B2A2C3339),
    .INIT_36(256'h606C66584B4C575750514F4E4B4649574249515150595E584543444B4F4C3F35),
    .INIT_37(256'h636B5A46475A6666535559574F50585752565F67685E544C535C6057545B6565),
    .INIT_38(256'h5C5E5557534E5F6365696E6F6E736F644E4F5758555A5A5047445A63544B454A),
    .INIT_39(256'h4D4C535659696D6D5E505D615A6064625E5D515564635B6470646569685E4A4B),
    .INIT_3A(256'h2733373D474C4948454B5252473D3F4851514E473F3934342E242A332B26282A),
    .INIT_3B(256'h5D685F534E535A5149525753483A36412F4149443E3D4147343F443E3A3E3F3A),
    .INIT_3C(256'h524F453F3D43505D5558584D43464E4C5A5B5E5E5A5049485058564948545F5D),
    .INIT_3D(256'h635C5356514C5F6A645C64685B5D62564544505B5B5B5D5A52485258595A4B45),
    .INIT_3E(256'h4E525A554F5D6264544B5C66666E6C675E6161676C6B65635C55627071675964),
    .INIT_3F(256'h35444A515957504D5051524F4742485254534C43362F3645392C3340352B2723),
    .INIT_40(256'h535F5A5857595C5047535B594F3F363A3943484B4E4341513D43423A39434641),
    .INIT_41(256'h4A43444844414B564B4C4E4B474C4E495B5D5A544D48484A4953534B4B575D55),
    .INIT_42(256'h6150515D574F57615C57585953595F5957556170736F6E68564E5051575D4E45),
    .INIT_43(256'h585B6055484F51524141555E5E625E5D68676B6B62615E57555A6D6F60504B60),
    .INIT_44(256'h52585A6162554F565D58514A4341444A49473F3D3A333A50453A404E4C45413D),
    .INIT_45(256'h5C5C545A5E5953473E495052534B4141413F4356625244504A464240434A4F51),
    .INIT_46(256'h4A43484A4443494B4C44444B4F51524E585C58534A4748484952544F53616258),
    .INIT_47(256'h4F3F4F6662564F50555D544E5A6564676D73756F707C78644C535A51494B484D),
    .INIT_48(256'h5D5A5E53474A4848444A59585356565C69626662504A4B444A55665E4A414458),
    .INIT_49(256'h605A575B55443E4C554F4845444442414641343C494946534F4B4B535A585657),
    .INIT_4A(256'h675B4D575E59514340494A4748443B394B3D3948575147494848474644454F5E),
    .INIT_4B(256'h4C4649473A3D443E40373A4C565B5F607074767069625D575756524E555E5E58),
    .INIT_4C(256'h4A33445B56514D4F4F5D534E626F6A70787979767170665350555A4D4948414B),
    .INIT_4D(256'h60565A534A494244434F61615B5B575F5C5353503F393C3A3A404D49474C505D),
    .INIT_4E(256'h615853585442394448423F41454845424A4C3B3A4C544C4F4E554C475354535E),
    .INIT_4F(256'h6E695D5F615F5C504A544E413B38353A584B43434A54575247494B4741404B5C),
    .INIT_50(256'h4D4B524D3A3B443D343B4E636F7C8A8F9B9E9E9A958E827873695E5A5D61605C),
    .INIT_51(256'h4C31404E44464A534B53575F6A7372727B75788177645852524F4B444B4A3B42),
    .INIT_52(256'h5D4F55564F4A454A394555595D5C4F4E5447404137323A464C454A4F53554F57),
    .INIT_53(256'h615D5B636354454745433D3F434746424F594635424E4A4B4857493C47494A5D),
    .INIT_54(256'h73817C74686469644E5B58483C3E475151504F4543535C4E494D4D453F3E4850),
    .INIT_55(256'h454654533C39423B53698491939EA9A9ABAAA5A09D998D81897D706E71737170),
    .INIT_56(256'h4B3349544343474D3F3C4E6263656D6A6C6E71695B57544B4444433F423F3543),
    .INIT_57(256'h55475159554E4B5545484F4F5558484455433939353442575B4E555C5E574F57),
    .INIT_58(256'h5F5951545B574A454938333E4E4F444A4D443E3A373B3F3D4E5651413C414A54),
    .INIT_59(256'h9A9C9A9A9C9B8F827460504E49424F655D5D51424252606156534E4C4D45454F),
    .INIT_5A(256'h4756524B444D656F7A90979BA9AFAEB0A6ABA3A09F98907F887F787774758191),
    .INIT_5B(256'h47433F4E434037403F3D3C46545A5854595B5F5C524744473E31313B3D32313B),
    .INIT_5C(256'h4242474D5150535749626B4B4F67564B4A493940403442504F4B505A5B595348),
    .INIT_5D(256'h5855535149454345382D33393E423E45372C2F39342B2D3546514A403E434B53),
    .INIT_5E(256'hA3A9A9ACB1B4ADA499836D5F51454856675F4F4043535F5F5C544C4C4B47454D),
    .INIT_5F(256'h606E675F6473827E919EA1A3B0B3B0B3ACAFA5A4A09C96887F7C7979787A8593),
    .INIT_60(256'h4A46393C38413632404B4F4947505657575A534A474A484049444346433E3F4A),
    .INIT_61(256'h424F5852453F4A5753615B565A5953515657444743373A3D4143525D534F4C44),
    .INIT_62(256'h6159595544414747342E3B3E39403D372C21262F29242B36424A443E4045484C),
    .INIT_63(256'h9BA3A5ABB1B5B1ACACA294877763564F5956504D4E504E49504E515A5E5E5B5C),
    .INIT_64(256'h526472817B7285989AA0A2A9B1B1AEB2ACAFA4A19C99968D8182827F7D808791),
    .INIT_65(256'h43413940424940394E554F3D333E52616258473A363A3F40505A616158524D50),
    .INIT_66(256'h3D54645C49434F5C515848555C525A575756413F46463F3344485D665148463D),
    .INIT_67(256'h6A5A58594E4E524742394648414A412C2E2D2D2D2D34383342423B383F423D3B),
    .INIT_68(256'h9CA3A5ABAEAFACAAA9ACABA9A0917A694F4D4F515048413E3C3E4A585E64686A),
    .INIT_69(256'h72767D9498878D97939299A5AEACAAAEA8ABA39F9993948D888A888280868C93),
    .INIT_6A(256'h423D414B483E3E4D615A4C3B2F34485D60504A4C453C4152545F605857657176),
    .INIT_6B(256'h39506160575658564B52484C575D60524952473B404948403B3A4E5D53515447),
    .INIT_6C(256'h584A4D55515254464A3E4949444E4A373A38383C4046402F3C3930313B3D332C),
    .INIT_6D(256'hA1A4A5AAABAAA8A8AAAAABA9AAA99C8E6F5C4D454545444533354046454C575A),
    .INIT_6E(256'hA3B2AAA19A979789938E92A0A6A7A8AAA6A9A4A29D93928C8E8D8882828A9299),
    .INIT_6F(256'h4A45494B433238495C605B4A3D3D464E5A565F6A654C3D404C53554C50627075),
    .INIT_70(256'h374856595859534B4F50564F5362524042575A483F474D514E434B595D62614F),
    .INIT_71(256'h423F4953505256524C3F45443F484F5453423C4344423E3637322C2F3A3B302A),
    .INIT_72(256'h9C9C9EA4A6A7A6A7ACABA6A5A7AAA59B997B5B4943433F3D353A48483C414842),
    .INIT_73(256'hA8BDBDB5A59893859B91979FA0A1A6A8A1A6A1A39C928F88948D8581848C9197),
    .INIT_74(256'h44475152554947464D5F614E45525D5C6C6E757A7C705A473E4A58617080888C),
    .INIT_75(256'h32404D4F50514F4B4A42534B494E3A334750554D525B5658695851596062594C),
    .INIT_76(256'h3D424A515253565B513E3C3E40434A5D6350423E383A40413939373A3F3D3635),
    .INIT_77(256'h9F9D9EA4A7A8A7A8A7A5A3A4A5A6A1989A8F7C6652453B363E414F4C3D40473C),
    .INIT_78(256'hAEAEAAB9BFAD9B85958F98A09D9FA2A09B9F9A9D988E8A82948983858B8D8E92),
    .INIT_79(256'h414658616D615E584E5252515767747B7F7F8285919B978B9392908D8D90959B),
    .INIT_7A(256'h303A474E504E4D4C4441474236373C3D4D454444555F4F4E5651464A55544A48),
    .INIT_7B(256'h4747484C54545257573C303742403C505F5D5341333A43404046464749443F43),
    .INIT_7C(256'hA09C9DA2A4A2A2A2A39F9B9C9EA1A09D8A959985644C45474C44463C2E3C4D45),
    .INIT_7D(256'hA6B0AEAEAEAAA492878899A5A09FA1989B9E999E9A908C8590847F8A93939394),
    .INIT_7E(256'h564C59636B58606E624D4964787A7C86817F828B93979FA49C9CA0A5A49F9FA6),
    .INIT_7F(256'h32384350544F46424B574B3D282F504E5045463E4143364154584E4A534A3E45),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__8_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0008)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__8 
       (.I0(addra[15]),
        .I1(addra[12]),
        .I2(addra[13]),
        .I3(addra[14]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__8_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized9
   (\douta[7] ,
    clka,
    addra,
    dina,
    wea);
  output [7:0]\douta[7] ;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__9_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]\douta[7] ;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h4C463C465A483A4D514A3839422F233B58635F42343F454C4E544B555A4D5760),
    .INIT_01(256'hADA8A49DAEA7A8A69D9C9190959B9F999A98958D7F6952413F3F3D3638505B4C),
    .INIT_02(256'hAAA2B4B2A09CB59E838B8FB0A8A0A2A29F9D9596A2949A8B96818E8C9187919E),
    .INIT_03(256'h666665636C43534F283E6D767280807B786B73818997A29C8F9B938A949BA6BE),
    .INIT_04(256'h41363F5353453B3B605C51453D44473D42433F46504A414A524C5E5759474967),
    .INIT_05(256'h54554E4C4F41353E47443C3E4333232F45586248363D465260564B5554576660),
    .INIT_06(256'hACAEAEA7B2A7A39E929C958C8A99A19B9AA0A09C95816042403F424046555D58),
    .INIT_07(256'hA6A5ABA1AC998CA47F8990ADA7A1A29F9C9C9AA0A796978A94828A8D908F949F),
    .INIT_08(256'h76686152564F512D253A5E6B6B777A6F6067656A85908B8D8C756D7685A1B0A3),
    .INIT_09(256'h44332F45554E403D55544C3C3643473838444A515B554E51535356475567696F),
    .INIT_0A(256'h5D5D5951504D443B3535363A3B372C282D3E4F433A434B5662514F5649506359),
    .INIT_0B(256'hA4ADB2ABB2AAA6A19898908D929F9D95A1A5A2A1A198785549525A6064635D5D),
    .INIT_0C(256'h979B9E8AA0936B817B8289A39E9D9E999C9896999C8F94929A8C8A8E88939098),
    .INIT_0D(256'h70544C4B5B6840002345646D63606A62574F54596280928880858C867F97A799),
    .INIT_0E(256'h524A404D60583F354C5049362F3E3F2F323A3C3F484B4C504D5A5B535C767575),
    .INIT_0F(256'h7469626061655D493D393D3B3A4444352F333E3E414C4A4C4A49565E49404B4C),
    .INIT_10(256'h9DABAFAAABAAA8A7A798979EA5A2989BB8BAAFA4A6A898806E7E86878B817877),
    .INIT_11(256'h8C8C967D737F766B6868708E919796989A939194938B929C99928A9080928991),
    .INIT_12(256'h5A4042586C7029001D455A64584D574E5546515446638A89808881829AA09797),
    .INIT_13(256'h4F5C524E5D5E4B42494D493A2E36382E403B383A40444B555057586C6B6C5E63),
    .INIT_14(256'h96827C7D77767360534B4A46404B4D383D353B3F464B3F3A3640515A4E383142),
    .INIT_15(256'h9EAEB1AFAAACA7A8AAA2AEAEA8A29FB3BFC2B8A59FA6A29693A5A69FA4A5A2A1),
    .INIT_16(256'h845B58746C626257463D4D7888929099989595989290919D93928B937D948A94),
    .INIT_17(256'h514C4D5B6B5D141A3D53555E625D5C4D57615F58504D6487907A6C84A394808C),
    .INIT_18(256'h4A5E4F3741524C4543444541353539393D3B444B443D45535D5144646659464D),
    .INIT_19(256'hA6989492837D7F7E6A5E58544C4D4731312B363C45443937383C45494D3C2B3B),
    .INIT_1A(256'h99A7ABB2B2B0A9ACAAA9B2A3A1AEAEBBB5BDBBAFA4A4A19A93A1A9A7AEB5B2AE),
    .INIT_1B(256'h2D3522202641524C352A3D6C869990979B98969489918F9E92918F9784938993),
    .INIT_1C(256'h545A5153634D0412283C4044505A6162666C6F6B5D52658C877D848D7E736755),
    .INIT_1D(256'h465649323A4C453737363C423D3B40442A3143473327384D5D57464F4E444750),
    .INIT_1E(256'hA39D9790817D858C8779737470685D4E3629303842443E4243393F3E3F453D3E),
    .INIT_1F(256'h959D9FADAFB0A6ADA69EA4989FB6B0B5B3BCBFBDBAB7B1A893969FA6AAAEADA2),
    .INIT_20(256'h36270C0800000A3E352B395E7AA098969A98958F839492A0928D90998B938B92),
    .INIT_21(256'h4C514C505D40050E1A354541495B6A7E706D75786D66717F75767B6C5E5E491D),
    .INIT_22(256'h394547444A554E3E2D2D333C3D4144402F35423C292B40494C5C564A43394D55),
    .INIT_23(256'h9F998F827C7D828594857F898C8378725B433A3D454943494638463C334A4D42),
    .INIT_24(256'h999C94A5A5A59DA99B92A39C9DA9A4B4B0B2B5BABEBEB9B3AF9E9DA2A0A2A7A4),
    .INIT_25(256'h090000002D6C3D0C332630476A9D9B958F959A978C9F959E8B838A9790978F95),
    .INIT_26(256'h3E444E57522B112B42515B46414742526A8076758572545E89846D58533E2221),
    .INIT_27(256'h434851534C4C48412B2B2F353B4340333B3D4238303E4B4043585A4D4E3F4B43),
    .INIT_28(256'hA0897E7B7062718C9385837F737984786E534B463F44484F4639434043595955),
    .INIT_29(256'h909F9F99B0A69FA39595967A907EB0B6ADACB8C0BABAB6A5A7A1A1A4989FAB9B),
    .INIT_2A(256'h0007153B484E511B1B282A386486939A888F959193928B99938A8C898E94949E),
    .INIT_2B(256'h414C3F506A2B193F46494F575A5E64695D686F77735D648F876D5D5C42201303),
    .INIT_2C(256'h412F4758534A4D382F2F2C2F363E3C33464E3C403A3048484B4842374440443F),
    .INIT_2D(256'h87827461596475818D7C767C80857F6A60554F4F5350465447414D484656595C),
    .INIT_2E(256'h9F9A9B9DB4B39D7B8C65675C6E839C7E969FB1B6B2B3B2A39C847F9192949C8E),
    .INIT_2F(256'h0519192E3621150B0D2A2B2A51748BA192929691949388908788908E8C9395A1),
    .INIT_30(256'h374B4E5C652407172F343841546B7773796A6D6F6667685E6C6B655229191500),
    .INIT_31(256'h3D222737453F3F333A2E2B3039413B2F3D413C48463F4E4D574E3E25343C3C3A),
    .INIT_32(256'h735D484655697376867A6C686F746F6552473B4464685155545159555157514D),
    .INIT_33(256'hA49BA4A3A9A9996B52433C3E35413B62677393ABA9A4A8AE9C918B93877B837D),
    .INIT_34(256'h0B0C18231A171F1B1035362A4A6F889F928D908E9495888A768394928E959BA7),
    .INIT_35(256'h394D544F410A000E06162C455E7176716E818A7F7463515068704525261C1014),
    .INIT_36(256'h4C3429334B3D383E442E28333C4440343B3D485651494D505054502B3238333E),
    .INIT_37(256'h443F41494C55687E70726E6F7774655A503D2B2E53706559605E6060625F4D3A),
    .INIT_38(256'h9C99A8A7A1928262492F2C0D0000000039425D829EACA89C9E958C8F918E8466),
    .INIT_39(256'h1B1726251E313729122C2E243E70919A8B878D8D94968787768495918F9A9BA4),
    .INIT_3A(256'h3648605530000000071C3E5E6765666A606D6A6F7D694F505654374D734B170F),
    .INIT_3B(256'h4F4C45495F4338505337323F43484B453F425D67594D46473B5260414646353B),
    .INIT_3C(256'h31404E50505C6870736F676D8088766558443828315F6F5C5B605D5F635E4F3F),
    .INIT_3D(256'h93919A9FA27D5A41342205364C562C07002550627591A2A4968E848A8E877651),
    .INIT_3E(256'h1C2E2D293D463538363C41353767908C88838D8D90918482828B9691929C9798),
    .INIT_3F(256'h39416060471C141E3C495A5D544C525A6554565F5E5C5547593634586A5E4620),
    .INIT_40(256'h3D4A4C4E62453A565F4A464E4E51595F4847616D61594E443748594C5B573F35),
    .INIT_41(256'h504D515C65696460797165657180786A563F372323576D5155625D5954505052),
    .INIT_42(256'h938F908A82553A30250C2D703B51590B000112396B8D9AA09892888D8165574A),
    .INIT_43(256'h2B322F3745474952545D6E6552698580847E888B898E878386888F8F959D9897),
    .INIT_44(256'h4032485158535B666269634A353036381F3C5966625753553038445158686840),
    .INIT_45(256'h3341433F50413F515B51484C525662725C4C4E54525E685B424A5454584C4942),
    .INIT_46(256'h5D5E666A625C62716764686D6E7264483C261D131E4B554055655B514A454E57),
    .INIT_47(256'h928C947E5731373A1B2A6A26120D521C0600001C51728AA5A4937D7C7B65594E),
    .INIT_48(256'h59524A575554645A496178796F747C8282777E81818A878483858F92969A9499),
    .INIT_49(256'h312A454B5A5C5B5A5C5D5742251219294D4F383449464159315250485C72786F),
    .INIT_4A(256'h3A464C3C414350595D5743404F53586A61584B4940567D724F4E515A4E364E4E),
    .INIT_4B(256'h616F6D5A586A736D6A5A58616B7561371C150F05102C36335261514949444E54),
    .INIT_4C(256'h93889A7F482D433F3B20332A241918140F1000002E69878EA2A38D7460525555),
    .INIT_4D(256'h6E876C6E857C6F5D587077757C73708487797A7A7983827D8688949694928C95),
    .INIT_4E(256'h2932524E5456524F4D484C4823000733301826597264524B4E49444E5663746F),
    .INIT_4F(256'h3F4F5A4239425E6569604337494A4554535F58553C48796F594B43584E2F5149),
    .INIT_50(256'h65687679727170666352515D64695E46211200020D06254E59505145434A3D3C),
    .INIT_51(256'h92989D7651605F43482C2827231F161F1C070418154D8B939C9D9B725C454C5A),
    .INIT_52(256'h6F80889198897064606B6F737C797279807571767B797C8385838A999C918B91),
    .INIT_53(256'h49515D5646454C4A4E4B4C47350E00111D498D967B544A353B3B4B6670696D7A),
    .INIT_54(256'h4C4C51623E4B545956594E433846574947544B5D594D62624345576146275053),
    .INIT_55(256'h6A67778D918883826B636263676E67504A370F00102A4146454C513E40544534),
    .INIT_56(256'hA0948F78626A695E55523C4341343218212A282313386A938E92927A67565662),
    .INIT_57(256'h87969B9B9382716A67655C5E6D787479756E696E706F7279787E878F93939193),
    .INIT_58(256'h5F6B655B51423E545A4E485663411C2C68919383544D332C37333A4E5E667386),
    .INIT_59(256'h55504C604E58565D595E56494142505550494E62604C4A57425961573F2A5460),
    .INIT_5A(256'h7F847E77757473736E6A696A6B73715F4C45473C3B423F37313846423D3D3C42),
    .INIT_5B(256'h92899197978970686D6B524D46455851502912325D5E4770818B8B80655B6375),
    .INIT_5C(256'h91959A9A8C81796F5F625D5B646F7075776F696B6B696D7673828A8A8D95948F),
    .INIT_5D(256'h59695D5B6247355659504E62755739557D86795F5540343D342F303E556C8092),
    .INIT_5E(256'h5B5F4E5D667566635B565043424650676050575F5C4E414E54675849483A515F),
    .INIT_5F(256'h63716C646E7670695F58565A60615A4F4F485747323A404937333E4F4E43475E),
    .INIT_60(256'h8F898C97A39C81818F74735D453C2D3B30385683A389475A727A7B87756D635C),
    .INIT_61(256'h8B858D90847E77695B5E5E5F666F7172726A636462636971757E85868A93928B),
    .INIT_62(256'h525C50535C453045544F59625A454465726B67525437384238383B465A6E7E87),
    .INIT_63(256'h4F5B444B6A82685A4D3B3E3F4352596152565A5B6067615860684D495C4B485C),
    .INIT_64(256'h655F555E73736B6F60544E565C5549413A435F544751473B3F34344A5C5E5A5B),
    .INIT_65(256'h858683808F9A888C876B786F6A694F516C8A988484924C1F677473806E738082),
    .INIT_66(256'h82808C8C7C726A5C6458525867726F68696A696A696A6F7573757B83898E8C88),
    .INIT_67(256'h565B5954493D383F594958594039475363625447243538383C4148525E6A7173),
    .INIT_68(256'h414536456B7D655C43303E4B48555C4B4E64626C747472535A6C575668574657),
    .INIT_69(256'h4F4C45454A4E5561645C575E645B504E4F485050484541423C302F4E5B4B4748),
    .INIT_6A(256'h727C8079869185828D8F8E8B899093856C809A947F8560445A727C8468544F35),
    .INIT_6B(256'h787D87826E5E5B56575054606463605D656C72787776787D7876788286838483),
    .INIT_6C(256'h4C57676347444C4B50445754332C3A3E4B423C2F15253B3D404349515C666F74),
    .INIT_6D(256'h3E2F2B49696C626955454754484C5B485964576E76676954536A5A5564654B48),
    .INIT_6E(256'h131C2932343F46465059595454504D5051433B443F292D3E3D3D435B563D404E),
    .INIT_6F(256'h7C7879717884838C7C8DA1A29FA3A69E987F839D8B7E7579716C636E7B7D7D4B),
    .INIT_70(256'h6F75746B605450544B4B5F6C5E4E5059666D71757273777C7C7B7B7D7B797D80),
    .INIT_71(256'h4C535E5B484A53524345534D301D1C314B3A392329233F494B44434B5766747B),
    .INIT_72(256'h311E25414F535C636C6042525548584E544C46626F65696A57645B585F6C5447),
    .INIT_73(256'h3B1C142832302E28425C5D4C4345474D484E3C3E45393A38364B4F544F4C564E),
    .INIT_74(256'h7F727275797A7B8B8C80A5A2A1AC93A096978F9587887A6571706865727F9C7A),
    .INIT_75(256'h74705E5558544B4D594F5B6758494E5A777A787671737B8175787B7570717C83),
    .INIT_76(256'h695C4A3E3940464A464B4A42381806273D4A2D171A3A4451594A3E45525E6D75),
    .INIT_77(256'h2E23323B3C4C625C6E6637536E51504B59484E616D675B625C6364665A60585E),
    .INIT_78(256'h8B47161A1B0B132949565D5A4B3837454E5E4E3C4645383B3C3E42464F575249),
    .INIT_79(256'h8574676B747C7F8190889694A9A9A2A3917C7B87857867596B6361686E7F96AA),
    .INIT_7A(256'h635C5A574935555B60645A654E45525E7A80807E7B7B7A7A6D78797476747787),
    .INIT_7B(256'h594E43362A3644403E3E413A3E3513111D2721313D465C5C5851403A4E616158),
    .INIT_7C(256'h242B4A4945495944535F56506A6647515F5A465B6251585148575A5D6460595E),
    .INIT_7D(256'hAB7D381212182B4957544A413E3D42515E655849484133343D3537434C484446),
    .INIT_7E(256'h8D887A6961697883848B969FAFA3A19C9A8E7354485B6D69596B665767859093),
    .INIT_7F(256'h53614A443351554A5C636765483A4C6576807F7D7D7A777872797A797C78767F),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[7] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__9_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0008)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__9 
       (.I0(addra[15]),
        .I1(addra[13]),
        .I2(addra[12]),
        .I3(addra[14]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__9_n_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top
   (douta,
    clka,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "16" *) (* C_ADDRB_WIDTH = "16" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "14" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.530383 mW" *) 
(* C_FAMILY = "zynq" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "0" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "blk_mem_mire.mem" *) 
(* C_INIT_FILE_NAME = "blk_mem_mire.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "57600" *) (* C_READ_DEPTH_B = "57600" *) (* C_READ_WIDTH_A = "8" *) 
(* C_READ_WIDTH_B = "8" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "0" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "57600" *) (* C_WRITE_DEPTH_B = "57600" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "8" *) (* C_WRITE_WIDTH_B = "8" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_3_6
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [15:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [15:0]addrb;
  input [7:0]dinb;
  output [7:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [15:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [7:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [7:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [15:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[15] = \<const0> ;
  assign rdaddrecc[14] = \<const0> ;
  assign rdaddrecc[13] = \<const0> ;
  assign rdaddrecc[12] = \<const0> ;
  assign rdaddrecc[11] = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[15] = \<const0> ;
  assign s_axi_rdaddrecc[14] = \<const0> ;
  assign s_axi_rdaddrecc[13] = \<const0> ;
  assign s_axi_rdaddrecc[12] = \<const0> ;
  assign s_axi_rdaddrecc[11] = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_3_6_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .wea(wea));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_3_6_synth
   (douta,
    clka,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input [15:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [15:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .wea(wea));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
