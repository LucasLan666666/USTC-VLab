module top_module (
    input  wire [31:0] REG1,
    input  wire [31:0] REG2,
    input  wire [ 2:0] Type,
    output  reg        BrE
);
    wire   signed [31:0] signed_REG1;
    wire   signed [31:0] signed_REG2;
    wire          [31:0] unsigned_REG1; // verilog 中，所有线默认无符号类型
    wire          [31:0] unsigned_REG2;

    assign   signed_REG1 = REG1;
    assign   signed_REG2 = REG2;
    assign unsigned_REG1 = REG1;
    assign unsigned_REG2 = REG2;

    always @(*) begin
        case(Type)
            3'b010: BrE = (REG1 == REG2) ? 1 : 0;
            3'b011: BrE = (REG1 != REG2) ? 1 : 0;
            3'b100: BrE = (signed_REG1 < signed_REG2) ? 1 : 0;
            3'b101: BrE = (signed_REG1 >= signed_REG2) ? 1 : 0;
            3'b110: BrE = (unsigned_REG1 < unsigned_REG2) ? 1 : 0;
            3'b111: BrE = (unsigned_REG1 >= unsigned_REG2) ? 1 : 0;
            default: BrE = 0;
        endcase
    end
endmodule
