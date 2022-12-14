`include "control.v"
`include "alucontrol.v"

module SYSCALL_controller(input [31:0]instruction, input clk, output reg syscall);
    initial
    syscall <= 0;

    always @(negedge clk) begin
  
        syscall = (instruction == {28'h0,`SYSCALL}) ? 1 : 0;
    end
endmodule