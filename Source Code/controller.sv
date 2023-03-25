`timescale 1ns / 10ps

module controller (
  input  logic       zero_i,
  input  logic [6:0] opcode_i, funct7_i,
  input  logic [2:0] funct3_i,  
  output logic [4:0] alu_control_o,
  output logic [1:0] immsrc_o, mem_mode_o,
  output logic       pcsrc_o, mem_write_o, alusrc_o, reg_write_o, result_src_o
);

  parameter Byte = 2'b00;
  parameter HalfWord = 2'b01;
  parameter Word = 2'b10;

  logic branch;
  logic [16:0] checker1;
  assign checker1 = { {opcode_i}, {funct3_i}, {funct7_i} };

  always_comb begin 
    casex (opcode_i)
    7'b0000011: begin  //lw, lh, lb
      branch <= 0;
      result_src_o <= 1;
      mem_write_o <= 0;
      alusrc_o <= 1;
      reg_write_o <= 1;
      immsrc_o <= 2'b00;
      case (funct3_i)
        000: mem_mode_o <=  Byte;      //Load Byte
        001: mem_mode_o <=  HalfWord;  // Load HalfWord
        010: mem_mode_o <=  Word;      //Load Word
      endcase
    end 

    7'b0100011: begin   //sw, sh, sb
      branch <= 0;
      result_src_o <= 1'bx;
      mem_write_o <= 1;
      alusrc_o <= 1;
      reg_write_o <= 0;
      immsrc_o <= 2'b01;
      case (funct3_i)
        000: mem_mode_o <=  Byte;       //Store Byte
        001: mem_mode_o <=  HalfWord;   //Store HalfWord
        010: mem_mode_o <=  Word;       //Store Word
      endcase
    end

    7'b0110011: begin    //R-type
      branch <= 0;
      reg_write_o <= 1;
      immsrc_o <= 2'bxx;
      alusrc_o <= 0;
      mem_write_o <= 0;
      result_src_o <= 0;
    end

    7'b1100011: begin    //branch
      branch <= 1;
      mem_write_o <= 0;
      immsrc_o <= 2'b10;
      alusrc_o <= 0;
      reg_write_o <= 0;
      result_src_o <= 1'bx;
    end

    7'b0010011: begin    //I-Type
      branch <= 0;
      mem_write_o <= 0;
      immsrc_o <= 2'b00;
      alusrc_o <= 1;
      reg_write_o <= 1;
      result_src_o <= 0;
    end
  
    default: begin
      branch <= 0;
      mem_write_o <= 0;
      immsrc_o <= 2'b00;
      alusrc_o <= 0;
      reg_write_o <= 0;
      result_src_o <= 0;
    end 
    endcase
    
  end

  always_comb begin 
    pcsrc_o <= zero_i && branch; 
  end

  always_comb begin 
    case (checker1)
    // R Type instructions
      17'b01100110000000000: alu_control_o <= 5'b00000;   //add (0)
      17'b01100110000100000: alu_control_o <= 5'b00001;   //subtract (1)
      17'b01100110010000000: alu_control_o <= 5'b00010;   //Shift Left Logical (2)
      17'b01100110100000000: alu_control_o <= 5'b00011;   //Set Less than (3)
      17'b01100110110000000: alu_control_o <= 5'b00100;   //Set Less unsigned (4)
      17'b01100111000000000: alu_control_o <= 5'b00101;   //xor (5)
      17'b01100111010000000: alu_control_o <= 5'b00110;   //Shift Right Logical (6)
      17'b01100111010100000: alu_control_o <= 5'b00111;   //Shift Right Arithmetic (7)
      17'b01100111100000000: alu_control_o <= 5'b01000;   //or (8)
      17'b01100111110000000: alu_control_o <= 5'b01001;   //and (9)

    // I Type Instructions
      17'b0000011000xxxxxxx: alu_control_o <= 5'b00000;   //load byte  
      17'b0000011001xxxxxxx: alu_control_o <= 5'b00000;   //load half
      17'b0000011010xxxxxxx: alu_control_o <= 5'b00000;   //load word 
      17'b0010011000xxxxxxx: alu_control_o <= 5'b00000;   //addi
      17'b00100110010000000: alu_control_o <= 5'b00010;   //shift left logical immediate 
      17'b0010011010xxxxxxx: alu_control_o <= 5'b00100;   //set less than immediate
      17'b00100111010000000: alu_control_o <= 5'b00100;   //shift right logical immediate
      17'b0010011110xxxxxxx: alu_control_o <= 5'b01000;   //or immediate
      17'b0010011111xxxxxxx: alu_control_o <= 5'b01001;   //and immediate

    // S Type Instructions
      17'b0100011000xxxxxxx: alu_control_o <= 5'b00000;  //store byte  
      17'b0100011001xxxxxxx: alu_control_o <= 5'b00000;  //store half  
      17'b0100011010xxxxxxx: alu_control_o <= 5'b00000 ; //store word 

    // B Type Instructions 
      17'b1100011000xxxxxxx: alu_control_o <= 5'b00001;   //branch if =   
      17'b1100011001xxxxxxx: alu_control_o <= 5'b00001;   //branch if not equal  
      17'b1100011100xxxxxxx: alu_control_o <= 5'b00011;   //branch if < 

      default: alu_control_o <= 5'b00000;
    endcase
    
  end
  
  
  // just for testing purposes so igonre this thing

endmodule
