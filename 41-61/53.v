module top_module (
    input  wire clk,
    input  wire enable,
    input  wire S,
    input  wire A, B, C,
    output  reg Z
);
    wire [7:0] num;
    reg  [7:0] Q;

    assign num = {A, B, C};

    always @(posedge clk) begin
        if (enable) begin
            Q <= {Q[6:0], S};
        end
        else begin
        end
    end
    always @(*) begin
        case (num)
            3'd0: Z = Q[0];
            3'd1: Z = Q[1];
            3'd2: Z = Q[2];
            3'd3: Z = Q[3];
            3'd4: Z = Q[4];
            3'd5: Z = Q[5];
            3'd6: Z = Q[6];
            3'd7: Z = Q[7];
        endcase
    end
endmodule
