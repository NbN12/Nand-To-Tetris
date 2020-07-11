// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Pseudo code
// while true
//    if keyboard is pressed
//        black all screen
//    else
//        white all screen

// loop forever
(LOOP)
// if keyboard is pressed
@KBD
D=M
@BLACKSCREEN
D;JNE
// keyboard is not pressed
@WHITESCREEN
D;JEQ
@LOOP
0;JMP

// black all screen
// for i in SCREEN
//    SCREEN[i] = -1
(BLACKSCREEN)
@i
M=0
// arr address
@SCREEN
D=A
@addr
M=D

@KBD
D=A-D
@screen_len
M=D
(FILLBLACK)
// i == Screen.len
@i
D=M
@screen_len
D=D-M
@LOOP
D;JEQ

// Screen[i] = -1
@addr
D=M
@i
A=D+M
M=-1

// ++i
@i
M=M+1

@FILLBLACK
0;JMP

// white all screen
// for i in SCREEN
//    SCREEN[i] = 0
(WHITESCREEN)
@i
M=0
// arr address
@SCREEN
D=A
@addr
M=D

@KBD
D=A-D
@screen_len
M=D
(FILLWHITE)
// i == Screen.len
@i
D=M
@screen_len
D=D-M
@LOOP
D;JEQ

// Screen[i] = 0
@addr
D=M
@i
A=D+M
M=0

// ++i
@i
M=M+1

@FILLWHITE
0;JMP