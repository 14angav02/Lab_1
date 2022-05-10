`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:21:31 02/15/2022 
// Design Name: 
// Module Name:    data_memory 
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
module data_memory(
	input clk,
	input [31:0] address,
	input [31:0] data_in,
	output [31:0] data_out,
	input cs,
	input we
    );
	 
	localparam address_offset = 30'h040000;
	 
	reg [31:0] memory [262143:0];

	assign data_out = (cs == 1'b1) ? memory[address[31:2] - address_offset] : 32'hzzzzzzzz;
	
	always @(clk)
	begin
		if(we == 1'b1 && cs == 1'b1)
		begin
			memory[address[31:2] - address_offset] <= data_in;
		end
	end

endmodule
