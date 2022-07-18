`timescale 1ns / 10ps

module mux_src_b (
  input  logic        alusrc_i,
  input  logic [31:0] rd2_i, imm_ext_i,
  output logic [31:0] src_b_o
);

always_comb begin 
  case (alusrc_i)
    1'b0: src_b_o = rd2_i;
    1'b1: src_b_o = imm_ext_i;
  endcase 
end

endmodule