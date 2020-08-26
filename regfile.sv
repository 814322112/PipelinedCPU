/*module regfile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister,
					                                                               RegWrite, clk);
	input logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	input logic [63:0]	WriteData;
	input logic 			RegWrite, clk;
	output logic [63:0]	ReadData1, ReadData2;
	logic [63:0][31:0]         w;
	logic [31:0]         decoderR;
	
	d5_32_decoder Decoder (.in(WriteRegister[4:0]), .out(decoderR[31:0]), .en(RegWrite));
	
	
	genvar i;
	genvar a;
	generate
		for (i = 0; i < 31; i++) begin : gen1
			for (a = 0; a < 64; a++) begin : gen3
				register register (.datain(WriteData[a]), .dataout(w[a][i]), .clk, .writeen(decoderR[i]));
			end
		end
	endgenerate
	
	genvar j;
	generate 
		for (j = 0; j < 64; j++) begin : gen2
			mux32_1 largeMux1 (.in(w[j][31:0]), .sel(ReadRegister1[4:0]), .out(ReadData1[j]));
			mux32_1 largeMux2 (.in(w[j][31:0]), .sel(ReadRegister2[4:0]), .out(ReadData2[j]));
		end
	endgenerate 

//	mux32_64 mux1 (.in(w[63:0][31:0]), .sel(ReadRegister1[4:0]), .out(ReadData1[63:0]));
//	mux32_64 mux2 (.in(w[63:0][31:0]), .sel(ReadRegister2[4:0]), .out(ReadData2[63:0]));
	
	integer k;
	always_comb begin
		for (k = 0; k < 64; k++) 
			w[k][31] = 0;
	end
endmodule*/

module regfile (ReadData1, ReadData2, WriteData, 
					 ReadRegister1, ReadRegister2, WriteRegister,
					 RegWrite, clk);
	
	input logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	input logic [63:0]	WriteData;
	input logic 			RegWrite, clk;
	output logic [63:0]	ReadData1, ReadData2;
	logic [63:0][31:0]   ffout;
	logic [31:0]         fromDecoder;
	logic [31:0][63:0]   insideReg;
	
	//Setting up input Decoder from the decode_5_32 submodule
	d5_32_decoder Decoder (.in(WriteRegister[4:0]), .out(fromDecoder[31:0]), .en(RegWrite));
	
	//Setting up the two output Muxs for reading data using the mux32_1 submodule
	genvar a;
	
	generate 
		for (a = 0; a < 64; a++) begin : eachMux
			mux32_1 largeMux1 (.in(ffout[a][31:0]), .sel(ReadRegister1[4:0]), .out(ReadData1[a]));
			mux32_1 largeMux2 (.in(ffout[a][31:0]), .sel(ReadRegister2[4:0]), .out(ReadData2[a]));
		end
	endgenerate 

	
	//Setting up registers made up of 64 D_FFs
	genvar i, j;
	
	generate
		for(i=0; i<31; i++) begin : eachReg //This loop creates registers 0-30 needed for the system
			for(j=0; j<64; j++) begin : eachDff //This loop creates a single register of 64 flip flops
				register theReg (.dataout(insideReg[i][j]), .datain(WriteData[j]),  .writeen(fromDecoder[i]), .clk);
		   end
		end
	endgenerate 

	integer m, n, o;
	
	//Sets register 31 to always read zero
	always_comb begin
		for(m=0; m<64; m++) 
			insideReg[31][m] = 0;
			
		for(n=0; n<32; n++)
			for(o=0; o<64; o++)
				 ffout[o][n] = insideReg[n][o];	
	end

endmodule