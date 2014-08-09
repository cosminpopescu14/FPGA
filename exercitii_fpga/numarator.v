`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:23 08/04/2014 
// Design Name: 
// Module Name:    numarator 
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
module numarator(
		input CLK,
		output reg [7:0] q
	
    );
	 
always @ (posedge CLK) begin
			q <= q + 1;
 end


endmodule
