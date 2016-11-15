`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:03:30 10/24/2016 
// Design Name: 
// Module Name:    TopModule 
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
module TxUART(
			input clk,
			input rst,
			output reg txClk = 0,	
			output reg readEn = 0,
			input [7:0]dout,
			input full,
			input empty,
			input [9:0]rdDataCount,
			output txData
			);

//-----------------------------//
//         Parameters          //
//-----------------------------//
	
	parameter BAUD_RATE = 9600;
	//(50000000/2)/x=BAUD_RATE
	parameter TX_CLK_COUNT = (50_000_000/2)/BAUD_RATE;
	
	parameter IDLE = 0;
	parameter PREPARE_PACKET = 1;
	parameter SENDING = 2;

	
	//One less than the total number
	parameter BITS_TO_SEND = 9;

//-----------------------------//
//         Regesters           //
//-----------------------------//
	
	//RS-232 Idle is a high state
	reg regTxData = 1;
	reg [12:0] txClkCounter = 0;
	reg [2:0] txState = IDLE;
	reg [3:0] bitsSent = 0;
	reg [9:0] txDataBuffer = 0;
	reg [3:0] loadCounter = 0;
	reg [7:0] initHoldDown = 0;
		
//-----------------------------//
//        Assignments          //
//-----------------------------//

	assign txData = regTxData;

	always@(posedge clk)begin
		//----------------Clock Generator-----------------//
		if(txClkCounter == TX_CLK_COUNT)begin
			txClkCounter <= 0;
			txClk <= ~txClk;
		end
		else begin
			txClkCounter <= txClkCounter + 1;
		end
		//-------------End of clock generator--------------//
	end

	always@(posedge txClk or posedge rst)begin
		if(rst)begin
			readEn <= 0;
			txState <= IDLE;
			txDataBuffer <= 0;
			regTxData <= 1;
			bitsSent <= 0;
		end
		else begin
			case(txState)
				IDLE: begin
					//Delays the state change by one cycle so the data can be on the output regester		
					if(readEn)begin
						txState <= PREPARE_PACKET;
						readEn <= 0;
					end
					else if(rdDataCount)begin
						readEn <= 1;
					end	
				end
				
				PREPARE_PACKET: begin
					readEn <= 0;
					txDataBuffer[9] <= 1;
					txDataBuffer[8:1] <= dout;
					txDataBuffer[0] <= 0;
					txState <= SENDING;
				end
				
				SENDING: begin
					regTxData <= txDataBuffer[0];
					txDataBuffer <= txDataBuffer >> 1;
					bitsSent <= bitsSent + 1;
					if(bitsSent == BITS_TO_SEND)begin
						bitsSent <= 0;
						if(rdDataCount == 0)begin
							txState <= IDLE;
						end
						else begin
							readEn <= 1;
							txState <= IDLE;
						end
					end
					else begin
						bitsSent <= bitsSent + 1;
					end
				end			
			endcase
		end
	end
endmodule
