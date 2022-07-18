`timescale 1ns / 10ps

module risc (
  input clk, rst
);
  logic [31:0] Instr,PC,ImmExt,ALUResult,RD1,RD2;
  logic [4:0] ALUControl; 
  logic [2:0] funct3;
  logic [31:0] SrcB;
  logic [31:0] Result;
  logic RegWrite;
  logic [31:0] ReadData;
  logic [4:0] A1,A2,A3;
  logic [24:0] Imm;
  logic [6:0] op,funct7;
  logic [1:0] ImmSrc;
  logic Zero,PCSrc;
  logic ResultSrc;
  logic MemWrite,ALUSrc;
  logic [1:0] mem_mode;
  program_counter AAA (.clk_i(clk),.rst_i(rst),.pcsrc_i(PCSrc),.immext_i(ImmExt),.pc_o(PC));
  instruction_memory BBB (.pc_in(PC),.instr_o(Instr));
  instruction_fetch CCC (.instr_i(Instr),.a1_o(A1),.a2_o(A2),.a3_o(A3),.opcode_o(op),.funct3_o(funct3),.imm_o(Imm),.funct7_o(funct7));
  register_file DDD (.clk_i(clk),.rst_i(rst),.reg_write_enable_i(RegWrite),.a1_i(A1),.a2_i(A2),.a3_i(A3),.reg_write_data_i(Result),.rd1_o(RD1),.rd2_o(RD2));
  mux_result EEE (.result_src_i(ResultSrc),.read_data_i(ReadData),.alu_result_i(ALUResult),.result_o(Result));   //last mux
  mux_src_b FFF(.alusrc_i(ALUSrc),.rd2_i(RD2),.imm_ext_i(ImmExt),.src_b_o(SrcB));
  alu GGG (.rd1_i(RD1),.src_b_i(SrcB),.alu_control_i(ALUControl),.funct3_i(funct3),.alu_result_o(ALUResult),.zero_o(Zero));
  extend HHH (.imm_i(Imm),.immsrc_i(ImmSrc),.imm_ext_o(ImmExt));
  data_memory III (.clk_i(clk),.rst_i(rst),.write_enable_i(MemWrite),.write_data_i(RD2),.a_i(ALUResult),.mem_mode_i(mem_mode),.read_data_o(ReadData));
  controller JJJ (.zero_i(Zero),.opcode_i(op),.funct7_i(funct7),.funct3_i(funct3),.alu_control_o(ALUControl),.immsrc_o(ImmSrc),.mem_mode_o(mem_mode),.pcsrc_o(PCSrc),.mem_write_o(MemWrite),.alusrc_o(ALUSrc),.reg_write_o(RegWrite),.result_src_o(ResultSrc));

endmodule