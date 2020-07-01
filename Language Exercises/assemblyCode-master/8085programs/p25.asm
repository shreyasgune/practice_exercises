

/*    Explanation :

  • Get the number in the accumulator from register B.
  • Rotate the number 1 time to the right
  • Store the shifted number back in register B
  • Get the number in the accumulator from register C.
  • Rotate the number 1 time to the right
  • Store the shifted number back in register C

/*    Algorithm :

Step I                 :     Get  the number the in the accumulator
                       from register B.
Step II     :    Rotate the number 1 time to the right.
Step III    :    Store the result in register B.
Step IV     :    Get  the number the in the accumulator
                       from register C.
Step V      :    Rotate the number 1 times to the right.
Step VI     :    Store the result in register C.
Step VII    :    Stop

/*    Program :

Instruction      Comment */
MOV A,B     ;  Load the number in register A
RAR         ;  Rotate the number 1 time to the right
MOV B,A     ; Store the shifted number
MOV A,C     ; Load the number in register A
RAR         ; Rotate the number 1 time to the right
MOV C,A     ; Store the shifted number
HLT         ; Terminate program execution
