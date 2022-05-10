`timescale 1ns/1ps
module ALU_tb ();
logic [31:0] srcA;
logic [31:0] srcB;
logic [ 3:0] oper;
logic        zero;
logic [31:0] result;
logic        clk;
logic        rst;
logic        pre_zero;
logic [31:0] pre_result;
reg [9:0] counter;
logic [102:0] testvectors [343:0];
integer i=0;
integer stopcount = 343;
int fd;

ALU dut (
    .srcA(srcA),
    .srcB(srcB),
    .oper(oper),
    .zero(zero),
    .result(result)
);


initial begin
    $readmemb ("ALU_testvectors.tv", testvectors);
    fd=$fopen("ALU_testlog.txt","w");
    srcA = 32'b0;
    srcB = 32'b0;
    oper =  3'b0;
    zero =  1'b0;
    result = 32'b0;
    clk=1'b0;
    i=0;
end
always #2 clk = ~clk;
always @ (posedge clk or negedge rst) begin
{srcA,srcB,oper,pre_zero,pre_result} = testvectors[i];
#10;
$fdisplay (fd, " Test of operation: ");
case (oper)
4'b0000 : $fdisplay (fd, "ADD\n");
4'b0001 : $fdisplay (fd, "OR \n");
4'b0010 : $fdisplay (fd, "NOR\n");
4'b0011 : $fdisplay (fd, "SRL\n");
4'b0100 : $fdisplay (fd, "SLL\n");
4'b0101 : $fdisplay (fd, "SLT\n");
4'b0110 : $fdisplay (fd, "SUB\n");
4'b0111 : $fdisplay (fd, "SRA\n");
4'b1000 : $fdisplay (fd, "XOR\n");
4'b1001 : $fdisplay (fd, "AND\n");
default : $fdisplay (fd, "default function\n");
endcase
$fdisplay(fd, "srcA: %b\nsrcB: %b\npre_zero: %b\n    zero: %b\npre_result: %b\n    result: %b\n",srcA,srcB,pre_zero,zero,pre_result,result);
if (pre_zero == zero) begin
    $fdisplay(fd, "zero OK\n");
end
else begin
    $fdisplay(fd, "zero ERROR\n");
end
if (pre_result == result) begin
    $fdisplay(fd, "result OK\n");
end
else begin
    $fdisplay(fd, "result ERROR\n");
end
$fdisplay(fd,"\n\n\n\n");

if (i == stopcount) begin
    $fclose(fd);
    $stop;
end
i=i+1;
end
endmodule

