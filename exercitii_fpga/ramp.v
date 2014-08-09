`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:28 08/04/2014 
// Design Name: 
// Module Name:    ramp 
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
module ramp(
		
		output o,
		input CLK

    );
	
	wire [29:0] q;
	 numarator N (
			.CLK(CLK),
			.q(q)
	 );
	 
	 intensitateled i(
	 .CLK(CLK),
	 .p(q[28:21]),
	
	  .o(o)
	 );
	
endmodule
