`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:51:07 09/02/2016 
// Design Name: 
// Module Name:    Test1 
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

module mag_sw(
		output led0, led1, led2, led3, led4, led5, led6, led7,
		output reg [7:0]LEDS,
	   output seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, seg_dp,	
		input RFS, LFS, RRS, LRS,
		input SW0
);
assign led0 = LEDS[0];
assign led1 = LEDS[1];
assign led2 = LEDS[2];
assign led3 = LEDS[3];
assign led4 = LEDS[4];
assign led5 = LEDS[5];
assign led6 = LEDS[6];
assign led7 = LEDS[7];

initial begin
LEDS = 8'b0000_0000;
end

always @(*)
begin
if (SW0) //Forward motion detected
begin
	if(RFS == 0)
		begin
		if (LFS == 0)
	       LEDS = 8'b1111_1111; //proceed
		else
		  LEDS = 8'b1111_0000; //Turn left
		end
	else if(LFS == 0)
		  begin
	     LEDS = 8'b0000_1111; //Turn right
		  end
   else begin
		 LEDS = 8'b0000_0000; //Stop
	     end
	
   end
else if (~SW0) //Reverse motion detected
		begin
			if(RRS == 0)
			begin
			if (LRS == 0)
				LEDS = 8'b1111_1111; //proceed
			else
			LEDS = 8'b1111_0000; //Turn left
			end
			else if(LRS == 0)
			begin
			LEDS = 8'b0000_1111; //Turn right
			end
			else begin
			LEDS = 8'b0000_0000; //Stop
			end
		end
end		

assign seg_a = 1;
assign seg_b = 1;
assign seg_c = 1;
assign seg_d = 1;
assign seg_e = 1;
assign seg_f = 1;
assign seg_g = 1;
assign seg_dp = 1;



endmodule
