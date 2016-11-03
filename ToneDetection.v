`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Tone Detection
//////////////////////////////////////////////////////////////////////////////////
module ToneDetection(
	 input clk,
	 input bp1,
	 input bp2,
	 input bp3,
	 input bp4,
	 input bp5,
	 output reg [2:0] tdDIR
    );
	 //State parameters
	 parameter   NOSIGNAL = 2'b00;
	 parameter   CHECKSIGNAL = 2'b01;
	 parameter   DETECTED = 2'b10;
	 parameter   DONE = 2'b11;
	 //Output parameters
	 parameter   STOP = 3'b1_00;
	 parameter   STRAIGHT = 3'b0_00;
	 parameter   LEFT = 3'b0_01;
	 parameter   RIGHT = 3'b0_10;
	 parameter   BACK = 3'b0_11;
	 
	 reg [31:0] toneCounter;
	 reg [31:0] bp1Counter;
	 reg [31:0] bp2Counter;
	 reg [31:0] bp3Counter;
	 reg [31:0] bp4Counter;
	 reg [31:0] bp5Counter;
	 reg [1:0] toneState;
	 reg [7:0] led_reg;
	 reg bp1Detect;
	 reg bp2Detect;
	 reg bp3Detect;
	 reg bp4Detect;
	 reg bp5Detect;
	 
	 assign led = led_reg;
	 
	 always @ (posedge clk) begin
			case(toneState)
				NOSIGNAL: begin
					bp1Counter <= 0;
					bp2Counter <= 0;
					bp3Counter <= 0;
					bp4Counter <= 0;
					bp5Counter <= 0;
					if (bp1 == 1)
						toneState <= CHECKSIGNAL;
					if (bp1 == 2)
						toneState <= CHECKSIGNAL;
					if (bp1 == 3)
						toneState <= CHECKSIGNAL;
					if (bp1 == 4)
						toneState <= CHECKSIGNAL;
					if (bp1 == 5)	
						toneState <= CHECKSIGNAL;
				end
				CHECKSIGNAL: begin
					//BP1
					if (bp1 == 1) begin
						bp1Counter <= bp1Counter + 1;
						if (bp1Counter >= 25_000_000) begin
							bp1Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					else begin
						toneState <= NOSIGNAL;
						bp1Counter <= 0;
					end
					//BP2
					if (bp2 == 1) begin
						bp2Counter <= bp2Counter + 1;
						if (bp2Counter >= 25_000_000) begin
							bp2Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					else begin
						toneState <= NOSIGNAL;
						bp2Counter <= 0;
					end
					//BP3
					if (bp3 == 1) begin
						bp3Counter <= bp3Counter + 1;
						if (bp3Counter >= 25_000_000) begin
							bp3Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					else begin
						toneState <= NOSIGNAL;
						bp3Counter <= 0;
					end
					//BP4
					if (bp4 == 1) begin
						bp4Counter <= bp4Counter + 1;
						if (bp4Counter >= 25_000_000) begin
							bp4Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					else begin
						toneState <= NOSIGNAL;
						bp4Counter <= 0;
					end
					//BP5
					if (bp5 == 1) begin
						bp5Counter <= bp5Counter + 1;
						if (bp5Counter >= 25_000_000) begin
							bp5Detect <= 1; 
							toneState <= DETECTED;
						end	
					end
					else begin
						toneState <= NOSIGNAL;
						bp5Counter <= 0;
					end	
				end			
				DETECTED: begin
					if (bp1Detect == 1) 
						tdDIR <= STOP;
					if (bp2Detect == 1) 
						tdDIR <= STRAIGHT;
					if (bp3Detect == 1) 
						tdDIR <= LEFT;
					if (bp4Detect == 1) 
						tdDIR <= RIGHT;
					if (bp5Detect == 1) 
						tdDIR <= BACK;	
				end
				default: toneState <= NOSIGNAL;
			endcase
		end		
					


endmodule
