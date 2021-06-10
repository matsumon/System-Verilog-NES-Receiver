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
// CREATED		"Sun Jun 02 17:07:19 2019"

module NESrecieverwpermission(
	clk,
	reset_n,
	data,
	LatchClock,
	NCLK,
	CounterOut,
	out
);


input wire	clk;
input wire	reset_n;
input wire	data;
output wire	LatchClock;
output wire	NCLK;
output wire	[3:0] CounterOut;
output wire	[6:0] out;

wire	[3:0] DataMuxCounter;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_5;

assign	NCLK = SYNTHESIZED_WIRE_6;




DataMux	b2v_inst(
	.data(data),
	.counterInput(DataMuxCounter),
	.out(SYNTHESIZED_WIRE_3));


halfNES	b2v_inst1(
	.clk(clk),
	.reset_n(reset_n),
	.slowedCLK(SYNTHESIZED_WIRE_6),
	.LatchClock(LatchClock));

assign	SYNTHESIZED_WIRE_2 = reset_n & SYNTHESIZED_WIRE_0;


counter	b2v_inst5(
	.clk(SYNTHESIZED_WIRE_6),
	.reset(SYNTHESIZED_WIRE_2),
	.q(DataMuxCounter));
	defparam	b2v_inst5.N = 4;


Sevenseg	b2v_inst7(
	.data(SYNTHESIZED_WIRE_3),
	.segments(out));


LesserComparator	b2v_inst8(
	.a(DataMuxCounter),
	.lt(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst8.B = 9;
	defparam	b2v_inst8.N = 4;


Sync	b2v_inst9(
	.clk(SYNTHESIZED_WIRE_6),
	.d(SYNTHESIZED_WIRE_5),
	.q(SYNTHESIZED_WIRE_0));

assign	CounterOut = DataMuxCounter;

endmodule
