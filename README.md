# RISC-V-32-bit-Single-Cycle
This repository contains the system verilog code files of Single Cycle RISC-V architecture.
Implementation of RISCV-32I Single Cycle Processor architecture consisting of base instructions (R, I, B, S).
This is an implementation of RISCV base single cycle processor. This basic design supports six 32-bit encoding based named as:
R-Type
I-Type
S-Type
B-Type


Source code of all modules are provided in Source_code folder and all those modules are finally called in Top_level.sv file. In order to test each module test benches for these modules are provided in separate folder named as test_Benches. And similarly in order to check the complete processor design a test bench file named as Single_cycle.sv in test_Bench folder is used.

Reference
Some part of this material and understanding is taken from book " Digital Design and Computer Architecture RISC-V Edition " by Sarah L Harris and David M Harris.
