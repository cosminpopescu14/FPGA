`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:11 08/03/2014 
// Design Name: 
// Module Name:    display7 
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
module display7(

		input [3:0] in,
		output [7:0] c,
		output [3:0] AN
    );
	 
	 always @ (in) begin
		case(in)
		
			4'b0000:c=8'b11000000;
			4'b0001:c=8'b11111001;
			4'b0010:c=8'b10100100;
			4'b0011:c=8'b10110000;
			4'b0100:c=8'b10011011;
			4'b0101:c=8'b10010010;
			4'b0110:c=8'b10000010;
			4'b0111:c=8'b10111000;
			4'b1000:c=8'b10000000;
			4'b1001:c=8'b10000000;
			4'b1010:c=8'b10001000;
			4'b1011:c=8'b11110001;
			4'b1100:c=8'b11000110;
			4'b1101:c=8'b11000000;
		endcase
	end
			

endmodule
