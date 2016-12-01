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
	input pushBtn1,
	input pushBtn2,
	input pushBtn3,
	input pushBtn4,
	
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

	wire colDetect;
	wire [3:0] dirControl;
	wire fullSpeedPwm;
	wire veerSpeedPwm;
	wire hardSpeedPwm;
	wire ninetySpeedPwm;
	wire ninetyFastSpeedPwm;
	wire [2:0] toneDir;
	wire [1:0] driveState;
	wire direction;
	wire enableToneDetection;
	wire [1:0] junctionState;
	
	//Turn Off The 7-Seg Display
	assign sevenSeg0 = 1;
	assign sevenSeg1 = 1;
	assign sevenSeg2 = 1;
	assign sevenSeg3 = 1;
	
	DirectionControl myDirectionControl(
		.clk (clk),
		.rst (rst),
		.RFS (RFS),
		.RRS (RRS),
		.RMS (RMS),
		.LFS (LFS),
		.LRS (LRS),
		.LMS (LMS),
		.direction (direction),
		.DIR (dirControl)
	);
	
	CollisionDetection myCollisionDetection(
		.clk (clk),
		.rst (rst),
		.direction (direction),
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
		.enableToneDetection (enableToneDetection),
		.pushBtn1 (pushBtn1),
		.pushBtn2 (pushBtn2),
		.pushBtn3 (pushBtn3),
		.pushBtn4 (pushBtn4),
		.toneDir (toneDir)
	);
	
	UART myUART(
		.clk (clk),
		.rst (rst),
		.pushBtn1 (pushBtn1),
		.dirControl (dirControl),
		.direction (direction),
		.driveState (driveState),
		.txData (txData),
		.hbEnA (hbEnA),
		.hbEnB (hbEnB),
		.junctionState (junctionState),
		.toneDir (toneDir)
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
		.toneDir (toneDir),
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
		.led8 (led8),
		.driveState (driveState),
		.direction (direction),
		.enableToneDetection (enableToneDetection),
		.junctionStateWire (junctionState)
	);
	
endmodule
