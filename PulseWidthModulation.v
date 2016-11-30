`timescale 1ns / 1ps
module PulseWidthModulation(
		input clk,
		output fullSpeedPwm,
		output veerSpeedPwm,
		output hardSpeedPwm,
		output ninetySpeedPwm,
		output ninetyFastSpeedPwm
    );

	`include "parameters.vh"

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
	
	assign fullSpeedPwm = regFullSpeedPwm;
	assign veerSpeedPwm = regVeerSpeedPwm;
	assign hardSpeedPwm = regHardSpeedPwm;
	assign ninetySpeedPwm = regNinetySpeedPwm;
	assign ninetyFastSpeedPwm = regNinetyFastSpeedPwm;
	
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
endmodule
