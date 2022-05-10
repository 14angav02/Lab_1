`include "Commands.vh"

module ALU
(
    input  [31:0] srcA,
    input  [31:0] srcB,
    input  [ 3:0] oper,
    output        zero,
	 output        less_then_zero
    output reg [31:0] result
);

    always @ (*) begin
        case (oper)
            default   : result =   srcA + srcB;
            `ALU_ADD  : result =   srcA + srcB;
            `ALU_OR   : result =   srcA | srcB;
            `ALU_NOR  : result = ~(srcA | srcB);
            `ALU_SRL  : result =   srcA >> srcB [4:0];
            `ALU_SLL  : result =   srcA << srcB [4:0];
            `ALU_SLT  : result =  (srcA < srcB) ? 1 : 0;
            `ALU_SUB  : result =   srcA - srcB;
            `ALU_SRA  : result =   srcA >>> srcB[4:0];
            `ALU_XOR  : result =   srcA ^ srcB;
            `ALU_AND  : result =   srcA & srcB;
        endcase
    end

    assign zero   = (result == 0);
	 assign less_then_zero   = result[31];
endmodule