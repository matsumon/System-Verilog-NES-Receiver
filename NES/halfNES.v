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
// CREATED		"Sat Jun 01 22:43:41 2019"

module halfNES(
	clk,
	reset_n,
	LatchClock,
	slowedCLK
);


input wire	clk;
input wire	reset_n;
output wire	LatchClock;
output wire	slowedCLK;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;

assign	slowedCLK = SYNTHESIZED_WIRE_0;



assign	SYNTHESIZED_WIRE_1 =  ~reset_n;

assign	LatchClock =  ~SYNTHESIZED_WIRE_0;


ClockHolder	b2v_inst2(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_1),
	.q(SYNTHESIZED_WIRE_0));


endmodule
