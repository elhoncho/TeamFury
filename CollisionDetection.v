`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Collision Detection
//////////////////////////////////////////////////////////////////////////////////
module colDetect(
	input clk, sens1,
	output led1, led2, led3
    );
	 
	parameter NO_COL_DETECT = 0;
	parameter VALIDATE_SIGNAL = 1;
	parameter COLLISION_STATE = 2;
	parameter DRIVE = 0;
	parameter STOP = 1; 

	reg regLed1 = 0;
	reg regLed2 = 0;
	reg regLed3 = 0;
	reg [1:0] state = 2'b00; 
	reg [25:0] count = 0;
	reg colDetect = DRIVE; 	
	
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
				if(sens1) begin
					state <= VALIDATE_SIGNAL;
				end	
			end 
			
			VALIDATE_SIGNAL: begin
				regLed1 <= 0;
				regLed2 <= 1;
				regLed3 <= 0;
				if (sens1) begin
					count = count + 1; 
					if (count == 50_000) begin 
						state <= COLLISION_STATE; 
						count = 0;
					end
				end
				else begin
					state <= NO_COL_DETECT;
					count = 0; 
				end
			end

			COLLISION_STATE: begin
				colDetect <= STOP;
				regLed1 <= 0;
				regLed2 <= 0;
				regLed3 <= 1;
				if (sens1 == 0) begin 
					state <= NO_COL_DETECT; 
				end
			end
		endcase
	end
endmodule
