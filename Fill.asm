(START)
@SCREEN     // Base address of screen memory map
D=A
@0
M=D     // Sets screen location at register 0


(CHECK)
@KBD    // Addresses the keyboard memory map
D=M     // And sets the value to D register
@SETBLACK
D;JGT       // If key is pressed, keycode value will be present in D (> 0) and therefore jump to SETBLACK
@SETWHITE
D;JEQ       // If no key is pressed, D will equal 0 and jump to SETWHITE


(SETBLACK)
@1      // Register 1 will contain the SETBLACK or SETWHITE "instruction"
M=-1    // -1 designates SETBLACK instruction
@LOOP
0;JMP       // Unconditional jump to beginning filling the screen black

(SETWHITE)
@1      // Register 1 will contain the SETBLACK or SETWHITE "instruction"
M=0     // 0 designates SETWHITE instruction
@LOOP
0;JMP       // Unconditional jump to beginning filling the screen white


(LOOP)
@1      // Address register 1 in order to set fill instruction
D=M     // Set D to either SETBLACK(-1) or SETWHITE(0)

@0      // Address register 0 to get pixel address to fill
A=M     // Set A register to the address value stored in register 0
M=D     // Set the pixel at address in A register to either black or white (depending on D register value)

@0      // Address register 0 (in order to begin incrementing sequence)
M=M+1   // Increment the value at register 0 by 1 (which is the address of the next pixel for next loop)
D=M     // Set incremented value to D register for use in counter

@KBD
D=A-D   // Functions as counter. As D gets larger, the value between A (KBD address) and D will get smaller until reaching 0

@LOOP
D;JGT	// Jumps to start of the loop while D > 0. Otherwise exits loop.

@START
0;JMP   // Unconditional jump to start of program