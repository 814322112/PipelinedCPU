module shifter_2(in, out);
	input logic [63:0] in;
	output logic [63:0] out;
	
	integer i;
	always_comb begin
		for(i = 2; i < 63; i++) begin
			assign out[i] = in[i-2];
		end
	end
	assign out[1:0] = 2'b00;
	
endmodule 


