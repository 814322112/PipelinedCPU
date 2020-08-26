`timescale 10ps/1fs

module d2_4_decoder(in, out, en);
	input logic [1:0]in;
	input logic en;
	output logic [3:0]out;
	logic [1:0] w;
	
	not #5 not1 (w[0], in[0]);
	not #5 not2 (w[1], in[1]);
	and #5 and1 (out[0], en, w[0], w[1]);
	and #5 and2 (out[1], en, in[0], w[1]);
	and #5 and3 (out[2], en, w[0], in[1]);
	and #5 and4 (out[3], en, in[0], in[1]);
endmodule

module d2_4_decoder_testbench();
	logic [1:0] in;
	logic en;
	logic [3:0] out;
	
	d2_4_decoder dut (.in, .out, .en);
	
	initial begin 
		in[0] = 0; in[1] = 0; en = 0; #10;
									 en = 1; #10;
		in[0] = 1;                    #10;
		           in[1] = 1;         #10;
	   in[0] = 0;							#10;
		                      en = 0; #10;
   end
endmodule
