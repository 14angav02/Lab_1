`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:23:10 02/15/2022 
// Design Name: 
// Module Name:    peripheral 
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
module peripheral(
	input reset_n,
	input clk,
	input [31:0] address,
	input [31:0] data_in,
	output [31:0] data_out,
	input cs,
	input we
    ); 

	uart uart_instance(
		.reset_n(reset_n),
		.clk(clk),
		.address(address),
		.data_in(data_in),
		.data_out(data_out),
		.cs(),
		.we(we)
	);

endmodule
