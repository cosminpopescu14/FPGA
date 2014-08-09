`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:56 08/03/2014 
// Design Name: 
// Module Name:    ex5 
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
module ex5(
input [3:0] in,
output reg [7:0] c,
output an[3:0]
    );
always @(in) begin
case (in)
4'h0:c=8'b11000000;
4'h1:c=8'b11111001;
4'h2:c=8'b10100100;
4'h3:c=8'b10110000;
4'h4:c=8'b10011001;
4'h5:c=8'b10010010;
4'h6:c=8'b10000010;
4'h7:c=8'b11111000;
4'h8:c=8'b10000000;
4'h9:c=8'b10010000;
4'hA:c=8'b10001000;
4'hB:c=8'b10000011;
4'hC:c=8'b11000110;
4'hD:c=8'b10100001;
4'hE:c=8'b10000110;
4'hF:c=8'b10001110;
endcase
end

assign an[0]= 0;
assign an[1]= 1;
assign an[2]= 1;
assign an[3]= 1;

endmodule
