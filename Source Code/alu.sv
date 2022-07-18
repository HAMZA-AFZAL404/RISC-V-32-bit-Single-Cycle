`timescale 1ns / 10ps

module alu (
  input  logic [31:0] rd1_i, src_b_i,
  input  logic [4:0]  alu_control_i,
  input  logic [2:0] funct3_i,
  output logic [31:0] alu_result_o,
  output logic        zero_o
);

  always_comb begin 
    case (alu_control_i)
      5'b00000: alu_result_o = rd1_i + src_b_i ;           //Addition 
        
      5'b00001: alu_result_o = rd1_i - src_b_i ;           //Subtraction
      
      5'b00010: alu_result_o = rd1_i<<src_b_i;             //Shift Left Logical 
          
      5'b00011: alu_result_o = ($signed(rd1_i) < $signed(src_b_i)) ? 1 : 0;  //Set Less than 
          
      5'b00100: alu_result_o = (rd1_i < src_b_i) ? 1 : 0;  //Set Less than unsigned 
        
      5'b00101: alu_result_o = rd1_i ^ src_b_i;            //LOgical xor 
        
      5'b00110: alu_result_o = rd1_i>>src_b_i;             //Shift Right Logical 
          
      5'b00111: alu_result_o = rd1_i >>> src_b_i;          //Shift Right Arithmetic 
        
      5'b01000: alu_result_o = rd1_i | src_b_i;            //Logical Or
        
      5'b01001: alu_result_o = rd1_i & src_b_i;            //Logical and 

      default:  alu_result_o = rd1_i + src_b_i;
    endcase  
  end

  always_comb begin 
    case (funct3_i)
    3'b000:  zero_o = rd1_i == src_b_i;    //beq
    3'b001:  zero_o =  rd1_i != src_b_i;   //bne
    3'b100:  zero_o =  rd1_i < src_b_i;    //blt
    default: zero_o = 0;
    endcase
  end

endmodule