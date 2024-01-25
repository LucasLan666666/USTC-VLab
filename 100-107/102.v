module top_module(
    input  wire [31:0] inst,
    output  reg [31:0] out
);
    wire [6:0] opcode;
    assign opcode = inst[6:0];

    //立即数扩展
    always @(*) begin
        case (opcode)
            7'b0010111: out = {inst[31:12], 12'b0};
            7'b0110111: out = {inst[31:12], 12'b0};
            7'b1100011: out = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
            7'b1101111: out = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
            7'b1100111: out = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
            7'b0000011: out = {{21{inst[31]}}, inst[30:20]};
            7'b0100011: out = {{21{inst[31]}}, inst[30:25], inst[11:7]};
            7'b0010011: out = {{21{inst[31]}}, inst[30:20]};
            default:    out = 32'h0;
        endcase
    end 
endmodule
