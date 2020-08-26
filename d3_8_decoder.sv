`timescale 10ps/1fs

module d3_8_decoder (in, out, en);
	input logic [2:0] in;
	input logic en;
	output logic [7:0] out;
	logic [1:0] w;
	
	d1_2_decoder decoder12  (.in(in[2]), .out(w[1:0]), .en(en));
	d2_4_decoder decoder241 (.in(in[1:0]), .out(out[3:0]), .en(w[0]));
	d2_4_decoder decoder242 (.in(in[1:0]), .out(out[7:4]), .en(w[1]));
endmodule

module d3_8_decoder_testbench();
	logic [2:0] in;
	logic en;
	logic [7:0] out;
	
	d3_8_decoder dut(.in, .out, .en);
	
	initial begin
		in[0] = 0; in[1] = 0; in[2] = 0; en = 0; #10;
													en = 1; #10;
		in[0] = 1;										  #10;
		in[0] = 0; in[1] = 1;                    #10;
		in[0] = 1;                               #10;
		in[0] = 0; in[1] = 0; in[2] = 1;         #10;
		in[0] = 1;                               #10;
		in[0] = 0; in[1] = 1;                    #10;
		in[0] = 1;                               #10;
	end
endmodule
