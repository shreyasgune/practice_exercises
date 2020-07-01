

/*    Explanation :

  • We are given two 16 bit numbers at memory locations D000 H, D001 H  and
    D002 H, D003 H. Let these numbers be 1234 H and 4321 H.
  • We have to add the word at memory locations D000 H and D001 H (1234  H)
    with the word at memory locations D002 H and D003 H (4321 H).
  • There are two methods for computing the 16 bit addition.
  • In the first method we add the two LSBs and the two MSB separately.
  • In the second method we will store the two numbers in register pairs DE
    and HL. Then using the instruction DAD we  will  add  the  two  16  bit
    numbers. The result of addition will be stored in the HL register pair.
    Store the result from HL register pair to memory locations D004  H  and
    D005 H.

/*    Algorithm  for method 1:

Step I                 :     Start
Step II     :    Get the LSB of first 16 bit  number in A.
Step III    :    Get the MSB of the first number in register B.
Step IV     :    Get the LSB of the second number in register C
Step V      :    Get the MSB of the second number in register D
Step VI     :    Add the LSB of two numbers.
Step VII    :    Store the result of LSB addition in register L.
Step VIII   :    Load the MSB of the first number in accumulator.
Step IX     :    Add the MSB of two numbers.
Step X      :    Store the result of MSB addition in register H.
Step XI     :    Store the result at memory locations D004 H and D005 H.
Step XII    :    Stop


/*    Program 1

Instruction             Comment */
LXI   H, D000 H  ;     HL points to the memory location D000 H
MOV   A, M  ;    Get the contents of location
                 ;     D000 H into the accumulator.
INX   H     ;    Increment HL to point to next
                 ;     memory location i.e. D001H
MOV   B, M       ;     Get the contents D001 H into
                 ;     register B i.e. MSB of first number.
INX   H     ;    Increment HL to point to next
                 ;     memory location i.e. D002H
MOV   C, M  ;    Get the contents D002 H into register
                 ;     C i.e. LSB of 2nd number.
INX   H     ;    Increment HL to point to next
                 ;     memory location i.e. D003H
MOV   D, M  ;    Get the contents D003 H into
                 ;     register C i.e. MSB of 2nd number.
ADD   C     ;    Compute LSB addition A= A + C
MOV   L, A  ;    Store the result in register L.
MOV   A, B             ;     Copy the contents of MSB of first
            ;    number to the accumulator.
ADD   D     ;    Compute MSB addition A= A + D
MOV   H, A  ;    Store the result in register H.
SHLD 2004 H      ;     Store the result at memory locations
            ;    2004 H and 2005 H.
HLT

/*    Algorithm  for method 2 :

Step I      :    Start
Step II     :    Get the first 16 bit number.
Step III    :    Exchange the contents of register pair HL
                 with the contents of DE register pair.
Step IV     :    Get the second 16 bit number.
Step V      :    Add the two numbers.
Step VI     :    Store the result at memory locations D004 H
                 and D005 H.
Step VII    :    Stop

/*    Program  2 :

Instruction      Comment */
LHLD  D000 H     ; Get the first number
XCHG             ; Store the first number in DE register pair
LHLD  D002 H     ; Get the second number
DAD   D          ; Add  the two numbers
SHLD  D004 H     ; Store the result D004 H and D005 H.
HLT              ; Terminate program execution.