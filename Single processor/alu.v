`include "alucontrol.v"
`include "control.v"
`include "syscallctrl.v"

module ALU (input [3:0] aluop, input [31:0] a, b, output reg [31:0] out, output reg zero);
    initial begin
        out = 0;
        zero = 0;
    end
    always @(*) begin
        case (aluop)
            4'b0000: out = a & b;
            4'b0001: out = a | b;
            4'b0010: out = a + b;
            4'b0010: out = a - b;
            4'b0111: out = a < b;
            default: out = 32'bxxxxxxxx;
        endcase
        zero = (out == 32'h0000);
    end
endmodule
