`include "control.v"

module instruction_memory (input [31:0] address, output [31:0] instruction);
    reg [31:0] mem [32'h0100000: 32'h0101000];
    initial begin
        $readmemh("add_test.v", mem);
    end

    assign instruction = mem[address[31:2]];
endmodule