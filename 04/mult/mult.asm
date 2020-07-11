// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Pseudo code for a * b using asm
// let result = 0
// for i from 1 to b
//     result += a

// Init variable
@R0
D=A
@R2
M=D // result = 0
@R1
D=A
@R1
D=A
@i 
M=D // i = 1
(LOOP)
// if (i==b) goto END
@i
D=M
@R1
D=D-M
@END
D;JGT

@R0
D=M
@R2
M=M+D
// ++i
@i
M=M+1

@LOOP
0;JMP

// END of program
(END)
@END
0;JMP