`include "control.v"


module registers(input [25:21] read_reg1,
                input [20:16] read_reg2,
                input [15:11] write_reg,
                input [31:0] write_data,
                input regwrite,
                input syscall,
                input clk,
                output reg [31:0] read_data1, read_data2);
    reg [32:0] [32:0] reg_file;
    initial begin
        reg_file = 0;
        read_data1 = 0;
        read_data2 = 0;
    end

    reg [31:0] v0, a0;
    always @(*) begin
        v0 = reg_file[5'b00010];
        a0 = reg_file[5'b00100];
    end

    always @(negedge clk) begin
        read_data1 = reg_file[read_reg1];
        read_data2 = reg_file[read_reg2];
    end
    always @(posedge clk) begin
        if (regwrite) begin
            reg_file[write_reg] = write_data;
            reg_file[5'b00000] = 0; 
        end
        else begin
        end
    end
    always @(posedge syscall) begin
        case (reg_file[5'b00010])
            1/*print*/: $strobe("%d", reg_file[5'b00100]);
            10/*exit*/: $finish;
        default: $display("unsupported syscall code:%h", reg_file[5'b00010]);
        endcase;
    end
endmodule
