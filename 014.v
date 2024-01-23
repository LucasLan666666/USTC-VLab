module top_module (
    input  wire [3:0] in,
    output wire       out_and,
    output wire       out_or,
    output wire       out_xor
);
    assign out_and = &in; // &in 可以直接对 in 的所有位执行按位与操作
    assign  out_or = |in;
    assign out_xor = ^in;
endmodule
