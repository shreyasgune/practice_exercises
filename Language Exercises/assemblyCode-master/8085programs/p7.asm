
/*    Explanation :
  • We are given two 16 bit numbers at memory locations D000 H, D001 H  and
    D002 H, D003 H. Let these numbers be 1234 H and 0100 H.
  • We have to subtract the word at memory locations  D000  H  and  D001  H
    (1234 H) from the word at memory locations D002 H and D003 H (0100 H).
  • We subtract the two LSBs and the two MSB separately.
  • Store the result at memory locations D004 H and D005 H.
/*    Algorithm :
Step I           :     Start
Step II     :    Get the LSB of first 16 bit  number in A.
Step III    :    Get the MSB of the first number in register B.
Step IV     :    Get the LSB of the second number in register C
Step V      :    Get the MSB of the second number in register D
Step VI     :    Subtract  the LSB of two numbers.
Step VII    :    Store the result of LSB subtraction
                       in register L.
Step VIII   :    Load the MSB of the first number in accumulator.
Step IX     :    Subtract the MSB of two numbers.
Step X      :    Store the result of MSB subtraction
                       in register H.
Step XI     :   Store the result at memory locations
                       D004 H and D005 H.
Step XII    :    Stop.

/*    Program 1 :
Instruction             Comment */
LXI   H, D000 H        ; HL points to the memory
                       ;  location D000 H
MOV   A, M             ; Get the contents of location
                       ; D000 H into the accumulator.
INX   H          ; Increment HL to point to next
                            ;      memory      location      i.e.      D001H

MOV   B, M       ; Get the contents D001 H  into  register  B  i.e.  MSB  of
first number.
INX   H          ; Increment HL to point to next memory location i.e. D002H
MOV   C, M       ; Get the contents D002 H into register C i.e. LSB  of  2nd
number.
INX   H          ; Increment HL to point to next memory location i.e. D003H
MOV   D, M       ; Get the contents D003 H into register C i.e. MSB of 2nd
number.
SUB   C          ; Compute LSB subtraction  A= A – C
MOV   L, A             ; Store the result in register L.
MOV   A, B                   ; Copy the contents of MSB of first number to
the accumulator.
SUB   D          ; Compute MSB subtraction  A= A – D
MOV   H, A             ; Store the result in register H.
SHLD  2004 H           ; Store the result at memory  locations  2004  H  and
2005 H.
HLT