`timescale 10ps/1fs
module mux8_1(in, sel, out);
	input logic [7:0] in;
	input logic [2:0] sel;
	output logic out;
	logic [1:0] w;
	
	mux4_1 mux411 (.in(in[3:0]), .sel(sel[1:0]), .out(w[0]));
	mux4_1 mux412 (.in(in[7:4]), .sel(sel[1:0]), .out(w[1]));
	mux2_1 mux211 (.in(w[1:0]),  .sel(sel[2]),   .out(out));
	
endmodule

module mux8_1_testbench();
	logic [7:0] in;
	logic [2:0] sel;
	logic out;
	
	mux8_1 dut (.*);
	
	integer i;
	initial begin
	   in = 7'b0;
		for (i = 0; i < 8; i++) begin
			in[i] = i; sel = i; #100;
		end
	end
	
endmodule

