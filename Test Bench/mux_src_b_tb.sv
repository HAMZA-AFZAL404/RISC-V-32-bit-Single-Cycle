`timescale 1ns / 10ps

module mux_src_b_tb ();
  logic        alusrc_i;
  logic [31:0] rd2_i, imm_ext_i;
  logic [31:0] src_b_o;

  mux_src_b UUT (alusrc_i, rd2_i, imm_ext_i, src_b_o);

  initial begin
    alusrc_i  = 1;
    imm_ext_i = 32'h01c00f93;
    rd2_i     = 32'b1;

    #50
    alusrc_i  = 0;
    imm_ext_i = 32'b0000000111000000000011111111111;
    rd2_i     = 32'b1;
  end



endmodule