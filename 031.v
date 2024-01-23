module top_module (
    input  wire cpu_overheated,
    input  wire arrived,
    input  wire gas_tank_empty,
    output reg	shut_off_computer,
    output reg  keep_driving
);
    always @(*) begin
        if (cpu_overheated)
            shut_off_computer = 1'b1;
        else
            shut_off_computer = 1'b0;
    end

    always @(*) begin
        if (~arrived)
            keep_driving = ~gas_tank_empty;
        else
            keep_driving = gas_tank_empty;
    end
endmodule
