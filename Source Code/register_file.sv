`timescale 1ns / 10ps

module register_file (
  input  logic        clk_i, rst_i, reg_write_enable_i,
  input  logic [4:0]  a1_i, a2_i, a3_i,
  input  logic [31:0] reg_write_data_i,
  output logic [31:0] rd1_o, rd2_o
);
  reg [31:0] registers[31:0];

  initial begin
	//Initializing Register Memory
	$readmemh("register_memory.mem", registers); 
end

  // Asynchronous Read
  always_comb begin 
    rd1_o = registers[a1_i];
    rd2_o = registers[a2_i];
 end
 
  // Synchronous Write
  integer i;
  always_ff @(posedge clk_i or posedge rst_i) begin 
    if (rst_i) begin
      for (i = 0; i < 32; i++)
        registers[i] <= 32'b0;
    end else if (reg_write_enable_i) begin
      registers[a3_i] <= reg_write_data_i;
    end 
  end

endmodule