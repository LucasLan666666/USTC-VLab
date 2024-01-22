module top_module (
    input  wire [31:0] x,
    output wire [31:0] y
);
    wire   [31:0] i, j, k;

    assign i = x - 1'b1; // 通过 -1 操作，把最后一个 1 变为 0，并把更低位的所有 0 变为 1
    assign j = x & i;    // 再和之前的自己按位与，就去掉最低位的 1 了
    assign k = j - 1'b1; // 将此操作重复一次，即可去掉最后两个 1
    assign y = j & k;
endmodule
