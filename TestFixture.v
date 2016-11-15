`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:43:43 11/14/2016
// Design Name:   MainModule
// Module Name:   D:/HDL/TeamFury/TestFixture.v
// Project Name:  TeamFury
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MainModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestFixture;

	// Inputs
	reg clk;
	reg shaftPulseL;
	reg shaftPulseR;
	reg RFS;
	reg RRS;
	reg RMS;
	reg LFS;
	reg LRS;
	reg LMS;
	reg bp1;
	reg bp2;
	reg bp3;
	reg bp4;
	reg bp5;
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg colDetF1;
	reg colDetF2;
	reg SW7;
	reg SW6;

	// Outputs
	wire hbEnA;
	wire hbEnB;
	wire hbIn1;
	wire hbIn2;
	wire hbIn3;
	wire hbIn4;
	wire sevenSeg0;
	wire sevenSeg1;
	wire sevenSeg2;
	wire sevenSeg3;
	wire testOut;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;
	wire led7;
	wire led8;
	wire txData;
	wire rxData;

	// Instantiate the Unit Under Test (UUT)
	MainModule uut (
		.clk(clk), 
		.hbEnA(hbEnA), 
		.hbEnB(hbEnB), 
		.hbIn1(hbIn1), 
		.hbIn2(hbIn2), 
		.hbIn3(hbIn3), 
		.hbIn4(hbIn4), 
		.shaftPulseL(shaftPulseL), 
		.shaftPulseR(shaftPulseR), 
		.RFS(RFS), 
		.RRS(RRS), 
		.RMS(RMS), 
		.LFS(LFS), 
		.LRS(LRS), 
		.LMS(LMS), 
		.sevenSeg0(sevenSeg0), 
		.sevenSeg1(sevenSeg1), 
		.sevenSeg2(sevenSeg2), 
		.sevenSeg3(sevenSeg3), 
		.testOut(testOut), 
		.bp1(bp1), 
		.bp2(bp2), 
		.bp3(bp3), 
		.bp4(bp4), 
		.bp5(bp5), 
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.colDetF1(colDetF1), 
		.colDetF2(colDetF2), 
		.SW7(SW7), 
		.SW6(SW6), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7), 
		.led8(led8), 
		.txData(txData), 
		.rxData(rxData)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		shaftPulseL = 0;
		shaftPulseR = 0;
		RFS = 0;
		RRS = 0;
		RMS = 0;
		LFS = 0;
		LRS = 0;
		LMS = 0;
		bp1 = 0;
		bp2 = 0;
		bp3 = 0;
		bp4 = 0;
		bp5 = 0;
		pb1 = 0;
		pb2 = 0;
		pb3 = 0;
		pb4 = 0;
		colDetF1 = 0;
		colDetF2 = 0;
		SW7 = 0;
		SW6 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
		#20 clk = ~clk;
	end
      
endmodule

