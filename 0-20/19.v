module top_module (
    input  wire a,
    input  wire b,
    output wire out
);
    mod_a inst_a (
        .in1    (a  ),
        .in2    (b  ),
        .out    (out)
    );
endmodule


module mod_a (
    input  wire in1,
    input  wire in2,
    output wire	out
);
    assign out = in1 & in2;
endmodule
