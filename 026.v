module top_module (
    input  wire [31:0] a,
    input  wire [31:0] b,
    output wire [31:0] sum
);
    wire [ 2:0] cin;
    wire [ 2:0] cout;
    wire [15:0] sum_low;
    wire [15:0] sum_high;
    wire [31:0] sum_high_2;

    assign cin = 3'b100;
    assign sum_high = (cout[0] == 1) ? sum_high_2[31:16] : sum_high_2[15:0];
    assign sum = {sum_high, sum_low};

    add16 inst_0 (
        .a       (a[15:0]      ),
        .b       (b[15:0]      ),
        .cin     (cin[0]       ),
        .cout    (cout[0]      ),
        .sum     (sum_low[15:0])
    );
    add16 inst_1 (
        .a       (a[31:16]        ),
        .b       (b[31:16]        ),
        .cin     (cin[1]          ),
        .cout    (cout[1]         ),
        .sum     (sum_high_2[15:0])
    );
    add16 inst_2 (
        .a       (a[31:16]         ),
        .b       (b[31:16]         ),
        .cin     (cin[2]           ),
        .cout    (cout[2]          ),
        .sum     (sum_high_2[31:16])
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
