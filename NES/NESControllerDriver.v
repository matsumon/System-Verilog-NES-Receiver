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
// CREATED		"Sun Jun 02 17:07:51 2019"

module NESControllerDriver(
	clk,
	reset_n,
	a,
	b,
	select,
	start,
	up,
	down,
	left,
	right,
	LEDout
);


input wire	clk;
input wire	reset_n;
input wire	a;
input wire	b;
input wire	select;
input wire	start;
input wire	up;
input wire	down;
input wire	left;
input wire	right;
output wire	[6:0] LEDout;

wire	OutShift;
wire	SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_2;





ShiftClock	b2v_inst(
	.latchCLK(SYNTHESIZED_WIRE_3),
	.reset_n(reset_n),
	.Counting(SYNTHESIZED_WIRE_2));


NESrecieverwpermission	b2v_inst2(
	.clk(clk),
	.reset_n(reset_n),
	.data(OutShift),
	
	.NCLK(SYNTHESIZED_WIRE_3),
	
	.out(LEDout));


ShiftRegisterC	b2v_inst3(
	.a(a),
	.b(b),
	.select(select),
	.start(start),
	.up(up),
	.down(down),
	.left(left),
	.right(right),
	.clk(SYNTHESIZED_WIRE_3),
	.counter(SYNTHESIZED_WIRE_2),
	.out(OutShift));


endmodule
