`timescale 1ns / 1ps

module PulseWidthModulationTestFixture;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire fullSpeedPwm;
	wire veerSpeedPwm;
	wire hardSpeedPwm;
	wire ninetySpeedPwm;
	wire ninetyFastSpeedPwm;

	// Instantiate the Unit Under Test (UUT)
	PulseWidthModulation uut (
		.clk(clk), 
		.rst(rst), 
		.fullSpeedPwm(fullSpeedPwm), 
		.veerSpeedPwm(veerSpeedPwm), 
		.hardSpeedPwm(hardSpeedPwm), 
		.ninetySpeedPwm(ninetySpeedPwm), 
		.ninetyFastSpeedPwm(ninetyFastSpeedPwm)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$display("Hello World!");
	end
	
	always begin
		#20 clk = ~clk;
	end
      
endmodule

