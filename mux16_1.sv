`timescale 10ps/1fs

module mux16_1 (in, sel, out);
	input logic [15:0] in;
	input logic [3:0] sel;
	output logic out;
	logic [3:0] w;
	
	mux4_1 mux411 (.in(in[3:0]), .sel(sel[1:0]), .out(w[0]));
	mux4_1 mux412 (.in(in[7:4]), .sel(sel[1:0]), .out(w[1]));
	mux4_1 mux413 (.in(in[11:8]), .sel(sel[1:0]), .out(w[2]));
	mux4_1 mux414 (.in(in[15:12]), .sel(sel[1:0]), .out(w[3]));
	mux4_1 mux415 (.in(w[3:0]), .sel(sel[3:2]), .out(out));
endmodule

module mux16_1_testbench();
	logic [15:0] in;
	logic [3:0] sel;
	logic out;
	
	mux16_1 dut (.in, .sel, .out);
	
	initial begin 
		in = 16'b0000000000000000; sel = 4'b0000; #10;
		in = 16'b0000000000000001;                #10;
		                           sel = 4'b0100; #10;
		in = 16'b0000000000000000;                #10;
		in = 16'b0000000000010000;                #10;
		                           sel = 4'b0110; #10;
		                           sel = 4'b0101; #10;
		in = 16'b0000000000100000;                #10;
                                 sel = 4'b1001; #10;
	end
endmodule
