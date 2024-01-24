module top_module (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [7:0] c,
    input  wire [7:0] d,
    output wire [7:0] min
);
    wire [7:0] tmp_1;
    wire [7:0] tmp_2;

    assign tmp_1 = (a < b) ? a : b;
    assign tmp_2 = (c < d) ? c : d;
    assign   min = (tmp_1 < tmp_2) ? tmp_1 : tmp_2;
endmodule
