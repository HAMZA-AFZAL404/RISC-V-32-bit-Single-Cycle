`timescale 1ns / 10ps

module alu_tb ();
  logic [31:0] rd1_i, src_b_i;
  logic [4:0]  alu_control_i;
  logic [2:0] funct3_i;
  logic [31:0] alu_result_o;
  logic        zero_o;

  alu UUT (rd1_i, src_b_i, alu_control_i, funct3_i, alu_result_o, zero_o);

  initial begin
    rd1_i <= 32'd5;
    src_b_i <= 32'd5;
    alu_control_i <= 5'd1;
    funct3_i <= 3'b000;


    #50
    rd1_i <= 32'd5;
    src_b_i <= 32'd3;
    alu_control_i <= 5'd0;
    funct3_i <= 3'b000;

    #50
    rd1_i <= 32'd100;
    src_b_i <= 32'd200;
    alu_control_i <= 5'd2;
    funct3_i <= 3'b001;  
  end
endmodule