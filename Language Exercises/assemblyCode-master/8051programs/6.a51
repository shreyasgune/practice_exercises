MOV A,# 92H ; Load the number in accumulator.
MOV B,A     ; Store the number in register B.
ANL A,#0F0H ;Mask lower nibble
SWAP A      ; Make the MSB digit = LSB digit  
MOV R1,A   ; Store the result in register R1 of register bank 3. 19 H is the address of register R1 of register bank 3.
MOV A , B   ; Load the number back in accumulator
ANL A,#0FH ; Mask upper nibble
MOV R0,A  ; Store the result in register R0 of register bank 3. 18 H is the address of register R0 of register bank 3.
End