`timescale 1ns / 10ps

module program_counter (
  input  logic         clk_i,
  input  logic         rst_i,
  input  logic         pcsrc_i,  
  input  logic [31:0]  immext_i,       // Immediate Extend
  output logic [31:0]  pc_o
);

logic [31:0] pc_next;

always_comb begin
  if (pcsrc_i) pc_next = pc_o + immext_i;
  else         pc_next = pc_o + 4;
end

always_ff @(posedge clk_i or posedge rst_i) begin 
  if (rst_i) pc_o <= 32'b0;
  else       pc_o <= pc_next;   
end

endmodule


