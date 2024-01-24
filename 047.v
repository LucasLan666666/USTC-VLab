module top_module (
    input  wire clk,
    input  wire in,
    output  reg out
);
    reg tmp = 1'b0;

    always @(posedge in or negedge in) begin
        out <= 1'b1;
        tmp <= 1'b1;
    end
    always @(posedge clk) begin
        if (tmp) begin
            out <= 1'b0;
            tmp <= 1'b0;
        end
    end
endmodule
