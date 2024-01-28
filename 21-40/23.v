module my_dff8 (
    input  wire       clk,
    input  wire [7:0] d,
    output  reg [7:0] q
);
	always@(posedge clk)
    	q <= d;
endmodule


module top_module (
    input  wire       clk,
    input  wire [7:0] d,
    input  wire [1:0] sel,
    output  reg [7:0] q
);
    wire [7:0] q1;
    wire [7:0] q2;
    wire [7:0] q3;

    my_dff8 d1 (
        .clk    (clk),
        .d      (d  ),
        .q      (q1 )
    );
    my_dff8 d2 (
        .clk    (clk),
        .d      (q1 ),
        .q      (q2 )
    );
    my_dff8 d3 (
        .clk    (clk),
        .d      (q2 ),
        .q      (q3 )
    );

    // 通过 always 块和 case 语句实现数据选择器
    always @(*) begin   // always @(*) 表示这个块的内容会在任何输入变量发生变化时执行
        case (sel)
            0: q <= d;
            1: q <= q1;
            2: q <= q2;
            3: q <= q3;
            default: q <= 8'bx;
        endcase
    end
endmodule
