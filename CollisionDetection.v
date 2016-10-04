`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:56 10/03/2016 
// Design Name: 
// Module Name:    colDetect 
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
module colDetect(
	input clk,
	output sens1, sens2	
    );
	 
parameter driveForward = 1'b0;
parameter driveBackward = 1'b0;
parameter stopF = 1'b1;
parameter stopB = 1'b1;  

reg regSens1; 
reg regSens2;
reg [1:0] state;  

assign sens1 = regSens1;
assign sens2 = regSens2; 

always @(posedge clk)
	begin 
		if (regSens1) begin 
			state <= driveForward; 
		end 
		else	
		state <= stopF; 
	end 
	
always @(posedge clk
	begin
		if (regSens2) begin
			state <= driveBackward ;
		end
		else 
			state <= stopB; 
	end
	
		case (state)  
			 driveForward: begin 
			   regSens1 = 1;
			 end
 	
			 stopF: begin			
				regSens1 = 1;
			 end
			
			driveBackward: begin 
			   regSens2 = 1;
			 end
 	
			 stopB: begin			
				regSens2 = 1;
			 end
		 endcase 
		
	end
endmodule