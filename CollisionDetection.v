`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Collision Detection
//////////////////////////////////////////////////////////////////////////////////
module CollisionDetection(
	input clk,
	input rst,
	input direction, 
	input colDetFrontRaw, 
	input colDetRearRaw,
	output led1, led2, led3,
	output reg colDetect = 0
    );
	 
	`include "parameters.vh"
	
	reg regLed1 = 0;
	reg regLed2 = 0;
	reg regLed3 = 0;
	reg [1:0] state = 2'b00; 
	reg [25:0] count = 0;
	reg sens = 0; 
	
	reg colDetFrontBuffer;
	reg colDetRearBuffer;
	reg colDetFront;
	reg colDetRear;
	
	assign led1 = regLed1; 
	assign led2 = regLed2; 
	assign led3 = regLed3; 
	
	always @(posedge clk) begin
		colDetFrontBuffer <= colDetFrontRaw;
		colDetRearBuffer <= colDetRearRaw;
		colDetFront <= colDetFrontBuffer;
		colDetRear <= colDetRearBuffer;
		
		if (direction == C_FORWARDS) begin 
			sens <= colDetFront;
		end
		else if (direction == C_BACKWARDS) begin
			sens <= colDetRear;
		end 
	
		case (state) 			
			C_NO_COL_DETECT: begin
				colDetect <= C_DRIVE;
				regLed1 <= 1;
				regLed2 <= 0;
				regLed3 <= 0;
				if(!sens) begin
					state <= C_VALIDATE_SIGNAL;
				end	
			end 
			
			C_VALIDATE_SIGNAL: begin
				regLed1 <= 0;
				regLed2 <= 1;
				regLed3 <= 0;
				if (!sens) begin
					count <= count + 1; 
					if (count == C_HOLD_DOWN) begin 
						state <= C_COLLISION_STATE; 
						count <= 0;
					end
				end
				else begin
					state <= C_NO_COL_DETECT;
					count <= 0; 
				end
			end

			C_COLLISION_STATE: begin
				colDetect <= C_STOP;
				
				regLed1 <= 0;
				regLed2 <= 0;
				regLed3 <= 1;
				if (sens) begin
					count <= count +1;
					if (count == 50_000)begin
						state <= C_NO_COL_DETECT; 
						count <= 0;
					end
				end
				else begin
					count <= 0;
				end
			end
		endcase
	end
endmodule
