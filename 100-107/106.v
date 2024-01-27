module top_module(
input     [31:0]  inst,
output            rf_wr_en,
output reg    [1:0]   rf_wr_sel,
output            do_jump,
output reg    [2:0]   BrType,
output            alu_a_sel,
output            alu_b_sel,
output reg    [3:0]   alu_ctrl,
output reg    [2:0]   dm_rd_ctrl,
output reg    [1:0]   dm_wr_ctrl
);
wire    [6:0]   opcode;
wire    [2:0]   funct3;
wire    [6:0]   funct7;

wire    is_lui;
wire    is_auipc;
wire    is_jal;
wire    is_jalr;
wire    is_beq;
wire    is_bne;
wire    is_blt;
wire    is_bge;
wire    is_bltu;
wire    is_bgeu;
wire    is_lb;
wire    is_lh;
wire    is_lw;
wire    is_lbu;
wire    is_lhu;
wire    is_sb;
wire    is_sh;
wire    is_sw;
wire    is_addi;
wire    is_slti;
wire    is_sltiu;
wire    is_xori;
wire    is_ori;
wire    is_andi;
wire    is_slli;
wire    is_srli;
wire    is_srai;
wire    is_add;
wire    is_sub;
wire    is_sll;
wire    is_slt;
wire    is_sltu;
wire    is_xor;
wire    is_srl;
wire    is_sra;
wire    is_or;
wire    is_and;

wire    is_add_type;
wire    is_u_type;
wire    is_jump_type;
wire    is_b_type;
wire    is_r_type;
wire    is_i_type;
wire    is_s_type;

assign  opcode  = inst[6:0];
assign  funct7  = inst[31:25];
assign  funct3  = inst[14:12];

assign  is_lui  = (opcode == 7'h37) ;
assign  is_auipc= (opcode == 7'h17) ;
assign  is_jal  = (opcode == 7'h6F) ;
assign  is_jalr = (opcode == 7'h67) && (funct3 ==3'h0) ;
assign  is_beq  = (opcode == 7'h63) && (funct3 ==3'h0) ;
assign  is_bne  = (opcode == 7'h63) && (funct3 ==3'h1) ;
assign  is_blt  = (opcode == 7'h63) && (funct3 ==3'h4) ;
assign  is_bge  = (opcode == 7'h63) && (funct3 ==3'h5) ;
assign  is_bltu = (opcode == 7'h63) && (funct3 ==3'h6) ;
assign  is_bgeu = (opcode == 7'h63) && (funct3 ==3'h7) ;
assign  is_lb   = (opcode == 7'h03) && (funct3 ==3'h0) ;
assign  is_lh   = (opcode == 7'h03) && (funct3 ==3'h1) ;
assign  is_lw   = (opcode == 7'h03) && (funct3 ==3'h2) ;
assign  is_lbu  = (opcode == 7'h03) && (funct3 ==3'h4) ;
assign  is_lhu  = (opcode == 7'h03) && (funct3 ==3'h5) ;
assign  is_sb   = (opcode == 7'h23) && (funct3 ==3'h0) ;
assign  is_sh   = (opcode == 7'h23) && (funct3 ==3'h1) ;
assign  is_sw   = (opcode == 7'h23) && (funct3 ==3'h2) ;
assign  is_addi = (opcode == 7'h13) && (funct3 ==3'h0) ;
assign  is_slti = (opcode == 7'h13) && (funct3 ==3'h2) ;
assign  is_sltiu= (opcode == 7'h13) && (funct3 ==3'h3) ;
assign  is_xori = (opcode == 7'h13) && (funct3 ==3'h4) ;
assign  is_ori  = (opcode == 7'h13) && (funct3 ==3'h6) ;
assign  is_andi = (opcode == 7'h13) && (funct3 ==3'h7) ;
assign  is_slli = (opcode == 7'h13) && (funct3 ==3'h1) && (funct7 == 7'h00);
assign  is_srli = (opcode == 7'h13) && (funct3 ==3'h5) && (funct7 == 7'h00);
assign  is_srai = (opcode == 7'h13) && (funct3 ==3'h5) && (funct7 == 7'h20);
assign  is_add  = (opcode == 7'h33) && (funct3 ==3'h0) && (funct7 == 7'h00);
assign  is_sub  = (opcode == 7'h33) && (funct3 ==3'h0) && (funct7 == 7'h20);
assign  is_sll  = (opcode == 7'h33) && (funct3 ==3'h1) && (funct7 == 7'h00);
assign  is_slt  = (opcode == 7'h33) && (funct3 ==3'h2) && (funct7 == 7'h00);
assign  is_sltu = (opcode == 7'h33) && (funct3 ==3'h3) && (funct7 == 7'h00);
assign  is_xor  = (opcode == 7'h33) && (funct3 ==3'h4) && (funct7 == 7'h00);
assign  is_srl  = (opcode == 7'h33) && (funct3 ==3'h5) && (funct7 == 7'h00);
assign  is_sra  = (opcode == 7'h33) && (funct3 ==3'h5) && (funct7 == 7'h20);
assign  is_or   = (opcode == 7'h33) && (funct3 ==3'h6) && (funct7 == 7'h00);
assign  is_and  = (opcode == 7'h33) && (funct3 ==3'h7) && (funct7 == 7'h00);

assign  is_add_type = is_auipc | is_jal | is_jalr | is_b_type | is_s_type 
                    | is_lb | is_lh | is_lw | is_lbu | is_lhu | is_add | is_addi ;
assign  is_u_type   = is_lui | is_auipc ;
assign  is_jump_type= is_jal ;
assign  is_b_type   = is_beq | is_bne | is_blt | is_bge | is_bltu | is_bgeu ;
assign  is_r_type   = is_add | is_sub | is_sll | is_slt | is_sltu | is_xor 
                    | is_srl | is_sra | is_or | is_and ;
assign  is_i_type   = is_jalr | is_lb | is_lh | is_lw | is_lbu | is_lhu 
                    | is_addi | is_slti | is_sltiu | is_xori | is_ori | is_andi
                    | is_slli | is_srli | is_srai ;
assign  is_s_type   = is_sb | is_sh | is_sw ;
//rf_wr_en  
assign rf_wr_en     =  /*待填*/ ;  
  
//[1:0]rf_wr_sel
always@(*)
begin
     /*待填*/
end  
  
//do_jump
assign do_jump      =  /*待填*/ ;
  
//[2:0]BrType
always@(*)
begin
	 /*待填*/
end
  
//alu_a_sel
assign alu_a_sel    =  /*待填*/;

//alu_b_sel  
assign alu_b_sel    =  /*待填*/ ;
  
//alu_ctrl
always@(*)
begin
     /*待填*/
end
  
//[2:0]dm_rd_ctrl
always@(*)
begin
     /*待填*/
end

//[1:0]dm_wr_ctrl
always@(*)
begin
    /*待填*/
end  
endmodule
