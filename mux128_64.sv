`timescale 10ps/1fs
module mux128_64 (zero_input, one_input, sel, out);
	input logic [63:0] one_input, zero_input;
	input logic sel;
	output logic [63:0] out;

	genvar i;
	
	generate 
		for (i = 0; i < 64; i++) begin : gen1
			mux2_1 mux21 (.in({one_input[i], zero_input[i]}), .sel(sel), .out(out[i]));
		end
	endgenerate 
endmodule

module mux128_64_testbench();
	logic [63:0] zero_input, one_input, out;
	logic sel;
	
	mux128_64 dut (.one_input, .zero_input, .sel, .out);
	
	initial begin 
		sel = 0; one_input = 64'hFFFFFFFFFFFFFFFF; zero_input = 64'h0000000000000000; #100;
		sel = 1;				                     										 			#100;
		sel = 0; one_input = 64'hFFFFFFFFFFFFFFFF; zero_input = 64'h0000000000000000; #100;
		sel = 1;				                      										 			#100;
		sel = 0; one_input = 64'hFFFFFFFFFFFFFFFF; zero_input = 64'h0000000000000000; #100;
		sel = 1;				                       										 			#100;
		sel = 0; one_input = 64'hFFFFFFFFFFFFFFFF; zero_input = 64'h0000000000000000; #100;
		sel = 1;				                      										 			#100;
	end
endmodule