`timescale 10ps/1fs

//64-bit ALU
module alu_64(A, B, cntrl, result, negative, zero,
					overflow, carry_out);
	input logic [63:0] A, B;
	input logic [2:0] cntrl;
	output logic [63:0] result;
	output logic negative, zero, overflow, carry_out;
	
	logic [63:0] cout;
	
	alu_1 alu (.a(A[0]), .b(B[0]), .Cin(cntrl[0]), .Cout(cout[0]), .sel(cntrl), .result(result[0]));
	
	genvar i;
	generate
		for (i = 1; i < 64; i++) begin : lol
			alu_1 alu (.a(A[i]), .b(B[i]), .Cin(cout[i-1]), .Cout(cout[i]), .sel(cntrl), .result(result[i]));
		end
	endgenerate
	
	xor #5 ovfl (overflow, cout[63], cout[62]);
	
	assign negative = result[63];
	assign carry_out = cout[63];
	
	zero_flag zrflag (.in(result), .*);
	
	
endmodule 