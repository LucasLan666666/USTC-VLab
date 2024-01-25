`timescale 1ns / 1ns

module tb (
);
    reg a, b;

    initial begin
        a = 1'b1;
        b = 1'b0;
        #10 b = 1'b1;
        #10 a = 1'b0;
        #10 b = 1'b0;
        #10 a = 1'b1;
    end
endmodule
