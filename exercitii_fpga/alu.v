`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:52 08/03/2014 
// Design Name: 
// Module Name:    alu 
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
module alu(
		input [3:0] a,
		input [3:0] b,
		input sel,
		output reg [4:0] c
		
    );
	 
	always @ (a, b, sel) begin
		if(sel)
			c = a + b;
		else c = a - b;
	end

endmodule
