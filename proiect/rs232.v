`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:16 08/09/2014 
// Design Name: 
// Module Name:    rs232 
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
module rs232_transmit(

		input clk,
		input start ,
		input [7 : 0] data,
		output  ser,
		output done
		

);


// Start signal tells it to start sending bits
		//reg start = 0 ;

//The bits of data to send
		//reg[7:0] data = 0;

/////////////////////////////////////////////////////////////////////////////
// Serial port clock generator
// Generate a 9600 baud clock signal for the serial port by dividing the
// 100Mhz clock by 10416

		reg [13:0] clockdiv = 0; //= 0;//initial 15 biti

// Count from 0..10416 then reset back to zero
		always @ (posedge clk) begin
		
				if (clockdiv == 10950)
					 clockdiv <= 0;
				else
						clockdiv <= clockdiv + 1;
	 end

// The serclock is a short pulse each time we are reset
wire serclock = (clockdiv == 0);

/////////////////////////////////////////////////////////////////////////////
// Serial port state machine
// Only start the state machine when "start" is set. Only advance to the
// next state when serclock is set.

reg [3:0] state;

always @(posedge clk)
begin
   case (state)
        4'b0000: if (start) state <= 4'b0001;
        4'b0001: if (serclock) state <= 4'b0010;    // Start bit
        4'b0010: if (serclock) state <= 4'b0011;    // Bit 0
        4'b0011: if (serclock) state <= 4'b0100;    // Bit 1
        4'b0100: if (serclock) state <= 4'b0101;    // Bit 2
        4'b0101: if (serclock) state <= 4'b0110;    // Bit 3
        4'b0110: if (serclock) state <= 4'b0111;    // Bit 4
        4'b0111: if (serclock) state <= 4'b1000;    // Bit 5
        4'b1000: if (serclock) state <= 4'b1001;    // Bit 6
        4'b1001: if (serclock) state <= 4'b1010;   // Bit 7
        4'b1010: if (serclock) state <= 4'b0000;    // Stop bit 0010
        default: state <= 4'b0000;                  // Undefined, skip to stop
    endcase
end

assign done = (state==4'b1010 & serclock == 1) ? 1:0;

///////////////////////////////////////////////////////////////////////////////
// Serial port data
// Ensure that the serial port has the correct data on it in each state

reg outbit;

always @(posedge clk)
begin
    case (state)
         4'b0000: outbit <= 1;              // idle
         4'b0001: outbit <= 0;              // Start bit
         4'b0010: outbit <= data[0];        // Bit 0
         4'b0011: outbit <= data[1];        // Bit 1
         4'b0100: outbit <= data[2];        // Bit 2
         4'b0101: outbit <= data[3];        // Bit 3
         4'b0110: outbit <= data[4];        // Bit 4
         4'b0111: outbit <= data[5];        // Bit 5
         4'b1000: outbit <= data[6];        // Bit 6
         4'b1001: outbit <= data[7];        // Bit 7
         4'b1010: outbit <= 1;          // Stop bit outbit 1<= 
         default: outbit <= 1;          // Bad state output idle
    endcase
end

// Output register to pin
assign ser = outbit;




endmodule
