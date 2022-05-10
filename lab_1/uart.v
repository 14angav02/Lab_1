`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:23:46 02/15/2022 
// Design Name: 
// Module Name:    uart 
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
module uart(
	input reset_n,
	input clk,
	input [31:0] address,
	input [31:0] data_in,
	output [31:0] data_out,
	input cs,
	input we
    );
	 
localparam control_addr 	= 32'hFFF00000;
localparam receive_addr 	= 32'hFFF00004;
localparam send_addr 		= 32'hFFF00008;

localparam send_bit			= 0;
localparam receive_bit		= 1;
localparam burst_mode_bit	= 2;
	 
reg [31:0] control;
reg [31:0] receive;
reg [31:0] send;

reg [31:0] control_sh;
reg [31:0] receive_sh;
reg [31:0] send_sh;

reg [31:0] counter;
reg [3:0] state;

wire send_flag = control[send_bit];
wire burst_flag = control[burst_mode_bit];

assign data_out = (address == control_addr && cs == 1'b1) ? control : 32'hZZZZZZZZ;
assign data_out = (address == receive_addr && cs == 1'b1) ? receive : 32'hZZZZZZZZ;
assign data_out = (address == send_addr && cs == 1'b1) ? send : 32'hZZZZZZZZ;

always @(posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		control <= 32'd0;
		receive <= 32'd0;
		send <= 32'd0;
		
		counter <= 32'd0;
		state = 4'd0;
	end
	else
	begin
		if(cs == 1'b1 && we == 1'b1)
		begin
			if(address == control_addr && control[send_bit] == 1'b0)
			begin
				control <= data_in;
			end
			
			if(address == send_addr && control[send_bit] == 1'b0)
			begin
				send <= data_in;
			end
			
			if(address == receive_addr)
			begin
				receive <= data_in;
				control[receive_bit] <= 1'b0;
			end
		end
	end
end

always @(posedge clk)
begin
	case(state)
		4'd0:
		begin
			if(control[send_bit] == 1'b1)
			begin
				state <= 4'd1;
				send_sh <= send;
				counter <= (control[burst_mode_bit] == 1'b1) ? 32'd127 : 32'd31;
			end
		end
		
		4'd1:
		begin
			counter <= (counter == 32'd0) ? counter : counter - 32'd1;
			send_sh <= {1'b0, send_sh[31:1]};
			control[send_bit] <= (counter == 32'd0) ? 1'b0 : 1'b1;
			state <= (counter == 32'd0) ? 4'd0 : 4'd1;
		end
	endcase
end

endmodule
