module top_module (
    input  wire clk,
    input  wire in,
    output  reg out
);
    wire d;

    assign d = in ^ out;

    always @(posedge clk) begin
        out <= d;
    end
endmodule
