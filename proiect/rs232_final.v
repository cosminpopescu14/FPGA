`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:25 08/13/2014 
// Design Name: 
// Module Name:    rs232_final 
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
module rs232_final(
			input clk,
			input [7:0]data_transmit,
			input start_transmit,
			input serial_in,
			output serial_out,	
			output [7:0]data_receive,
			output valid,
			output transmit_done
    );
	 
rs232_transmit T(
		.clk(clk),
		.data(data_transmit),
		.start(start_transmit),
		.ser(serial_out),
	   .done(transmit_done)
); 

rs232_receive RX(
	.clk(clk),
	.serial_in(serial_in),
	.serial_out(data_receive),
	.valid(valid)
);


endmodule
