`timescale 10ps/1fs

module d5_32_decoder(in, out, en);
	input logic [4:0] in;
	input logic en;
	output logic [31:0] out;
	logic [3:0] w;
	 
	d2_4_decoder d24  (.in(in[4:3]), .out(w[3:0]), .en(en));
	d3_8_decoder d381 (.in(in[2:0]), .out(out[7:0]), .en(w[0]));
	d3_8_decoder d382 (.in(in[2:0]), .out(out[15:8]), .en(w[1]));
	d3_8_decoder d383 (.in(in[2:0]), .out(out[23:16]), .en(w[2]));
	d3_8_decoder d384 (.in(in[2:0]), .out(out[31:24]), .en(w[3]));
endmodule

module d5_32_decoder_testbench();
	logic[4:0] in;
	logic en;
	logic [31:0] out;
	
	d5_32_decoder dut (.in, .out, .en);
	
	initial begin 
		in[0] = 0; in[1] = 0; in[2] = 0; in[3] = 0; in[4] = 0; en = 0; #10;
																				 en = 1; #10;
		in[0] = 1;                                                     #10;
		in[0] = 0; in[1] = 1;                                          #10;
		in[0] = 1;                                                     #10;
		in[0] = 0; in[1] = 0; in[2] = 1;                               #10;
		in[0] = 1;                                                     #10;
		in[0] = 0; in[1] = 1;                                          #10;
		in[0] = 1;                                                     #10;
	end
endmodule
