`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:12 02/15/2022 
// Design Name: 
// Module Name:    soc 
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
module soc(
	input clk,
	input reset_n
    );
	 
	wire rw;
	reg core_stop;
	wire unknown_command;
	
	wire cs_code;
	wire cs_data;
	wire cs_peripheral;
	
	wire [31:0] code;
	wire [31:0] code_addr;
	
	wire [31:0] data_out_mux;
	wire [31:0] data_out_per;
	wire [31:0] data_out_mem;
	wire [31:0] data_in;
	wire [31:0] data_addr;

	core_top uut (
		.clk(clk),
		.reset_n(reset_n),
		.data_in_bus_mem(data_out_mux),
		.data_out_bus_mem(data_in),
		.addr_data_bus_mem(data_addr),
		.rw(rw),
		.code_bus_mem(code),
		.addr_code_bus_mem(code_addr),
		.core_stop(core_stop),
		.unknown_command(unknown_command)
	);
	
	code_memory code_mem(
		.address(code_addr),
		.data(code),
		.cs(cs_code)
	);
	
	data_memory data_mem(
		.clk(clk),
		.address(data_addr),
		.data_in(data_in),
		.data_out(data_out_mem),
		.cs(1'b1),
		.we(rw & cs_data)
	);
	
	peripheral periph(
		.reset_n(reset_n),
		.clk(clk),
		.address(data_addr),
		.data_in(data_in),
		.data_out(data_out_per),
		.cs(1'b1),
		.we(rw & cs_peripheral)
	);
	
	assign cs_code = (code_addr[31:20] == 12'h000);
	assign cs_data = (data_addr[31:20] == 12'h001);
	assign cs_peripheral = (data_addr[31:20] == 12'hFFF);
	
	assign data_out_mux = (cs_data) ? data_out_mem : ((cs_peripheral) ? data_out_per : 32'hXXXXXXXX);
	//assign cs_data = (code_addr[31:20] == 12'h000);

endmodule
