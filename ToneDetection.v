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
	 output reg [2:0] toneDir
    );
	
	`include "parameters.vh"
	
	reg [25:0] pushBtnCount1 = 0;
	reg [25:0] pushBtnCount2 = 0;
	reg [25:0] pushBtnCount3 = 0;
	reg [25:0] pushBtnCount4 = 0;

	always@(posedge clk)begin
		if(enableToneDetection)begin
			if(pushBtn1)begin
				pushBtnCount1 <= pushBtnCount1 + 1;
				if(pushBtnCount1 == 50_000_000)begin
					toneDir <= TD_STRAIGHT;
					pushBtnCount1 <= 0;
					pushBtnCount2 <= 0;
					pushBtnCount3 <= 0;
					pushBtnCount4 <= 0;
				end
			end
			else if(pushBtn2)begin
				pushBtnCount2 <= pushBtnCount2 + 1;
				if(pushBtnCount2 == 50_000_000)begin
					toneDir <= TD_LEFT;
					pushBtnCount1 <= 0;
					pushBtnCount2 <= 0;
					pushBtnCount3 <= 0;
					pushBtnCount4 <= 0;
				end
			end
			else if(pushBtn3)begin
				pushBtnCount3 <= pushBtnCount3 + 1;
				if(pushBtnCount3 == 50_000_000)begin
					toneDir <= TD_RIGHT;
					pushBtnCount1 <= 0;
					pushBtnCount2 <= 0;
					pushBtnCount3 <= 0;
					pushBtnCount4 <= 0;
				end
			end
			else if(pushBtn4)begin
				pushBtnCount4 <= pushBtnCount4 + 1;
				if(pushBtnCount4 == 50_000_000)begin
					toneDir <= TD_BACK;
					pushBtnCount1 <= 0;
					pushBtnCount2 <= 0;
					pushBtnCount3 <= 0;
					pushBtnCount4 <= 0;
				end
			end
		end
		else begin
			toneDir <= TD_HOLD;
			pushBtnCount1 <= 0;
			pushBtnCount2 <= 0;
			pushBtnCount3 <= 0;
			pushBtnCount4 <= 0;
		end
	end
endmodule
