module top_module (
    input  wire [2:0] vec,
    output wire [2:0] outv,
    output wire       o0,
    output wire       o1,
    output wire       o2
);
    assign outv = vec;
    assign o0 = vec[2];
    assign o1 = vec[1];
    assign o2 = vec[0];
endmodule
