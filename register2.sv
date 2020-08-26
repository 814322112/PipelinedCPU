`timescale 10ps/1fs
module register2 (in, clk, out, reset);
	input logic [63:0] in;
	input logic clk, reset;
	output logic [63:0] out;

	genvar i;
	
	generate 
		for (i = 0; i < 64; i++) begin : gen1
			D_FF register1 (.q(out[i]), .d(in[i]), .reset(reset), .clk(clk));
		end
	endgenerate 
endmodule

module register32 (in, clk, out, reset);
	input logic [31:0] in;
	input logic clk, reset;
	output logic [31:0] out;

	genvar i;
	
	generate 
		for (i = 0; i < 32; i++) begin : gen1
			D_FF register1 (.q(out[i]), .d(in[i]), .reset(reset), .clk(clk));
		end
	endgenerate 
endmodule

module register5 (in, clk, out, reset);
	input logic [4:0] in;
	input logic clk, reset;
	output logic [4:0] out;

	genvar i;
	
	generate 
		for (i = 0; i < 5; i++) begin : gen1
			D_FF register1 (.q(out[i]), .d(in[i]), .reset(reset), .clk(clk));
		end
	endgenerate 
endmodule

module register2b (in, clk, out, reset);
	input logic [1:0] in;
	input logic clk, reset;
	output logic [1:0] out;

	genvar i;
	
	generate 
		for (i = 0; i < 2; i++) begin : gen1
			D_FF register1 (.q(out[i]), .d(in[i]), .reset(reset), .clk(clk));
		end
	endgenerate 
endmodule

module register3 (in, clk, out, reset);
	input logic [2:0] in;
	input logic clk, reset;
	output logic [2:0] out;

	genvar i;
	
	generate 
		for (i = 0; i < 3; i++) begin : gen1
			D_FF register1 (.q(out[i]), .d(in[i]), .reset(reset), .clk(clk));
		end
	endgenerate 
endmodule