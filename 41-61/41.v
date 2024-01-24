module top_module (
    input  wire       clk,
    input  wire       reset,
    input  wire [7:0] d,
    output  reg [7:0] q
);
    always @(negedge clk) begin
        if (reset) begin        // 同步置零
            q <= 8'h34;
        end
        else begin
            q <= d;
        end
    end
endmodule
