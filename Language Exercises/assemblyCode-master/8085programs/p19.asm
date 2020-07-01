

/*    Explanation :

  • Get the dividend in the HL  register  pair.  Get  the  divisor  in  the
    accumulator and store it in register C.
  • Initialize quotient in register pair DE as 00 H.
  • Perform the division by subtracting the divisor from the dividend, till
    the dividend is greater than the divisor. Increment the quotient  every
    time the dividend is greater than the divisor when the  subtraction  is
    performed.
  • When the dividend becomes less than the divisor then this  dividend  is
    the remainder. Store the quotient and remainder.

/*    Algorithm :

Step I                 :     Get the dividend in the HL register pair.
Step II     :    Get the divisor in the accumulator
Step III    :    Initialize quotient =0
Step IV     :    Perform division,
                       Division = Dividend – Divisor
Step V      :    Increment quotient by 1
Step VI     :    Check if dividend < divisor,
                       if not zero goto step IV
Step VII    :    Remainder = Dividend
Step VIII   :    Store the quotient and remainder.
Step IX     :    Stop.

/*    Program :

      Instruction                 Comment */
      LHLD  D000H                 ; Get the dividend
      LDA   D002H                 ; Get the divisor
      MOV   C, A             ;  Store the divisor in C
      LXI   D, 0000H         ; Initialize Quotient = 0
BACK:MOV    A, L             ;
      SUB   C                ;  Division = Dividend – Divisor
      MOV   L, A
      JNC   SKIP
      DCR   H                     ; Subtract borrow of previous  subtraction


SKIP:   INX     D                       ;   quotient   =   quotient   +    1
      MOV   A, H
      CPI   00                    ; Check if dividend < divisor
      JNZ   BACK
      MOV   A, L                  ;  if no repeat
      CMP   C
      JNC   BACK
      SHLD  E002H                       ; Store the remainder
      XCHG
      SHLD  E000H                       ; Store the quotient
      HLT                         ; Terminate program execution
