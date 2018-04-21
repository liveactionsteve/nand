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

(MAIN_LOOP)
    @KBD
    D=M
    @CLEAR
    D;JEQ
(KEYPRESSED)
    D=-1
    @FILL
    0;JMP
(CLEAR)
    D=0
(FILL)
    @fill
    M=D
    @8192
    D=A
    @wordnum
    M=D
    @SCREEN
    D=A
    @pixels
    M=D
(SCR_LOOP)
    @wordnum
    D=M
    @END
    D;JEQ
    @fill
    D=M
    @pixels
    A=M
    M=D
    @pixels
    M=M+1
    @wordnum
    M=M-1
    @SCR_LOOP
    0;JMP
(END)
    @MAIN_LOOP
    0;JMP
    
    
    
        
    
    