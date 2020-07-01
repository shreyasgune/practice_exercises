

/*    Explanation :

  • We have an array of 10 numbers for e.g. So we  initialize  the  counter
    with 10. Also we initialize a pointer to point these numbers.
  • Compare first number with initial number. If number <  minimum  number,
    save  number  otherwise  increment  pointer  to  compare  next  number.
    Decrement counter, compare till all the numbers are compared. Store the
    maximum number in memory location E000 H.

/*    Algorithm :

Step I      :    Initialize pointer.
Step II     :    Initialize counter.
Step III    :     Initialize minimum =0
Step IV     :    Compare number with maximum.
                 If no carry i.e. if number is smaller don’t
            interchange then goto step VI
Step V      :    Save the minimum number.
Step VI     :    Decrement counter.
Step VII    :    Increment pointer.
Step VIII   :    Check if count = 0. If not goto step IV.
Step IX     :    Store the maximum number.
Step XI     :    Stop.

/*    Program :

      Instruction            Comment */
      LDA   D000H
      MOV   C, A             ; Initialize counter
      LXI   H, D001H         ; Initialize pointer
      MOV      A, M
      INX      M
BACK: CMP   M                 ; Is number < miniumum
      JC    SKIP
      MOV   A, M              ; If number < minimum then interchange.
SKIP: INX  H
      DCR   C
      JNZ   BACK
      STA   E000H             ; Store minimum number
      HLT                     ; Terminate program execution


