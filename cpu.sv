`timescale 1ns/10ps
module cpu (clk, reset);
	input logic clk, reset;
	logic [63:0] Da, Db, Dw, addr, regularAddr, branchAddr, newPC, aluUse, 
					 aluResult, BrMux, dataMemOut, newAddr; 
	logic [31:0] instruction, instruction_reg;
	logic [10:0] instr;
	logic [11:0] imm_12;
	logic [25:0] imm_26;
	logic [18:0] imm_19;
	logic [15:0] imm_16;
	logic [8:0]  daddr9;
	logic [4:0]  Rd, Rm, Rn, Aa, Ab, Aw;
	logic [5:0] shamt;
	logic MemWrite, reg2loc, reg3loc, ALUSrc,UncondBr,BrTaken,read_en,RegWrite,ImmSel,IsBranch,flagSet;
	logic [3:0] xfer_size;
	logic negative, zero, overflow, carry_out;
	logic negative_reg, overflow_reg, zero_reg, carry_out_reg;
	
	logic [63:0] imm26_xtd,imm_26_sft, imm12_xtd, daddr_xtd, postShiftB,bToAddr, daddr9_xtd, imm19_xtd, altBInput;
	logic [2:0] ALUOP;
	logic [1:0] MemToReg, forwardDa, forwardDb;

	/**************lab4 logics************/
	logic rvsdClk;
	logic [63:0] addr1, addr2, addr3, addr4, Dw_reg, alu_reg, Db_reg2, Db_reg3,
					 Da_reg2, Da_out, Db_out, newAddr_2, newAddr_3, add2_1,altBInput3, Con19;
	logic [4:0] Rd2, Rd3, Rd4, Rd5;
	logic [2:0] ALUOP3;
	logic [1:0] MemToReg3, MemToReg4;
		
	//Assign variable
	assign Rd       = 	  instruction_reg[4:0];
	assign Rn       = 	  instruction_reg[9:5];
	assign Rm       = 	  instruction_reg[20:16];
	assign instr    = 	  instruction_reg[31:21];
	//assign shamt    =  	  instruction[15:10];
	assign imm_12    =  	  instruction_reg[21:10];
	assign daddr9   = 	  instruction_reg[20:12];
	//assign imm_16   =      instruction[20:5];
	assign imm_26   =      instruction_reg[25:0];
	assign imm_19   =      instruction_reg[23:5];
	
	not #5 not1 (rvsdClk, clk);
	or #5 or1 (selAddr, BrTaken, IsBranch);
	
	/************Instructmem*************/
	instructmem inst (.address(addr),.*);
	
	/**************Control Logic***************/
	controlLogic ctrl (.negative(negative_reg),.overflow(overflow_reg),.zero(DbZero),.*);
	
	/************Regfile************/
	regfile regf (.ReadData1(Da), .ReadData2(Db), .WriteData(Dw_reg), 
					.ReadRegister1(Rn), .ReadRegister2(Ab), .WriteRegister(Aw),.clk(rvsdClk),.RegWrite(RegWrite5));
	
	/************DataMem************/
	datamem dataMemory (.address(alu_reg), .write_enable(MemWrite4), .read_enable(read_en4), .write_data(Db_reg3), 
	.clk(clk), .xfer_size(4'b1000), .read_data(dataMemOut));
	
	
	/************Muxes***********/	
	mux128_64 mux1 (.one_input(branchAddr), .zero_input(addr2), .sel(BrTaken), .out(newPC));
	mux128_64 mux3 (.one_input(imm12_xtd), .zero_input(daddr9_xtd), .sel(ImmSel), .out(altBInput)); 
	mux4_1_64 mux4 (.in1(alu_reg),.in2(dataMemOut),.in3(addr4),.in4(64'b0),.sel(MemToReg4),.out(Dw));
	mux5bit mux5 (.in1(Rm),.in2(Rd),.sel(reg2loc),.out(Ab));
	mux128_64 alusrcMUX (.one_input(altBInput3), .zero_input(Db_reg2), .sel(ALUSrc3), .out(aluUse));
	mux5bit mux6 (.in1(5'd30),.in2(Rd5),.sel(reg3loc5),.out(Aw));
	mux128_64 brSelect (.one_input(imm26_xtd), .zero_input(imm19_xtd), .sel(UncondBr), .out(postShiftB));
	mux128_64 mux7 (.one_input(Db_out), .zero_input(newPC), .sel(IsBranch), .out(newAddr_3));
	
	/**************ALU**************/
	alu_64 alu1 (.A(Da_reg2), .B(aluUse), .cntrl(ALUOP3), .result(aluResult), .*);
	fullAdder_64 adder1 (.a(addr), .b(64'h0000000000000004), .out(regularAddr));
	fullAdder_64 adder2 (.a(addr1), .b(bToAddr), .out(branchAddr));
	
	
	/***********Registers**********/	
	register reg1 (.datain(negative),.dataout(negative_reg),.clk,.writeen(flagSet3));
	register reg2 (.datain(overflow),.dataout(overflow_reg),.clk,.writeen(flagSet3));
	register reg3 (.datain(zero),.dataout(zero_reg),.clk,.writeen(flagSet3));
	register reg4 (.datain(carry_out),.dataout(carry_out_reg),.clk,.writeen(flagSet3));
	register2 pc (.in(newAddr),.out(addr),.*);
	
	always_ff@(posedge clk) begin
		if (reset) begin
			addr <= 64'h0;
			newAddr <= 64'h4;
		end else begin
			addr <= newAddr;
		end
	end
	
	
	/****************Lab4***************/
	//First level
	register2 reg1_1 (.in(addr),.out(addr1),.clk,.reset);
	register2 reg1_2 (.in(regularAddr),.out(addr2),.clk,.reset);
	register2 reg1_3 (.in(altBInput),.out(altBInput3),.*);

	register32 reg1_4 (.in(instruction),.out(instruction_reg),.clk,.reset);
	
	shifter shift2 (.value(imm19_xtd), .direction(1'b0), .distance(6'b000010), .result(Con19));
	fullAdder_64 adder3 (.a(addr1),.b(Con19),.out(add2_1));
	
	mux128_64 mux8 (.one_input(add2_1),.zero_input(newAddr_3),.sel(CBZSel),.out(newAddr_2));
	mux128_64 mux9 (.one_input(newAddr_2),.zero_input(regularAddr),.sel(selAddr),.out(newAddr));
	
	D_FF seladdr (.q(selAddr2), .d(selAddr),.*);

	//Second level
	//sel-- to be determined by the forwarding unit
	mux4_1_64 mux10 (.in1(Da), .in2(aluResult), .in3(addr3), .in4(Dw), .sel(forwardDa), .out(Da_out));
	mux4_1_64 mux11 (.in1(Db), .in2(aluResult), .in3(addr3), .in4(Dw), .sel(forwardDb), .out(Db_out));
	zero_flag DbZ (Db_out,DbZero);

	//check if the instr is CBZ and B is zero
	not #5 ins9 (insInv9, instr[9]); 
	not #5 ins6 (insInv6, instr[6]); 
	not #5 ins4 (insInv4, instr[4]); 
	not #5 ins3 (insInv3, instr[3]); 
	and #5 cbz1 (CBZ1,(instr[10]),(insInv9),(instr[8]),(instr[7]));
	and #5 cbz2 (CBZ2,(insInv6),(instr[5]),(insInv4),(insInv3));
	and #5 cbz3 (CBZ3, CBZ2, CBZ1);
	and #5 cbzsel (CBZSel, CBZ3, DbZero);
	
	register2 reg2_1 (.in(addr2),.out(addr3),.*);
	register2 reg2_2 (.in(Db_out),.out(Db_reg2),.*);
	register2 reg2_3 (.in(Da_out),.out(Da_reg2),.*);
	
	register2b reg2_5 (.in(MemToReg), .out(MemToReg3),.*);
	
	register5 reg2_4 (.in(Rd),.out(Rd3),.*);
	
	D_FF Reg3Loc3 (.q(reg3loc3), .d(reg3loc),.*);
	D_FF RegWri3 (.q(RegWrite3), .d(RegWrite),.*);
	D_FF MemWri3 (.q(MemWrite3), .d(MemWrite),.*);
	D_FF flgSt3 (.q(flagSet3), .d(flagSet),.*);
	D_FF rdEn3 (.q(read_en3), .d(read_en),.*);
	D_FF Alusrc3 (.q(ALUSrc3), .d(ALUSrc),.*);
	register3 Aluop3 (.out(ALUOP3), .in(ALUOP),.*);
   
	//Third level
	register2 reg3_1 (.in(addr3),.out(addr4),.*);
	register2 reg3_2 (.in(aluResult),.out(alu_reg),.*);
	register2 reg3_3 (.in(Db_reg2),.out(Db_reg3),.*);
	
	register2b reg3_5 (.in(MemToReg3), .out(MemToReg4),.*);
	
	register5 reg3_4 (.in(Rd3),.out(Rd4),.*);
	
	D_FF Reg3Loc4 (.q(reg3loc4), .d(reg3loc3),.*);
	D_FF RegWri4 (.q(RegWrite4), .d(RegWrite3),.*);
	D_FF MemWri4 (.q(MemWrite4), .d(MemWrite3),.*);
	D_FF rdEn4 (.q(read_en4), .d(read_en3),.*);

	logic flagSet3b, on, on2, fl, lessThanFWD;
	xor #5 lt (lessThan, overflow_reg, negative_reg);
	not #5 fsb (flagSet3b, flagSet3);
	and #5 a1 (fl, flagSet3b, lessThan);
	xor #5 x1 (on, overflow, negative);
	and #5 a2 (on2, flagSet3, on);
	or #5 o1 (lessThanFWD, on2, fl);
	
	//Fourth level
	register2 reg4_1 (.in(Dw),.out(Dw_reg),.*);
	
	register5 reg4_2 (.in(Rd4),.out(Rd5),.*);
	
	D_FF Reg3Loc5 (.q(reg3loc5), .d(reg3loc4),.*);
	D_FF RegWri5 (.q(RegWrite5), .d(RegWrite4),.*);
	
	/**************Forwarding************/
	always_comb begin
		if ((Rn == 5'd30) & reg3loc3)
			forwardDa = 2'b10;
		else if (RegWrite3 & (Rd3 != 5'd31) & (Rn==Rd3))
			forwardDa = 2'b01;
		else if ((RegWrite4 & (Rd4 != 5'd31) & (Rn==Rd4))|(reg3loc4&(Rn==5'd30)))
			forwardDa = 2'b11;
		else
			forwardDa = 2'b00;
		
		if ((Ab==5'd30) & reg3loc3)
			forwardDb = 2'b10;
		else if (RegWrite3 & (Rd3 != 5'd31) & (Ab == Rd3))
			forwardDb = 2'b01;
		else if ((RegWrite4 & (Rd4 != 5'd31) & (Ab == Rd4))|(reg3loc4&(Ab == 5'd30)))
			forwardDb = 2'b11;
		else
			forwardDb = 2'b00;
	end
	
	/************SignExtend**********/
	bit26to64 SE1 (.Rin(imm_26),.Rout(imm26_xtd));
	bit19to64 SE5 (.Rin(imm_19),.Rout(imm19_xtd));
	bit12to64 SE2(.Rin(imm_12),.Rout(imm12_xtd));
	bit9to64 SE3 (.Rin(daddr9),.Rout(daddr9_xtd));
	shifter shift (.value(postShiftB), .direction(1'b0), .distance(6'b000010), .result(bToAddr));
	
endmodule

`timescale 1ns/10ps

module cpu_testbench(); 		
	parameter ClockDelay = 30;
	logic  clk, reset;
	integer i;

	cpu dut (.clk, .reset);
	initial begin
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		reset = 1; 							@(posedge clk);
	   reset = 0; 							@(posedge clk);
												@(posedge clk);
		for (i=0; i<700; i++) begin
												@(posedge clk);
		end
		$stop;
	end
endmodule
