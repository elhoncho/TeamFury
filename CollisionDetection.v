`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Collision Detection
//////////////////////////////////////////////////////////////////////////////////
module CollisionDetection(
	input clk, sensf1, sensf2,
	output led1, led2, led3,
	output reg colDetect = 0
    );
	 
	parameter NO_COL_DETECT = 0;
	parameter VALIDATE_SIGNAL = 1;
	parameter COLLISION_STATE = 2;
	parameter DRIVE = 1;
	parameter STOP = 0; 

	reg regLed1 = 0;
	reg regLed2 = 0;
	reg regLed3 = 0;
	reg [1:0] state = 2'b00; 
	reg [25:0] count = 0;
	
	assign led1 = regLed1; 
	assign led2 = regLed2; 
	assign led3 = regLed3; 
	
	always @(posedge clk) begin
	
		case (state) 			
			NO_COL_DETECT: begin
				colDetect <= DRIVE;
				regLed1 <= 1;
				regLed2 <= 0;
				regLed3 <= 0;
				if(!(sensf1 && sensf2)) begin
					state <= VALIDATE_SIGNAL;
				end	
			end 
			
			VALIDATE_SIGNAL: begin
				regLed1 <= 0;
				regLed2 <= 1;
				regLed3 <= 0;
				if (!(sensf1 && sensf2)) begin
					count <= count + 1; 
					if (count == 50_000) begin 
						state <= COLLISION_STATE; 
						count <= 0;
					end
				end
				else begin
					state <= NO_COL_DETECT;
					count <= 0; 
				end
			end

			COLLISION_STATE: begin
				colDetect <= STOP;
				regLed1 <= 0;
				regLed2 <= 0;
				regLed3 <= 1;
				if (sensf1 && sensf2) begin
					count <= count +1;
					if (count == 50_000)begin
						state <= NO_COL_DETECT; 
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
