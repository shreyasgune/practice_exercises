
/*    Explanation :
  • A digit BCD number is available at memory location D000 H. We  have  to
    unpack this BCD number i.e. we have to separate the BCD digits. e.g.  :
    If the number = 92 H then in unpack form the two digits will 02  H  and
    09 H.
  • We have to mask the lower nibble, first and rotate four  times  to  the
    right to get the MSB digit.
  • Then to get the LSB digit mask the upper nibble.
  • Store the result.
  • Masking lower nibble means ANDing the number
    with 0F0 to get MSB.

/*    Algorithm :

Step I                 :     Load unpacked number into register A.
Step II     :    Mask the lower nibble.
Step III    :    Rotate 4 times right to make MSB digit = LSB.
Step IV     :    Store the digit at memory location D001 H.
Step V      :    Load number in A.
Step VI     :    Mask upper nibble.
Step VII    :    Store the result at memory location D002 H.
Step VIII   :    Stop.

/*    Program :

Instruction          Comment */
LDA D000H   ; Get the packed BCD number in register A
ANI 0F0H    ; Mask lower nibble
RRC         ; Make MSB BCD digit  = LSB digit
RRC
RRC
RRC
STA D001H   ; Store the partial result
LDA D000H   ; Get the original BCD number in register A
ANI 0FH     ; Mask higher nibble
STA D002H   ; Store the result
HLT         ; Terminate program execution

