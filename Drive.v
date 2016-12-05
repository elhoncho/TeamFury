`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Drive
//////////////////////////////////////////////////////////////////////////////////
module Drive(
	input clk,
	input rst,
	input colDetect,
	input [3:0] dirControl,
	input veerSpeedPwm,
	input fullSpeedPwm,
	input hardSpeedPwm,
	input ninetySpeedPwm,
	input ninetyFastSpeedPwm,
	input [2:0] toneDir,
	output hbIn1,
	output hbIn2,
	output hbIn3,
	output hbIn4,
	output reg enableToneDetection = 0,
	output reg hbEnA,
	output reg hbEnB,
	output reg [1:0] driveState = 0,
	output reg direction = 1,
	output [1:0] junctionStateWire,
	input [1:0] leadSense
	);
	 
	`include "parameters.vh"
	
	//H-Bridge Registers
	reg [3:0] regHbRight = 0;
	reg [3:0] regHbLeft = 0;
	reg [3:0] regHbStraight = 0;
	reg [3:0] regHbDrive = 0;
	
	//Junction Registers
	reg [1:0] junctionState = J_COMPLETE;
	reg [2:0] junctionManeuver = TD_HOLD;
	reg [26:0] junctionTimer = 0;
	reg [26:0] straightTimer =0;
	
	//Collision Registters
	reg [25:0] colPauseCount;
	
	assign hbIn1 = regHbDrive[0];
	assign hbIn2 = regHbDrive[1];
	assign hbIn3 = regHbDrive[2];
	assign hbIn4 = regHbDrive[3];
	
	assign junctionStateWire = junctionState;
	//assign driveState = regDriveState;
	always @(posedge clk) begin
	
		//Diretion and bit assignments for H-Bridge
		if (direction == FORWARDS) begin
			regHbRight <= HB_RIGHT;
			regHbLeft <= HB_LEFT;
			regHbStraight <= HB_STRAIGHT;
		end
		else if (direction == REVERSE) begin
			regHbRight <= ~HB_RIGHT;
			regHbLeft <= ~HB_LEFT;
			regHbStraight <= ~HB_STRAIGHT;
		end
	
		case(driveState)
			//Drive State
			DRIVE: begin
			
				//Collision detected	
				if(!colDetect) begin
					driveState <= COLLISION;
				end
			
				//Turn Left
				else if(dirControl[3:2] == DC_TURN_LEFT)begin
				
					//Veer Left
					if(dirControl[1:0] == DC_VEER)begin
						hbEnA <= veerSpeedPwm;
						hbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					
					//Hard Left
					else if(dirControl[1:0] == DC_HARD) begin
						hbEnA <= veerSpeedPwm;
						hbEnB <= hardSpeedPwm;
						regHbDrive <= regHbLeft;
					end
					
					//Stop Left
					else if(dirControl[1:0] == DC_STOP) begin
						if (direction == FORWARDS) begin
							hbEnA <= ninetySpeedPwm;
							hbEnB <= ninetySpeedPwm;
							regHbDrive <= regHbLeft;
						end
						else if (direction == REVERSE) begin 
							hbEnA <= ninetyFastSpeedPwm;
							hbEnB <= ninetySpeedPwm;
							regHbDrive <= regHbLeft;
						end

					end
				end
				
				//Turn Right
				else if(dirControl[3:2] == DC_TURN_RIGHT) begin
				
					//Veer Right
					if(dirControl[1:0] == DC_VEER) begin
						hbEnA <= fullSpeedPwm;
						hbEnB <= veerSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					
					//Hard Right
				   else if(dirControl[1:0] == DC_HARD) begin
						hbEnA <= hardSpeedPwm;
						hbEnB <= veerSpeedPwm;
						regHbDrive <= regHbRight;
					end 
					
					//Stop Right
					else if(dirControl[1:0] == DC_STOP) begin
					if (direction == FORWARDS) begin
							hbEnA <= ninetySpeedPwm;
							hbEnB <= ninetySpeedPwm;
							regHbDrive <= regHbRight;
						end
						else if (direction == REVERSE) begin 
							hbEnA <= ninetySpeedPwm;
							hbEnB <= ninetyFastSpeedPwm;
							regHbDrive <= regHbRight;
						end
					end 
				end
				
				//Straight
				else if(dirControl[3:2] == DC_PROCEED) begin
					if(dirControl[1:0] == 2'b00) begin
						hbEnA <= fullSpeedPwm;
						hbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
				end	
				
				//Stop
				else if(dirControl[3:2] == DC_STOP) begin
					hbEnA <= 0;
					hbEnB <= 0;
					regHbDrive <= HB_STOP;
					driveState <= JUNCTION;
				end
				
				/*//Default Stop
				else begin
					hbEnA <= fullSpeedPwm;
					hbEnB <= fullSpeedPwm;
					regHbDrive <= HB_STOP;
					driveState <= JUNCTION;
				end*/
			end

			//Collision State
			COLLISION: begin
				if (colDetect) begin
					colPauseCount <= colPauseCount + 1;
					if (colPauseCount == C_NO_COL_PAUSE) begin
						driveState <= DRIVE;
					end
				end
					hbEnA <= fullSpeedPwm;
					hbEnB <= fullSpeedPwm;
					regHbDrive <= HB_STOP;
				
			end

			//Junction State
			JUNCTION: begin
				case(junctionState)
					J_DETECT: begin
						enableToneDetection <= 1;
						
						if(toneDir == TD_FORWARD)begin
							junctionState <= J_MANEUVER;
							junctionManeuver <= TD_FORWARD;
							direction <= FORWARDS;
						end
						else if(toneDir == TD_LEFT)begin
							junctionState <= J_MANEUVER;
							junctionManeuver <= TD_LEFT;
							junctionTimer <= 0;
						end
						else if(toneDir == TD_RIGHT)begin
							junctionState <= J_MANEUVER;
							junctionManeuver <= TD_RIGHT;
						end
						else if(toneDir == TD_REVERSE)begin
							junctionState <= J_MANEUVER;
							junctionManeuver <= TD_REVERSE;
							direction <= REVERSE;
						end
						else if(toneDir == TD_STOP)begin
							junctionState <= J_MANEUVER;
							junctionManeuver <= TD_STOP;
						end
						else if(toneDir == TD_HOLD)begin
							 //Do nothing, just sit here and wate for a decision
						end
					end
					J_MANEUVER: begin
						enableToneDetection <= 0;
						if(junctionManeuver == TD_FORWARD)begin
							junctionTimer <= junctionTimer +1;
							if(junctionTimer < 50_000_000)begin
								hbEnA <= fullSpeedPwm;
								hbEnB <= fullSpeedPwm;
								regHbDrive <= regHbStraight;
								if(leadSense)begin
									driveState <= DRIVE;
									junctionState <= J_COMPLETE;
									junctionTimer <= 0;
								end
							end
							else begin
								junctionTimer <= 0;
								junctionState <= J_COMPLETE;
								driveState <= DRIVE;
							end
						end
						else if(junctionManeuver == TD_LEFT)begin
							junctionTimer <= junctionTimer +1;
							if(junctionTimer < 75_000_000)begin
								hbEnA <= ninetySpeedPwm;
								hbEnB <= ninetySpeedPwm;
								regHbDrive <= regHbLeft;
							end
							else if(straightTimer < 50_000_000)begin
								hbEnA <= fullSpeedPwm;
								hbEnB <= fullSpeedPwm;
								regHbDrive <= regHbStraight;
								if(leadSense)begin
									driveState <= DRIVE;
									junctionState <= J_COMPLETE;
									junctionTimer <= 0;
									straightTimer <= 0;
								end
							end
							else begin
								junctionTimer <= 0;
								straightTimer <= 0;
								junctionState <= J_COMPLETE;
								driveState <= DRIVE;
							end
						end
						else if(junctionManeuver == TD_RIGHT)begin
							junctionTimer <= junctionTimer +1;
							if(junctionTimer < 75_000_000)begin
								hbEnA <= ninetySpeedPwm;
								hbEnB <= ninetySpeedPwm;
								regHbDrive <= regHbRight;
							end
							else if(straightTimer < 50_000_000)begin
								hbEnA <= fullSpeedPwm;
								hbEnB <= fullSpeedPwm;
								regHbDrive <= regHbStraight;
								if(leadSense)begin
									driveState <= DRIVE;
									junctionState <= J_COMPLETE;
									junctionTimer <= 0;
									straightTimer <= 0;
								end
							end
							else begin
								junctionTimer <= 0;
								straightTimer <= 0;
								junctionState <= J_COMPLETE;
								driveState <= DRIVE;
							end
						end
						else if(junctionManeuver == TD_REVERSE)begin
							junctionTimer <= junctionTimer +1;
							if(junctionTimer < 50_000_000)begin
								hbEnA <= fullSpeedPwm;
								hbEnB <= fullSpeedPwm;
								regHbDrive <= regHbStraight;
								if(leadSense)begin
									driveState <= DRIVE;
									junctionState <= J_COMPLETE;
									junctionTimer <= 0;
									straightTimer <= 0;
								end
							end
							else begin
								junctionTimer <= 0;
								junctionState <= J_COMPLETE;
								driveState <= DRIVE;
							end
						end
						else if(junctionManeuver == TD_STOP)begin
							junctionTimer <= junctionTimer +1;
							if(junctionTimer < 25_000_000)begin
								hbEnA <= fullSpeedPwm;
								hbEnB <= fullSpeedPwm;
								regHbDrive <= HB_STOP;
							end
							else begin
								junctionTimer <= 0;
								junctionState <= J_COMPLETE;
								driveState <= DRIVE;
							end			
						end
						else begin
							junctionTimer <= 0;
							junctionState <= J_COMPLETE;
							junctionManeuver <= 5;
						end
					end
					J_COMPLETE: begin
						//This should be the first state of a new junction phase
						junctionState <= J_DETECT;
					end
				endcase
			end
		endcase
	end
endmodule

