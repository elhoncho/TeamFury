`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Tone Detection
//////////////////////////////////////////////////////////////////////////////////
module ToneDetection(
	 input clk,
	 input rst,
	 input enableToneDetection,
	 input pushBtn1,
	 input pushBtn2,
	 input pushBtn3,
	 input pushBtn4,
	 input rawBandPass1k,
	 input rawBandPass1_5k,
	 input rawBandPass2k,
	 input rawBandPass2_5k,
	 input rawBandPass3k,
	 output reg [2:0] toneDir,
	 output reg [25:0] rightCount = 0
    );
	
	`include "parameters.vh"
	
	reg [25:0] stopCount = 0;
	reg [25:0] forwardCount = 0;
	reg [25:0] leftCount = 0;
	//reg [25:0] rightCount = 0;
	reg [25:0] reverseCount = 0;
	reg [25:0] straightCount = 0;
	
	reg bandPass1k;
	reg bandPass1_5k;
	reg bandPass2k;
	reg bandPass2_5k;
	reg bandPass3k;
	
	reg bufferBandPass1k;
	reg bufferBandPass1_5k;
	reg bufferBandPass2k;
	reg bufferBandPass2_5k;
	reg bufferBandPass3k;
 
	always@(posedge clk)begin
		bufferBandPass1k <= rawBandPass1k;
		bufferBandPass1_5k <= rawBandPass1_5k;
		bufferBandPass2k <= rawBandPass2k;
		bufferBandPass2_5k <= rawBandPass2_5k;
		bufferBandPass3k <= rawBandPass3k;
	
		bandPass1k <= bufferBandPass1k;
		bandPass1_5k <= bufferBandPass1_5k;
		bandPass2k <= bufferBandPass2k;
		bandPass2_5k <= bufferBandPass2_5k;
		bandPass3k <= bufferBandPass3k;
	 
		if(enableToneDetection)begin
			if(pushBtn1 || bandPass1_5k)begin
				straightCount <= straightCount + 1;
				if(straightCount == 25_000_000)begin
					toneDir <= TD_FORWARD;
					stopCount <= 0;
					forwardCount <= 0;
					leftCount <= 0;
					rightCount <= 0;
					reverseCount <= 0;
					straightCount <= 0;
				end
			end
			else if(pushBtn2 || bandPass2k)begin
				leftCount <= leftCount + 1;
				if(leftCount == 25_000_000)begin
					toneDir <= TD_LEFT;
					stopCount <= 0;
					forwardCount <= 0;
					leftCount <= 0;
					rightCount <= 0;
					reverseCount <= 0;
					straightCount <= 0;
				end
			end
			else if(pushBtn3 || bandPass2_5k)begin
				rightCount <= rightCount + 1;
				if(rightCount == 25_000_000)begin
					toneDir <= TD_RIGHT;
					stopCount <= 0;
					forwardCount <= 0;
					leftCount <= 0;
					rightCount <= 0;
					reverseCount <= 0;
					straightCount <= 0;
				end
			end
			else if(pushBtn4 || bandPass3k)begin
				reverseCount <= reverseCount + 1;
				if(reverseCount == 25_000_000)begin
					toneDir <= TD_REVERSE;
					stopCount <= 0;
					forwardCount <= 0;
					leftCount <= 0;
					rightCount <= 0;
					reverseCount <= 0;
					straightCount <= 0;
				end
			end
			else if(bandPass1k)begin
				stopCount <= stopCount + 1;
				if(stopCount == 25_000_000)begin
					toneDir <= TD_STOP;
					stopCount <= 0;
					forwardCount <= 0;
					leftCount <= 0;
					rightCount <= 0;
					reverseCount <= 0;
					straightCount <= 0;
				end
			end
		end
		else begin
			toneDir <= TD_HOLD;
			stopCount <= 0;
			forwardCount <= 0;
			leftCount <= 0;
			rightCount <= 0;
			reverseCount <= 0;
			straightCount <= 0;
		end
	end
endmodule
