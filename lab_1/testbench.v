`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:16:22 02/15/2022 
// Design Name: 
// Module Name:    testbench 
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
module testbench(
    );

	// Inputs
	reg clk;
	reg reset_n;

	// Instantiate the Unit Under Test (UUT)
	
	soc dut(
		.clk(clk),
		.reset_n(reset_n)
	);

endmodule
