`timescale 1ns / 1ps

module DirectionControlTestFixture;

	// Inputs
	reg clk;
	reg rst;
	reg RFS;
	reg RRS;
	reg RMS;
	reg LMS;
	reg LFS;
	reg LRS;
	reg direction;

	// Outputs
	wire [3:0] DIR;

	// Instantiate the Unit Under Test (UUT)
	DirectionControl uut (
		.clk(clk), 
		.rst(rst), 
		.RFS(RFS), 
		.RRS(RRS), 
		.RMS(RMS), 
		.LMS(LMS), 
		.LFS(LFS), 
		.LRS(LRS), 
		.direction(direction), 
		.DIR(DIR)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		direction = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 1;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 1;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 1;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 1;
		LMS = 0;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 1;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 0;
		LMS = 1;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 0;
		LMS = 1;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 0;
		LMS = 1;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 1;
		LMS = 1;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 1;
		LMS = 1;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 1;
		LMS = 1;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 1;
		LMS = 1;
		LFS = 0;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 0;
		LMS = 0;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 0;
		LMS = 0;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 1;
		LMS = 0;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 1;
		LMS = 0;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 1;
		LMS = 0;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 1;
		LMS = 0;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 1;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 0;
		LMS = 1;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 0;
		LMS = 1;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 0;
		LMS = 1;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 1;
		LMS = 1;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 1;
		LMS = 1;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 1;
		LMS = 1;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 1;
		LMS = 1;
		LFS = 1;
		LRS = 0;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 0;
		LMS = 0;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 1;
		LMS = 0;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 1;
		LMS = 0;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 1;
		LMS = 0;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 1;
		LMS = 0;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 1;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 0;
		LMS = 1;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 0;
		LMS = 1;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 0;
		LMS = 1;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 1;
		LMS = 1;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 1;
		LMS = 1;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 1;
		LMS = 1;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 1;
		LMS = 1;
		LFS = 0;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 0;
		LMS = 0;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 0;
		LMS = 0;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 0;
		LMS = 0;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 1;
		LMS = 0;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 1;
		LMS = 0;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 1;
		LMS = 0;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 1;
		LMS = 0;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LMS = 1;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 0;
		LMS = 1;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 0;
		LMS = 1;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 0;
		LMS = 1;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 0;
		RMS = 1;
		LMS = 1;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 0;
		RMS = 1;
		LMS = 1;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 0;
		RRS = 1;
		RMS = 1;
		LMS = 1;
		LFS = 1;
		LRS = 1;
		
		#5000000
		RFS = 1;
		RRS = 1;
		RMS = 1;
		LMS = 1;
		LFS = 1;
		LRS = 1;
	end
	
	always begin
		#20 clk = ~clk;
	end
      
endmodule

