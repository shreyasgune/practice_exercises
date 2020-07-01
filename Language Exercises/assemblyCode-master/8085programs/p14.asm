

/*    Explanation :

  • We are given a series of numbers.  The length of series  is  stored  at
    memory location D000 H. We will initialize register C as  counter  with
    the length of the series.
  • We will initialize the accumulator with 00 H, so that the  sum  can  be
    stored in the accumulator. Also initialize register B = 00  H  so  that
    the higher byte of sum can be stored.
  • The series begins at D001 H. So, we will  initialize  HL  the  register
    pair as memory pointer to point the series.
  • Using add instruction, add the contents, of the  accumulator  with  the
    contents of memory location pointed by HL register pair. The result  of
    this addition will be stored in the A register.
  • Check for carry. If carry is 1 then increment register B.
  • Then we will increment HL to point  to  next  memory  location  of  the
    series. Decrement the count in register C. Continue this  process  till
    the count is zero i.e. all the numbers in the series are added.
  • Store the result at memory locations E000 H and E001 H.

/*    Algorithm :

Step I                 :     Initialize the register C with count.
Step II     :    Initialize  sum  in accumulator = 00  H   and   register  B
    =00 H.
Step III    :    Initialize the pointer  to  memory  location  D001  H  i.e.
    first number of series.
Step IV     :    Add the numbers in series.
Step V      :    Increment memory pointer to next memory location.
Step VI     :    Check for carry. If carry = 1 goto step VII else goto  step
    VIII
Step VII    :    Increment register B
Step VIII   :  Decrement count
Step IX     :    Check if count = 0, if not goto step IV
Step X      :    Store the result at memory locations E000 H and E001 H.
Step XI     :    Stop.


/*    Program :

      Instruction       Comment */
      LDA   D000 H                ;    A  =  contents  of  location  D000  H


      MOV   C, A                  ; Initialize counter
      XRA   A                     ; sum = 0
      XRA   B                     ; sum in B = 0
      LXI   H, D001H   ; Initialize  HL as memory pointer
                                  ; for the series
L1:   ADD   M                     ; SUM in A= SUM in A + M
      JNC   L2                    ; Check for carry
      INR   B                     ; Carry is incremented as MSB
                                  ; in register B.
L2 :  INX   H                     ; Increment pointer
      DCR   C                     ; Decrement counter
      JNZ   L1                    ; if counter  0 repeat
      STA   E000H                 ; store the result at memory
                                  ; location E000 H
      MOV   A, B             ; Store the MSB of result in
                                  ; register B
      STA   E001H                 ; store the result at memory location
                                  ; E001 H
      HLT                           ;    Terminate    program    execution

