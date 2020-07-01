

/*    Explanation :

  • Consider that a byte is present at  the  memory  location  D000  H  and
    second byte is present at memory location D001 H.
  • We have  to  multiply  the  bytes  present  at  the  above  two  memory
    locations.
  • We will multiply the numbers using successive addition method.
  • In successive addition method, one number is accepted and other  number
    is taken as a counter. The first number is added with itself, till  the
    counter decrements to zero.
  • Result is stored at memory locations E000 H and E001 H.
      For example : D000 H = 12 H,  D001 H = 10 H
            Result = 12H + 12H + 12H + 12H + 12H + 12H + 12H + 12H + 12H +
12H
      Result = 0120 H
      E000 H = 20 H
      E001 H = 01 H

/*    Algorithm :

Step I                 :     Get the first number.
Step II     :    Get the second number as counter.
Step III    :    Initialize result = 0.
Step IV     :    Result = Result + First number.
Step V      :    Decrement counter
Step VI     :    If count ( 0, go to step V.
Step VII    :    Store the result.
Step VIII : Stop.

/*    Program :

      Instruction           Comment */
      LDA   D000H            ; A = first number
      MOV   E, A             ; E = first number
      MVI   D, 00                 ; D = 00 H
      LDA   D001H            ; A = second number
      MOV   C, A                  ; Initialize counter
      LXI   H, 0000H         ; Result = 0
BACK: DAD   D                     ; Result = result + first number
      DCR   C                     ; decrement count
      JNZ   BACK       ; If count  0 repeat
      SHLD  E000H            ; Store result
      HLT                       ;     Terminate     program     execution
