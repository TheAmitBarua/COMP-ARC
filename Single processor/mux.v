`include "control.v"


module mux(input [4:0] a, b, input high_a, output [4:0] out);
    assign out = high_a ? a : b;
endmodule