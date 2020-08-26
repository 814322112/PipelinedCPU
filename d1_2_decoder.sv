`timescale 10ps/1fs

module d1_2_decoder(in, out, en);
	input logic in, en;
	output logic [1:0]out;
	logic w;
	
	not #5 not1 (w, in);
	and #5 and1 (out[0], en, w);
	and #5 and2 (out[1], en, in);
endmodule

module d1_2_decoder_testbench();
	logic in, en;
	logic [1:0]out;
	
	d1_2_decoder dut (.in, .out, .en);
	
	initial begin
		in = 0; en = 0; #10;
				  en = 1; #10;
		in = 1;         #10;
				  en = 0; #10;
	 end
 endmodule
	
	