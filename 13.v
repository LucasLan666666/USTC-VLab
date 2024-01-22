module top_module (
    input  wire [2:0] a,
    input  wire [2:0] b,
    output wire       out_or_logical,
    output wire [2:0] out_or_bitwise,
    output wire [5:0] out_not
);
    wire [5:0] c;
    assign out_or_logical = a || b;
    assign out_or_bitwise = a | b;
    assign out_not[5:3] = ~b[2:0]; 
    assign out_not[2:0] = ~a[2:0]; 
endmodule
