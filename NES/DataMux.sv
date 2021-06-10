module DataMux 
	(input logic data,
		input logic [3:0] counterInput,
		output logic [3:0] out);
	always_comb
	if (data) out <= 4'b1111;
	
	else case(counterInput)
	4'b0001: out <= 4'b0001;
	4'b0010: out <= 4'b0010;
	4'b0011: out <= 4'b0011;
	4'b0100: out <= 4'b0100;
	4'b0101: out <= 4'b0101;
	4'b0110: out <= 4'b0110;
	4'b0111: out <= 4'b0111;
	4'b1000: out <= 4'b1000;
	default: out <= 4'b1111;
	endcase
endmodule 