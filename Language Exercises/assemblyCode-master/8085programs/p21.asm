

/*    Explanation :

  • For example : we have an array of 10  numbers.  So  we  initialize  the
    counter with 10. Also we initialize a pointer to point these numbers.
  • Compare first number with initial maximum number i.e. zero. If number >
    maximum number, save number otherwise increment pointer to compare next
    number. Decrement counter, compare till all the numbers  are  compared.
    Store the maximum number in memory location E000 H.
/*    Algorithm :
Step I                 :     Initialize pointer.
Step II     :    Initialize counter.
Step III    :     Initialize maximum number =0
Step IV     :    Compare number with maximum.
                       If no carry i.e. if number is smaller don’t
                       interchange then goto step VI
Step V      :    Save the maximum number.
Step VI     :    Decrement counter.
Step VII    :    Increment pointer.
Step VIII   :    Check if count = 0. If not goto step IV.
Step IX     :    Store the maximum number.
Step X      :    Stop.

/*    Program :

      Instruction                Comment */
      LDA   D000H
      MOV   C, A                  ; Initialize counter
      XRA   A                     ; Maximum = Minimum possible value = 0
      LXI   H, D001H              ; Initialize pointer
BACK: CMP   M                     ; Is number > maximum
      JNC   SKIP
      MOV   A, M                  ; If number > maximum then interchange.
SKIP: INX  H
      DCR   C
      JNZ   BACK
      STA   E000H            ; Store maximum number
      HLT                         ; Terminate program execution
