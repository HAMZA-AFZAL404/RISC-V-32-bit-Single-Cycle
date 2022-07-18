`timescale 1ns / 10ps

module instruction_fetch (
	input  logic [31:0] instr_i,
	output logic [4:0] a1_o, a2_o, a3_o,
	output logic [6:0]  opcode_o,
	output logic [2:0]  funct3_o,
	output logic [24:0] imm_o,
	output logic [6:0]  funct7_o
);

	// Fetching the instruction
	always_comb begin 
		a1_o     = instr_i [19:15];
		a2_o     = instr_i [24:20];
		a3_o     = instr_i [11:7]; 
		opcode_o = instr_i [6:0];
		funct3_o = instr_i [14:12];
		imm_o    = instr_i [31:7];
		funct7_o = instr_i [31:25];
	end
endmodule

