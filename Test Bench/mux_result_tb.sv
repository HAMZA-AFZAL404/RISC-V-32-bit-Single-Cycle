`timescale 1ns / 10ps

module mux_result_tb ();
  logic        result_src_i;
  logic [31:0] read_data_i, alu_result_i;
  logic [31:0] result_o;

  mux_result UUT (result_src_i, read_data_i, alu_result_i, result_o);

  initial begin
    result_src_i = 0;
    alu_result_i = 32'h1;
    read_data_i  = 32'h2;
    
    #50
    result_src_i = 1;
    alu_result_i = 32'h1;
    read_data_i  = 32'h2;
  end

endmodule