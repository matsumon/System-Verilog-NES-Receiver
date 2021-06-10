module GreaterComparator #(parameter N = 8, B = 10)
						 (input logic [N-1:0] a,
						  output logic gt);
	assign gt = (a > B);
endmodule

						 
