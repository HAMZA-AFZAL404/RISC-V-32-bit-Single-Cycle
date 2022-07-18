`timescale 1ns / 10ps

module extend_tb ();
  logic [24:0] imm_i;
  logic [1:0]  immsrc_i;
  logic [31:0] imm_ext_o;

  extend UUT(imm_i, immsrc_i, imm_ext_o);

  initial begin
    immsrc_i=2'b00;
    imm_i=25'b0000000111000000000011111;

    #50
    immsrc_i=2'b01;
    imm_i=25'b0000000111000000000011111;

    #50
    immsrc_i=2'b10;
    imm_i=25'b0000000111000000000011111;
  end

  endmodule
