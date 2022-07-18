`timescale 1ns / 10ps

module data_memory (
  input  logic        clk_i, rst_i, write_enable_i,
  input  logic [31:0] write_data_i, a_i,
  input  logic [1:0]  mem_mode_i,
  output logic [31:0] read_data_o
);

  parameter Byte = 2'b00;
  parameter HalfWord = 2'b01;
  parameter Word = 2'b10;
  
  reg [7:0] data_mem [40:0];    //Byte addressable 

  initial begin
	//Initializing Data Memory
	$readmemh("data_memory.mem", data_mem); 
  end

  // Asynchronus Read
  always_comb begin 
    case (mem_mode_i)
      Byte:     read_data_o = $signed(data_mem[a_i]);
      HalfWord: read_data_o = $signed({data_mem[a_i+1], data_mem[a_i]});
      Word:     read_data_o = ({data_mem[a_i+3], data_mem[a_i+2], data_mem[a_i+1], data_mem[a_i]});
    endcase  
  end

  // Synchronous Write
  integer i;
  always_ff @( posedge clk_i or posedge rst_i ) begin 
    if (rst_i) begin
      for(i = 0; i < 1023; i = i + 1)
        data_mem[i] <= 32'd0;
    end else if (write_enable_i) begin
      case (mem_mode_i)
        Byte: begin
          data_mem[a_i]   <= write_data_i[7:0];
			    data_mem[a_i+1] <= 8'd0;
			    data_mem[a_i+2] <= 8'd0;
			    data_mem[a_i+3] <= 8'd0;
        end
        HalfWord: begin
          data_mem[a_i]   <= write_data_i[7:0];
	        data_mem[a_i+1] <= write_data_i[15:8];
			    data_mem[a_i+2] <= 8'd0;
			    data_mem[a_i+3] <= 8'd0;
        end
        Word: begin
          data_mem[a_i]   <= write_data_i[7:0];
          data_mem[a_i+1] <= write_data_i[15:8];
          data_mem[a_i+2] <= write_data_i[23:16];
          data_mem[a_i+3] <= write_data_i[31:24];
        end
      endcase 
    end
  end

endmodule