`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Main Module
//////////////////////////////////////////////////////////////////////////////////
module MainModule(
	input clk,
	
	//Drive
	output hbEnAa, 
	output hbEnB, 
	output hbIn1, 
	output hbIn2, 
	output hbIn3,
	output hbIn4,
	
	//Direction Control
	input RFS, RRS, LFS, LRS,
	
	//Seven Seg
	output sevenSeg0, 
	output sevenSeg1, 
	output sevenSeg2, 
	output sevenSeg3,
	
	//Test Output
	output testOut

	//Tone  Detection
	input bp1,
	input bp2,
	input bp3,
	input bp4,
	input bp5,
	);
	
	//Input from Direction Control module
	wire [3:0] dirControl;

	//PWM Parameters
	//Do not exceed 80% on per H-Bridge specifications (Allows for a max of 2.5A Stall)
	parameter   PWM_FULL_SPEED_PERCENT_ON = 80;
	parameter   PWM_VEER_SPEED_PERCENT_ON = 40;
	parameter   PWM_FREQUENCY  = 80;

	parameter   PWM_COUNT_FREQ = 50_000_000/(PWM_FREQUENCY);
	parameter   PWM_COUNT_FULL_SPEED_ON   = PWM_COUNT_FREQ*PWM_FULL_SPEED_PERCENT_ON/100;
	parameter   PWM_COUNT_VEER_SPEED_ON   = PWM_COUNT_FREQ*PWM_VEER_SPEED_PERCENT_ON/100;

	//Drive State Machine States
	parameter   FORWARDS = 2'b00;
	parameter	 REVERSE = 2'b01;
	parameter   COLLISION = 2'b10;
	parameter   JUNCTION = 2'b11;

	//PWM Registers
	reg regFullSpeedPwm = 0;
	reg regVeerSpeedPwm = 0;
	reg [19:0] pwmFullSpeedCount = 0;
	reg [19:0] pwmVeerSpeedCount = 0;

	//H-Bridge Registers
	reg regHbEnA = 0;
	reg regHbEnB = 0;
	reg regHbIn1 = 0;
	reg regHbIn2 = 0;
	reg regHbIn3 = 0;
	reg regHbIn4 = 0;

	//Drive State Machine Registers
	reg [1:0] driveState = FORWARDS;
	reg colDetect = 0;

	//Pin Assignments
	assign hbEnA = regHbEnA;
	assign hbEnB = regHbEnB;
	assign hbIn1 = regHbIn1;
	assign hbIn2 = regHbIn2;
	assign hbIn3 = regHbIn3;
	assign hbIn4 = regHbIn4;

	//Testing Pin
	assign testOut = regVeerSpeedPwm;


	//Turn Off The 7-Seg Display
	assign sevenSeg0 = 1;
	assign sevenSeg1 = 1;
	assign sevenSeg2 = 1;
	assign sevenSeg3 = 1;

	//Instanciate Drive Control
	DirectionControl myDirectionControl(
		.clk	(clk),
		.RFS	(RFS),
		.RRS	(RRS),
		.LFS	(LFS),
		.LRS	(LRS),
		.DIR	(dirControl)
	);

	//PWM
	always @(posedge clk) begin
		//Full Speed PWM
		pwmFullSpeedCount <= pwmFullSpeedCount +1;
		if(pwmFullSpeedCount == PWM_COUNT_FULL_SPEED_ON) begin
			regFullSpeedPwm <= 0;
		end
		else if(pwmFullSpeedCount == PWM_COUNT_FREQ) begin
			regFullSpeedPwm <= 1;
			pwmFullSpeedCount <= 0;
		end

		//Veer Speed PWM
		pwmVeerSpeedCount <= pwmVeerSpeedCount +1;
		if(pwmVeerSpeedCount == PWM_COUNT_VEER_SPEED_ON) begin
			regVeerSpeedPwm <= 0;
		end
		else if(pwmVeerSpeedCount == PWM_COUNT_FREQ) begin
			regVeerSpeedPwm <= 1;
			pwmVeerSpeedCount <= 0;
		end
	end

	//Drive State Machine
	always @(posedge clk) begin
		case(driveState)
			FORWARDS: begin
				//Collision detected
				if(colDetect) begin
					driveState <= COLLISION;
				end
				//Turn Left
				else if(dirControl[3:2] == 2'b01) begin
					regHbEnA <= 1 & regVeerSpeedPwm;
					regHbEnB <= 1 & regFullSpeedPwm;
					regHbIn1 <= 0;
					regHbIn2 <= 1;
					regHbIn3 <= 1;
					regHbIn4 <= 0;
				end
				//Turn Right
				else if(dirControl[3:2] == 2'b10) begin
					regHbEnA <= 1 & regFullSpeedPwm;
					regHbEnB <= 1 & regVeerSpeedPwm;
					regHbIn1 <= 0;
					regHbIn2 <= 1;
					regHbIn3 <= 1;
					regHbIn4 <= 0;
				end
				
				JUNCTION: begin
					 if (bp1 == 1)
						driveState = COLLISION;
					 if (bp1 == 2)
					   driveState = FORWARDS;
					 if (bp1 == 3)
					   veerLeft = 1;
					 if (bp1 == 4)
					   veerRight = 1;
					 if (bp1 == 5)	
					   driveState = REVERSE;
				//Stop
				//TODO: Think about how puting the enables to 0 spins the motors where as the inputs to 0 is a break
				else if(dirControl[3:2] == 2'b11) begin
					regHbEnA <= 0;
					regHbEnB <= 0;
					regHbIn1 <= 0;
					regHbIn2 <= 0;
					regHbIn3 <= 0;
					regHbIn4 <= 0;
				end
				//Straight
				else begin
					regHbEnA <= 1 & regFullSpeedPwm;
					regHbEnB <= 1 & regFullSpeedPwm;
					regHbIn1 <= 0;
					regHbIn2 <= 1;
					regHbIn3 <= 1;
					regHbIn4 <= 0;
				end
			end

			REVERSE: begin
			end

			COLLISION: begin
				regHbEnA <= 0;
				regHbEnB <= 0;
				if(!colDetect)begin
				//TODO: Be sure to setup a case for when the robot is doing the track backwards
					driveState <= FORWARDS;
				end
			end

			JUNCTION: begin
			end		
		endcase
	end
endmodule
