module top_module (
    input  wire clk,
    input  wire x,
    output wire z
); 
    wire d_1, d_2, d_3;
    reg  q_1, q_2, q_3;

    assign d_1 = x ^^  q_1;
    assign d_2 = x && ~q_2;
    assign d_3 = x || ~q_3;
    assign   z = ~(q_1 || q_2 || q_3);

    // initial 语句在模块开始运行时设置 q_1、q_2 和 q_3 的值为 0。这些值将保持不变，直到 always 语句在 clk 的上升沿改变它们
    initial begin
        q_1 = 0;
        q_2 = 0;
        q_3 = 0;
    end

    always @(posedge clk) begin
        q_1 <= d_1;
        q_2 <= d_2;
        q_3 <= d_3;
    end
endmodule
