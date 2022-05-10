`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:20:12 02/15/2022 
// Design Name: 
// Module Name:    core_top 
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
module core_top(
    input clk,
	 input reset_n,
	 input [31:0] data_in_bus_mem,
	 output [31:0] data_out_bus_mem,
	 output [31:0] addr_data_bus_mem,
	 output rw,
	 input [31:0] code_bus_mem,
	 output [31:0] addr_code_bus_mem,
	 input core_stop,
	 output unknown_command
    );


endmodule
