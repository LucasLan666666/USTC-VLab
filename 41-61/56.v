module top_module (
    input  wire clk,
    input  wire areset,
    input  wire in,
    output wire out
);
    parameter A = 0; // parameter 用于声明常量
    parameter B = 1;
    reg state;
    reg next_state;

    // 有限状态机第一段
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= B;
        end
        else begin
            state <= next_state;
        end
    end
    // 有限状态机第二段
    always @(*) begin
        case (state)
            A: begin
                if (in == 1'b1) begin
                    next_state = A;
                end
                else begin
                    next_state = B;
                end
            end
            B: begin
                if (in == 1'b1) begin
                    next_state = B;
                end
                else begin
                    next_state = A;
                end
            end
            default: ;
        endcase
    end
    //有限状态机第三段，信号输出逻辑
    assign out = (state == B);
endmodule
