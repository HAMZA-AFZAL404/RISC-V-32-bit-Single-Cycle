`timescale 1ns / 10ps

module risc_tb();

  logic clk, rst;

  risc UUT(clk, rst);

  initial begin
    clk<=0;
    forever #50 clk<=~clk;
  end

  initial begin
    #10 
      rst <= 1'b1;

    #10
      rst <= 1'b0;

    #100

    $stop;
      
  end
  
endmodule