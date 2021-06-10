// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Sun May 26 21:02:33 2019"

module NESreciever(
	clk,
	reset_n,
	data,
	SlowedClock,
	out
);


input wire	clk;
input wire	reset_n;
input wire	data;
output wire	SlowedClock;
output wire	[6:0] out;

wire	SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_11;

assign	SlowedClock = SYNTHESIZED_WIRE_13;




counter	b2v_innt(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_0),
	.q(SYNTHESIZED_WIRE_3));
	defparam	b2v_innt.N = 8;


DataMux	b2v_inst(
	.data(data),
	.counterInput(SYNTHESIZED_WIRE_12),
	.out(SYNTHESIZED_WIRE_8));

assign	SYNTHESIZED_WIRE_7 = reset_n & SYNTHESIZED_WIRE_2;


LesserComparator	b2v_inst2(
	.a(SYNTHESIZED_WIRE_3),
	.lt(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst2.B = 12;
	defparam	b2v_inst2.N = 8;


Sync	b2v_inst3(
	.clk(clk),
	.d(SYNTHESIZED_WIRE_4),
	.q(SYNTHESIZED_WIRE_13));

assign	SYNTHESIZED_WIRE_0 = reset_n & SYNTHESIZED_WIRE_13;


counter	b2v_inst5(
	.clk(SYNTHESIZED_WIRE_13),
	.reset(SYNTHESIZED_WIRE_7),
	.q(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst5.N = 4;


Sevenseg	b2v_inst7(
	.data(SYNTHESIZED_WIRE_8),
	.segments(out));


LesserComparator	b2v_inst8(
	.a(SYNTHESIZED_WIRE_12),
	.lt(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst8.B = 7;
	defparam	b2v_inst8.N = 4;


Sync	b2v_inst9(
	.clk(SYNTHESIZED_WIRE_13),
	.d(SYNTHESIZED_WIRE_11),
	.q(SYNTHESIZED_WIRE_2));


endmodule
