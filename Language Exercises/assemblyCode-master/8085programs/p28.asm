

/*    Explanation :

  • Initialize the sum to zero. Load the count of numbers  in  register  C.
    Initialize pointer to start of series.
  • To check whether the number is even we will AND the number with  01  H.
    If the result of ANDing is zero it indicates that the number  is  even.
    We will add this even number to the initialised sum.
  • Decrement count. Increment source pointer to  next  location.  Continue
    the process till sum of all even numbers is found.  Store  the  sum  at
    memory location E000 H.

/*    Algorithm :

Step I      :    Initialize sum  in B = 00.
Step II     :    Initialize pointer to start of series i.e.
        D001 H. Initialize counter 1 = 10.
Step III    :    Check if number is even.
        If not goto step V.
Step IV     :    Sum = Sum + Data.
Step V      :    Increment pointer.
Step VI     :    Decrement counter.
Step VII    :    Check if count = 0. If not go to step IV.
Step VIII   :    Store result in memory location E000 H.
Step IX     :    Stop.


/*    Program :

      Instruction                 Comment */
      LDA   D000H
      MOV   C, A                  ; Initialize counter
      MVI        B,      00H      ; sum       =        0
      LXI   H, D001H              ; Initialize pointer
BACK: MOV   A, M                  ; Get the number
      ANI,  01H                   ; Mask Bit1 to Bit7
      JNZ   SKIP                  ; Don’t add if number is ODD
      MOV   A, B                  ; Get the sum
      ADD   M                     ; SUM = SUM + data
      MOV   B, A                  ; Store result in B register
SKIP:       INX        H          ; increment pointer
      DCR   C                     ; Decrement counter
      JNZ   BACK                  ; if counter 0 repeat
      STA   E000H                 ; store sum
            HLT                   ; Terminate program execution
