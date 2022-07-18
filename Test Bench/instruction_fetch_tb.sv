`timescale 1ns/1ns

module instruction_fetch_tb();
	logic [31:0] instr_i;
	logic [4:0] a1_o, a2_o, a3_o;
	logic [6:0]  opcode_o;
	logic [2:0]  funct3_o;
	logic [24:0] imm_o;
	logic [6:0]  funct7_o;

	instruction_fetch UUT(instr_i, a1_o, a2_o, a3_o, opcode_o, funct3_o, imm_o, funct7_o);

initial begin
	instr_i = 32'h01c00f93;

	#50
	instr_i = 32'h000f8083;
end

endmodule