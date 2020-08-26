`timescale 10ps/1fs
module fullAdder_64 (a, b, out);
	input logic  [63:0] a, b;
	output logic [63:0] out;
	logic [63:0] carry_out;
	
	fullAdder adder1(.a(a[0]), .b(b[0]), .out(out[0]), .Cin(1'b0), .Cout(carry_out[0]));
	genvar i;
	generate
		for (i = 1; i < 64; i++) begin: gen1
			fullAdder adder (.a(a[i]), .b(b[i]), .out(out[i]), .Cin(carry_out[i-1]), .Cout(carry_out[i]));
		end
	endgenerate
endmodule

