`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// UART
//////////////////////////////////////////////////////////////////////////////////
module UART(
	input rst,
	input clk,
	input pushBtn1,
	input [3:0] dirControl,
	input direction,
	input [1:0] driveState,
	output txData,
	input hbEnA,
	input hbEnB
   );
	
	`include "parameters.vh"

	wire rdClk;
	wire readEn;
	wire full;
	wire empty;
	wire [7:0] dout;
	wire [11:0] wrDataCount;
	wire [11:0] rdDataCount;


	//UART regesters
	reg txClk = 0;
	reg writeEn = 0;
	reg clearToWrite = 0;
	//loadCounter and messageSize need to be the same size
	reg [6:0] loadCounter = 0;
	reg [6:0] messageSize = 0;
	reg [6:0] systemPoll = P_IDLE;
	reg [6:0] lastSystemPolled = P_IDLE;
	reg [7:0] initHoldDown = 0;
	reg [7:0] message [40:0];
	reg [7:0] din;
	reg [12:0] txClkCounter = 0;
	
	UART_Buffer myUART_Buffer (
		.rst				(rst),    // input rst
		.wr_clk			(clk),    // input wr_clk
		.rd_clk			(rdClk),  // input rd_clk
		.din				(din),    // input [7 : 0] din
		.wr_en			(writeEn),// input wr_en
		.rd_en			(readEn), // input rd_en
		.dout				(dout),   // output [7 : 0] dout
		.full				(full),   // output full
		.empty			(empty),  // output empty
		.rd_data_count	(rdDataCount), // output [11 : 0] rd_data_count
		.wr_data_count	(wrDataCount)  // output [11 : 0] wr_data_count
	);
	
	//Instanciate TxUART
	TxUART myTxUART(
		.clk (clk),
		.rst (rst),
		.txClk (rdClk),
		.readEn (readEn),
		.dout (dout),
		.full (full),
		.empty (empty),
		.rdDataCount (rdDataCount),
		.txData (txData)
	);
	
	always @(posedge clk or posedge rst)begin
		if(rst)begin
			txClkCounter <=0;
			txClk <= 0;
			initHoldDown <= 0;
			loadCounter <= 0;
			clearToWrite <= 0;
			writeEn <= 0;
			din <= 0;
		end
		else begin
			//Sets baud rate of transmision
			if(initHoldDown < 110)begin
				initHoldDown <= initHoldDown + 1;
			end
			else begin
				//-----------------Data to write-------------------//
				case(systemPoll)
					P_IDLE: begin
						if(wrDataCount == 0)begin
							systemPoll <= P_PUSH_BUTTON;
						end
					end
					P_LOAD_MESSAGE: begin
						if(loadCounter <= messageSize)begin
							writeEn <= 1;
							din <= message[loadCounter];
							loadCounter <= loadCounter + 1;
						end
						else if(lastSystemPolled < P_CLEAR_TERM)begin
							writeEn <= 0;
							systemPoll <= lastSystemPolled + 1;
						end
						else begin
							writeEn <= 0;
							systemPoll <= P_IDLE;
						end
					end
					P_PUSH_BUTTON: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_PUSH_BUTTON;						
						
						if(pushBtn1)begin
							messageSize <= 24;
							message[0] <= "P";
							message[1] <= "B";
							message[2] <= "1";
							message[3] <= " ";
							message[4] <= "S";
							message[5] <= "t";
							message[6] <= "a";
							message[7] <= "t";
							message[8] <= "u";
							message[9] <= "s";
							message[10] <= ":";
							message[11] <= " ";
							message[12] <= "P";
							message[13] <= "r";
							message[14] <= "e";
							message[15] <= "s";
							message[16] <= "s";
							message[17] <= "e";
							message[18] <= "d";
							message[19] <= " ";
							message[20] <= " ";
							message[21] <= " ";
							message[22] <= " ";
							message[23] <= 13;
							message[24] <= 10;
						end
						else begin
							messageSize <= 24;
							message[0] <= "P";
							message[1] <= "B";
							message[2] <= "1";
							message[3] <= " ";
							message[4] <= "S";
							message[5] <= "t";
							message[6] <= "a";
							message[7] <= "t";
							message[8] <= "u";
							message[9] <= "s";
							message[10] <= ":";
							message[11] <= " ";
							message[12] <= "N";
							message[13] <= "o";
							message[14] <= "t";
							message[15] <= " ";
							message[16] <= "P";
							message[17] <= "r";
							message[18] <= "e";
							message[19] <= "s";
							message[20] <= "s";
							message[21] <= "e";
							message[22] <= "d";
							message[23] <= 13;
							message[24] <= 10;
						end
					end
					P_DC_DIR: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_DC_DIR;	
						
						messageSize <= 13;
						
						message[0] <= "D";
						message[1] <= "i";
						message[2] <= "r";
						message[3] <= ":";
						message[4] <= " ";
						
						if(dirControl[3:2] == DC_PROCEED) begin
							message[5] <= "P";
							message[6] <= "r";
							message[7] <= "o";
							message[8] <= "c";
							message[9] <= "e";
							message[10] <= "e";
							message[11] <= "d";
							message[12] <= 13;
							message[13] <= 10;
						end
						else if(dirControl[3:2] == DC_TURN_LEFT) begin
							message[5] <= "L";
							message[6] <= "e";
							message[7] <= "f";
							message[8] <= "t";
							message[9] <= " ";
							message[10] <= " ";
							message[11] <= " ";
							message[12] <= 13;
							message[13] <= 10;
						end
						else if(dirControl[3:2] == DC_TURN_RIGHT) begin
							message[5] <= "R";
							message[6] <= "i";
							message[7] <= "g";
							message[8] <= "h";
							message[9] <= "t";
							message[10] <= " ";
							message[11] <= " ";
							message[12] <= 13;
							message[13] <= 10;
						end
						else if(dirControl[3:2] == DC_STOP) begin
							message[5] <= "S";
							message[6] <= "t";
							message[7] <= "o";
							message[8] <= "p";
							message[9] <= " ";
							message[10] <= " ";
							message[11] <= " ";
							message[12] <= 13;
							message[13] <= 10;
						end
						else begin
							message[5] <= "E";
							message[6] <= "R";
							message[7] <= "R";
							message[8] <= "O";
							message[9] <= "R";
							message[10] <= "!";
							message[11] <= " ";
							message[12] <= 13;
							message[13] <= 10;
						end
					end
					P_DRIVE_DIR: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_DRIVE_DIR;	
						
						messageSize <= 14;
						
						message[0] <= "F";
						message[1] <= "/";
						message[2] <= "R";
						message[3] <= ":";
						message[4] <= " ";
						
						if(direction == FORWARDS)begin
							message[5] <= "F";
							message[6] <= "o";
							message[7] <= "r";
							message[8] <= "w";
							message[9] <= "a";
							message[10] <= "r";
							message[11] <= "d";
							message[12] <= "s";
							message[13] <= 13;
							message[14] <= 10;
						end
						else if(direction == REVERSE)begin
							message[5] <= "R";
							message[6] <= "e";
							message[7] <= "v";
							message[8] <= "e";
							message[9] <= "r";
							message[10] <= "s";
							message[11] <= "e";
							message[12] <= " ";
							message[13] <= 13;
							message[14] <= 10;
						end
						else begin
							message[5] <= "E";
							message[6] <= "R";
							message[7] <= "R";
							message[8] <= "O";
							message[9] <= "R";
							message[10] <= " ";
							message[11] <= " ";
							message[12] <= " ";
							message[13] <= 13;
							message[14] <= 10;
						end
					end
					P_DRIVE_STATE: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_DRIVE_STATE;	
						
						messageSize <= 23;
						
						message[0] <= "D";
						message[1] <= "r";
						message[2] <= "i";
						message[3] <= "v";
						message[4] <= "e";
						message[5] <= " ";
						message[6] <= "S";
						message[7] <= "t";
						message[8] <= "a";
						message[9] <= "t";
						message[10] <= "e";
						message[11] <= ":";
						message[12] <= " ";
	
						if(driveState == DRIVE)begin
							message[13] <= "D";
							message[14] <= "r";
							message[15] <= "i";
							message[16] <= "v";
							message[17] <= "e";
							message[18] <= " ";
							message[19] <= " ";
							message[20] <= " ";
							message[21] <= " ";
							message[22] <= 13;
							message[23] <= 10;
						end
						else if(driveState == COLLISION)begin
							message[13] <= "C";
							message[14] <= "o";
							message[15] <= "l";
							message[16] <= "l";
							message[17] <= "i";
							message[18] <= "s";
							message[19] <= "i";
							message[20] <= "o";
							message[21] <= "n";
							message[22] <= 13;
							message[23] <= 10;
						end
						else if(driveState == JUNCTION)begin
							message[13] <= "J";
							message[14] <= "u";
							message[15] <= "n";
							message[16] <= "c";
							message[17] <= "t";
							message[18] <= "i";
							message[19] <= "o";
							message[20] <= "n";
							message[21] <= " ";
							message[22] <= 13;
							message[23] <= 10;
						end
					end
					P_CLEAR_TERM: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_CLEAR_TERM;	
						
						messageSize <= 8;
						
						//Return home
						message[0] <= 27;
						message[1] <= 91;
						message[2] <= 72;
						
						//Hide cursor ESC[?25l to show it ESC[?25h
						message[3] <= 27;
						message[4] <= 91;
						message[5] <= 63;
						message[6] <= 50;
						message[7] <= 53;
						message[8] <= 108;
					end
				endcase
			end
		end
	end
endmodule
