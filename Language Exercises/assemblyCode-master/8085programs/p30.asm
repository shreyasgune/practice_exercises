

/*    Explanation :

  • To find the square of a number we multiply the number with itself.
  • Store the result.

/*    Algorithm :

Step  I     :    Initialize the look up table pointer.
Step II     :    Initialize  the  source  memory  pointer  and  destination
         memory pointer.
Step III    :    Get the number.
Step IV     :    Compute the square of number. Result is stored  in  the  A
         register.
Step V      :    Store the result  to the required destination location.
Step VI     :    Increment source memory pointer.
Step VII    :    Increment destination memory pointer.
Step VIII   :    Check if number is last number. If not goto step III
Step IX     :    Stop.

/*    Program :

            Instruction                 Comment */
            LXI  H, D100H    ; Initialize lookup  ; table pointer
            LXI  D, D000H    ; Initialize source memory pointer
            LXI  B, D200H    ; Initialize destination memory pointer
BACK:       LDAX  D          ; Get the number
            MOV  L,A         ; A point to the
                             ; square
            MOV  A,M         ; Get the square
            STAX B           ; Store the result at destination memory location
            INX  D           ; Increment source memory pointer
            INX  B           ; Increment destination memory pointer
            MOV   A,C
            CPI   05H        ; Check for last number
            JNZ  BACK        ; If not repeat
            HLT              ; End of program

