module top_module (
    input  wire clk,
    input  wire in,
    output  reg out
);
    reg [1:0] tmp; // tmp 高位用来判断是否在 in 的同一个高电平区间内，低位让 out 高电平持续一周期后转为低电平

    // 仿真的开始阶段，reg 的值未定义，需要初始化为 0
    initial begin
        out = 1'b0; // initial 语句中，用阻塞赋值
        tmp = 2'b00;
    end

    always @(posedge clk) begin
        if (in == 1'b1 && tmp == 2'b00) begin
            out <= 1'b1;
            tmp <= 2'b11;
        end else if (tmp ) begin
            out <= 1'b0;
            tmp <= 1'b0;
        end
    end
endmodule
