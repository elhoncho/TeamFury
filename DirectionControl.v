`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Direction Control
//////////////////////////////////////////////////////////////////////////////////
module DirectionControl(
		input clk,
		input rst,
		input RFS, 
		input RRS, 
		input RMS, 
		input LMS,
		input LFS, 
		input LRS,
		input direction,
		output reg [3:0]DIR,
		output reg [2:0] state = 0,
		output reg [1:0] leadSens
   );

	parameter MAX_COUNT = 5_000; //debounce time delay
	parameter INTERSECT_TIMER = 15_000_000; //Detect 90 or intersect
	parameter NORMAL = 3'b000;
	parameter DEBOUNCE = 3'b001;
	parameter CHANGE_DIR = 3'b010;
	parameter CHK_INTERSECT = 3'b011;
	parameter CHK_SKINNY = 3'b100;
	parameter FORWARDS = 1'b1;
	parameter BACKWARDS = 1'b0;
	
	parameter SKINNY_MAX = 12_500_000;
	parameter SKINNY_LEFT = SKINNY_MAX/4;
	parameter SKINNY_RIGHT = SKINNY_MAX/2+SKINNY_LEFT;
	parameter SKINNY_ORIGIN = SKINNY_MAX;
	
	//Turning
	parameter VEER_RIGHT = 4'b10_01;
	parameter HARD_RIGHT = 4'b10_10;
	parameter NINETY_RIGHT = 4'b10_11;
	parameter VEER_LEFT = 4'b01_01;
	parameter HARD_LEFT = 4'b01_10;
	parameter NINETY_LEFT = 4'b01_11;
	parameter PROCEED = 4'b00_00;
	parameter STOP = 4'b11_11;
	
	//Counting registers	
	reg [24:0] CountOne = 0; //Time Delay for input signal
	reg [27:0] intersectCount = 0;
	reg [25:0] skinnyCounter = 0;
	
	//Signal registers
   reg [5:0] unstableIn = 0; //Unstable input
	reg [5:0] stableSignal = 0; //Stable signal
	reg [5:0] bufferedSignal = 0; //Buffered Signal
	reg [5:0] prevSignal = 0; //Used to store stable input signal
	reg [3:0] tempSignal = 0;
	
	//State machine registers
	//reg [1:0] state = 0;
	//reg [1:0] leadSens = 0; //Picks out leading sensors
	//reg prevDirection = 0;
	
	initial begin
		DIR = STOP;
	end
	
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
		
		//Pulls out leading sensors
		if (direction == FORWARDS) begin //If forwards
			//prevDirection <= FORWARDS;		//Resets debouonce check for change in direction
			leadSens <= stableSignal[5:4]; //Front two sensors
		end
		else if (direction == BACKWARDS) begin // If backwards
			//prevDirection <= BACKWARDS;	//Resets debouonce check for change in direction
			leadSens <= stableSignal[1:0]; //Rear two sensors
		end
		
		//State machine for direction control
		case(state)
			
			//Normal state: looks for change in signal based on direction
			NORMAL: begin
				if (direction == FORWARDS) begin //If Forwards
					//Change in leading sensors?
					//if (prevSignal[5:2] != stableSignal[5:2] || direction != prevDirection) begin
					if (prevSignal[5:2] != stableSignal[5:2]) begin
						state <= DEBOUNCE;
						tempSignal <= prevSignal[5:2];
					end
				end
				else if (direction == BACKWARDS) begin //If Backwards
					//Change in leading sensors?
					//if (prevSignal[3:0] != stableSignal[3:0] || direction != prevDirection) begin
					if (prevSignal[3:0] != stableSignal[3:0]) begin
						state <= DEBOUNCE;
						tempSignal <= prevSignal[3:0];
					end
				end
			end
			
			//Debounce state: checks for consistent signal
			DEBOUNCE: begin
				//Begin count
				CountOne <= CountOne + 1;
				//Signal still there?
				//No, return to NORMAL
				//if (stableSignal[5:2] == tempSignal && direction == prevDirection && direction == FORWARDS) begin //If Forwards
				if (stableSignal[5:2] == tempSignal && direction == FORWARDS) begin 
					state <= NORMAL;
					CountOne <= 0;
				end
				//else if (stableSignal[3:0] == tempSignal && direction == prevDirection && direction == BACKWARDS) begin //If Backwards
				else if (stableSignal[3:0] == tempSignal && direction == BACKWARDS) begin
					state <= NORMAL;
					CountOne <= 0;
				end
				//Yes, reset count and move to Change Direction state
				else if (CountOne == MAX_COUNT) begin
					state <= CHANGE_DIR;
					CountOne <= 0;
				end
			end
			
			//Change direction state: intreprets signal and outputs to main module
			CHANGE_DIR: begin
				case (leadSens)
					//Proceed
					2'b11: begin
							DIR <= PROCEED;
							state <= NORMAL;
					end
					//Hard Right
					2'b10: begin
							DIR <= HARD_RIGHT;
							state <= NORMAL;
					end
					//Hard Left
					2'b01: begin
							DIR <= HARD_LEFT;
							state <= NORMAL;
					end
					//90 degree or intersect		
					2'b00: begin
								intersectCount <= 0; //Set intersect timer
								state <= CHK_SKINNY;
					end										
					//default: DIR <= STOP;
				endcase	
			end
			CHK_SKINNY: begin
				skinnyCounter <= skinnyCounter + 1;
				if(skinnyCounter < SKINNY_LEFT)begin
					DIR <= HARD_LEFT;
					if(leadSens)begin
						state <= CHANGE_DIR;
						skinnyCounter <= 0;
					end
				end
				else if(skinnyCounter < SKINNY_RIGHT)begin
					DIR <= HARD_RIGHT;
					if(leadSens)begin
						state <= CHANGE_DIR;
						skinnyCounter <= 0;
					end
				end
				else if(skinnyCounter < SKINNY_ORIGIN)begin
					DIR <= HARD_LEFT;
					if(leadSens)begin
						state <= CHANGE_DIR;
						skinnyCounter <= 0;
					end
				end
				else begin
					state <= CHK_INTERSECT;
					skinnyCounter <= 0;
				end
			end	
			//Ceck intersect state: determines 90 degree or intersect
			CHK_INTERSECT: begin
				//Leading sensors on tape, change states
				if (leadSens != 2'b00) begin
					state <= CHANGE_DIR;
					intersectCount <= 0;
				end
				//Intersect timer reached or both side sensors on tape
				else if (intersectCount == INTERSECT_TIMER) begin
					DIR <= STOP;
					state <= NORMAL;
					intersectCount <= 0;
				end
				//Check for 90-degree turn
				//Ninety Left state until leading sensors on tape
				else if (stableSignal[3:2] == 2'b01) begin
					DIR <= NINETY_LEFT;
				end
				//Ninety Right state until leading sensors on tape
				else if (stableSignal[3:2] == 2'b10) begin
					DIR <= NINETY_RIGHT;
				end

				//No signal detected, proceed and keep counting
				else if (DIR != NINETY_RIGHT && DIR != NINETY_LEFT)begin
						intersectCount <= intersectCount + 1;
						DIR <= PROCEED;
				end
			end
		endcase
	end
endmodule
