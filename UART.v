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
	input hbEnB,
	input [1:0] junctionState,
	input [2:0] toneDir,
	input [25:0] rightCount
   );
	
	`include "parameters.vh"

	wire rdClk;
	wire readEn;
	wire full;
	wire empty;
	wire [7:0] dout;
	wire [9:0] wrDataCount;
	wire [9:0] rdDataCount;
	
	wire [3:0] rightOne;
	wire [3:0] rightTen;
	wire [3:0] rightHundred;
	wire [3:0] rightThousand;
	wire [3:0] rightTenThousand;
	wire [3:0] rightHundredThousand;
	wire [3:0] rightMil;
	wire [3:0] rightTenMil;


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
	reg [25:0] rightNumberToBcd = 0;
	reg [10:0] clearScreenCounter = 0;
	
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

	bcd rightBcd(
		.clk (clk),
		.number (rightNumberToBcd),   
		.one (rightOne),
		.ten (rightTen),
		.hundred (rightHundred),
		.thousand (rightThousand),
		.tenThousand (rightTenThousand),
		.hundredThousand (rightHundredThousand),
		.mil (rightMil),
		.tenMil (rightTenMil)
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
							systemPoll <= P_DC_DIR;
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
					P_JUNCTION_STATE: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_JUNCTION_STATE;	
						
						messageSize <= 26;
						
						//Return home
						message[0] <= "J";
						message[1] <= "u";
						message[2] <= "n";
						message[3] <= "c";
						message[4] <= "t";
						message[5] <= "i";
						message[6] <= "o";
						message[7] <= "n";
						message[8] <= " ";
						message[9] <= "S";
						message[10] <= "t";
						message[11] <= "a";
						message[12] <= "t";
						message[13] <= "e";
						message[14] <= ":";
						message[15] <= " ";
						
						if(junctionState == J_DETECT)begin
							message[16] <= "D";
							message[17] <= "e";
							message[18] <= "t";
							message[19] <= "e";
							message[20] <= "c";
							message[21] <= "t";
							message[22] <= " ";
							message[23] <= " ";
							message[24] <= " ";
							message[25] <= 13;
							message[26] <= 10;
						end
						else if(junctionState == J_MANEUVER)begin
							message[16] <= "M";
							message[17] <= "a";
							message[18] <= "n";
							message[19] <= "e";
							message[20] <= "u";
							message[21] <= "v";
							message[22] <= "e";
							message[23] <= "r";
							message[24] <= " ";
							message[25] <= 13;
							message[26] <= 10;
						end
						else if(junctionState == J_COMPLETE)begin
							message[16] <= "C";
							message[17] <= "o";
							message[18] <= "m";
							message[19] <= "p";
							message[20] <= "l";
							message[21] <= "e";
							message[22] <= "t";
							message[23] <= "e";
							message[24] <= " ";
							message[25] <= 13;
							message[26] <= 10;
						end
					end
					P_TONE_DIR: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_TONE_DIR;	
						
						messageSize <= 19;
						
						//Return home
						message[0] <= "T";
						message[1] <= "o";
						message[2] <= "n";
						message[3] <= "e";
						message[4] <= " ";
						message[5] <= "D";
						message[6] <= "i";
						message[7] <= "r";
						message[8] <= ":";
						message[9] <= " ";
						
						if(toneDir == TD_FORWARD)begin
							message[10] <= "F";
							message[11] <= "o";
							message[12] <= "r";
							message[13] <= "w";
							message[14] <= "a";
							message[15] <= "r";
							message[16] <= "d";
							message[17] <= " ";
							message[18] <= 13;
							message[19] <= 10;
						end
						else if(toneDir == TD_LEFT)begin
							message[10] <= "L";
							message[11] <= "e";
							message[12] <= "f";
							message[13] <= "t";
							message[14] <= " ";
							message[15] <= " ";
							message[16] <= " ";
							message[17] <= " ";
							message[18] <= 13;
							message[19] <= 10;
						end
						else if(toneDir == TD_RIGHT)begin
							message[10] <= "R";
							message[11] <= "i";
							message[12] <= "g";
							message[13] <= "h";
							message[14] <= " ";
							message[15] <= " ";
							message[16] <= " ";
							message[17] <= " ";
							message[18] <= 13;
							message[19] <= 10;
						end
						else if(toneDir == TD_REVERSE)begin
							message[10] <= "R";
							message[11] <= "e";
							message[12] <= "v";
							message[13] <= "e";
							message[14] <= "r";
							message[15] <= "s";
							message[16] <= "e";
							message[17] <= " ";
							message[18] <= 13;
							message[19] <= 10;
						end
						else if(toneDir == TD_STOP)begin
							message[10] <= "S";
							message[11] <= "t";
							message[12] <= "o";
							message[13] <= "p";
							message[14] <= " ";
							message[15] <= " ";
							message[16] <= " ";
							message[17] <= " ";
							message[18] <= 13;
							message[19] <= 10;
						end
						else if(toneDir == TD_HOLD)begin
							message[10] <= "H";
							message[11] <= "o";
							message[12] <= "l";
							message[13] <= "d";
							message[14] <= " ";
							message[15] <= " ";
							message[16] <= " ";
							message[17] <= " ";
							message[18] <= 13;
							message[19] <= 10;
						end
					end
					P_RIGHT_COUNT: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_RIGHT_COUNT;	
						
						rightNumberToBcd <= rightCount;
						
						messageSize <= 20;

						message[0] <= "R";
						message[1] <= "i";
						message[2] <= "g";
						message[3] <= "h";
						message[4] <= "t";
						message[5] <= " ";
						message[6] <= "C";
						message[7] <= "o";
						message[8] <= "u";
						message[9] <= "n";
						message[10] <= "t";
						message[11] <= ":";
						message[12] <= " ";
						message[13] <= 48+rightTenMil;
						message[14] <= 48+rightMil;
						message[15] <= 48+rightHundredThousand;
						message[16] <= 48+rightTenThousand;
						message[17] <= 48+rightThousand;
						message[18] <= 48+rightHundred;
						message[19] <= 48+rightTen;
						message[20] <= 48+rightOne;
					end
					P_CLEAR_TERM: begin
						loadCounter <= 0;
						systemPoll <= P_LOAD_MESSAGE;
						lastSystemPolled <= P_CLEAR_TERM;	

						if(clearScreenCounter == CLEAR_SCREEN_COUNT) begin
							clearScreenCounter <= 0;
						
							messageSize <= 11;
						
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
							
							message[9] <= 27;
							message[10] <= 91;
							message[11] <= "J";
						end
						else begin
							clearScreenCounter <= clearScreenCounter + 1;
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
					end
				endcase
			end
		end
	end
endmodule
