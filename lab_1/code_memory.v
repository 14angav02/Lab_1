`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:20:56 02/15/2022 
// Design Name: 
// Module Name:    code_memory 
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
module code_memory(
	input [31:0] address,
	output [31:0] data,
	input cs
    );

	reg [31:0] memory [262143:0];
	
	assign data = (cs == 1'b1) ? memory[address[31:2]] : 32'h00000000;

endmodule
