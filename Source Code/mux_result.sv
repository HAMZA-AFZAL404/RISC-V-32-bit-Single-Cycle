`timescale 1ns / 10ps

module mux_result (
  input  logic        result_src_i,
  input  logic [31:0] read_data_i, alu_result_i,
  output logic [31:0] result_o
);

  always_comb begin 
    case (result_src_i)
    1'b0: result_o = alu_result_i;
    1'b1: result_o = read_data_i;
    endcase
    
  end

endmodule