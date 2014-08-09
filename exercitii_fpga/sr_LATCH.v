`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:43 08/03/2014 
// Design Name: 
// Module Name:    sr_LATCH 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// set-restet latch
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sr_LATCH(
		input s, r,

		output q,
		output q_bar
    );
	 
	 wire w1;
	 wire w2;	 
	  nand N1(w1, s, w2);
	 
	  nand N2(w2, r, w1);
	 
	 assign q = w2;
	 assign q_bar = w1;


endmodule
