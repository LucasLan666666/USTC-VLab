module top_module(
    input  [31:0] a,
    input  [31:0] b,
    input         sub,
    output [31:0] sum
);
    wire [ 1:0] cin;
    wire [ 1:0] cout;
    wire [31:0] b2;

    assign cin = {cout[0], sub};
    assign  b2 = b ^ {32{sub}};

    add16 inst_0 (
        .a      (a[15: 0]  ),
        .b      (b2[15: 0] ),
        .cin    (cin[0]    ),
        .sum    (sum[15: 0]),
        .cout   (cout[0]   )
    );
    add16 inst_1 (
        .a      (a[31:16]  ),
        .b      (b2[31:16] ),
        .cin    (cin[1]    ),
        .sum    (sum[31:16]),
        .cout   (cout[1]   )
    );
endmodule


module add16 (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);
	assign {cout, sum} = a + b + cin;
endmodule
