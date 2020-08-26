module  DE1_SoC  (CLOCK_50,  HEX0,  HEX1,  HEX2,  HEX3,  HEX4,  HEX5,  KEY,  LEDR, SW, GPIO_0);
   input  logic CLOCK_50; // 50MHz clock.
	output logic[6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
	output logic[9:0]  LEDR;
	input  logic[3:0]  KEY; // True when not pressed, False whenpressed
	input  logic[9:0]  SW; 
	inout [35:0] GPIO_0;  
endmodule
