`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:00:41 12/06/2016
// Design Name:   CollisionDetection
// Module Name:   C:/Users/Denton/Documents/GitHub/TeamFury/CollisionDetectionTestFixture.v
// Project Name:  TeamFury
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CollisionDetection
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CollisionDetectionTestFixture;

	// Inputs
	reg clk;
	reg rst;
	reg direction;
	reg colDetFrontRaw;
	reg colDetRearRaw;

	// Outputs
	wire led1;
	wire led2;
	wire led3;
	wire colDetect;

	// Instantiate the Unit Under Test (UUT)
	CollisionDetection uut (
		.clk(clk), 
		.rst(rst), 
		.direction(direction), 
		.colDetFrontRaw(colDetFrontRaw), 
		.colDetRearRaw(colDetRearRaw), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.colDetect(colDetect)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		
		
		direction = 0;
		colDetFrontRaw = 0;
		colDetRearRaw = 0;
		#10000;
		
		direction = 0;
		colDetFrontRaw = 0;
		colDetRearRaw = 1;
		#10000;
		
		direction = 0;
		colDetFrontRaw = 0;
		colDetRearRaw = 0;
		#10000;
		
		direction = 0;
		colDetFrontRaw = 1;
		colDetRearRaw = 0;
		#10000;
        
		// Add stimulus here

	end
	
	always begin
		#20 clk = ~clk;
	end
      
endmodule

