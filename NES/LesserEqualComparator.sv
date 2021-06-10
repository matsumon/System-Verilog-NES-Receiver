module LesserEqualComparator #(parameter N = 8, B = 10)
						 (input logic [N-1:0] a,
						  output logic lt);
	assign lt = (a == B);
endmodule

						 
