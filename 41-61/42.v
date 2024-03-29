module top_module (
    input  wire       clk,
    input  wire       areset,
    input  wire [7:0] d,
    output  reg [7:0] q
);
    always @(posedge clk or posedge areset) begin
        if (areset) begin        // 异步置零
            q <= 8'b00000000;
        end
        else begin
            q <= d;
        end
    end
endmodule
