module register31(datain,dataout,clk,writeen);
	input logic [30:0][63:0] datain;
	output logic [63:0][30:0] dataout;
	input logic clk, writeen;
	logic [63:0] dffout;
	
	genvar i;
	generate 
		for(i = 0; i < 31; i++) begin : gen1
			//register produceReg (.datain(datain[i][63:0]),.dataout(dataout[63:0][30:0]),.clk(clk),.writeen(writeen));
		end
	endgenerate
endmodule

