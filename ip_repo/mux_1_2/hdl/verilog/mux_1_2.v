// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="mux_1_2_mux_1_2,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.733000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=3,HLS_SYN_LUT=67,HLS_VERSION=2022_1}" *)

module mux_1_2 (
        ap_clk,
        ap_rst_n,
        opcode,
        in_r_TDATA,
        in_r_TVALID,
        in_r_TREADY,
        out0_TDATA,
        out0_TVALID,
        out0_TREADY,
        out1_TDATA,
        out1_TVALID,
        out1_TREADY
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst_n;
input  [1:0] opcode;
input  [127:0] in_r_TDATA;
input   in_r_TVALID;
output   in_r_TREADY;
output  [127:0] out0_TDATA;
output   out0_TVALID;
input   out0_TREADY;
output  [127:0] out1_TDATA;
output   out1_TVALID;
input   out1_TREADY;

 reg    ap_rst_n_inv;
reg    in_r_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    out0_TDATA_blk_n;
wire   [0:0] or_ln4_fu_82_p2;
wire    ap_CS_fsm_state2;
reg   [0:0] or_ln4_reg_94;
reg    out1_TDATA_blk_n;
reg    ap_block_state1;
reg    ap_block_state1_io;
wire   [0:0] icmp_ln4_1_fu_76_p2;
wire   [0:0] icmp_ln4_fu_70_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    regslice_both_out0_U_apdone_blk;
wire    regslice_both_out1_U_apdone_blk;
reg    ap_block_state2;
reg    ap_block_state2_io;
wire    regslice_both_in_r_U_apdone_blk;
wire   [127:0] in_r_TDATA_int_regslice;
wire    in_r_TVALID_int_regslice;
reg    in_r_TREADY_int_regslice;
wire    regslice_both_in_r_U_ack_in;
reg    out0_TVALID_int_regslice;
wire    out0_TREADY_int_regslice;
wire    regslice_both_out0_U_vld_out;
reg    out1_TVALID_int_regslice;
wire    out1_TREADY_int_regslice;
wire    regslice_both_out1_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

mux_1_2_regslice_both #(
    .DataWidth( 128 ))
regslice_both_in_r_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_r_TDATA),
    .vld_in(in_r_TVALID),
    .ack_in(regslice_both_in_r_U_ack_in),
    .data_out(in_r_TDATA_int_regslice),
    .vld_out(in_r_TVALID_int_regslice),
    .ack_out(in_r_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_r_U_apdone_blk)
);

mux_1_2_regslice_both #(
    .DataWidth( 128 ))
regslice_both_out0_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_r_TDATA_int_regslice),
    .vld_in(out0_TVALID_int_regslice),
    .ack_in(out0_TREADY_int_regslice),
    .data_out(out0_TDATA),
    .vld_out(regslice_both_out0_U_vld_out),
    .ack_out(out0_TREADY),
    .apdone_blk(regslice_both_out0_U_apdone_blk)
);

mux_1_2_regslice_both #(
    .DataWidth( 128 ))
regslice_both_out1_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_r_TDATA_int_regslice),
    .vld_in(out1_TVALID_int_regslice),
    .ack_in(out1_TREADY_int_regslice),
    .data_out(out1_TDATA),
    .vld_out(regslice_both_out1_U_vld_out),
    .ack_out(out1_TREADY),
    .apdone_blk(regslice_both_out1_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        or_ln4_reg_94 <= or_ln4_fu_82_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state1_io) | (in_r_TVALID_int_regslice == 1'b0) | ((or_ln4_fu_82_p2 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_fu_82_p2 == 1'd0) & (out0_TREADY_int_regslice == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_out1_U_apdone_blk == 1'b1) | (regslice_both_out0_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state2_io) | ((or_ln4_reg_94 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_reg_94 == 1'd0) & (out0_TREADY_int_regslice == 1'b0)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_r_TDATA_blk_n = in_r_TVALID_int_regslice;
    end else begin
        in_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | (in_r_TVALID_int_regslice == 1'b0) | ((or_ln4_fu_82_p2 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_fu_82_p2 == 1'd0) & (out0_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        in_r_TREADY_int_regslice = 1'b1;
    end else begin
        in_r_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((or_ln4_reg_94 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((or_ln4_fu_82_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        out0_TDATA_blk_n = out0_TREADY_int_regslice;
    end else begin
        out0_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | (in_r_TVALID_int_regslice == 1'b0) | ((or_ln4_fu_82_p2 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_fu_82_p2 == 1'd0) & (out0_TREADY_int_regslice == 1'b0))) & (or_ln4_fu_82_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        out0_TVALID_int_regslice = 1'b1;
    end else begin
        out0_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((or_ln4_reg_94 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((or_ln4_fu_82_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        out1_TDATA_blk_n = out1_TREADY_int_regslice;
    end else begin
        out1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | (in_r_TVALID_int_regslice == 1'b0) | ((or_ln4_fu_82_p2 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_fu_82_p2 == 1'd0) & (out0_TREADY_int_regslice == 1'b0))) & (or_ln4_fu_82_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        out1_TVALID_int_regslice = 1'b1;
    end else begin
        out1_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b1 == ap_block_state1_io) | (in_r_TVALID_int_regslice == 1'b0) | ((or_ln4_fu_82_p2 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_fu_82_p2 == 1'd0) & (out0_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((regslice_both_out1_U_apdone_blk == 1'b1) | (regslice_both_out0_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state2_io) | ((or_ln4_reg_94 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_reg_94 == 1'd0) & (out0_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((in_r_TVALID_int_regslice == 1'b0) | ((or_ln4_fu_82_p2 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_fu_82_p2 == 1'd0) & (out0_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state1_io = (((or_ln4_fu_82_p2 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_fu_82_p2 == 1'd0) & (out0_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2 = ((regslice_both_out1_U_apdone_blk == 1'b1) | (regslice_both_out0_U_apdone_blk == 1'b1) | ((or_ln4_reg_94 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_reg_94 == 1'd0) & (out0_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = (((or_ln4_reg_94 == 1'd1) & (out1_TREADY_int_regslice == 1'b0)) | ((or_ln4_reg_94 == 1'd0) & (out0_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign icmp_ln4_1_fu_76_p2 = ((opcode == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln4_fu_70_p2 = ((opcode == 2'd3) ? 1'b1 : 1'b0);

assign in_r_TREADY = regslice_both_in_r_U_ack_in;

assign or_ln4_fu_82_p2 = (icmp_ln4_fu_70_p2 | icmp_ln4_1_fu_76_p2);

assign out0_TVALID = regslice_both_out0_U_vld_out;

assign out1_TVALID = regslice_both_out1_U_vld_out;


reg find_kernel_block = 0;
// synthesis translate_off
`include "mux_1_2_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //mux_1_2

