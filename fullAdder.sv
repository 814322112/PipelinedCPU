`timescale 10ps/1fs
module fullAdder (a, b, out, Cin, Cout);
	input logic a, b, Cin;
	output logic out, Cout;
	logic [2:0] w;
	
	xor #5 xor1 (out, a, b, Cin);
	and #5 and1 (w[0], a, b);
	and #5 and2 (w[1], a, Cin);
	and #5 and3 (w[2], b, Cin);
	or  #5 or1  (Cout, w[0], w[1], w[2]);
endmodule

module fullAdder_testbench();
	logic a, b, out, Cin, Cout;
	
	fullAdder dut (.a, .b, .out, .Cin, .Cout);
	
	initial begin
		a = 0; b = 0; Cin = 0; #100;
		a = 0; b = 0; Cin = 1; #100;
		a = 0; b = 1; Cin = 0; #100;
		a = 0; b = 1; Cin = 1; #100;
		a = 1; b = 0; Cin = 0; #100;
		a = 1; b = 0; Cin = 1; #100;
		a = 1; b = 1; Cin = 0; #100;
		a = 1; b = 1; Cin = 1; #100;
	end
endmodule
	