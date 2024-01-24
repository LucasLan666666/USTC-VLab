module top_module (
    input  wire [7:0] in,
    output  reg [2:0] pos
);
    always @(*) begin
        casez (in[7:0])                 // casez 可以处理高阻抗（z）状态，z 表示 don't care，能匹配任意值
            8'bzzzzzzz1: pos = 3'd0;    // 如果一个输入匹配多个项，则优先执行第一个输入的项
            8'bzzzzzz1z: pos = 3'd1;
            8'bzzzzz1zz: pos = 3'd2;
            8'bzzzz1zzz: pos = 3'd3;
            8'bzzz1zzzz: pos = 3'd4;
            8'bzz1zzzzz: pos = 3'd5;
            8'bz1zzzzzz: pos = 3'd6;
            8'b1zzzzzzz: pos = 3'd7;
            default: pos = 3'd0;
        endcase
    end
endmodule
