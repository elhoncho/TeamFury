`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:23:59 12/01/2016
// Design Name:   bcd
// Module Name:   C:/Users/Denton/Desktop/TeamFury/bcdTestFixture.v
// Project Name:  TeamFury
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcdTestFixture;

	// Inputs
	reg clk;
	reg [25:0] number;

	// Outputs
	wire [3:0] one;
	wire [3:0] ten;
	wire [3:0] hundred;
	wire [3:0] thousand;
	wire [3:0] tenThousand;
	wire [3:0] hundredThousand;
	wire [3:0] mil;
	wire [3:0] tenMil;

	// Instantiate the Unit Under Test (UUT)
	bcd uut (
		.clk(clk), 
		.number(number), 
		.one(one), 
		.ten(ten), 
		.hundred(hundred), 
		.thousand(thousand), 
		.tenThousand(tenThousand), 
		.hundredThousand(hundredThousand), 
		.mil(mil), 
		.tenMil(tenMil)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		number = 1337;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   
	always begin
		#20 clk = ~clk;
	end
	
endmodule

