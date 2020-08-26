/*module signExtend  #(parameter WIDTH = 9) (in, out);
	input logic [WIDTH-1:0] in;
	output logic [63:0] out;
	
	always_comb begin
		for (int i = 0; i < WIDTH; i++) begin
			out[i] = in[i];
		end
		
		for (int i = WIDTH; i < 64; i++) begin
			out[i] = in[WIDTH-1];
		end
	end
endmodule*/




module bit26to64 (Rin, Rout);
	input logic [25:0] Rin;
	output logic [63:0] Rout;
	
	genvar i;
	generate
		for(i=0;i<26;i++) begin:transfer1
			assign Rout[i]=Rin[i];
		end
		for(i=26;i<64;i++)begin:movz1
			assign Rout[i]=Rin[25];
		end
	endgenerate

endmodule


module bit19to64 (Rin, Rout);
	input logic [18:0] Rin;
	output logic [63:0] Rout;
	
	genvar i;
	generate
		for(i=0;i<19;i++) begin:transfer2
			assign Rout[i]=Rin[i];
		end
		for(i=19;i<64;i++)begin:movz2
			assign Rout[i]=Rin[18];
		end
	endgenerate

endmodule


module bit9to64 (Rin, Rout);
	input logic [8:0] Rin;
	output logic [63:0] Rout;
	
	genvar i;
	generate
		for(i=0;i<9;i++) begin:transfer
			assign Rout[i]=Rin[i];
		end
		for(i=9;i<64;i++)begin:movz
			assign Rout[i]=Rin[8];
		end
	endgenerate

endmodule
