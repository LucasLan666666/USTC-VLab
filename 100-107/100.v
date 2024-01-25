module top_module(
    input  wire        clk,
    input  wire [ 4:0] A1,
    input  wire [ 4:0] A2,
    input  wire [ 4:0] A3,
    input  wire [31:0] WD,
    input  wire        WE,
    output wire [31:0] RD1,
    output wire [31:0] RD2
);
    reg [31:0] reg_file [31:0];

    //初始化寄存器堆
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1)
            reg_file[i] = 0;
    end

    //写入寄存器
    always @(posedge clk) begin
        if (WE && A3) begin     // 当待写入寄存器端口号为 0 时，往 x0 写入的数据总是被丢弃
            reg_file[A3] <= WD;
        end
    end

    //读取寄存器
    assign RD1 = reg_file[A1];
    assign RD2 = reg_file[A2];
endmodule
