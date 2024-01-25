`timescale 10ns / 10ns
module tb ();
    reg  a;
    reg  b;
    wire q;

    initial begin
        a = 1'b0;
        b = 1'b0;
        #3 b = ~b;
        #2 a = ~a; b = ~b;
        #2 b = ~b;
        #2 a = ~a; b = ~b;
        #2 b = ~b;
        #2 a = ~a; b = ~b;
        #2 b = ~b;
        #2 a = ~a; b = ~b;
    end


    mymodule tb (
        .a(a),  
        .b(b),  
        .q(q)  
    );

endmodule


module mymodule (
    input  wire a,
    input  wire b,
    output wire q
);
    assign q = a & b;
endmodule
