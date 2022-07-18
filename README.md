# RISC-V-32-bit-Single-Cycle
This repository contains the system verilog code files of Single Cycle RISC-V architecture.
Implementation of RISCV-32I Single Cycle Processor architecture consisting of base instructions (R, I, B, S).


![image](https://user-images.githubusercontent.com/107424714/179557355-e68b9366-5748-4652-9a3a-8ac1a1a554a6.png)

This is an implementation of RISCV base single cycle processor. This basic design supports six 32-bit encoding based named as:
R-Type
I-Type
S-Type
B-Type

Supported Instructions

    R-Type: ADD, SUB, OR, AND, SLL, SRL, SRA, SLT, SLTU
    I-Type: ADDI, ORI, ANDI, SLLI, SRLI, SLTI, LW, LH, LB
    S-Type: SW, SH, SB
    B-Type: BEQ, BNE, BLT
    J-Type: JAL, JALR
    U-Type: LUI

Source code of all modules are provided in Source_code folder and all those modules are finally called in Top_level.sv file. In order to test each module test benches for these modules are provided in separate folder named as test_Benches. And similarly in order to check the complete processor design a test bench file named as Single_cycle.sv in test_Bench folder is used.

Reference
Some part of this material and understanding is taken from book " Digital Design and Computer Architecture RISC-V Edition " by Sarah L Harris and David M Harris.
