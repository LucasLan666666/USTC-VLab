module top_module (
    input  wire clk,
    input  wire in,
    output  reg out
);
    reg tmp; // tmp 用来判断是否在 in 的同一个高电平区间内

    // 仿真的开始阶段，reg 的值未定义，需要初始化为 0
    initial begin
        out = 1'b0; // initial 语句中，用阻塞赋值
        tmp = 1'b0;
    end

    always @(posedge clk) begin
        if (~in) begin
            tmp <= 1'b0;
        end else if (~tmp) begin
            out <= 1'b1;
            tmp <= 1'b1;
        end
        else begin
            out <= 1'b0;
        end
    end
endmodule
