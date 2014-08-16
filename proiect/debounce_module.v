`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:51 08/12/2014 
// Design Name: 
// Module Name:    debounce_module 
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
module debounce_module(
   output o,
	input clk,
	input in
);
 
parameter limit = 20'd650000;
 
reg [19:0] counter;
reg hit;
 
assign o = (counter == limit);
 
always@(posedge clk) begin
        if(!in) begin
		counter <= 0;
		hit <= 0;        
        end else if(counter == limit) begin
		hit <= 1;
		counter <= counter + 1;
	end else if(in & !hit) begin
		counter <= counter + 1;
	end
end


endmodule
