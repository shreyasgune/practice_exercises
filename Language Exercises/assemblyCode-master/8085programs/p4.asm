

/*    Explanation :

  • We are given two numbers at memory locations D000 H  and  D001  H.  Let
    these numbers be
    20 H and 50 H.
  • We have to add the byte at memory location D000 H ( 20  H  )  with  the
    byte at memory location D001 H ( 50 H).
  • Initially we will store the first number in the accumulator.
  • Using ADD instruction add the two contents. Result of addition will  be
    stored in the A register.
  • Store the result at memory location D002 H.
|For example|D000 H  = 20 |   |20 H  |
|:          |H            |   |      |
|           |D001 H = 50  |+  |50 H  |
|           |H            |   |      |
|           |             |   |70 H  |


/*    Algorithm :

Step I      :    Start
Step II     :    Get the first number in A register.
Step III    :    Get the second number in memory.
Step IV     :    Add the two numbers.
Step V      :    Store the result at memory location D002 H.
Step VI     :    Stop


/*    Program :

Instruction      Comment */
LXI   H, D000 H  ; HL points to the memory location D000 H
MOV     A,   M   ; Get the contents of location D000 H into the accumulator.
INX   H          ; Increment HL to point to next memory location i.e. D001H
ADD   M          ; A = A +M i.e. compute the addition
INX   H          ; Increment HL to point to next memory location i.e. D002H
MOV   M, A       ; Store the result at memory location i.e. D002H
HLT