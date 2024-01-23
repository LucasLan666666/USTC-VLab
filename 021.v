module mod_a (
    input  wire in1,
    input  wire in2,
    input  wire in3,
    input  wire in4,
    output wire out1,
    output wire out2
);
    assign out1 = in1 & in2 & in3 & in4;
    assign out2 = in1 | in2 | in3 | in4;
endmodule


module top_module ( 
	input  wire a,
    input  wire b,
    input  wire c,
    input  wire d,
    output wire out1,
    output wire out2
);
	mod_a inst_a (
        .in1     (a   ),
        .in2     (b   ),
        .in3     (c   ),
        .in4     (d   ),
        .out1    (out1),
        .out2    (out2)
    );
endmodule
