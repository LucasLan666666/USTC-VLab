module top_module (
    input  wire [31:0] SrcA,
    input  wire [31:0] SrcB,
    input  wire [ 3:0] func,
    output  reg [31:0] ALUout
);

    wire signed [31:0] signed_a;
    wire signed [31:0] signed_b;

    assign signed_a = SrcA;
    assign signed_b = SrcB;

    always @(*) begin
        case(func)
            4'b0000: ALUout = SrcA + SrcB;
            4'b1000: ALUout = SrcA - SrcB;
            4'b0001: ALUout = SrcA << SrcB[4:0];
            4'b0010: ALUout = (signed_a < signed_b) ? 1 : 0;
            4'b0011: ALUout = (SrcA < SrcB) ? 1 : 0;
            4'b0100: ALUout = SrcA ^ SrcB;
            4'b0101: ALUout = SrcA >> SrcB[4:0];
            4'b1101: ALUout = signed_a >> signed_b[4:0];
            4'b0110: ALUout = SrcA | SrcB;
            4'b0111: ALUout = SrcA & SrcB;
            4'b1110: ALUout = SrcB;
            default: ALUout = 32'b0;
        endcase
    end
endmodule
