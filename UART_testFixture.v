`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:55:47 12/01/2016
// Design Name:   UART
// Module Name:   C:/Users/Denton/Desktop/TeamFury/UART_testFixture.v
// Project Name:  TeamFury
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_testFixture;

	// Inputs
	reg rst;
	reg clk;
	reg pushBtn1;
	reg [3:0] dirControl;
	reg direction;
	reg [1:0] driveState;
	reg hbEnA;
	reg hbEnB;
	reg [1:0] junctionState;
	reg [2:0] toneDir;
	reg [25:0] leftCount;

	// Outputs
	wire txData;

	// Instantiate the Unit Under Test (UUT)
	UART uut (
		.rst(rst), 
		.clk(clk), 
		.pushBtn1(pushBtn1), 
		.dirControl(dirControl), 
		.direction(direction), 
		.driveState(driveState), 
		.txData(txData), 
		.hbEnA(hbEnA), 
		.hbEnB(hbEnB), 
		.junctionState(junctionState), 
		.toneDir(toneDir), 
		.leftCount(leftCount)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		pushBtn1 = 0;
		dirControl = 0;
		direction = 0;
		driveState = 0;
		hbEnA = 0;
		hbEnB = 0;
		junctionState = 0;
		toneDir = 0;
		leftCount = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
	always begin
		#20 clk = ~clk;
	end
	
endmodule

