module mux64(in, out, sel);
	input logic sel;
	input logic [63:0] in;
	output logic [63:0] out;
	
	genvar i;
	generate 
		for (i = 0; i < 64; i++) begin : gen
			mux2_1 mux2 (.in(in[i]),.sel,.out(out[i]));
	endgenerate
endmodule
