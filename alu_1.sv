`timescale 10ps/1fs
//1-bit ALU

module alu_1 (a, b, Cin, Cout, sel, result);
		input logic [2:0] sel;
		input logic a, b, Cin;
		output logic Cout, result;
		logic [3:0] w;
		logic negB, outB;
		
		and #5 and1 (w[0], a, b);
		or  #5 or1  (w[1], a, b);
		xor #5 xor1 (w[2], a, b);
		not #5 not1 (negB, b);
		
		mux2_1 mux21   (.in({negB, b}), .sel(sel[0]), .out(outB));
		fullAdder add1 (.a, .b(outB), .out(w[3]), .Cin, .Cout);
		mux8_1 mux81 (.in({1'b0, w[2],w[1],w[0],w[3],w[3],1'b0,b}), .out(result),.*);
endmodule

module alu_1_testbench();
	logic a, b;
	logic Cin, Cout, result;
	logic [2:0] sel;
	
	alu_1 dut (.*);
	
	initial begin
		Cin = 0; sel = 3'b000; a = 0; b = 0; #100; //directly output b
		b = 1; #100;
		//addition
		sel = 3'b010; #100; //return a+b=1
		a = 1; b = 0; #100; //should still return a+b=1
		a = 1; b = 1; #100; //a+b=0, cout=1
		//subtraction
		Cin = 1; sel = 3'b011; #100; //a-b=0
		a = 1; b = 0; #100; //a-b=1
		a = 0; b = 1; #100; //a-b=1
		a = 0; b = 0; #100; //a-b=0
		//and
		sel = 3'b100; a = 1; b = 1; #100;
		a = 0; b = 1; #100;
		a = 1; b = 0; #100;
		a = 0; b = 0; #100;
		a = 1; b = 1; #100;
		//or
		sel = 3'b101; a = 1; b = 1; #100;
		a = 0; b = 1; #100;
		a = 1; b = 0; #100;
		a = 0; b = 0; #100;
		a = 1; b = 1; #100;
		//xor
		sel = 3'b110; a = 1; b = 1; #100;
		a = 0; b = 1; #100;
		a = 1; b = 0; #100;
		a = 0; b = 0; #100;
		a = 1; b = 1; #100;
	end
endmodule
