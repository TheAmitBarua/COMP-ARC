module clock_gen(output reg clock);
    initial
        clock = 1'b0;
    always
        begin
            #100; 
            clock = ~clock;
        end
endmodule