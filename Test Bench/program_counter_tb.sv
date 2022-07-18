`timescale 1ns / 10ps

module program_counter_tb ();
  logic         clk_i;
  logic         rst_i;
  logic         pcsrc_i;  
  logic [31:0]  immext_i;       // Immediate Extend
  logic [31:0]  pc_o;

  program_counter UUT (clk_i, rst_i, pcsrc_i, immext_i, pc_o);

  initial begin    
    clk_i<= 0;
    forever #5 clk_i <=~ clk_i;  
  end

  initial begin
    rst_i=1;
    pcsrc_i=0;
    immext_i=32'h0;

    #10
    rst_i=0;
    pcsrc_i=0;
    immext_i=32'h0;

    #10
    rst_i=0;
    pcsrc_i=1;
    immext_i=32'd24;

    #10
    rst_i=0;
    pcsrc_i=0;
    immext_i=32'h0;
          
    $stop;
  end

endmodule