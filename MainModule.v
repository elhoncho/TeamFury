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
	input shaftPulseL,
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
	input SW7,
	input SW6,
	
	//LEDs
	output led1,
	output led2,
	output led3,
	output led4,
	output led5,
	output led6,
	output led7,
	output led8
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
	parameter FORWARDS = 2'b00;
	parameter REVERSE = 2'b01;
	parameter COLLISION = 2'b10;
	parameter JUNCTION = 2'b11;
	
	//Junction Conditions
	parameter  STRAIGHT = 3'b000;
	parameter  LEFT = 3'b001;
	parameter  RIGHT = 3'b010;
	parameter  BACK = 3'b011;
	parameter  STOP = 3'b100;
	
	//H-Bridge Parameters
	/*
	parameter HbRight = 4'b0101;
	parameter HbLeft = 4'b1010;
	parameter HbStraight = 4'b0110;
	parameter HbStop = 4'b0000;
	*/
	

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
	reg regHbIn1 = 0;
	reg regHbIn2 = 0;
	reg regHbIn3 = 0;
	reg regHbIn4 = 0;
	/*
	reg [3:0] HbRightReg = 0;
	reg [3:0] HbLeftReg = 0;
	reg [3:0] HbStraightReg = 0;
	reg [3:0] HbDrive = 0;
	*/

	//Drive State Machine Registers
	reg [1:0] driveState = FORWARDS;
	reg Drive = 1;
	
	//Junction Registers
	reg [26:0] jncCounter = 0;
	reg regLed4 = 0;
	reg regLed5 = 0;
	reg regLed6 = 0;
	reg regLed7 = 0;
	reg regLed8 = 0;
	

	//Pin Assignments
	assign hbEnA = regHbEnA;
	assign hbEnB = regHbEnB;
	assign hbIn1 = regHbIn1;
	assign hbIn2 = regHbIn2;
	assign hbIn3 = regHbIn3;
	assign hbIn4 = regHbIn4;
	/*
	assign HbDrive[0] = hbIn1;
	assign HbDrive[1] = hbIn2;
	assign HbDrive[2] = hbIn3;
	assign HbDrive[3] = hbIn4;
	*/

	//Testing Pin
	assign testOut = regVeerSpeedPwm;
	assign dcDrive = Drive;

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
		/*if (Drive == 1) begin
			HbRightReg <= HbRight;
			HbLeftReg <= HbLeft;
			HbStraightReg <= HbStraight;
		end
		else if (Drive == 0) begin
			HbRightReg <= ~HbRight;
			HbLeftReg <= ~HbLeft;
			HbStraightReg <= ~HbStraight;
		end */
	
		case(driveState)
			FORWARDS: begin
				//Collision detected
				
				/*
				if(!colDetect || SW7) begin
					driveState <= COLLISION;
				end
				*/
				
				/*
				//Direction control for testing
				if (SW6 == 0) begin
					driveState <= REVERSE;
					Drive <= 0;
				end
				*/
				
				//Turn Left
				if(dirControl[3:2] == 2'b01)begin
					//Veer Left
					if(dirControl[1:0] == 2'b01)begin
						regHbEnA <= regVeerSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
					//Hard Left
					else if(dirControl[1:0] == 2'b10) begin
						regHbEnA <= regVeerSpeedPwm;
						regHbEnB <= regHardSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
					//Stop Left
					else if(dirControl[1:0] == 2'b11) begin
						regHbEnA <= regNinetySpeedPwm;
						regHbEnB <= regNinetyFastSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
				end

				//Turn Right
				else if(dirControl[3:2] == 2'b10) begin
					//Veer Right
					if(dirControl[1:0] == 2'b01) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regVeerSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
					//Hard Right
				   else if(dirControl[1:0] == 2'b10) begin
						regHbEnA <= regHardSpeedPwm;
						regHbEnB <= regVeerSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end 
					//Stop Right
					else if(dirControl[1:0] == 2'b11) begin
						regHbEnA <= regNinetyFastSpeedPwm;
						regHbEnB <= regNinetySpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end 
				end

				//Straight
				else if(dirControl[3:2] == 2'b00) begin
					if(dirControl[1:0] == 2'b00) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
				end
				
				//Stop
				else if(dirControl[3:2] == 2'b11) begin
					regHbEnA <= 0;
					regHbEnB <= 0;
					regHbIn1 <= 0;
					regHbIn2 <= 0;
					regHbIn3 <= 0;
					regHbIn4 <= 0;
					driveState <= JUNCTION;
				end
				
				//Default Stop
				else begin
					regHbEnA <= regFullSpeedPwm;
					regHbEnB <= regFullSpeedPwm;
					regHbIn1 <= 0;
					regHbIn2 <= 0;
					regHbIn3 <= 0;
					regHbIn4 <= 0;
					driveState <= JUNCTION;
				end
			end

			REVERSE: begin
			//Collision detected
				if(!colDetect || SW7) begin
					driveState <= COLLISION;
				end
				
				//Direction control for testing

				
				//Turn Left
				else if(dirControl[3:2] == 2'b01)begin
					//Veer Left
					if(dirControl[1:0] == 2'b01)begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regVeerSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end
					//Hard Left
					else if(dirControl[1:0] == 2'b10) begin
						regHbEnA <= regVeerSpeedPwm;
						regHbEnB <= regHardSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end
					//Stop Left
					else if(dirControl[1:0] == 2'b11) begin
						regHbEnA <= regNinetySpeedPwm;
						regHbEnB <= regNinetyFastSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end
				end

				//Turn Right
				else if(dirControl[3:2] == 2'b10) begin
					//Veer Right
					if(dirControl[1:0] == 2'b01) begin
						regHbEnA <= regVeerSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end
					//Hard Right
				   else if(dirControl[1:0] == 2'b10) begin
						regHbEnA <= regHardSpeedPwm;
						regHbEnB <= regVeerSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end 
					//Stop Right
					else if(dirControl[1:0] == 2'b11) begin
						regHbEnA <= regNinetyFastSpeedPwm;
						regHbEnB <= regNinetySpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end 
				end

				//Straight
				else if(dirControl[3:2] == 2'b00) begin
					if(dirControl[1:0] == 2'b00) begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end
				end
				
				//Stop
				else if(dirControl[3:2] == 2'b11) begin
					regHbEnA <= 0;
					regHbEnB <= 0;
					regHbIn1 <= 0;
					regHbIn2 <= 0;
					regHbIn3 <= 0;
					regHbIn4 <= 0;
					driveState <= JUNCTION;
				end
				
				//Default Stop
				else begin
					regHbEnA <= regFullSpeedPwm;
					regHbEnB <= regFullSpeedPwm;
					regHbIn1 <= 0;
					regHbIn2 <= 0;
					regHbIn3 <= 0;
					regHbIn4 <= 0;
					driveState <= JUNCTION;
				end
			end

			COLLISION: begin
						if (colDetect && Drive == 0) begin
							driveState <= REVERSE;
						end
						else if (colDetect && Drive == 1) begin
							driveState <= FORWARDS;
						end					
						
				regHbEnA <= 0;
				regHbEnB <= 0;
				
			end

			JUNCTION: begin
				regLed4 <= 0;
				regLed5 <= 0;
				regLed6 <= 0;
				regLed7 <= 0;
				regLed8 <= 0;
				jncCounter <= jncCounter + 1;
				
				if(tdDir == STOP)begin
					regLed4 <= 1;
					regLed5 <= 0;
					regLed6 <= 0;
					regLed7 <= 0;
					regLed8 <= 0;
					
					//not sure if we have to do anything here, so we chillin
					regHbEnA <= 0;
					regHbEnB <= 0;
					regHbIn1 <= 0;
					regHbIn2 <= 0;
					regHbIn3 <= 0;
					regHbIn4 <= 0;
				end
				//Straight
				else if (tdDir == STRAIGHT)begin
					regLed4 <= 0;
					regLed5 <= 1;
					regLed6 <= 0;
					regLed7 <= 0;
					regLed8 <= 0;
					
					if (jncCounter <= 25_00_000)begin	
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
					else begin
						driveState <= FORWARDS;
						Drive <= 1;
						jncCounter <= 0;
					end
					jncCounter <= jncCounter + 1;				
				end
				//Left
				else if (tdDir == LEFT)begin
					regLed4 <= 0;
					regLed5 <= 0;
					regLed6 <= 1;
					regLed7 <= 0;
					regLed8 <= 0;
					
					if (jncCounter <= 25_000_000)begin
						regHbEnA <= regNinetySpeedPwm;
						regHbEnB <= regNinetyFastSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 1;
						regHbIn4 <= 0;
					end
					else begin
						driveState <= FORWARDS;
						Drive <= 1;
						jncCounter <= 0;
					end	
				end
				//Right
				else if (tdDir == RIGHT)begin
					regLed4 <= 0;
					regLed5 <= 0;
					regLed6 <= 0;
					regLed7 <= 1;
					regLed8 <= 0;
					
					if (jncCounter <= 25_000_000)begin
						regHbEnA <= regNinetyFastSpeedPwm;
						regHbEnB <= regNinetySpeedPwm;
						regHbIn1 <= 0;
						regHbIn2 <= 1;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end
					else begin
						driveState <= FORWARDS;
						Drive <= 1;
						jncCounter <= 0;
					end	
				end
				//Back
				else if (tdDir == BACK)begin
					regLed4 <= 0;
					regLed5 <= 0;
					regLed6 <= 0;
					regLed7 <= 0;
					regLed8 <= 1;
					
					if (jncCounter <= 25_000_000)begin
						regHbEnA <= regFullSpeedPwm;
						regHbEnB <= regFullSpeedPwm;
						regHbIn1 <= 1;
						regHbIn2 <= 0;
						regHbIn3 <= 0;
						regHbIn4 <= 1;
					end
					else begin
						driveState <= REVERSE;
						Drive <= 0;
						jncCounter <= 0;
					end	
				end	
			end		
		endcase
	end
endmodule
