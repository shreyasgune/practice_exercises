

/*    Explanation :

  • We have two digits available at the memory locations D000 H and D001  H
    in unpacked BCD form. The digit at D000 H is the LSB, whereas digit  at
    D001 H is MSB. To pack the  two  numbers,  means  to  combine  the  two
    numbers.
  • To make the digit at D001 H as MSB we rotate it 4 times  to  the  left.
    i.e. if digit = 09 H, after rotating it by a 4 times it becomes  90  H.
    Now add the two numbers. Result will be packed BCD. Store the result.
    e.g. :       D001 H      =    09 N
               D000 H  =     02 H
            Result     =     92 H

/*    Algorithm :

Step I           :     Load the most significant BCD digit in A.
Step II     :    Rotate MSB 4 times to left.
Step III    :    Store the result of rotation in register C
Step IV     :    Load the least significant BCD digit in A.
Step V      :    Add least significant BCD digit into ; rotated number.
Step VI     :    Store the result.
Step VII    :    Stop.

/*    Program :              

      Instruction      Comment */
      LDA   D001H                 ; Get the Most significant BCD digit
      RLC                    ;  Rotate the BCD 4 times to left  to  make  it
              MSB
      RLC
      RLC
      RLC
      MOV   C, A                  ; Store the partial result
      LDA   D000H                 ; Get the lower BCD digit
      ADD   C                ; Add lower BCD digit
      STA   D002             ; Store the result
      HLT                    ; Terminate program execution
