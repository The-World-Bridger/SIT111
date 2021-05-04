// Multiplies 2 values in @0 and @1 and stores in @2

@2
M=0     // Clear answer memory

(LOOP)
@1
D=M    // Assign Value @1 to D

@2
M=M+D   // Add value in D (from @1) to @2

@0
M=M-1   // Reduce value in @0 by 1 in loop iteration (eg. 3 x 4 == 4 + 4 + 4)
D=M     // Store reduced value in D for loop condition check

@LOOP
D;JGT     // Loop if D is greater than 0

(END)
@END      // Otherwise end in infinite loop
0;JMP
