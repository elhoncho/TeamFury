`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Direction Control
//////////////////////////////////////////////////////////////////////////////////
module DirectionControl(
		input clk,
		input RFS, 
		input RRS, 
		input RMS, 
		input LFS, 
		input LRS,
		input LMS,
		//input Forward,
		//input Backward,
		output reg [3:0]DIR
   );
	
	reg [23:0] CountOne = 0; //Time Delay for input signal
	reg [23:0] CountTwo = 0;
   reg [23:0] CountFinal = 0;
	reg [27:0] Count90 = 0;
   reg [5:0] UnstableIn; //Unstable input
	reg [5:0] StableOut; //Stable output
	reg [5:0] Signal; //Used to store stable input signal
	reg [1:0] Test;

	parameter MAX_COUNT = 8_388_608; // 500 ms time delay
	parameter CORNER_TIMER = 50_000_000; //Detect 90 or intersect
	
	always@(posedge clk)begin
	   //Signal inputs
		UnstableIn[0] <= LRS;
		UnstableIn[1] <= RRS;
		UnstableIn[2] <= LMS; 
		UnstableIn[3] <= RMS;
		UnstableIn[4] <= LFS;
		UnstableIn[5] <= RFS;
		//Stabilized input
		Signal <= UnstableIn;
		
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
					 if (CountFinal < MAX_COUNT) begin
						CountFinal <= CountFinal + 1;
						Test <= 3;
					  end
				          else if (StableOut != Signal && Test >= 2) begin //Signal Still there?
						StableOut <= ~Signal; //Place signal input to LED output
						CountOne <= 0;	//Reset count values
						CountTwo <= 0;
						CountFinal <= 0;
						Test <= Test + 1; //Keeps compiler happy
					end
				end
			end
		end
		else if (Signal == 6'b11_11_11) begin //No signal
			StableOut <= 6'b00_00_00;			//Turn LEDS off
		end		
		
		//00 Proceed 00 Full
		//01 Turn Left 01 Veer
		//10 Turn Right 01 Hard
		//11 Stop 11 90 degree
		
		casex (StableOut)
			//Proceed
			6'b11_??_??: DIR = 4'b00_00;
			//Veer Left
			6'b10_??_??: DIR = 4'b01_01;
			//Veer Right
			6'b01_??_??: DIR = 4'b10_01;
			//90 degree or intersect		
			6'b00_??_??: begin
					if (Count90 <= CORNER_TIMER) begin
					    casex (StableOut)
						//90 degree left
						 6'b00_01_??: DIR = 4'b01_11;
						 //90 degree right
					         6'b00_10_??: DIR = 4'b10_11;
						//Hold time
						default: begin
							DIR = 4'b00_00;
							Count90 <= Count90 + 1;
							end
					      endcase
					 end
					 else 
					     casex (StableOut)
					            //90 degree left
						    6'b00_01_??: DIR = 4'b01_11;
						    //90 degree right
						    6'b00_10_??: DIR = 4'b10_11;
						    //Stop
						    default: DIR = 4'b11_11;
						endcase
												
						  if(StableOut != ~Signal) begin //Reset count for next signal
						     Count90 <= 0;
						  end	
					end
			
			default: DIR = 4'b11_11;
		endcase
	end
	
endmodule
