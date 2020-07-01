

/*    Explanation :

  • One’s complement of number means to invert each bit of that number.  So
    our task is to complement each bit of number.
  • We will first load the number whose 1’s complement is to  be  found  in
    the accumulator.
  •  Using the CMA instruction we will complement the accumulator. This  is
    1’s complement of the number.
  • Store the result at memory location C100 H.

/*    Algorithm :

Step I                 :     Get the number
Step II     :    Complement the number
Step III    :    Store the result.



/*    Program :

Instruction      Operation   Comment */s
LDA   C200H ; C200 ( A ; Get the number
CMA         ; ( A      ; Complement number
STA   C100H      ;                ;  Store the result
HLT         ; Stop           ; Terminate program execution