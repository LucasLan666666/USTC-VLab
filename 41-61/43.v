module top_module (
    input  wire        clk,
    input  wire        resetn,
    input  wire [ 1:0] byteena,
    input  wire [15:0] d,
    output  reg [15:0] q
);
    always @(posedge clk) begin
        if (~resetn) begin
            q <= 16'h00;
        end
        else begin
            case (byteena[1:0])
                2'b00: q <= q;
                2'b01: q <= {q[15:8], d[7:0]};
                2'b10: q <= {d[15:8], q[7:0]};
                2'b11: q <= d;
            endcase
        end
    end
endmodule
