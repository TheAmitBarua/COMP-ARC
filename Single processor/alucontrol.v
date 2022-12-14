`include "control.v"

module ALU_control (input [3:0] aluop_from_control,
                    input [5:0] functioncode,
                    input rtype,
                    output reg [3:0] aluop_out);
    always @(*) begin
        if (rtype) begin
            case(functioncode)
                6'b100100: aluop_out = 4'b0000;
                6'b100101: aluop_out = 4'b0001;
                6'b001101: aluop_out = 4'b0001;
                6'b100000: aluop_out = 4'b0010;
                6'b001000: aluop_out = 4'b0010;
                6'b100001: aluop_out = 4'b0010; //TODO Differentiate this from addi
                6'b100011: aluop_out = 4'b0010;
                6'b101011: aluop_out = 4'b0010;
                6'b100010: aluop_out = 4'b0110;
                6'b000100: aluop_out = 4'b0110;
                6'b000101: aluop_out = 4'b0110;
                6'b101010: aluop_out = 4'b0111;
                6'b001100: aluop_out = 4'b0010;
                default: aluop_out = 4'bxxxx;
            endcase
        end
        else begin
            aluop_out = aluop_from_control;
        end
    end
endmodule   

