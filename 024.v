module add16 (
    input  wire [15: 0] a,
    input  wire [15: 0] b,
    input  wire         cin,
    output wire [15: 0] sum,
    output wire         cout
);
    assign {cout, sum} = a + b + cin;
endmodule


module top_module(
    input  wire [31: 0] a,
    input  wire [31: 0] b,
    output wire [31: 0] sum
);
    wire c;

    add16 low (
        .a       (a[15: 0]  ),
        .b       (b[15: 0]  ),
        .cin     (1'b0      ),
        .sum     (sum[15: 0]),
        .cout    (c         )
    );
    add16 high (
        .a      (a[31:16]  ),
        .b      (b[31:16]  ),
        .cin    (c         ),
        .sum    (sum[31:16])
    );
endmodule
