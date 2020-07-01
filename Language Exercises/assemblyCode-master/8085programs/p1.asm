

/*    Explanation :

    Let the 8 bit number be in the A register. We have to  mask  the  upper
nibble i.e. we have to separate the upper nibble. In  the  result  only  LSB
number should be present.
| e.g. : AL = 67H.|0110|0111|     |
|Logically AND    |0000|1111|     |
|with 0FH         |    |    |     |
|                 |0000|0111|= 07H|


                       Result = 07 H, 6 is masked.
                       Store the result.

/*    Algorithm :

Step I                 :     Load the number in A.
Step II     :    Mask the upper nibble.
Step III    :    Store the result in register B.
Step IV     :    Stop.

Program :

Instruction             Comments */
ANI   0F H  ; Logically AND the number
MOV   B, A  ; Store the result.
HLT         ; Terminate the execution