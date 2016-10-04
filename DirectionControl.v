`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Direction Control
//////////////////////////////////////////////////////////////////////////////////
module DirectionControl(
		input clk,
		input RFS, 
		input RRS, 
		input LFS, 
		input LRS,
		output reg [3:0]DIR
   );
	
	reg [24:0] COUNT_ONE = 0;
	reg [24:0] COUNT_TWO = 0;
	reg [3:0] LEDS; //Stable output
	reg [3:0] SIGNAL; //Used to store realtime signal
	reg [1:0] TEST = 0;

	parameter MAX_COUNT = 12_500_000; // 500 ms time delay

	always@(posedge clk)begin
		SIGNAL[0] <= RFS;
		SIGNAL[1] <= LFS;
		SIGNAL[2] <= RRS;
		SIGNAL[3] <= LRS;

		if (LEDS != SIGNAL)begin //test for change in signal
			if(COUNT_ONE < MAX_COUNT) begin //Delay count 1
				COUNT_ONE <= COUNT_ONE + 1;
				TEST <= 1;
			end
			else if(LEDS != SIGNAL && TEST >= 1)begin		//Signal still there?
				if(COUNT_TWO < MAX_COUNT) begin //Delay count 2
					COUNT_TWO <= COUNT_TWO + 1;
					TEST <= 2;
				end
				else if (LEDS != SIGNAL && TEST >= 1)begin //Signal Still there?
					LEDS <= ~SIGNAL; //Place signal input to LED output
					COUNT_ONE <= 0;	//Reset count values
					COUNT_TWO <= 0;
				end
			end
		end
		else if (SIGNAL == 4'b11_11) begin //No signal
			LEDS <= 4'b00_00;			//Turn LEDS off
		end	
	end	
	
	always@(LEDS)begin ////////////WRONG//////////
		//Case Statement for output to main module
		//Still in progress
		//Basic Forward Only tracking outside of tape
		//Proceed at Full Speed
							
		case (LEDS)
			4'b00_00: DIR = 4'b00_00;
			4'b00_01: DIR = 4'b00_00;
			4'b00_10: DIR = 4'b00_00;
			4'b00_11: DIR = 4'b00_00;
		
			//Veer Left
			4'b10_00: DIR = 4'b01_01;
			4'b10_01: DIR = 4'b01_01;
			4'b10_10: DIR = 4'b01_01;
			4'b10_11: DIR = 4'b01_01;
			
			//Veer Right
			4'b01_00: DIR = 4'b10_01;
			4'b01_01: DIR = 4'b10_01;
			4'b01_10: DIR = 4'b10_01;
			4'b01_11: DIR = 4'b10_01;
			
			//Stop
			4'b11_00: DIR = 4'b11_11;
			4'b11_01: DIR = 4'b11_11;
			4'b11_10: DIR = 4'b11_11;
			4'b11_11: DIR = 4'b11_11;
			
			default: DIR = 4'b11_11;
		endcase
	end
endmodule
