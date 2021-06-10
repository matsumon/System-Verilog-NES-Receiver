module counter #(parameter N = 4)
					(input logic clk,
						input logic reset,
							output logic [N-1:0]q);
	
	always_ff@(posedge clk, negedge reset)
		if (~reset) q<=0;
		else 			q<=q+1;
	endmodule