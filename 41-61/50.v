module top_module(
    input  wire       clk,
    input  wire       reset,
    input  wire       en,
    output reg  [3:0] q
);
    always @(posedge clk) begin
        if (reset) begin
            q = 4'b0101;
        end
        else begin
            if (q == 4'b0101) begin
                q <= 4'b1111;
            end
            else begin
                q <= q - en; // 巧妙回避了对 en 信号的判断
            end
        end
    end
endmodule
