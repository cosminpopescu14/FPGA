`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:33 08/04/2014 
// Design Name: 
// Module Name:    cronometru 
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
module cronometru(
input clk,
output [7:0]c,
output [3:0]an
    );

wire [29:0] w;
 
clkex (
.clk(clk),
.q(w) );


seg (
.in(w[29:26]),
.c(c),
.an(an) );







endmodule
