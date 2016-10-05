`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Direction Control
//////////////////////////////////////////////////////////////////////////////////
module DirectionControl(
		input clk,
		input RFS, 
		//input RRS, 
		input RMS, 
		input LMS,
		input LFS, 
		//input LRS,
		//input Forward,
		//input Backward,
		output led0,
		output led1,
		output led2,
		output led3,
		output reg [3:0]DIR
   );
	
	reg [24:0] CountOne = 0;
	reg [24:0] CountTwo = 0;
	reg [27:0] Count90 = 0;
	reg [3:0] StableOut; //Stable output
	reg [3:0] StableOut2; //Stable output
	reg [3:0] Signal; //Used to store realtime signal
	reg [1:0] Test = 0;

	parameter MAX_COUNT = 12_500_000; // 500 ms time delay
	parameter CORNER_TIMER = 50_000_000;
	
	assign led0 = DIR[3];
	assign led1 = DIR[2];
	assign led2 = DIR[1];
	assign led3 = DIR[0];
	

	always@(posedge clk)begin
		Signal[0] <= LMS;	//[2]
		Signal[1] <= RMS;	//[3]
		Signal[2] <= LFS; //[4]
		Signal[3] <= RFS;	//[5]
		//Signal[0] <= LMS;
		//Signal[1] <= RMS;
		StableOut2 <= ~Signal;	

		if (StableOut != Signal)begin //test for change in signal
			if(CountOne < MAX_COUNT) begin //Delay count 1
				CountOne <= CountOne + 1;
				Test <= 1;
			end
			else if(StableOut != Signal && Test >= 1)begin		//Signal still there?
				if(CountTwo < MAX_COUNT) begin //Delay count 2
					CountTwo <= CountTwo + 1;
					Test <= 2;
				end
				else if (StableOut != Signal && Test >= 1)begin //Signal Still there?
					StableOut <= ~Signal; //Place signal input to LED output
					CountOne <= 0;	//Reset count values
					CountTwo <= 0;
				end
			end
		end
		else if (Signal == 4'b11_11) begin //No signal
			StableOut <= 4'b00_00;			//Turn LEDS off
		end		
		
		//00 Proceed 00 Full
		//01 Turn Left 01 Veer
		//10 Turn Right 01 Hard
		//11 Stop 11 90 degree
		
		casex (StableOut)
			
			//Proceed
			4'b11_??: DIR = 4'b00_00;
		
			//Veer Left
			4'b10_??: DIR = 4'b01_01;
			
			//Veer Right
			4'b01_??: DIR = 4'b10_01;
			
			//90 degree or intersect		
			4'b00_??: begin
							DIR = 4'b00_00;
								if (Count90 <= CORNER_TIMER) begin
									if (StableOut == 4'b00_01) begin
										DIR = 4'b01_11;
									end
									else if (StableOut == 4'b00_10) begin
										DIR = 4'b10_11;
									end
									Count90 <= Count90 + 1;
								end
								else if (StableOut == 4'b00_00) begin
									  DIR = 4'b11_11;
								end
								else if (StableOut == 4'b00_01) begin
										DIR = 4'b01_11;
								end
								else if (StableOut == 4'b00_10) begin
										DIR = 4'b10_11;
								end
									if(StableOut != StableOut2) begin
									   Count90 <= 0;
								   end
						 end
			
			default: DIR = 4'b11_11;
		endcase
	end
	
endmodule