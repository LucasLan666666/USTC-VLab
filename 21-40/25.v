module top_module (
    input  wire [31:0] a,
    input  wire [31:0] b,
    output wire [31:0] sum
);

    wire [31:0] adder_a;
    wire [31:0] adder_b;
    wire [ 1:0] adder_cin;
    wire [31:0] adder_result;
    wire [ 1:0] adder_cout;

    assign      adder_a = a;
    assign      adder_b = b;
    assign adder_cin[0] = 1'b0;
    assign adder_cin[1] = adder_cout[0];

    add16 inst_add16_0 (
        .a       (adder_a[15:0]     ),
        .b       (adder_b[15:0]     ),
        .cin     (adder_cin[0]      ),
        .sum     (adder_result[15:0]),
        .cout    (adder_cout[0]     )
    );
    add16 inst_add16_1 (
        .a       (adder_a[31:16]     ),
        .b       (adder_b[31:16]     ),
        .cin     (adder_cin[1]       ),
        .sum     (adder_result[31:16]),
        .cout    (adder_cout[1]      )
    );

    assign sum = adder_result;

endmodule


module add1 (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

    assign {cout, sum} = a + b + cin;

endmodule
