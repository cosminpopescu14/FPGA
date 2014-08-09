`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:23 08/04/2014 
// Design Name: 
// Module Name:    intensitateled 
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
module intensitateled(
		input CLK,
		input [7:0] p,
		
		output o
		
    );
wire [29 : 0] q;
	 
numarator N(
	.CLK(CLK),
	.q(q)
);

assign o = ~(p <  q[7:0]);

endmodule
