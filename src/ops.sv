//ops.sv
// This file contains very simple, low level functions which are
// imperative to the driver's operation.

// This functions as a simple, various-bit decoder.
// Note that the "a ** b" operation is "a to the power of b"
// BITS: The number of bits to be used for possible states
// select: A binary number representing which output channel should be logic high.
// enabler: A bus wherein only one output is high at any point, based on select.
module switch #(parameter BITS = 2) 
	(input logic [BITS-1:0] select, output logic [(2 ** BITS)-1:0] enabler);
	always_comb begin //always_comb is best for comb. logic, not sure what the difference
	//is between it and "always @ (*)"
		for(int i = 0; i < 2 ** BITS; i++) begin
			unique if(select == i) begin //"unique" means the true and false are mutually exclusive.
				enabler[i] = 1;
			end else begin
				enabler[i] = 0;
			end //end if
		end //end for
	end //end always
endmodule

//Counts from 0 to 2^(N-1). Overflows appropriately to 0.
//This module was used in lab 5.
//N: Number of bits of memory + 1
//clk: A signal which, upon reception, increments the counter.
//reset: A signal which, on reception, both sets the counter to zero and prevents clk.
//q: An unsinged integer which demonstrates the current state of the counter.
module counter #(parameter N = 4) (input logic clk, input logic reset, output logic [N-1:0]q);
	always_ff@(posedge clk, posedge reset)
		if(reset)	q<= 0;
		else		q <= q+1;
endmodule

//Counts from 0 to 2^(N-1). Overflows appropriately to 0 upon reaching a value 
// specified at instantiation time.
//N: Number of bits of memory + 1
//MAX: The maximum value this counter can reach before the next increment resets
//     it to zero
//clk: A signal which, upon reception, increments the counter.
//reset: A signal which, on reception, both sets the counter to zero and prevents clk.
//q: An unsinged integer which demonstrates the current state of the counter.
module counter_max #(parameter N = 4, parameter MAX = 10) (input logic clk, input logic reset, output logic [N-1:0]q);
	always_ff@(posedge clk, posedge reset)
		if(reset | q == MAX)	q<= 0;
		else		q <= q+1;
endmodule


//THIS MODULE IS DEPRECATED- see documentation. Do not delete it, it is used in core.sv
//Identical to counter except uses the negative edge of the clock
//In in hindsight, this could have been acheived by inverting the clk of the above when it 
//is passed into the instance, but oh well; live and learn
module neg_counter #(parameter N = 4) (input logic clk, input logic reset, output logic [N-1:0]q);
	always_ff@(negedge clk, posedge reset)
		if(reset)	q<= 0;
		else		q <= q+1;
endmodule


//THIS MODULE IS DEPRECATED- see documentation. Do not delete it, it is used in core.sv
//Identical to negative counter, but has the option to include an early overload.
//I bear the same concern with this module with respect to neg_counter
module neg_counter_max #(parameter N = 4, parameter MAX = 10) (input logic clk, input logic reset, output logic [N-1:0]q);
	always_ff@(negedge clk, posedge reset)
		if(reset | q == MAX)	q<= 0;
		else		q <= q+1;
endmodule

// Converts an unsigned number into hexidecimal notation
// Here is a relevant URL for range notation in sv:
// https://forums.xilinx.com/t5/Design-Entry/Verilog-Loop-error-range-must-be-bounded-by-constant-expressions/td-p/721765
// Anyway, here are the details:
// INPUT_SIZE: The amount of bits of input. INPUT_SIZE % 4 MUST BE 0.
// number: The number to be broken into hexidecimal digits
// hex: A bus of hexidecimal digits, of size INPUT_SIZE/4. Ordered from 
//      least to most significant digits.
//      NOTE- a hexidecimal digit is a 4 bit unsigned integer.
module hex_notation #(parameter INPUT_SIZE = 8) 
(input logic [INPUT_SIZE-1:0] number, output logic [(INPUT_SIZE/4)-1:0][3:0] hex);
	always_comb begin
		for(int i = 0; i < (INPUT_SIZE/4); i++) begin
			hex[i] = number[i*4 +: 4]; //This is a weird notation, see the url at the top
		end
	end
endmodule

/*BELOW IS CODE FROM LAB 5*/
//The exact same thing as lab 2, but simpler
//I had to change this from the source code because our 7segs are active low, not active high.
//data: The number to translate to display form
//segments: 7 bit number legible to the 7 segment display.
module sevenseg(input logic[3:0] data, output logic[6:0] segments);
	always_comb
		case(data)
			//              abc_defg
			0:	segments=7'b000_0001;
			1:	segments=7'b100_1111;
			2:	segments=7'b001_0010;
			3:	segments=7'b000_0110;
			4:	segments=7'b100_1100;
			5:	segments=7'b010_0100;
			6:	segments=7'b010_0000;
			7:	segments=7'b000_1111;
			8:	segments=7'b000_0000;
			9:	segments=7'b000_1100;
			10:	segments=7'b000_1000;
			11:	segments=7'b110_0000;
			12:	segments=7'b011_0001;
			13:	segments=7'b100_0010;
			14:	segments=7'b011_0000;
			15:	segments=7'b011_1000;
			default: segments = 7'b000_0000; //This should throw an error, technically. But whatever.
		endcase
endmodule