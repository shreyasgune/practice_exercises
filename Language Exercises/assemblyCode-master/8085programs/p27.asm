

/*    Explanation :

  • We have a byte that is stored in H register.
  • Initialize the counter 1 = 8 i.e. total number of bits in a byte.
  • Initialize counter 2 = 0 to count the number of 1’s.
  • We will rotate the number in A alongwith carry by 1 bit to  the  right.
    If there is a carry we will increment counter 2.
  • Decrement counter 1. This process will continue till all the  bits  are
    checked. The counter 2 will indicate the number of 1’s present  in  the
    byte.
  •  The result of counter 2 is stored in B.
|  e.g. : H = 52 |0101       |0010     |


  • Number of 1’s = 3

/*    Algorithm :

Step I                 :     Load the number in H register.
Step II     :    Initialize count in B = 00
                       Initialize counter 1 = 8.
Step III    :    Rotate contents of register so that  LSB
                       will go in carry.
Step IV     :    Check if carry = 1. If not goto step VI.
Step V      :    Increment count in BL.
Step VI     :    Decrement counter 1.
Step VII    :    Check if counter 1 = 0. If not go to step III.
Step VIII   :    Store result in B.
Step IX     :    Stop.

/*    Program :

      Instruction      Comment */
      MVI   B,00H            ; Initialize  counter 1 =00 H
      MVI   C,08H            ; Initialize counter 2 = 08 H
      MOV   A,H              ; Load the number in accumulator
L2 :  RAR                    ; Rotate the number alongwith carry
      JNC   L1               ; if no carry goto L1
      INR   B                ; increment the count
L1:   DCR   C                ; decrement counter 2
      JNZ   L2               ; check if counter = 0 ? if not continue
      HLT                    ; terminate program execution
