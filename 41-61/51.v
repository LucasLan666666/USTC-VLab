// 本质上是一个分频器
module top_module(
    input  wire       clk,
    input  wire       reset,
    output wire [7:0] ss
); 
    reg       clk_div;
    reg [1:0] cnt;
    reg [3:0] bit_l;
    reg [3:0] bit_h;
    
    // 分频器，1s 一个周期，先低电平，后高电平
    always @(posedge clk) begin
        if (reset) begin
            clk_div <= 1'd0;
            cnt     <= 2'd0;
            bit_l   <= 4'd0;
            bit_h   <= 4'd0;
        end
        // cnt 满 2 进 1，使得 clk_div 的一个低 / 高电平分别持续 2 个时钟周期
        else begin
            if (cnt < 2'd1) begin
                cnt     <= cnt + 2'b1;
                clk_div <= clk_div;
            end
            else begin
                cnt     <= 2'd0;
                clk_div <= ~clk_div;
            end
        end
    end
    // 计数器
    always @(negedge clk_div) begin
        if (reset) begin
            bit_l <= 4'd0;
            bit_h <= 4'd0;
        end
        else begin
            if (bit_l < 4'd10)
                bit_l <= bit_l + 4'd1;
            else begin
                bit_l <= 4'd0;
                if (bit_h < 4'd6)
                    bit_h <= bit_h + 4'd1;
                else
                    bit_h <= 4'd0;
            end
        end
    end
    assign ss = {bit_h, bit_l};
endmodule
