`timescale 1ns / 10ps

module data_memory_tb ();
  logic        clk_i, rst_i, write_enable_i;
  logic [31:0] write_data_i, a_i;
  logic [1:0]  mem_mode_i;
  logic [31:0] read_data_o;

  data_memory UUT (clk_i, rst_i, write_enable_i, write_data_i, a_i, mem_mode_i, read_data_o);
  
  initial begin
    clk_i <= 0;
    forever #5 clk_i <= ~clk_i;
  end

  initial begin
    rst_i <= 1;

    #50
    rst_i <= 0;
    write_enable_i <= 1;             //store
    mem_mode_i <= 2'b10;             //word type
    a_i <= 32'd1;                    //Adress
    write_data_i <= 32'h01c00f93;    //value    

    #50
    rst_i <= 0;
    write_enable_i <= 0;            //load
    mem_mode_i <= 2'b00;            //Byte will be Loaded 
    a_i <= 32'd1;                   //Loading the value
  

    #50
    rst_i <= 0;
    write_enable_i <= 0;      //load
    mem_mode_i <= 2'b01;      //Half Word will be Loaded 
    a_i <= 32'd1;             //Loading the value
  

    #50
    rst_i <= 0;
    write_enable_i <= 0;      //load
    mem_mode_i <= 2'b10;      //Word will be Loaded 
    a_i <= 32'd1;             //Loading the value
  
    #50
    rst_i <= 1;
    write_enable_i <= 1;             //store
    mem_mode_i <= 2'b10;             //word type
    a_i <= 32'd1;                    //Adress
    write_data_i <= 32'h000f8083;    //value    

  
    #50
    rst_i <= 0;
    write_enable_i <= 1;              //store
    mem_mode_i <= 2'b10;              //word type
    a_i <= 32'd1;                     //Adress
    write_data_i <= 32'h000f8083;     //value    

    #50
    rst_i <= 0;
    write_enable_i <= 0;     //store
    mem_mode_i <= 2'b01;     //Half word type
    a_i <= 32'd1;            //Adress
  end

endmodule