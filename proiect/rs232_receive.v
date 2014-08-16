`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:04 08/12/2014 
// Design Name: 
// Module Name:    rs232_receive 
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
module rs232_receive(
    input clk,
	 input serial_in,
	 output reg [7:0]serial_out,
	 output valid
	 
	 
	 );
reg [3:0]state;
reg a;
wire detect_start;


	always @(posedge clk) begin
a<=serial_in;
	end
 
 assign detect_start=a&~(serial_in);
	
	reg [14:0] q = 0; 


	always @(posedge clk)
	
	case(state)
  4'b0000: if(detect_start)  begin
  state <= 4'b1000; // start bit found?
  q <=15625;
   end
	else
	q<=q-1;
  
  4'b1000: if(q==0) begin
	state <= 4'b1001; // bit 0
	q<=10416;
	serial_out[0]<=serial_in;
  end
  else
  q<=q-1;
 
 4'b1001: if(q==0) begin
  state <= 4'b1010; // bit 1
  q<=10416;
  serial_out[1]<=serial_in;
  end
  else 
  q<=q-1;
  
  4'b1010: if(q==0) begin
  state <= 4'b1011; // bit 2
  q<=10416;
  serial_out[2]<=serial_in;
  end
  else
  q<=q-1;

  4'b1011: if(q==0) begin
  state <= 4'b1100; // bit 3
  q<=10416;
  serial_out[3]<=serial_in;
  end
  else
  q<=q-1;

 
	4'b1100: if(q==0) begin 
	state <= 4'b1101; // bit 4
	q<=10416;
	serial_out[4]<=serial_in;
  end
  else
  q<=q-1;
  
  4'b1101: if(q==0) begin
  state <= 4'b1110; // bit 5
  q<=10416;
  serial_out[5]<=serial_in;
 end
 else
 q<=q-1;
 
  4'b1110: if(q==0) begin
  state <= 4'b1111; // bit 6
  q<=10416;
  serial_out[6]<=serial_in;
  end
  else
  q<=q-1;
 
 4'b1111: if(q==0) begin
  state <= 4'b0001; // bit 7
  q<=10416;
  serial_out[7]<=serial_in;
  end
  else
  q<=q-1;
  
  4'b0001: if(q==0) begin
  state <= 4'b0000; // stop bit
  q<=15625;
  end
  else
  q<=q-1;
 default: state <= 4'b0000;
	endcase

assign valid=(state==4'b0001 & q==0) ? 1:0;
	endmodule
