

/*    Explanation :

  • We have an array of N numbers. For e.g. we initialize the count with 5.


  • Also we initialize a pointer to point the elements in the array.
  • We will check for the MSB. If the MSB of number is  1,  the  number  is
    negative.
  • Increment count for counting the negative numbers.
  • Increment the pointer to point to the next element. Check if MSB is  1.
    Repeat process till all the numbers are scanned.
  • Store the count of negative numbers.

/*    Algorithm :

Step I      :    Initialize count for number of elements
Step II     :    Get the number.
Step III    :    AND the number with 80H.
Step IV     :    Check if MSB is 1. If yes, goto step V, else goto step VI.
Step V      :    Increment count for counting negative numbers.
Step VI     :    Increment pointer.
Step VII    :    Decrement count.
Step VIII   :    Check for count = 0. If yes, goto step IX  else  goto  step
         III.
Step IX     :    Store the count for number of negative numbers.
Step X      :    Stop.

/*    Program :
      Instruction      Comment */
            LDA  D000H
            MOV  C,A         ; Initialize count
            MVI  B,00        ; Initialize the Negative number count = 0
            LXI    H,D001H       ;    Initialize    pointer    to    array

BACK:       MOV       A,M              ;      Get      the       number
            ANI  80H         ; Check for MSB
            JZ   SKIP        ; Check if MSB = 1
            INR  B           ; Increment negative number count
SKIP: INX   H          ; Increment pointer
            DCR  C           ; Decrement count
            JNZ  BACK        ; If count 0 repeat
            MOV  A, B
            STA  E000H            ; Store the result
            HLT              ; Terminate program execution
