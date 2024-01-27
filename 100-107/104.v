module top_module(
input [31:0] SrcA,SrcB,
input [3:0]  func,
output reg [31:0] ALUout
);

wire signed [31:0] signed_a;
wire signed [31:0] signed_b;

assign signed_a = SrcA;
assign signed_b = SrcB;

always@(*)
begin
  case(func)
		/*待填*/
	endcase
end 

endmodule