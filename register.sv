`timescale 10ps/1fs
module register(datain,dataout,clk,writeen);
	input logic  datain;
	output logic  dataout;
	input logic clk, writeen;
	logic  dffout;
	

			mux2_1 m21 (.in({datain,dataout}), .sel(writeen), .out(dffout));
			D_FF dffs (.q(dataout),.d(dffout),.clk,.reset(1'b0));

endmodule

module register_testbench();
	logic datain;
	logic dataout;
	logic clk, writeen;
	
	register dut (.*);
	
	parameter CLOCK_PERIOD=100;
	initial begin
	   clk<= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
	 writeen <= 0; datain <= 1; @(posedge clk);
	 @(posedge clk);
	 writeen <= 1;@(posedge clk);
	 @(posedge clk);
	 datain <= 0;@(posedge clk);
	 @(posedge clk);
	 @(posedge clk);
	 @(posedge clk);
	 writeen <= 0;@(posedge clk);
	 @(posedge clk);
	 datain <= 0;@(posedge clk);
	 @(posedge clk);
	 datain <= 1;@(posedge clk);
	 @(posedge clk);
	 writeen <= 1;@(posedge clk);
	 @(posedge clk);
	 @(posedge clk);
	 @(posedge clk);
	$stop;
	end
	
endmodule