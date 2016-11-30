`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Tone Detection
//////////////////////////////////////////////////////////////////////////////////
module ToneDetection(
	 input clk,
	 input rst,
	 input bp1,
	 input bp2,
	 input bp3,
	 input bp4,
	 input bp5,
	 input pb1,
	 input pb2,
	 input pb3,
	 input pb4,
	 output wire [2:0] tdDir
    );
	 //State parameters
	 parameter   NO_SIGNAL = 2'b00;
	 parameter   CHECKSIGNAL = 2'b01;
	 parameter   DETECTED = 2'b10;
	 parameter   DONE = 2'b11;
	 //Output parameters
	 parameter   STOP = 3'b1_00;
	 parameter   STRAIGHT = 3'b0_00;
	 parameter   LEFT = 3'b0_01;
	 parameter   RIGHT = 3'b0_10;
	 parameter   BACK = 3'b0_11;
	 parameter   FINISH = 3'b1_11;
	 
	 reg [2:0] regTdDir = STOP;
	 reg [31:0] toneCounter;
	 reg [31:0] bp1Counter = 0;
	 reg [31:0] bp2Counter = 0;
	 reg [31:0] bp3Counter = 0;
	 reg [31:0] bp4Counter = 0;
	 reg [31:0] bp5Counter = 0;
	 reg [31:0] junctionCounter = 0;
	 reg [1:0] toneState = NO_SIGNAL;
	 reg bp1Detect;
	 reg bp2Detect;
	 reg bp3Detect;
	 reg bp4Detect;
	 reg bp5Detect;
	 assign tdDir = regTdDir;
	 
	 
	 always @ (posedge clk) begin
			case(toneState)
				NO_SIGNAL: begin
					bp1Counter <= 0;
					bp2Counter <= 0;
					bp3Counter <= 0;
					bp4Counter <= 0;
					bp5Counter <= 0;
					bp2Detect <= 0;
					bp3Detect <= 0;
					bp4Detect <= 0;
					bp5Detect <= 0;
					
					if (pb1 == 1) begin
						toneState <= CHECKSIGNAL;
					end
					
					else if (pb2 == 1) begin
						toneState <= CHECKSIGNAL;
					end
					
					else if (pb3 == 1) begin
						toneState <= CHECKSIGNAL;
					end
					
					else if (pb4 == 1) begin	
						toneState <= CHECKSIGNAL;
					end
				end
				
				CHECKSIGNAL: begin
					//BP1
					//BP2
					if (pb1 == 1) begin
						bp2Counter <= bp2Counter + 1;
						if (bp2Counter >= 12_500_000) begin
							bp2Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					//BP3
					else if (pb2 == 1) begin
						bp3Counter <= bp3Counter + 1;
						if (bp3Counter >= 12_500_000) begin
							bp3Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					//BP4
					else if (pb3 == 1) begin
						bp4Counter <= bp4Counter + 1;
						if (bp4Counter >= 12_500_000) begin
							bp4Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					//BP5
					else if (pb4 == 1) begin
						bp5Counter <= bp5Counter + 1;
						if (bp5Counter >= 12_500_000) begin
							bp5Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					else begin
						bp1Counter <= 0;
						bp2Counter <= 0;
						bp3Counter <= 0;
						bp4Counter <= 0;
						bp5Counter <= 0;
						
						toneState <= NO_SIGNAL;
					end
				end
				
				DETECTED: begin
						if (bp2Detect == 1)begin 
							regTdDir <= STRAIGHT;
							//toneState <= NO_SIGNAL;
							toneState <= DONE;
						end	
						else if (bp3Detect == 1) begin 
							regTdDir <= LEFT;
							//toneState <= NO_SIGNAL;
							toneState <= DONE;
						end	
						else if (bp4Detect == 1) begin
							regTdDir <= RIGHT;
							//toneState <= NO_SIGNAL;
							toneState <= DONE;
						end	
						else begin
							regTdDir <= BACK;
							//toneState <= NO_SIGNAL;
							toneState <= DONE;
						end
				end
				
				DONE: begin
					junctionCounter <= junctionCounter + 1;
					if (junctionCounter == 120_000_000) begin
						regTdDir <= STOP;
						toneState <= NO_SIGNAL;
						bp2Detect <= 0;
						bp3Detect <= 0;
						bp4Detect <= 0;
						bp5Detect <= 0;
						junctionCounter <= 0;
					end
				end
			endcase
		end		
endmodule
