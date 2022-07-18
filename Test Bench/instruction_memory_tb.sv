`timescale 1ns / 10ps

module instruction_memory_tb ();
	logic [31:0] pc_in;
	logic [31:0] instr_o;

	instruction_memory UUT(pc_in, instr_o);

	initial begin
		pc_in = 32'd0;
		
		#50
		pc_in = 32'd4;
	end
endmodule