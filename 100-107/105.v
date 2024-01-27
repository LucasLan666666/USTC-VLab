module top_module(
input           clk,
input   [31:0]  im_addr,
output  [31:0]  im_dout,
input   [2:0]   dm_rd_ctrl,
input   [1:0]   dm_wr_ctrl,
input   [31:0]  dm_addr,
input   [31:0]  dm_din,
output reg  [31:0]  dm_dout
);

reg     [3:0]   byte_en;
reg     [31:0]  mem[0:4095];
reg     [31:0]  mem_out;
integer i;

initial
begin
    for(i=0;i<4095;i=i+1) mem[i] = 0;
end

initial
begin
  $readmemh("./problem/inst.dat",mem);
end

assign im_dout = /*待填*/
//由于不能跨单位读取数据，地址最低两位的数值决定了当前单位能读取到的数据，即mem_out
always@(*)
begin
    case(dm_addr[1:0])
    2'b00:  mem_out = mem[dm_addr[13:2]][31:0];
    2'b01:  mem_out = {8'h0,mem[dm_addr[13:2]][31:8]};
    2'b10:  mem_out = {16'h0,mem[dm_addr[13:2]][31:16]};
    2'b11:  mem_out = {24'h0,mem[dm_addr[13:2]][31:24]};
    endcase
end

always@(*)
begin
    case(dm_rd_ctrl)                                         
    /*待填*/
    endcase
end

always@(*)
begin
    if(dm_wr_ctrl == 2'b11)
        byte_en = 4'b1111;
    else if(dm_wr_ctrl == 2'b10)
    begin
        if(dm_addr[1] == 1'b1) 
            byte_en = 4'b1100;
        else
            byte_en = 4'b0011;
    end
    else if(dm_wr_ctrl == 2'b01)
    begin
        case(dm_addr[1:0])
        2'b00:  byte_en = 4'b0001;
        2'b01:  byte_en = 4'b0010;
        2'b10:  byte_en = 4'b0100;
        2'b11:  byte_en = 4'b1000;
        endcase
    end
    else
        byte_en = 4'b0000;
end

always@(posedge clk)
begin
    if((byte_en != 1'b0)&&(dm_addr[30:12]==19'b0))
    begin
        case(byte_en)
        	/*待填*/
        endcase
    end
end
endmodule