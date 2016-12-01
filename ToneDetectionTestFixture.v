`timescale 1ns / 1ps

module ToneDetectionTestFixture;

	// Inputs
	reg clk;
	reg rst;
	reg enableToneDetection;
	reg pushBtn1;
	reg pushBtn2;
	reg pushBtn3;
	reg pushBtn4;

	// Outputs
	wire [2:0] toneDir;

	// Instantiate the Unit Under Test (UUT)
	ToneDetection uut (
		.clk(clk), 
		.rst(rst), 
		.enableToneDetection(enableToneDetection), 
		.pushBtn1(pushBtn1), 
		.pushBtn2(pushBtn2), 
		.pushBtn3(pushBtn3), 
		.pushBtn4(pushBtn4), 
		.toneDir(toneDir)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		enableToneDetection = 0;
		pushBtn1 = 0;
		pushBtn2 = 0;
		pushBtn3 = 0;
		pushBtn4 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
	end
   always begin
		#2000000000 enableToneDetection = 1;
	end
	always begin
		#2000000000 pushBtn1 = 1;
	end
	 
	always begin
		#20 clk = ~clk;
	end
endmodule

