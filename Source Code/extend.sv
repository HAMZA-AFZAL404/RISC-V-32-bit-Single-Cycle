`timescale 1ns / 10ps

module extend (
  input  logic [24:0] imm_i,
  input  logic [1:0]  immsrc_i,
  output logic [31:0] imm_ext_o
);

  always_comb begin 
    case (immsrc_i)
    // I Type
    2'b00:   imm_ext_o = { { 20{ imm_i[24] } }, imm_i[24:13] };
    // S Type
    2'b01:   imm_ext_o = { { 20{ imm_i[24] } }, imm_i[24:18], imm_i[4:0] };
    // B Type
    2'b10:   imm_ext_o = { { 20{ imm_i[24] } }, imm_i[0], imm_i[23:18], imm_i[4:1], 1'b0};
    default: imm_ext_o = 32'bx;
    endcase
  end

endmodule