module controlLogic(instr, reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP,
                    ImmSel, IsBranch, negative, zero, overflow, flagSet, reg3loc, read_en, lessThanFWD);
	input logic [10:0] instr;
	input logic lessThanFWD;
	output logic reg2loc, ALUSrc, RegWrite, MemWrite, BrTaken, UncondBr, ImmSel, IsBranch,flagSet, reg3loc, read_en;
	output logic [2:0] ALUOP;
	output logic [1:0] MemToReg;
	//logic [63:0] instr;
	logic [31:0] addr;
	input logic negative, zero, overflow;
	logic lessThan;
	
	/*logic				write_enable;
	logic				read_enable;
	logic	[63:0]	write_data;
	logic	[3:0]		xfer_size;
	logic	[63:0]	read_data;*/
	
	parameter ADDI = 11'b1001000100x; //0x244
	parameter ADDS = 11'b10101011000; //0x558
	parameter B =    11'b000101xxxxx; //0x05
	parameter BLT =  11'b0101010xxxx;
	parameter BL =   11'b100101xxxxx;
	parameter BR =   11'b11010110000; //6B0
	parameter CBZ =  11'b10110100xxx;
	parameter LDUR = 11'b11111000010; //7C2
	parameter STUR = 11'b11111000000; //7C0
	parameter SUBS = 11'b11101011000; //758
	
	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
	
	always_comb begin
		casex(instr)
			ADDI: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} = 
			{8'b0100100X, ALU_ADD, 5'b10000};
			
			ADDS: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} = 
			{8'b1000100x, ALU_ADD, 2'bx0, 1'b1, 2'b00};
			
			B: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} =
			{8'bxxxx0011, 3'bxxx, 2'bx0, 1'b0, 2'b00};
			
			BLT: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} = 
			{6'b0xxx00, lessThanFWD, 1'b0, 3'bxxx, 2'bx0, 1'b0, 2'b00};
			
			BL: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} =
			{8'bxx101011, 3'bxxx, 2'bx0, 1'b0, 2'b10};
			
			BR: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} =
			{8'b00xx00xx, 3'bxxx, 2'bx1, 1'b0, 2'b00};
			
			CBZ: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} =
			{6'b00XX00, zero, 1'b0, 3'b000,2'bx0, 1'b0, 2'b00};
			
			LDUR: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} = 
			{8'bx101100x, ALU_ADD, 2'b00, 1'b0, 2'b01};
			
			STUR: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} =
			{8'b01xx010x, ALU_ADD, 2'b00, 1'b0, 2'b00};
			
			SUBS: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} =
			{8'b1000100X, ALU_SUBTRACT, 2'bx0, 1'b1, 2'b00};
			
			11'b0: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} = 
			16'b0;

			default: {reg2loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOP, ImmSel, IsBranch, flagSet, reg3loc, read_en} = 
			'bx;
		endcase
	end
endmodule 