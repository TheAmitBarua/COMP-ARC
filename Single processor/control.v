//`include "alucontrol.v"


module control (input [31:26] opcode,
                output reg regdst,jump,
                branch,memread,memtoreg,
                output reg [3:0] aluop,
                output reg rtype, memwrite,
                alusrc,regwrite,invertzero);
    initial begin
        regdst <= 0;
        jump <= 0;
        branch <= 0;
        memread <= 0;
        memtoreg <= 0;
        aluop <= 0;
        rtype <= 0;
        memwrite <= 0;
        alusrc <= 0;
        regwrite <= 0;
        invertzero <= 0;
    end
    always @(opcode) begin

        regdst <= (opcode == 6'b001000 || opcode == 6'b001101 || opcode == 6'b100011) ? 0 : 1;


        jump <= (opcode == 6'b000010||opcode == 6'b000011) ? 1 : 0;


        branch <= (opcode ==6'b000100||opcode == 6'b000101) ? 1 : 0;


        memread <= (opcode ==6'b100011) ? 1 : 0;


        memtoreg <= (opcode == 6'b100011) ? 1 : 0;

        case(opcode)
            6'b100100: aluop = 4'b0000;
            6'b100101: aluop = 4'b0001;
            6'b001101: aluop = 4'b0001;
            6'b100000: aluop = 4'b0010;
            6'b001000: aluop = 4'b0010;
            6'b001001: aluop = 4'b0010; //TODO The alu needs to differentiate addi addiu
            6'b100011: aluop = 4'b0010;
            6'b101011: aluop = 4'b0010;
            6'b100010: aluop = 4'b0110;
            6'b000100: aluop = 4'b0110;
            6'b000101: aluop = 4'b0110;
            6'b101010: aluop = 4'b0111;
            default: aluop = 4'bxxxx;
        endcase;

        rtype <= (opcode == 6'h0) ? 1 : 0;


        memwrite <= (opcode ==6'b101011) ? 1 : 0;

 
        alusrc <= (opcode==6'b001000||opcode == 6'b001001||opcode==6'b001101||opcode==6'b100011||opcode==6'b101011)?1:0;

        regwrite <= (opcode == 6'b101011||opcode == 6'b000100||opcode == 6'b000101||opcode == 6'b000010||opcode == 6'b001000) ? 0 : 1;


        regdst <= (opcode == 6'b001000||opcode == 6'b001001||opcode == 6'b100011||opcode == 6'b001101) ? 0 : 1;


        invertzero <= (opcode == 6'b000101) ? 1 : 0;


    end
endmodule
