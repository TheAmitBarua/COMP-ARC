`include "control.v"

module PC (input [31:0] new_pc, input clk, output reg [31:0] PC);
    initial begin
        PC = 32'h00400020;
    end
    always @(posedge clk) begin
        PC = new_pc;
    end
endmodule