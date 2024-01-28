module ram_one_port (
    input  wire        clk,
    input  wire        wr_en,
    input  wire [ 2:0] wr_addr,
    input  wire [15:0] wr_data,
    input  wire [ 2:0] rd_addr,
    output wire [15:0] rd_data
);
    reg [15:0] mem [7:0];

    initial begin
        $readmemh("memfile.dat", mem); // $readmemh 是 Verilog 中的一个系统任务，用于从指定的文件中读取数据并将其加载到内存数组中。这个任务通常用于初始化内存或寄存器文件
    end

    assign rd_data = mem[rd_addr];

    always @(posedge clk) begin
        if(wr_en)
            mem[wr_addr] <= wr_data;
    end
endmodule
