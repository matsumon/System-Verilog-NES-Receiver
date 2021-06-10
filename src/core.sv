
// SIGNAL ORDER for PS/2:
// 1. Parity 0
// 2. Data * 8 (any)
// 3. Parity 1.
// 4. Stop 1.
// 5. Agknowledge (n/a)


module sequential_writer_ps2 (input logic [3:0] index, input logic CLK, input logic data, input logic reset, output logic [7:0] last_mem);
	logic [10:0] working_mem;
	//It may be preferrable to declock this function and instead be sensitive to index changing.
	always_ff @(posedge CLK, posedge reset) begin
		if(reset) begin
			working_mem <= 0;
			last_mem <= 0;
		end else begin
			working_mem[index] = data;
			if(index >= 10) begin
				// If you were to write error-checking code, it would be here.
				// You would check the first bit and last two bits. If they were
				// wrong, you would set the clock to low for 100us, flush 
				// working_mem, and reset.
				last_mem <= working_mem[8: 1];
			end
		end
	end
endmodule

// This takes all of the keyboard data possibilities and decodes them 
// from binary transmission form (for one pin). This does not do any
// error handling.
// SIGNAL_BITS: The maximum number of bits which can be recieved from the device
// SIGNAL_LENGTH: The length of a completed signal.
// SURROUND_LENGTH: The number of bits of metadata surrounding the input.
// block: control for halting the current keyboard input.
// Data: The current signal from the keyboard
// CLK_K: Keyboard clock
// key: The last received ASCII character
module listener_ps2 (input logic block, input logic data, inout logic CLK_K, output logic [7:0] key);
	logic [4:0] ind; //Stores the current bit to write to.
	logic counter_loop;
	//Increments index with the negative edge of the clock.
	neg_counter #(5) reader(.clk(CLK_K), .reset(counter_loop | block), .q(ind));
	sequential_writer_ps2 wrt(.index(ind), .CLK(!CLK_K), .data(data), .last_mem(key));
	always_ff @(posedge block) begin
		//counter_loop = 1;
		key = 0;
		//Pull CLK_K low
	end
	always_ff @(negedge block) begin
		//counter_loop = 0;
		//Release CLK_K
	end
	// I had to add the following conditional later after discovering 
	// a bug related to the lack of ability to rely on the coutner's 
	// overflow since it hit the required max before the bit max.
	// A cleaner solution would be to make a new counter that takes a
	// "maximum value" parameter, but for now this is fine.
	always_ff @ (ind, block) begin //Block included for initialization purposes.
		if(ind > 10)
			counter_loop = 1;
		else
			counter_loop = 0;
	end
endmodule