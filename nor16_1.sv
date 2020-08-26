`timescale 10ps/1fs
module nor16_1 (in, out);
	input logic  [15:0] in;
	output logic out;
	logic [3:0] w;
	
	or  #5 or1   (w[0], in[3], in[2], in[1], in[0]);
	or  #5 or2   (w[1], in[7], in[6], in[5], in[4]);
	or  #5 or3   (w[2], in[11], in[10], in[9], in[8]);
	or  #5 or4   (w[3], in[15], in[14], in[13], in[12]);
   nor #5 nor1  (out, w[0], w[1], w[2], w[3]);
endmodule

module nor16_1_testbench();
	logic [15:0] in;
	logic out;
	
   nor16_1 dut (.in, .out);
	
	integer i;
	
	initial begin 
		in = 0;                                     #100;
		for(i = 0; i < 16; i++) begin
			in[i] = 1;                               #100;
		end
	end
endmodule
