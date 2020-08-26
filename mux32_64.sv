`timescale 10ps/1fs
module mux32_64 (in, sel, out);
	input logic [63:0][31:0] in;
	input logic [4:0] sel;
	output logic [63:0] out;
	genvar i;
	
	generate
		for (i = 0; i < 64; i++) begin : gen1
			mux32_1 produceMux (.in(in[i][31:0]), .sel(sel), .out(out[i]));
		end
	endgenerate
endmodule
