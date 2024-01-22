module top_module (
    input  wire  a,
    input  wire  b,
    input  wire  c,
    input  wire  d,
    output wire  out,
    output wire  out_n
);
    wire x, y;
    assign x = a && b;
    assign y = c && d;
    assign out = x || y;
    assign out_n = ~out;
endmodule
