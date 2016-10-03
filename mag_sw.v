`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:51:07 09/02/2016 
// Design Name: 
// Module Name:    Test1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module mag_sw(
		output led0, led1, led2, led3, led4, led5, led6, led7, //Led output for testing
		output reg [3:0]LEDS,
		output reg [3:0]DIR, //Actual output
		input clk,
		input RFS, RRS, LFS, LRS //Sensor input
);

reg [24:0] COUNT_ONE = 0;
reg [24:0] COUNT_TWO = 0;
reg [3:0] SIGNAL; //Used to store realtime signal
reg [1:0] TEST = 0;
parameter MAX_COUNT = 12_500_000; // 500 ms time delay

assign led0 = LEDS[0];	//Led outputs for testing purposes
assign led1 = LEDS[1];
assign led2 = LEDS[2];
assign led3 = LEDS[3];
assign led4 = DIR[0];
assign led5 = DIR[1];
assign led6 = DIR[2];
assign led7 = DIR[3];

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
	
	
always@(LEDS)begin

case (LEDS)			//Case Statement for output to main module
						//Still in progress
	4'b00_11: DIR <= 4'b00_11;
	4'b11_00: DIR <= 4'b11_00;
	default: DIR <= 4'b00_00;
endcase

end	
	
	
endmodule


