module top_module (
    input  wire [7:0] in,
    output wire [7:0] parity
);
    assign parity = ^in[7:0]; // 归约运算符
endmodule
