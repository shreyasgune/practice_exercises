

/*    Explanation :
  • We have immediate data 05 H. To load this data into the accumulator  we
    will use the MVI A, 05 H  instruction.
  • To transfer the data to B register we will use the instruction  MOV  B,
    A.
  • To transfer the data to H register we will use the instruction  MOV  H,
    A.
/*    Algorithm :
Step I           :     Load the accumulator with immediate data 05 H
Step II     :    Copy the contents of accumulator to the register B.
Step III    :    Copy the contents of accumulator to the register H.

Program :

Instruction      Comments
*/

MVI   A, 05 H    ; Initialize A reg = 05 H
MOV   B, A       ; Transfer contents of A to B reg.
MOV   H, A       ; Transfer contents of A to H reg.
HLT              ; Stop the execution.