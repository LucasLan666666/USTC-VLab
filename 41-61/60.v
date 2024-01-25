`timescale 1ns / 1ns
module tb (
);
    wire [2:0] out;
    reg        clk;
    initial begin
        clk = 0;
    end

    always begin
        #5 clk = ~clk;
    end
    always begin
        #100 $finish;
    end

    dut init (
        .clk(clk),
        .out(out)
    );
endmodule


module dut (
    input  wire       clk,
    output  reg [2:0] out
);
    always @(posedge clk)
        out <= out + 1'b1;
endmodule
