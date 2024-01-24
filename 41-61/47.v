// 本质是个移位寄存器
module top_module(
    input  wire clk,
    input  wire in,
    output wire out
);
    reg [1:0] tmp;

    always @(posedge clk) begin
        tmp <= {tmp[0], in}; //tmp[0]储存当前状态，tmp[1]储存前一状态
    end
    assign out = ^tmp[1:0]; //前后两状态相异，输出 out 为 1
endmodule
