module top_module (
    input  wire  clk,
    input  wire  rst
);
    wire          clk;
    wire          rst;
    wire  [31:0]  inst;

    wire  [ 1:0]  rf_wr_sel;
    reg   [31:0]  rf_wd;
    wire          rf_wr_en;
    wire  [31:0]  rf_rd1,rf_rd2;

    wire  [31:0]  pc;
    wire  [31:0]  pc_plus4;
    wire          do_jump;
    wire          JUMP;

    wire  [31:0]  imm_out;

    wire  [ 2:0]  comp_ctrl;
    wire          BrE;

    wire          alu_a_sel;
    wire          alu_b_sel;
    wire  [31:0]  alu_a,alu_b,alu_out;
    wire  [ 3:0]  alu_ctrl;

    wire  [ 2:0]  dm_rd_ctrl;
    wire  [ 1:0]  dm_wr_ctrl;
    wire  [31:0]  dm_dout;

    always @(*) begin
        case (rf_wr_sel)
            2'b00:  rf_wd = 32'h0;
            2'b01:  rf_wd = pc_plus4;
            2'b10:  rf_wd = alu_out;
            2'b11:  rf_wd = dm_dout;
            default:rf_wd = 32'h0;
        endcase
    end
    assign		pc_plus4 = pc + 32'h4;
    assign		    JUMP = BrE || do_jump;
    assign         alu_a = alu_a_sel ? rf_rd1 : pc ;
    assign         alu_b = alu_b_sel ? imm_out : rf_rd2 ;

reg_file reg_file0(
    .clk        (),
    .A1         (),
    .A2         (),
    .A3         (),
    .WD         (),
    .WE         (),
    .RD1        (),
    .RD2        ()
);
pc	pc0(
    .clk        (),
    .rst		(),
    .JUMP		(),
    .JUMP_PC    (),
    .pc         ()
);
imm	imm0(
    .inst		(),
    .out    	()
);
branch branch0(
    .REG1		(),
    .REG2		(),
    .Type		(),
    .BrE		()
);
alu alu0(
    .SrcA     	(),
    .SrcB      	(),
    .func   	(),
    .ALUout    	()
);
mem mem0(
    .clk        (),
    .im_addr    (),
    .im_dout    (),
    .dm_rd_ctrl (),
    .dm_wr_ctrl (),
    .dm_addr    (),
    .dm_din     (),
    .dm_dout    ()
);
ctrl ctrl0(
    .inst       (),
    .rf_wr_en   (),
    .rf_wr_sel  (),
    .do_jump    (),
    .BrType		(),
    .alu_a_sel  (),
    .alu_b_sel  (),
    .alu_ctrl   (),
    .dm_rd_ctrl (),
    .dm_wr_ctrl (),
);

endmodule