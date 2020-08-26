// Test bench for ALU
`timescale 1ns/10ps

// Meaning of signals in and out of the ALU:

// Flags:
// negative: whether the result output is negative if interpreted as 2's comp.
// zero: whether the result output was a 64-bit zero.
// overflow: on an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp.
// carry_out: on an add or subtract, whether the computation produced a carry-out.

// cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			result = A - B
// 100:			result = bitwise A & B		value of overflow and carry_out unimportant
// 101:			result = bitwise A | B		value of overflow and carry_out unimportant
// 110:			result = bitwise A XOR B	value of overflow and carry_out unimportant

module alustim();

	parameter delay = 100000;

	logic		[63:0]	A, B;
	logic		[2:0]		cntrl;
	logic		[63:0]	result;
	logic					negative, zero, overflow, carry_out ;

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
	

	alu_64 dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	integer i;
	logic [63:0] test_val;
	initial begin
	
		$display("%t testing PASS_B operations", $time);
		cntrl = ALU_PASS_B;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random();
			#(delay);
			assert(result == B && negative == B[63] && zero == (B == '0));
		end
		
		$display("%t testing addition funtion...", $time);
		cntrl = ALU_ADD;
		//normal operation
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		assert(result == A+B && carry_out == 0 && overflow == 0 && negative == 0 && zero == 0);
		//negative overflow and all zero
		A = 64'h8000000000000000; B = 64'h8000000000000000;
		#(delay);
		assert(result == 64'h0 && carry_out == 1 && overflow == 1 && negative == 0 && zero == 1);
		//positive overflow
		A = 64'h4000000000000000; B = 64'h7000000000000000;
		#(delay);
		assert(result == A+B && carry_out == 0 && overflow == 1 && negative == 1 && zero == 0);
		//carryout
		A = 64'hC000000000000000; B = 64'hE000000000000000;
		#(delay);
		assert(result == A+B && carry_out == 1 && overflow == 0 && negative == 1 && zero == 0);
		//another normal operation
		A = 64'h000010000C000000; B = 64'h000070000E000000;
		#(delay);
		assert(result == A+B && carry_out == 0 && overflow == 0 && negative == result[63] && zero == 0);
		
		
		$display("%t testing subtraction function...", $time);
		cntrl = ALU_SUBTRACT;
		//normal operation
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		assert(result == A-B && carry_out == 1 && overflow == 0 && negative == result[63] && zero == 1);
		//carryout
		A = 64'hB000000000000000; B = 64'h1000000000000000;
		#(delay);
		assert(result == A-B && carry_out == 1 && overflow == 0 && negative == result[63] && zero == 0);
		//positive overflow
		A = 64'h4000000000000000; B = 64'h8FFFFFFFFFFFFFFF;
		#(delay);
		assert(result == A-B && carry_out == 0 && overflow == 1 && negative == result[63] && zero == 0);
		//another normal operation
		A = 64'h000010000C000000; B = 64'h000070000E000000;
		#(delay);
		assert(result == A-B && carry_out == 0 && overflow == 0 && negative == result[63] && zero == 0);
		
		$display("%t testing and function...", $time);
		cntrl = ALU_AND;
		A = 64'h0000000000000001; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'h0 && negative == result[63] && zero == 1);
		A = 64'h0000000000000000; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'h0 && negative == result[63] && zero == 1);
		A = 64'h4000000000000000; B = 64'h8FFFFFFFFFFFFFFF;
		#(delay);
		assert(result == 64'h0 && negative == result[63] && zero == 1);
		A = 64'h000010000C000000; B = 64'h000070000E000000;
		#(delay);
		assert(result == 64'h000010000C000000 && negative == result[63] && zero == 0);
		A = 64'hE45310000C00CBA0; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'h0 && negative == result[63] && zero == 1);
		
		$display("%t testing or function...", $time);
		cntrl = ALU_OR;
		A = 64'h0000000000000001; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'h0000000000000001 && negative == result[63] && zero == 0);
		A = 64'h0000000000000000; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'h0 && negative == result[63] && zero == 1);
		A = 64'h4000000000000000; B = 64'h8FFFFFFFFFFFFFFF;
		#(delay);
		assert(result == 64'hCFFFFFFFFFFFFFFF && negative == result[63] && zero == 0);
		A = 64'h000010000C000000; B = 64'h000070000E000000;
		#(delay);
		assert(result == 64'h000070000E000000 && negative == result[63] && zero == 0);
		A = 64'hE45310000C00CBA0; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'hE45310000C00CBA0 && negative == result[63] && zero == 0);
		
		$display("%t testing xor function...", $time);
		cntrl = ALU_XOR;
		A = 64'h0000000000000001; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'h0000000000000001 && negative == result[63] && zero == 0);
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h0000000000000000 && negative == result[63] && zero == 1);
		A = 64'h0000000000000000; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'h0 && negative == result[63] && zero == 1);
		A = 64'h4000000000000000; B = 64'h8FFFFFFFFFFFFFFF;
		#(delay);
		assert(result == 64'hCFFFFFFFFFFFFFFF && negative == result[63] && zero == 0);
		A = 64'h000010000C000000; B = 64'h000070000E000000;
		#(delay);
		assert(result == 64'h0000600002000000 && negative == result[63] && zero == 0);
		A = 64'hE45310000C00CBA0; B = 64'h0000000000000000;
		#(delay);
		assert(result == 64'hE45310000C00CBA0 && negative == result[63] && zero == 0);
		
	end
endmodule