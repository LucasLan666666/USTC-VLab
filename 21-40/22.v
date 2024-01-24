module my_dff (
    input  wire clk,
    input  wire d,
    output  reg q
);
	always@(posedge clk)
    	q <= d;
endmodule

module top_module (
    input  wire clk,
    input  wire d,
    output wire q
);
    wire q1, q2, q3;

    my_dff d1 (
        .clk    (clk),
        .d      (d  ),
        .q      (q1 )
    );
    my_dff d2 (
        .clk    (clk),
        .d      (q1 ),
        .q      (q2 )
    );
    my_dff d3 (
        .clk    (clk),
        .d      (q2 ),
        .q      (q3 )
    );
    assign q = q3;
endmodule
