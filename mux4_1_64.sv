module mux4_1_64(in1, in2, in3, in4, sel, out);
	input logic [63:0] in1, in2, in3, in4;
	output logic [63:0] out;
	input logic [1:0] sel;
	
	genvar i;
	
	generate 
		for (i = 0; i < 64; i++) begin : gen1
			mux4_1 mux41 (.in({in4[i], in3[i], in2[i], in1[i]}), .sel(sel), .out(out[i]));
		end
	endgenerate
endmodule