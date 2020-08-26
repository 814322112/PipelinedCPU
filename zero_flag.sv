`timescale 10ps/1fs
module zero_flag(in, zero);
	input logic [63:0] in;
	output logic zero;
	logic [3:0] w;
	
	nor16_1  nor1 (.in(in[15:0]), .out(w[0]));
	nor16_1  nor2 (.in(in[31:16]),. out(w[1]));
	nor16_1  nor3 (.in(in[47:32]), .out(w[2]));
	nor16_1  nor4 (.in(in[63:48]), .out(w[3]));
	and #5   and1 (zero, w[3], w[2], w[1], w[0]);
endmodule

module zero_flag_testbench();
	logic [63:0] in;
	logic zero;
	
	zero_flag dut (.in, .zero);
	integer i;
	
	initial begin
		in = 0;                       #100;
		for (i = 0; i < 64; i++) begin
			in[i] = 1;                 #100;
		end
	end
endmodule
		
	