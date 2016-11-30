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
	input tdDir,
	output hbIn1,
	output hbIn2,
	output hbIn3,
	output hbIn4,
	output hbEnA,
	output hbEnB,
	output led4,
	output led5,
	output led6,
	output led7,
	output led8
	);
	 
	`include "parameters.vh"
	
	//H-Bridge Registers
	reg regHbEnA = 0;
	reg regHbEnB = 0;
	reg [3:0] regHbRight = 0;
	reg [3:0] regHbLeft = 0;
	reg [3:0] regHbStraight = 0;
	reg [3:0] regHbDrive = 0;

	//Drive State Machine Registers
	reg [1:0] driveState = DRIVE;
	reg drive = FORWARDS;
	
	//Junction Registers
	reg [26:0] jncCounter = 0;
	reg [26:0] jncTurnCounter = 0;
	reg regLed4 = 0;
	reg regLed5 = 0;
	reg regLed6 = 0;
	reg regLed7 = 0;
	reg regLed8 = 0;
	
	//Junction
	assign led4 = regLed4;
	assign led5 = regLed5;
	assign led6 = regLed6;
	assign led7 = regLed7;
	assign led8 = regLed8;
	
		//Pin Assignments
	assign hbEnA = regHbEnA;
	assign hbEnB = regHbEnB;
	assign hbIn1 = regHbDrive[0];
	assign hbIn2 = regHbDrive[1];
	assign hbIn3 = regHbDrive[2];
	assign hbIn4 = regHbDrive[3];
	assign dcDrive = drive;
	
	always @(posedge clk) begin
	
		//Diretion and bit assignments for H-Bridge
		if (drive == FORWARDS) begin
			regHbRight <= HB_RIGHT;
			regHbLeft <= HB_LEFT;
			regHbStraight <= HB_STRAIGHT;
		end
		else if (drive == REVERSE) begin
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
						regHbEnA <= veerSpeedPwm;
						regHbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					
					//Hard Left
					else if(dirControl[1:0] == DC_HARD) begin
						regHbEnA <= veerSpeedPwm;
						regHbEnB <= hardSpeedPwm;
						regHbDrive <= regHbLeft;
					end
					
					//Stop Left
					else if(dirControl[1:0] == DC_STOP) begin
						regHbEnA <= ninetySpeedPwm;
						regHbEnB <= ninetyFastSpeedPwm;
						regHbDrive <= regHbLeft;
					end
				end
				
				//Turn Right
				else if(dirControl[3:2] == DC_TURN_RIGHT) begin
				
					//Veer Right
					if(dirControl[1:0] == DC_VEER) begin
						regHbEnA <= fullSpeedPwm;
						regHbEnB <= veerSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					
					//Hard Right
				   else if(dirControl[1:0] == DC_HARD) begin
						regHbEnA <= hardSpeedPwm;
						regHbEnB <= veerSpeedPwm;
						regHbDrive <= regHbRight;
					end 
					
					//Stop Right
					else if(dirControl[1:0] == DC_STOP) begin
						regHbEnA <= ninetyFastSpeedPwm;
						regHbEnB <= ninetySpeedPwm;
						regHbDrive <= regHbRight;
					end 
				end
				
				//Straight
				else if(dirControl[3:2] == DC_PROCEED) begin
					if(dirControl[1:0] == 2'b00) begin
						regHbEnA <= fullSpeedPwm;
						regHbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
				end	
				
				//Stop
				else if(dirControl[3:2] == DC_STOP) begin
					regHbEnA <= 0;
					regHbEnB <= 0;
					regHbDrive <= HB_STOP;
					driveState <= JUNCTION;
				end
				
				//Default Stop
				else begin
					regHbEnA <= fullSpeedPwm;
					regHbEnB <= fullSpeedPwm;
					regHbDrive <= HB_STOP;
					driveState <= JUNCTION;
				end
			end

			//Collision State
			COLLISION: begin
				if (colDetect) begin
					driveState <= DRIVE;
				end
				regHbEnA <= 0;
				regHbEnB <= 0;
				
			end

			//Junction State
			JUNCTION: begin
				if(tdDir == STOP)begin
					regLed4 <= 1;
					regLed5 <= 0;
					regLed6 <= 0;
					regLed7 <= 0;
					regLed8 <= 0;
					
					regHbEnA <= 0;
					regHbEnB <= 0;
					regHbDrive <= HB_STOP;
				end
				//Straight
				else if (tdDir == STRAIGHT)begin
					jncCounter <= jncCounter + 1;
					if (jncCounter <= 50_00_000)begin	
						regHbEnA <= fullSpeedPwm;
						regHbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					else begin
						regLed4 <= 0;
						regLed5 <= 0;
						regLed6 <= 1;
						regLed7 <= 0;
						regLed8 <= 0;
						driveState <= DRIVE;
						drive <= FORWARDS;
						jncCounter <= 0;
					end			
				end
				//Left
				else if (tdDir == LEFT)begin
					jncCounter <= jncCounter + 1;
					if (jncCounter <= 75_000_000)begin
						regHbEnA <= ninetySpeedPwm;
						regHbEnB <= ninetyFastSpeedPwm;
						regHbDrive <= regHbLeft;
					end
					else if (jncCounter > 75_000_000 && dirControl[3:2] == DC_STOP)begin
						regHbEnA <= fullSpeedPwm;
						regHbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					else begin
						regLed4 <= 0;
						regLed5 <= 0;
						regLed6 <= 1;
						regLed7 <= 0;
						regLed8 <= 0;
						driveState <= DRIVE;
						//Drive <= FORWARDS;
						jncCounter <= 0;
					end
				end
				//Right
				else if (tdDir == RIGHT)begin
					jncCounter <= jncCounter + 1;
					if (jncCounter <= 75_000_000)begin
						regHbEnA <= ninetyFastSpeedPwm;
						regHbEnB <= ninetySpeedPwm;
						regHbDrive <= regHbRight;
					end
					else if (jncCounter > 75_000_000 && dirControl[3:2] == DC_STOP)begin
						regHbEnA <= fullSpeedPwm;
						regHbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end	
					else begin
						regLed4 <= 0;
						regLed5 <= 0;
						regLed6 <= 1;
						regLed7 <= 0;
						regLed8 <= 0;
						driveState <= DRIVE;
						//Drive <= FORWARDS;
						jncCounter <= 0;
					end	
				end
				//Back
				else if (tdDir == BACK)begin
					jncCounter <= jncCounter + 1;
					regLed4 <= 0;
					regLed5 <= 0;
					regLed6 <= 1;
					regLed7 <= 0;
					regLed8 <= 0;
					
					if (jncCounter <= 50_000_000)begin
						regHbEnA <= fullSpeedPwm;
						regHbEnB <= fullSpeedPwm;
						regHbDrive <= regHbStraight;
					end
					else begin
						regLed4 <= 0;
						regLed5 <= 0;
						regLed6 <= 1;
						regLed7 <= 0;
						regLed8 <= 0;
						driveState <= DRIVE;
						drive <= REVERSE;
						jncCounter <= 0;
					end	
				end
				else begin
					driveState <= DRIVE;
					drive <= FORWARDS;
					jncCounter <= 0;
				end	
			end		
		endcase
	end
endmodule
