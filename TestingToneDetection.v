`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:04:55 11/21/2016
// Design Name:   ToneDetection
// Module Name:   C:/Users/jnwad_000/Documents/School/Project Lab 1/TeamFury/TestingToneDetection.v
// Project Name:  TeamFury
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ToneDetection
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestingToneDetection;

	// Inputs
	reg clk;
	reg bp1;
	reg bp2;
	reg bp3;
	reg bp4;
	reg bp5;
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;

	// Outputs
	wire [2:0] tdDir;

	// Instantiate the Unit Under Test (UUT)
	ToneDetection uut (
		.clk(clk), 
		.bp1(bp1), 
		.bp2(bp2), 
		.bp3(bp3), 
		.bp4(bp4), 
		.bp5(bp5), 
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.tdDir(tdDir)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		bp1 = 0;
		bp2 = 0;
		bp3 = 0;
		bp4 = 0;
		bp5 = 0;
		pb1 = 0;
		pb2 = 0;
		pb3 = 0;
		pb4 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
		#10 pb1 = 1;
		#10 pb1 = 0;
		pb2 = 1;
		#10;
		pb2 = 0;
	end	
      
endmodule

