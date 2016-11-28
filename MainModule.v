`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Fury
// Main Module
//////////////////////////////////////////////////////////////////////////////////
module MainModule(
	input clk,
	
	//Drive
	output hbEnA, 
	output hbEnB, 
	output hbIn1, 
	output hbIn2, 
	output hbIn3,
	output hbIn4,
	input shaftPulseR,
	
	//Direction Control
	input RFS, 
	input RRS,
	input RMS,
	input LFS, 
	input LRS,
	input LMS,
	
	//Seven Seg
	output sevenSeg0, 
	output sevenSeg1, 
	output sevenSeg2, 
	output sevenSeg3,
	
	//Test Output
	output testOut,

	//Tone  Detection
	input bp1,
	input bp2,
	input bp3,
	input bp4,
	input bp5,
	input pb1,
	input pb2,
	input pb3,
	input pb4,
	
	//Collision Detection
	input colDetF1,
	input colDetF2, 
	
	//LEDs
	output led1,
	output led2,
	output led3,
	output led4,
	output led5,
	output led6,
	output led7,
	output led8,
	
	//UART
	output txData,
	output rxData
	);
	
	//Input from Direction Control module
	//wire DirSignal,
	wire [3:0] dirControl;
	wire colDetect;
	wire dcDrive;
	
	//Input from Tone Detection module
	wire [2:0] tdDir;

	//PWM Parameters
	//Do not exceed 80% on per H-Bridge specifications (Allows for a max of 2.5A Stall)
	parameter PWM_FULL_SPEED_PERCENT_ON = 27;
	parameter PWM_HARD_SPEED_PERCENT_ON = 80;
	parameter PWM_VEER_SPEED_PERCENT_ON = 33;
	parameter PWM_NINETY_SPEED_PERCENT_ON = 40;
	parameter PWM_NINETY_FAST_SPEED_PERCENT_ON = 42;
	parameter PWM_FREQUENCY  = 80;

	parameter PWM_COUNT_FREQ = 50_000_000/(PWM_FREQUENCY);
	parameter PWM_COUNT_FULL_SPEED_ON   = PWM_COUNT_FREQ*PWM_FULL_SPEED_PERCENT_ON/100;
	parameter PWM_COUNT_VEER_SPEED_ON   = PWM_COUNT_FREQ*PWM_VEER_SPEED_PERCENT_ON/100;
	parameter PWM_COUNT_HARD_SPEED_ON   = PWM_COUNT_FREQ*PWM_HARD_SPEED_PERCENT_ON/100;
	parameter PWM_COUNT_NINETY_SPEED_ON   = PWM_COUNT_FREQ*PWM_NINETY_SPEED_PERCENT_ON/100;
	parameter PWM_COUNT_NINETY_FAST_SPEED_ON   = PWM_COUNT_FREQ*PWM_NINETY_FAST_SPEED_PERCENT_ON/100;

	//Drive State Machine States
	parameter DRIVE = 2'b00;
	parameter COLLISION = 2'b10;
	parameter JUNCTION = 2'b11;
	
	//Direction Control
	parameter DC_PROCEED = 2'b00;
	parameter DC_TURN_LEFT = 2'b01;
	parameter DC_TURN_RIGHT = 2'b10;
	parameter DC_STOP = 2'b11;
	parameter DC_FULL = 2'b00;
	parameter DC_VEER = 2'b01;
	parameter DC_HARD = 2'b10;
	
	
	
	//Junction Conditions
	parameter  STRAIGHT = 3'b000;
	parameter  LEFT = 3'b001;
	parameter  RIGHT = 3'b010;
	parameter  BACK = 3'b011;
	parameter  STOP = 3'b100;
	
	//H-Bridge Parameters
	parameter HbRight = 4'b1010;
	parameter HbLeft = 4'b0101;
	parameter HbStraight = 4'b0110;
	parameter HbStop = 4'b0000;
	parameter FORWARDS = 1'b1;
	parameter REVERSE = 1'b0;
	
	//UART Parameters
	parameter P_IDLE = 0;
	parameter P_LOAD_MESSAGE = 1;
	parameter P_PUSH_BUTTON = 2;
	parameter P_DC_DIR = 3;
	parameter P_DRIVE_DIR = 4;
	parameter P_DRIVE_STATE = 5;
	//this one has to be the max number
	//because of how the case statement works
	parameter P_CLEAR_TERM = 6;
	

	//PWM Registers
	reg regFullSpeedPwm = 0;
	reg regVeerSpeedPwm = 0;
	reg regHardSpeedPwm = 0;
	reg regNinetySpeedPwm = 0;
	reg regNinetyFastSpeedPwm = 0;
	reg [19:0] pwmFullSpeedCount = 0;
	reg [19:0] pwmHardSpeedCount = 0;
	reg [19:0] pwmVeerSpeedCount = 0;
	reg [19:0] pwmNinetySpeedCount = 0;
	reg [19:0] pwmNinetyFastSpeedCount = 0;

	//H-Bridge Registers
	reg regHbEnA = 0;
	reg regHbEnB = 0;
	reg [3:0] HbRightReg = 0;
	reg [3:0] HbLeftReg = 0;
	reg [3:0] HbStraightReg = 0;
	reg [3:0] HbDrive = 0;

	//Drive State Machine Registers
	reg [1:0] driveState = DRIVE;
	reg Drive = FORWARDS;
	
	//Junction Registers
	reg [26:0] jncCounter = 0;
	reg regLed4 = 0;
	reg regLed5 = 0;
	reg regLed6 = 0;
	reg regLed7 = 0;
	reg regLed8 = 0;


	reg rst = 0;
	reg txClk = 0;
	reg writeEn = 0;
	reg clearToWrite = 0;
	
	//These need to be the same size
	reg [6:0] loadCounter = 0;
	reg [6:0] messageSize = 0;
	
	reg [7:0] initHoldDown = 0;
	reg [7:0] message [40:0];
	reg [7:0] din;
	reg [12:0] txClkCounter = 0;
	reg [6:0] systemPoll = P_IDLE;
	reg [6:0] lastSystemPolled = P_IDLE;

	wire rdClk;
	wire readEn;
	wire [7:0] dout;
	wire full;
	wire empty;
	wire [11:0] wrDataCount;
	wire [11:0] rdDataCount;

	//Pin Assignments
	assign hbEnA = regHbEnA;
	assign hbEnB = regHbEnB;
	assign hbIn1 = HbDrive[0];
	assign hbIn2 = HbDrive[1];
	assign hbIn3 = HbDrive[2];
	assign hbIn4 = HbDrive[3];
	assign dcDrive = Drive;

	//Testing Pin
	assign testOut = regVeerSpeedPwm;
	
	//Turn Off The 7-Seg Display
	assign sevenSeg0 = 1;
	assign sevenSeg1 = 1;
	assign sevenSeg2 = 1;
	assign sevenSeg3 = 1;

   //Junction
	assign led4 = regLed4;
	assign led5 = regLed5;
	assign led6 = regLed6;
	assign led7 = regLed7;
	assign led8 = regLed8;
	//Instanciate Drive Control
	DirectionControl myDirectionControl(
		.clk	(clk),
		.RFS	(RFS),
		.RRS	(RRS),
		.RMS  (RMS),
		.LFS	(LFS),
		.LRS	(LRS),
		.LMS  (LMS),
		.Direction (dcDrive),
		.DIR	(dirControl)
	);
	
	//Instanciate COllision Detection
	CollisionDetection myCollisionDetection(
		.clk (clk),
		.direction (dcDrive),
		.sensf (colDetF1),
		.sensb (colDetF2),
		.led1 (led1),
		.led2 (led2),
		.led3 (led3),
		.colDetect (colDetect)
	);

	//Instanciate Tone Detection
	ToneDetection myToneDetection (
		.clk (clk),
		.bp1 (bp1),
		.bp2 (bp2),
		.bp3 (bp3),
		.bp4 (bp4),
		.bp5 (bp5),
		.pb1 (pb1),
		.pb2 (pb2),
		.pb3 (pb3),
		.pb4 (pb4),
		//.led8 (led8),
		//.led7 (led7),
		//.led6 (led6),
		//.led5 (led5),
		.tdDir (tdDir)
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
		.txData (txData),
		.rxData (rxData)
	);
	
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
						
						if(pb1)begin
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
						
						if(Drive == FORWARDS)begin
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
						else if(Drive == REVERSE)begin
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
	
	//PWM
	always @(posedge clk) begin
		//Full Speed PWM
		pwmFullSpeedCount <= pwmFullSpeedCount +1;
		if(pwmFullSpeedCount == PWM_COUNT_FULL_SPEED_ON) begin
			regFullSpeedPwm <= 0;
		end
		else if(pwmFullSpeedCount == PWM_COUNT_FREQ) begin
			regFullSpeedPwm <= 1;
			pwmFullSpeedCount <= 0;
		end

		//Veer Speed PWM
		pwmVeerSpeedCount <= pwmVeerSpeedCount +1;
		if(pwmVeerSpeedCount == PWM_COUNT_VEER_SPEED_ON) begin
			regVeerSpeedPwm <= 0;
		end
		else if(pwmVeerSpeedCount == PWM_COUNT_FREQ) begin
			regVeerSpeedPwm <= 1;
			pwmVeerSpeedCount <= 0;
		end
			
		//Ninety Speed PWM
		pwmNinetySpeedCount <= pwmNinetySpeedCount +1;
		if(pwmNinetySpeedCount == PWM_COUNT_NINETY_SPEED_ON) begin
			regNinetySpeedPwm <= 0;
		end
		else if(pwmNinetySpeedCount == PWM_COUNT_FREQ) begin
			regNinetySpeedPwm <= 1;
			pwmNinetySpeedCount <= 0;
		end
		
		//Ninety Fast Speed PWM
		pwmNinetyFastSpeedCount <= pwmNinetyFastSpeedCount +1;
		if(pwmNinetyFastSpeedCount == PWM_COUNT_NINETY_FAST_SPEED_ON) begin
			regNinetyFastSpeedPwm <= 0;
		end
		else if(pwmNinetyFastSpeedCount == PWM_COUNT_FREQ) begin
			regNinetyFastSpeedPwm <= 1;
			pwmNinetyFastSpeedCount <= 0;
		end
		
		//Hard Speed PWM
		pwmHardSpeedCount <= pwmHardSpeedCount +1;
		if(pwmHardSpeedCount == PWM_COUNT_HARD_SPEED_ON) begin
			regHardSpeedPwm <= 0;
		end
		else if(pwmHardSpeedCount == PWM_COUNT_FREQ) begin
			regHardSpeedPwm <= 1;
			pwmHardSpeedCount <= 0;
		end
	end
	

	//Drive State Machine
	always @(posedge clk) begin
	
		//Diretion and bit assignments for H-Bridge
		if (Drive == FORWARDS) begin
			HbRightReg <= HbRight;
			HbLeftReg <= HbLeft;
			HbStraightReg <= HbStraight;
		end
		else if (Drive == REVERSE) begin
			HbRightReg <= ~HbRight;
			HbLeftReg <= ~HbLeft;
			HbStraightReg <= ~HbStraight;
		end
	
		case(driveState)
			//Drive State
			DRIVE: begin
			
				//Collision detected	
				if(!colDetect) begin
					driveState <= COLLISION;
				end
			
				//Turn Left
				if(dirControl[3:2] == DC_TURN_LEFT)begin
				
					//Veer Left
					if(dirControl[1:0] == DC_VEER)begin
						regHbEnA <= regVeerSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						HbDrive <= HbStraightReg;
					end
					
					//Hard Left
					else if(dirControl[1:0] == DC_HARD) begin
						regHbEnA <= regVeerSpeedPwm;
						regHbEnB <= regHardSpeedPwm;
						HbDrive <= HbLeftReg;
					end
					
					//Stop Left
					else if(dirControl[1:0] == DC_STOP) begin
						regHbEnA <= regNinetySpeedPwm;
						regHbEnB <= regNinetyFastSpeedPwm;
						HbDrive <= HbLeftReg;
					end
				end
				
				//Turn Right
				else if(dirControl[3:2] == DC_TURN_RIGHT) begin
				
					//Veer Right
					if(dirControl[1:0] == DC_VEER) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regVeerSpeedPwm;
						HbDrive <= HbStraightReg;
					end
					
					//Hard Right
				   else if(dirControl[1:0] == DC_HARD) begin
						regHbEnA <= regHardSpeedPwm;
						regHbEnB <= regVeerSpeedPwm;
						HbDrive <= HbRightReg;
					end 
					
					//Stop Right
					else if(dirControl[1:0] == DC_STOP) begin
						regHbEnA <= regNinetyFastSpeedPwm;
						regHbEnB <= regNinetySpeedPwm;
						HbDrive <= HbRightReg;
					end 
				end
				
				//Straight
				else if(dirControl[3:2] == DC_PROCEED) begin
					if(dirControl[1:0] == 2'b00) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						HbDrive <= HbStraightReg;
					end
				end	
				
				//Stop
				else if(dirControl[3:2] == DC_STOP) begin
					regHbEnA <= 0;
					regHbEnB <= 0;
					HbDrive <= HbStop;
					driveState <= JUNCTION;
				end
				
				//Default Stop
				else begin
					regHbEnA <= regFullSpeedPwm;
					regHbEnB <= regFullSpeedPwm;
					HbDrive <= HbStop;
					driveState <= JUNCTION;
				end
			end

			//Collision State
			COLLISION: begin
				if (colDetect) begin
					driveState <= DRIVE;
				end
				regHbEnA <= 0;
				regHbEnB <= 0;
				
			end

			//Junction State
			JUNCTION: begin
				regLed4 <= 0;
				regLed5 <= 0;
				regLed6 <= 0;
				regLed7 <= 0;
				regLed8 <= 0;
				
				if(tdDir == STOP)begin
					regLed4 <= 1;
					regLed5 <= 0;
					regLed6 <= 0;
					regLed7 <= 0;
					regLed8 <= 0;
					
					regHbEnA <= 0;
					regHbEnB <= 0;
					HbDrive <= HbStop;
				end
				//Straight
				else if (tdDir == STRAIGHT)begin
					jncCounter <= jncCounter + 1;
					regLed4 <= 0;
					regLed5 <= 1;
					regLed6 <= 0;
					regLed7 <= 0;
					regLed8 <= 0;
					
					if (jncCounter <= 50_00_000)begin	
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						HbDrive <= HbStraight;
					end
					else begin
						driveState <= DRIVE;
						Drive <= FORWARDS;
						jncCounter <= 0;
					end			
				end
				//Left
				else if (tdDir == LEFT)begin
					jncCounter <= jncCounter + 1;
					regLed4 <= 0;
					regLed5 <= 0;
					regLed6 <= 1;
					regLed7 <= 0;
					regLed8 <= 0;
					
					if (jncCounter <= 50_000_000)begin
						regHbEnA <= regNinetySpeedPwm;
						regHbEnB <= regNinetyFastSpeedPwm;
						HbDrive <= HbLeft;
					end
					else begin
						driveState <= DRIVE;
						Drive <= FORWARDS;
						jncCounter <= 0;
					end	
				end
				//Right
				else if (tdDir == RIGHT)begin
					jncCounter <= jncCounter + 1;
					regLed4 <= 0;
					regLed5 <= 0;
					regLed6 <= 0;
					regLed7 <= 1;
					regLed8 <= 0;
					
					if (jncCounter <= 50_000_000)begin
						regHbEnA <= regNinetyFastSpeedPwm;
						regHbEnB <= regNinetySpeedPwm;
						HbDrive <= HbRight;
					end
					else begin
						driveState <= DRIVE;
						Drive <= FORWARDS;
						jncCounter <= 0;
					end	
				end
				//Back
				else if (tdDir == BACK)begin
					jncCounter <= jncCounter + 1;
					regLed4 <= 0;
					regLed5 <= 0;
					regLed6 <= 0;
					regLed7 <= 0;
					regLed8 <= 1;
					
					if (jncCounter <= 50_000_000)begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						HbDrive <= ~HbStraight;
					end
					else begin
						driveState <= DRIVE;
						Drive <= REVERSE;
						jncCounter <= 0;
					end	
				end	
			end		
		endcase
	end
endmodule
