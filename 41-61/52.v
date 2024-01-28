module top_module (
    input  wire       clk,
    input  wire       areset,
    input  wire       load,
    input  wire       ena,
    input  wire [3:0] data,
    output  reg [3:0] q
);
    always @(areset) begin
        q <= 4'b0000;
    end
    always @(posedge clk) begin
        if (areset) begin
        end
        else begin
            if (load) begin
                q <= data;
            end
            else begin
                if (ena) begin
                    q <= {1'b0, q[3:1]};
                end
                else begin
                end
            end
        end
    end
endmodule
