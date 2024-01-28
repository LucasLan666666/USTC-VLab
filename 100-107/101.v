module top_module (
    input  wire        clk,
    input  wire        rst,
    input  wire        JUMP,
    input  wire [31:0] JUMP_PC,
    output reg  [31:0] pc
);
    wire [31:0] pc_plus4;
    assign pc_plus4 = pc + 32'h4;

    //计算PC
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc <= 32'h0;
        end
        else begin
            if (JUMP) begin
                pc <= JUMP_PC;
            end
            else begin
                pc <= pc_plus4;
            end
        end
    end
endmodule
