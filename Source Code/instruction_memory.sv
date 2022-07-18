`timescale 1ns / 10ps

module instruction_memory (
	input  logic [31:0] pc_in,
	output logic [31:0] instr_o
);

	reg [7:0] mem [1023:0];

	initial begin
		//Initializing Memory
		$readmemh("instruction_memory.mem", mem); 
	end

  //Fetching Instruction
	assign instr_o = {mem[pc_in+3], mem[pc_in+2], mem[pc_in+1], mem[pc_in]};  //Byte adressable

endmodule
