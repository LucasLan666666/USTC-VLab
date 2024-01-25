module tb (
);
    reg         clk;
    reg         wr_en;
    reg	 [1:0]  addr;
    reg	 [7:0]  wr_data;
    wire [7:0]  rd_data;

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 生成周期为 10 的一个时钟信号，forever 为 verilog 的关键字
    end
    initial begin
        addr = 2'b0;
        repeat (12) begin // repeat 为 verilog 关键字，表示重复操作，参数是重复次数
            @(posedge clk); // 等待 clk 信号的上升沿到来
            #1 addr = addr + 1;	// clk 上升沿 1 个时间单位后，addr + 1
        end
    end
    initial begin
        wr_en = 0;
        @(posedge clk);
        #1 wr_en = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);	//等待 4 个 clk 上升沿
        #1 wr_en = 0;
    end
    initial begin
        wr_data = 8'h0;
        repeat (4) begin
            wait (wr_en==1'b1);
            #1 wr_data = $random%256;
            @(posedge clk);
        end
    end

    ram_one_port init (
        .clk        (clk    ),
        .addr       (addr   ),
        .wr_en      (wr_en  ),
        .wr_data    (wr_data),
        .rd_data    (rd_data)
    );
endmodule


module ram_one_port (
    input  wire       clk,
    input  wire [1:0] addr,
    input  wire       wr_en,
    input  wire [7:0] wr_data,
    output wire [7:0] rd_data
);
    reg [7:0] mem [3:0];
    initial begin
        mem[0] = 8'b0;
        mem[1] = 8'b0;
        mem[2] = 8'b0;
        mem[3] = 8'b0;
    end
    assign rd_data = mem[addr];
    always @(posedge clk) begin
        if (wr_en)
            mem[addr] <= wr_data;
    end
endmodule
