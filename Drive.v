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
	input [2:0] tdDir,
	output hbIn1,
	output hbIn2,
	output hbIn3,
	output hbIn4,
	output reg hbEnA = 0,
	output reg hbEnB = 0,
	output reg led4 = 0,
	output reg led5 = 0,
	output reg led6 = 0,
	output reg led7 = 0,
	output reg led8 = 0,
	output reg [1:0] driveState = 0,
	output reg direction = 0
	);
	 
	`include "parameters.vh"
	
	//H-Bridge Registers
	reg [3:0] regHbRight = 0;
	reg [3:0] regHbLeft = 0;
	reg [3:0] regHbStraight = 0;
	reg [3:0] regHbDrive = 0;
	
	//Junction Registers
	reg [26:0] jncCounter = 0;
	reg [26:0] jncTurnCounter = 0;
	
	assign hbIn1 = regHbDrive[0];
	assign hbIn2 = regHbDrive[1];
	assign hbIn3 = regHbDrive[2];
	assign hbIn4 = regHbDrive[3];
	
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
				if(dirControl[3:2] == DC_TURN_LEFT)begin
				
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
						hbEnA <= ninetySpeedPwm;
						hbEnB <= ninetyFastSpeedPwm;
						regHbDrive <= regHbLeft;
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
						hbEnA <= ninetyFastSpeedPwm;
						hbEnB <= ninetySpeedPwm;
						regHbDrive <= regHbRight;
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
				
				//Default Stop
				else begin
					hbEnA <= fullSpeedPwm;
					hbEnB <= fullSpeedPwm;
					regHbDrive <= HB_STOP;
					driveState <= JUNCTION;
				end
			end

			//Collision State
			COLLISION: begin
				if (colDetect) begin
					driveState <= DRIVE;
				end
				hbEnA <= 0;
				hbEnB <= 0;
				
			end

			//Junction State
			JUNCTION: begin
				if(tdDir == STOP)begin
					led4 <= 1;
					led5 <= 0;
					led6 <= 0;
					led7 <= 0;
					led8 <= 0;
					
					hbEnA <= 0;
					hbEnB <= 0;
					regHbDrive <= HB_STOP;
				end
				//Straight
				else if (tdDir == STRAIGHT)begin
					jncCounter <= jncCounter + 1;
					if (jncCounter <= 50_00_000)begin	
						hbEnA <= fullSpeedPwm;
						hbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					else begin
						led4 <= 0;
						led5 <= 0;
						led6 <= 1;
						led7 <= 0;
						led8 <= 0;
						driveState <= DRIVE;
						direction <= FORWARDS;
						jncCounter <= 0;
					end			
				end
				//Left
				else if (tdDir == LEFT)begin
					jncCounter <= jncCounter + 1;
					if (jncCounter <= 75_000_000)begin
						hbEnA <= ninetySpeedPwm;
						hbEnB <= ninetyFastSpeedPwm;
						regHbDrive <= regHbLeft;
					end
					else if (jncCounter > 75_000_000 && dirControl[3:2] == DC_STOP)begin
						hbEnA <= fullSpeedPwm;
						hbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					else begin
						led4 <= 0;
						led5 <= 0;
						led6 <= 1;
						led7 <= 0;
						led8 <= 0;
						driveState <= DRIVE;
						jncCounter <= 0;
					end
				end
				//Right
				else if (tdDir == RIGHT)begin
					jncCounter <= jncCounter + 1;
					if (jncCounter <= 75_000_000)begin
						hbEnA <= ninetyFastSpeedPwm;
						hbEnB <= ninetySpeedPwm;
						regHbDrive <= regHbRight;
					end
					else if (jncCounter > 75_000_000 && dirControl[3:2] == DC_STOP)begin
						hbEnA <= fullSpeedPwm;
						hbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end	
					else begin
						led4 <= 0;
						led5 <= 0;
						led6 <= 1;
						led7 <= 0;
						led8 <= 0;
						driveState <= DRIVE;
						jncCounter <= 0;
					end	
				end
				//Back
				else if (tdDir == BACK)begin
					jncCounter <= jncCounter + 1;
					led4 <= 0;
					led5 <= 0;
					led6 <= 1;
					led7 <= 0;
					led8 <= 0;
					
					if (jncCounter <= 50_000_000)begin
						hbEnA <= fullSpeedPwm;
						hbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					else begin
						led4 <= 0;
						led5 <= 0;
						led6 <= 1;
						led7 <= 0;
						led8 <= 0;
						driveState <= DRIVE;
						direction <= REVERSE;
						jncCounter <= 0;
					end	
				end
				else begin
					driveState <= DRIVE;
					direction <= FORWARDS;
					jncCounter <= 0;
				end	
			end		
		endcase
	end
endmodule
