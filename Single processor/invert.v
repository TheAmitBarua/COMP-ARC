`include "control.v"
//takes input if control is 1 and outputs the inverse

module inverter(input in, control, output reg out);
    always @(*) begin
        out = (control) ? ~in : in;
    end
endmodule