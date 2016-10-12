`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Main Module
//////////////////////////////////////////////////////////////////////////////////
module MainModule(
	input clk,
	
	//Drive
	output hbEnA, 
	output hbEnB, 
	output hbIn1, 
	output hbIn2, 
	output hbIn3,
	output hbIn4,
	input shaftPulseL,
	input shaftPulseR,
	
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
	
	//Test Output
	output testOut,

	//Tone  Detection
	input bp1,
	input bp2,
	input bp3,
	input bp4,
	input bp5,
	
	//Collision Detection
	input colDetF,
	
	//LEDs
	output led1,
	output led2,
	output led3
	);
	
	//Input from Direction Control module
	//wire DirSignal,
	wire [3:0] dirControl;
	wire colDetect;
	
	//Input from Tone Detection module
	wire tdEn;
	wire [1:0] tdDir;

	//PWM Parameters
	//Do not exceed 80% on per H-Bridge specifications (Allows for a max of 2.5A Stall)
	parameter PWM_FULL_SPEED_PERCENT_ON = 80;
	parameter PWM_VEER_SPEED_PERCENT_ON = 20;
	parameter PWM_FREQUENCY  = 80;

	parameter PWM_COUNT_FREQ = 50_000_000/(PWM_FREQUENCY);
	parameter PWM_COUNT_FULL_SPEED_ON   = PWM_COUNT_FREQ*PWM_FULL_SPEED_PERCENT_ON/100;
	parameter PWM_COUNT_VEER_SPEED_ON   = PWM_COUNT_FREQ*PWM_VEER_SPEED_PERCENT_ON/100;

	//Drive State Machine States
	parameter FORWARDS = 2'b00;
	parameter REVERSE = 2'b01;
	parameter COLLISION = 2'b10;
	parameter JUNCTION = 2'b11;
	
	//Junction Conditions
	parameter  STRAIGHT = 2'b00;
	parameter  LEFT = 2'b01;
	parameter  RIGHT = 2'b10;
	parameter  BACK = 2'b11;

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
		.RMS  (RMS),
		.LFS	(LFS),
		.LRS	(LRS),
		.LMS  (LMS),
		.Direction (1'b1),
		.DIR	(dirControl)
	);
	
	//Instanciate COllision Detection
	CollisionDetection myCollisionDetection(
		.clk (clk),
		.sens1 (colDetF),
		.led1 (led1),
		.led2 (led2),
		.led3 (led3),
		.colDetect (colDetect)
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
				if(!colDetect) begin
					driveState <= COLLISION;
				end

				//Turn Left
				else if(dirControl[3:2] == 2'b01)begin
					//Veer Left
					if(dirControl[1:0] == 2'b01)begin
						regHbEnA <= regVeerSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
					//Stop Left
					else if(dirControl[1:0] == 2'b11) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
				end

				//Turn Right
				else if(dirControl[3:2] == 2'b10) begin
					//Veer Right
					if(dirControl[1:0] == 2'b01) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regVeerSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
					//Stop Right
					else if(dirControl[1:0] == 2'b11) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end 
				end

				//Straight
				else if(dirControl[3:2] == 2'b00) begin
					if(dirControl[1:0] == 2'b00) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
				end
				
				//Stop
				else if(dirControl[3:2] == 2'b11) begin
					regHbEnA <= 0;
					regHbEnB <= 0;
					regHbIn1 <= 0;
					regHbIn2 <= 0;
					regHbIn3 <= 0;
					regHbIn4 <= 0;
				end
				
				//Default Stop
				else begin
					regHbEnA <= regFullSpeedPwm;
					regHbEnB <= regFullSpeedPwm;
					regHbIn1 <= 0;
					regHbIn2 <= 0;
					regHbIn3 <= 0;
					regHbIn4 <= 0;
				end
			end

			REVERSE: begin
				//TODO: Add code to handle the reverse direction
			end

			COLLISION: begin
				regHbEnA <= 0;
				regHbEnB <= 0;
				if(colDetect)begin
					driveState <= FORWARDS;
				end
			end

			JUNCTION: begin
				if(tdEn)begin
					if(tdDir == STRAIGHT)begin
						//TODO: Add code for go straight
					end
					else if (tdDir == LEFT)begin
						//TODO: Add code for turn left
					end
					else if (tdDir == RIGHT)begin
						//TODO: Add code for turn right
					end
					else if (tdDir == BACK)begin
						//TODO: Add code for run backwards
					end
				end
			end		
		endcase
	end
endmodule
