module top_module ( 
    input  wire [2:0] sel, 
    input  wire [3:0] data0,
    input  wire [3:0] data1,
    input  wire [3:0] data2,
    input  wire [3:0] data3,
    input  wire [3:0] data4,
    input  wire [3:0] data5,
    output  reg [3:0] out
);
    always@(*) begin
        case (sel[2:0])
            0: out = data0;
            1: out = data1;
            2: out = data2;
            3: out = data3;
            4: out = data4;
            5: out = data5;
            default: out = 4'b0;
        endcase
    end
endmodule
