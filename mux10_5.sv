module mux10_5(in1, in2, sel, out);
	input logic [4:0] in1, in2;
	output logic [4:0] out;
	input logic sel;
	
	genvar i;
	
	generate 
		for (i = 0; i < 5; i++) begin : gen1
			mux2_1 mux21 (.in({in1[i], in2[i]}), .sel(sel), .out(out[i]));
		end
	endgenerate 
endmodule