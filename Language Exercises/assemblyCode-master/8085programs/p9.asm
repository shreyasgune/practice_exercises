

/*    Explanation :

  • 2’s complement of number means add 1 to  the  1’s  complement  of  that
    number.
  • We will first load the number whose 2’s complement is to  be  found  in
    the accumulator.
  • Using the CMA instruction we will complement the accumulator.  This  is
    1’s complement of the number. Add 1 to this complemented number to  get
    the 2’s complement of the number.
  • Store the result at memory location C100 H.

/*    Algorithm :

Step I           :     Get the number
Step II          :     Complement the number
Step III    :    Add one to the complemented number.
Step IV     :    Store the result.

/*    Program :

Instruction      Operation   Comment */s
LDA   C200H ;    C200 ( A    ; Get the number
CMA         ;    ( A   ; Complement the number
ADI,  01H   ;    A + 1 ( A   ; Add 01 in the number
STA,  C100H      ;                ; Store the result.
HLT         ;    Stop  ; Terminate the execution              Flowchart  10
