`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Top Module
//////////////////////////////////////////////////////////////////////////////////
module TopModule(
	input clk,
	
	//Drive
	output hbEnA, 
	output hbEnB, 
	output hbIn1, 
	output hbIn2, 
	output hbIn3,
	output hbIn4,
	
	//Direction Control
	input RFS, 
	input RRS,
	input RMS,
	input LFS, 
	input LRS,
	input LMS,
	
	//Seven Seg
	output sevenSeg0, 
	output sevenSeg1, 
	output sevenSeg2, 
	output sevenSeg3,

	//Tone  Detection
	input bp1,
	input bp2,
	input bp3,
	input bp4,
	input bp5,
	input pb1,
	input pb2,
	input pb3,
	input pb4,
	
	//Collision Detection
	input colDetF1,
	input colDetF2, 
	
	//LEDs
	output led1,
	output led2,
	output led3,
	output led4,
	output led5,
	output led6,
	output led7,
	output led8,
	
	//UART
	output txData
	);
	
	reg rst = 0;

	wire dcDrive;
	wire colDetect;
	wire [3:0] dirControl;
	wire fullSpeedPwm;
	wire veerSpeedPwm;
	wire hardSpeedPwm;
	wire ninetySpeedPwm;
	wire ninetyFastSpeedPwm;
	wire [2:0] tdDir;
	
	//Turn Off The 7-Seg Display
	assign sevenSeg0 = 1;
	assign sevenSeg1 = 1;
	assign sevenSeg2 = 1;
	assign sevenSeg3 = 1;
	
	DirectionControl myDirectionControl(
		.clk	(clk),
		.rst (rst),
		.RFS	(RFS),
		.RRS	(RRS),
		.RMS  (RMS),
		.LFS	(LFS),
		.LRS	(LRS),
		.LMS  (LMS),
		.Direction (dcDrive),
		.DIR	(dirControl)
	);
	
	CollisionDetection myCollisionDetection(
		.clk (clk),
		.rst (rst),
		.direction (dcDrive),
		.sensf (colDetF1),
		.sensb (colDetF2),
		.led1 (led1),
		.led2 (led2),
		.led3 (led3),
		.colDetect (colDetect)
	);

	ToneDetection myToneDetection (
		.clk (clk),
		.rst (rst),
		.bp1 (bp1),
		.bp2 (bp2),
		.bp3 (bp3),
		.bp4 (bp4),
		.bp5 (bp5),
		.pb1 (pb1),
		.pb2 (pb2),
		.pb3 (pb3),
		.pb4 (pb4),
		.tdDir (tdDir)
	);
	
	UART myUART(
		.clk (clk),
		.rst (rst),
		.pb1 (pb1),
		.dirControl (dirControl),
		.drive (drive),
		.driveState (driveState),
		.txData (txData)
	);
	
	PulseWidthModulation myPulseWidthModulation(
		.clk (clk),
		.rst (rst),
		.fullSpeedPwm (fullSpeedPwm),
		.veerSpeedPwm (veerSpeedPwm),
		.hardSpeedPwm (hardSpeedPwm),
		.ninetySpeedPwm (ninetySpeedPwm),
		.ninetyFastSpeedPwm (ninetyFastSpeedPwm)
	);

	Drive myDrive(
		.clk (clk),
		.rst (rst),
		.colDetect (colDetect),
		.dirControl (dirControl),
		.veerSpeedPwm (veerSpeedPwm),
		.fullSpeedPwm (fullSpeedPwm),
		.hardSpeedPwm (hardSpeedPwm),
		.ninetySpeedPwm (ninetySpeedPwm),
		.ninetyFastSpeedPwm (ninetyFastSpeedPwm),
		.tdDir (tdDir),
		.hbIn1 (hbIn1),
		.hbIn2 (hbIn2),
		.hbIn3 (hbIn3),
		.hbIn4 (hbIn4),
		.hbEnA (hbEnA),
		.hbEnB (hbEnB),
		.led4 (led4),
		.led5 (led5),
		.led6 (led6),
		.led7 (led7),
		.led8 (led8)
	);
	
endmodule
