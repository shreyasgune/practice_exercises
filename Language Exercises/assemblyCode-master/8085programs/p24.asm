

/*    Explanation :

  • Get the number in the accumulator from register B.
  • Rotate the number 4 times to the right
  • Store the shifted number back in register B

/*    Algorithm :

Step I                  :      Get   the  number  in  the  accumulator  from
    register B.
Step II     :    Rotate the number 4 times to the right.
Step III    :    Store the result in register B.
Step IV     :    Stop

/*    Program :

Instruction      Comment */
MOV A,B     ;  Load the number in register A
RAR         ; Rotate the number 4 times  to the right
RAR
RAR
RAR
MOV B,A     ; Store the shifted number
HLT         ; Terminate program execution  

