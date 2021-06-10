//extra_credit.sv

/*module color_hash #(parameter HASH_BASE = 5381)(input logic [5:0] key, output logic [31:0] hash);
	chash recurse(.key(key), .inhash(HASH_BASE), .hash(hash));
endmodule*/

// Computes an arbitrary non-continuous hash for any given key.
// This module went through several iterations; see comments within
// for old versions.
// HASH_BASE: Mathematical constant
// MULT: Mathematical constant
// KEY_SIZE: The number of bits long the key is.
// key: Key to be hashed
// hash: hash integer
module chash #(parameter HASH_BASE = 5381, parameter MULT = 33, parameter KEY_SIZE = 6) (input logic [KEY_SIZE-1:0] key,  output logic [31:0] hash);
	logic [KEY_SIZE-1:0] c;
	always_ff@(key) begin
		c = key;
		hash = HASH_BASE;
		repeat(2**(KEY_SIZE-1)) begin
			c = c + 1;
			hash = (hash * MULT + c);
		end
	end
	/*logic [5:0] c;
	always_ff@(key) begin
		c = key;
		hash = HASH_BASE;
	end
	always_ff@(c) begin
		if(c != 0) begin
			c = c + 1;
			hash = (hash * MULT) + c;
		end 
	end
		
	/*always_comb begin
		if(key != 0) begin
			color_hash recurse(.key(key + 1), .inhash(hash*33 + key), .hash(hash));
		end else begin
			hash = inhash;
		end
	end*/
	/*logic [31:0] c;
	
	always_comb begin
		hash = HASH_BASE;
		c = key;
		while (c != 0) begin
			hash = hash*MULT + c;
			c = c + 1;
		end
	end*/
endmodule