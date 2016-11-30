`timescale 1ns / 1ps

module DriveTestFixture;

	// Inputs
	reg clk;
	reg rst;
	reg colDetect;
	reg [3:0] dirControl;
	reg veerSpeedPwm;
	reg fullSpeedPwm;
	reg hardSpeedPwm;
	reg ninetySpeedPwm;
	reg ninetyFastSpeedPwm;
	reg [2:0] tdDir;

	// Outputs
	wire hbIn1;
	wire hbIn2;
	wire hbIn3;
	wire hbIn4;
	wire hbEnA;
	wire hbEnB;
	reg led4;
	reg led5;
	reg led6;
	reg led7;
	reg led8;
	reg [1:0] driveState;
	reg direction;

	// Instantiate the Unit Under Test (UUT)
	Drive uut (
		.clk(clk), 
		.rst(rst), 
		.colDetect(colDetect), 
		.dirControl(dirControl), 
		.veerSpeedPwm(veerSpeedPwm), 
		.fullSpeedPwm(fullSpeedPwm), 
		.hardSpeedPwm(hardSpeedPwm), 
		.ninetySpeedPwm(ninetySpeedPwm), 
		.ninetyFastSpeedPwm(ninetyFastSpeedPwm), 
		.tdDir(tdDir), 
		.hbIn1(hbIn1), 
		.hbIn2(hbIn2), 
		.hbIn3(hbIn3), 
		.hbIn4(hbIn4), 
		.hbEnA(hbEnA), 
		.hbEnB(hbEnB), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7), 
		.led8(led8), 
		.driveState(driveState), 
		.direction(direction)
	);
	
	`include "parameters.vh"

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		colDetect = 1;
		dirControl = 0;
		veerSpeedPwm = 0;
		fullSpeedPwm = 0;
		hardSpeedPwm = 0;
		ninetySpeedPwm = 0;
		ninetyFastSpeedPwm = 0;
		tdDir = 0;
		
		// Initalize Outputs
		led4 = 0;
	   led5 = 0;
	   led6 = 0;
	   led7 = 0;
	   led8 = 0;
      driveState = 0;
	   direction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#20000000 dirControl = 0;
		#20000000 dirControl = 1;
		#20000000 dirControl = 2;
		#20000000 dirControl = 3;
		#20000000 dirControl = 4;
		#20000000 dirControl = 5;
		#20000000 dirControl = 6;
		#20000000 dirControl = 7;
		#20000000 dirControl = 8;
		#20000000 dirControl = 9;
		#20000000 dirControl = 10;
		#20000000 dirControl = 11;
		direction = 1;
		#20000000 dirControl = 0;
		#20000000 dirControl = 1;
		#20000000 dirControl = 2;
		#20000000 dirControl = 3;
		#20000000 dirControl = 4;
		#20000000 dirControl = 5;
		#20000000 dirControl = 6;
		#20000000 dirControl = 7;
		#20000000 dirControl = 8;
		#20000000 dirControl = 9;
		#20000000 dirControl = 10;
		#20000000 dirControl = 11;
		#20000000 dirControl = 12;

	end
	
	always begin
		#20 clk = ~clk;
	end
	always begin
		#2000000 veerSpeedPwm = ~veerSpeedPwm;
	end
	always begin
		#3000000 fullSpeedPwm = ~fullSpeedPwm;
	end
	always begin
		#4000000 hardSpeedPwm = ~hardSpeedPwm;
	end
	always begin
		#5000000 ninetySpeedPwm = ~ninetySpeedPwm;
	end
	always begin
		#6000000 ninetyFastSpeedPwm = ~ninetyFastSpeedPwm;
	end
      
endmodule

