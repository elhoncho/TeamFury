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
		input LMS,
		input LFS, 
		input LRS,
		input Direction,
		output reg [3:0]DIR
   );

	parameter MAX_COUNT = 12_500_000; // 500 ms time delay
	parameter CORNER_TIMER = 50_000_000; //Detect 90 or intersect
	parameter NORMAL = 2'b00;
	parameter DEBOUNCE = 2'b01;
	parameter CHANGE_DIR = 2'b10;
	parameter CHK_INTERSECT = 2'b11;
	parameter FORWARDS = 1'b1;
	parameter BACKWARDS = 1'b0;
	
	//Turning
	parameter VEER_RIGHT = 4'b10_01;
	parameter HARD_RIGHT = 4'b10_10;
	parameter NINETY_RIGHT = 4'b10_11;
	parameter VEER_LEFT = 4'b01_01;
	parameter HARD_LEFT = 4'b01_10;
	parameter NINETY_LEFT = 4'b01_11;
	parameter PROCEED = 4'b00_00;
	parameter STOP = 4'b11_11;
	
		
	reg [24:0] CountOne = 0; //Time Delay for input signal
	reg [27:0] Count90 = 0;
   reg [5:0] unstableIn = 0; //Unstable input
	reg [5:0] stableSignal = 0; //Stable output
	reg [5:0] bufferedSignal = 0;
	reg [5:0] prevSignal = 0; //Used to store stable input signal
	reg [5:0] tempSignal = 0;
	reg [2:0] state = 0;
	reg prevDirection = 0;
	
	
	always@(posedge clk)begin
	   //Signal inputs
		
		prevSignal <= stableSignal;
		stableSignal <= bufferedSignal;
		bufferedSignal <= unstableIn;
		unstableIn[0] <= ~LRS;
		unstableIn[1] <= ~RRS;
		unstableIn[2] <= ~LMS; 
		unstableIn[3] <= ~RMS;
		unstableIn[4] <= ~LFS;
		unstableIn[5] <= ~RFS;

		case(state)
			NORMAL: begin
				if (prevSignal != stableSignal || Direction != prevDirection) begin
					state = DEBOUNCE;
					tempSignal = prevSignal;
				end
			end
			
			DEBOUNCE: begin
				CountOne = CountOne + 1;
				if (stableSignal == tempSignal && Direction == prevDirection) begin
					state = NORMAL;
				end
				else if (CountOne == MAX_COUNT) begin
					state = CHANGE_DIR;
					CountOne = 0;
				end
			end
			
			CHANGE_DIR: begin
							if (Direction == FORWARDS) begin
								prevDirection = FORWARDS;
								casex (stableSignal)
									//Proceed
									6'b11_??_??: DIR = PROCEED;
									//Veer Left
									6'b10_??_??: DIR = VEER_LEFT;
									6'b01_??_??: DIR = VEER_RIGHT;
									//90 degree or intersect		
									6'b00_??_??: begin
														//state = CHK_INTERSECT;
														casex (stableSignal)
																//90 degree left
															6'b00_01_??: DIR = NINETY_LEFT;
															//90 degree right
															6'b00_10_??: DIR = NINETY_RIGHT;
															//Stop
															default: DIR = STOP;
														endcase
													end										
									default: DIR = STOP;
								endcase	
								state = PROCEED;
							end
							else if (Direction == BACKWARDS) begin //If Backwards
										prevDirection = BACKWARDS;
										casex (stableSignal)
											//Proceed
											6'b??_??_11: DIR = PROCEED;
											//Veer Left
											6'b??_??_01: DIR = VEER_LEFT;
											6'b??_??_10: DIR = VEER_RIGHT;
											//90 degree or intersect		
											6'b??_??_00: begin
																casex (stableSignal)
																	 //90 degree right
																	6'b??_01_00: DIR = NINETY_RIGHT;
																	//90 degree left
																	6'b??_10_00: DIR = NINETY_LEFT;
																	//Stop
																	6'b??_11_00: DIR = STOP;
																	6'b??_00_00: DIR = STOP;
																endcase
											end
										
											default: DIR = STOP;
										endcase
									end							
				end
			
			//CHK_INTERSECT: begin
				//				intersect_Count
					//			if()
			
		//	end
			endcase
	end
	
endmodule