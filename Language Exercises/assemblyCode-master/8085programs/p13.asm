
/*    Explanation :
  • We are given a series of numbers.  The length of series  is  stored  at
    memory location D000 H. We will initialise register C as  counter  with
    the length of the series.
  • We will initialise the accumulator with 00 H, so that the  sum  can  be
    stored in the accumulator.
  • The series begins at D001 H. So, we will  initialise  HL  the  register
    pair as memory pointer to point the series.
  • Using add instruction, add the contents, of the  accumulator  with  the
    contents of memory location pointed by HL register pair. The result  of
    this addition will be stored in the A register.
  • Then we will increment HL to point  to  next  memory  location  of  the
    series. Decrement the count in register C. Continue this  process  till
    the count is zero i.e. all the numbers in the series are added.
  • Store the result at memory location E000 H.
Example : Let    D000 = 05 H i.e. series is of 5 numbers.
                       D001 = 08 H
                             D002 = 12 H
                             D003 = 74 H
                             D004 = 34 H
                             D005 = 04 H
                 Result  = 08 H + 12 H + 74 H + 34 H + 04 H = C6 H
                 E000 H = C6 H.

/*    Algorithm :

Step I                 :     Initialize the register C with count.
Step II     :    Initialize  sum  in accumulator = 0.
Step III    :    Initialize the pointer to memory location
                       D001 H i.e. first number of series.
Step IV     :    Add the numbers in series.
Step V      :    Increment memory pointer to
                       next memory location.
Step VI     :   Decrement count
Step VII    :    Check if count = 0, if not goto step IV
Step VIII   :    Store the result at memory location E000 H.
Step IX     :    Stop.

/*    Program :
Instruction      Comment */
      LDA   D000       ; A = contents of location D000 H
      MOV   C, A       ; Initialize counter
      XRA   A          ; sum = 0
      LXI   H, D001H         ; Initialize  HL as memory pointer
                       ; for the series
L1:   ADD M            ; SUM in A= SUM in A + M
      INX   H          ; Increment pointer
      DCR   C          ; Decrement counter
      JNZ   L1         ; if counter  0 repeat
      STA   E000H            ; store the result at memory  location  E000  H

HLT                   ;      Terminate      program      execution

