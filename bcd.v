`timescale 1ns / 1ps

module bcd(
	input clk,
   input  [25:0] number,   
   output reg [3:0] one,
	output reg [3:0] ten,
	output reg [3:0] hundred,
	output reg [3:0] thousand,
	output reg [3:0] tenThousand,
	output reg [3:0] hundredThousand,
	output reg [3:0] mil,
	output reg [3:0] tenMil
	);
   
   // Internal variable for storing bits
   reg [57:0] shift = 0;
   reg [4:0] count = 0;
   
   always @(posedge clk)begin
      // Clear previous number and store new number in shift register
      if(count == 0)begin
			shift[57:26] = 0;
			shift[25:0] = number;
			count <= count + 1;
      end
		else begin
			count <= count + 1;
			if(count <= 26) begin
				if (shift[29:26] >= 5)
					shift[29:26] = shift[29:26] + 3;
					
				if (shift[33:30] >= 5)
					shift[33:30] = shift[33:30] + 3;
				
				if (shift[37:34] >= 5)
					shift[37:34] = shift[37:34] + 3;
					
				if (shift[41:38] >= 5)
					shift[41:38] = shift[41:38] + 3;
				
				if (shift[45:42] >= 5)
					shift[45:42] = shift[45:42] + 3;
					
				if (shift[49:46] >= 5)
					shift[49:46] = shift[49:46] + 3;
					
				if (shift[53:50] >= 5)
					shift[53:50] = shift[53:50] + 3;
					
				if (shift[57:54] >= 5)
					shift[57:54] = shift[57:54] + 3;
					
				// Shift entire register left once
				shift = shift << 1;
			end
			else begin
				count <= 0;
				
				// Push decimal numbers to output
				one = shift[29:26];
				ten = shift[33:30];
				hundred = shift[37:34];
				thousand = shift[41:38];
				tenThousand = shift[45:42];
				hundredThousand = shift[49:46];
				mil = shift[53:50];
				tenMil = shift[57:54];
			end
		end
   end

endmodule