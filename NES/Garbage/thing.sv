module prelab (input logic clk, reset,
					output logic q);
		logic [9:0] count;			
		always_ff@(posedge clk,negedge reset) 
			begin
			
				if(!reset) 
					begin
					count <= 0; 	// <= means comment
					end
					
				else
					begin
						count <= count + 1;
						if(count < 12) 
							begin
							q <= 1; //logic high
							end
					
						if(count > 12)
							begin 
							q <= 0; // logic low
							end	
							
						if(count == 24) 
							begin
							count <= 0;
							q <= 1; //logic high
							end
					
					end
			
			end
					
endmodule 