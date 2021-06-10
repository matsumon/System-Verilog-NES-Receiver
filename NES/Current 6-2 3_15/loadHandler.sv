module loadHandler(
						input logic count [7:0],
						output logic loadSignal);
always_comb 
if (count > 0)
begin
loadSignal= 0;
end
else 
begin
loadSignal = 0;
end
endmodule