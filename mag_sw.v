`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: 	Team Fury
// Module Name:	        mag_sw
// Description: 	Line Following
//////////////////////////////////////////////////////////////////////////////////

module mag_sw(
		input clock,
		input RFS,
		input LFS,
		input RRS,
		input LRS,
		output reg [3:0]DIR,
		//Testing
		/*
		output led4,
		output led5,
		output led6,
		output led7
		*/
);

// 500 ms time delay
parameter MAX_COUNT = 12_500_000; 

//Time Delay
reg [24:0] COUNT_ONE = 0;
reg [24:0] COUNT_TWO = 0;
reg [1:0] TEST = 0;

//Stable and Unstable signal
reg [3:0] LEDS;
reg [3:0] SIGNAL;


//Led outputs for testing purposes
/*
assign led4 = DIR[0];
assign led5 = DIR[1];
assign led6 = DIR[2];
assign led7 = DIR[3];
*/

//Proximity detection
always@(posedge clock)begin

	//Stores current signals
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
		LEDS <= 4'b00_00;	//Turn LEDS off
	end	
end	
	
//Takes stable readings and converts to useful 4-bit output	
always@(LEDS)begin

	case (LEDS)			//Case Statement for output to main module
						//Still in progress
						//Basic Forward Only tracking outside of tape
		//Proceed at Full Speed
		4'b00_00: DIR <= 4'b00_00;
		4'b00_01: DIR <= 4'b00_00;
		4'b00_10: DIR <= 4'b00_00;
		4'b00_11: DIR <= 4'b00_00;
	
		//Veer Left
		4'b10_00: DIR <= 4'b01_01;
		4'b10_01: DIR <= 4'b01_01;
		4'b10_10: DIR <= 4'b01_01;
		4'b10_11: DIR <= 4'b01_01;
	
       		 //Veer Right
		4'b01_00: DIR <= 4'b10_01;
		4'b01_01: DIR <= 4'b10_01;
		4'b01_10: DIR <= 4'b10_01;
		4'b01_11: DIR <= 4'b10_01;
	
	
		//Stop
		4'b11_00: DIR <= 4'b11_11;
		4'b11_01: DIR <= 4'b11_11;
		4'b11_10: DIR <= 4'b11_11;
		4'b11_11: DIR <= 4'b11_11;
	
		default: DIR <= 4'b11_11;
	endcase

end	
	
endmodule
