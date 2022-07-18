`timescale 1ns / 10ps

module rgister_file_tb ();
  logic        clk_i, rst_i, reg_write_enable_i;
  logic [4:0]  a1_i, a2_i, a3_i;
  logic [31:0] reg_write_data_i;
  logic [31:0] rd1_o, rd2_o;

  register_file UUT(clk_i, rst_i, reg_write_enable_i, a1_i, a2_i, a3_i, reg_write_data_i, rd1_o, rd2_o);
  
  initial begin
    clk_i <=0;
    forever #5 clk_i <= ~clk_i;
  end

  initial begin
    a1_i = 5'b00000;
    a2_i = 5'b11100;
    a3_i = 5'b11111;
    rst_i = 0;
    reg_write_enable_i = 1;
    reg_write_data_i = 32'h01c00f93;

    #50
    a1_i = 5'b11111;
    a2_i = 5'b00000;
    a3_i = 5'b00001;
    rst_i = 0;
    reg_write_enable_i = 0;
    reg_write_data_i = 32'h000f8083;
  end
  
endmodule