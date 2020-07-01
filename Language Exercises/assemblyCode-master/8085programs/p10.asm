

/*    Explanation :

    Let the 8 bit number be in the A register. We have to  mask  the  lower
nibble, i.e. we have to separate the lower nibble. In the  result  only  MSB
number should remain.
    For example :
| e.g. : A = 5B H.|0101|1011|     |
|Logically AND    |1111|0000|     |
|with F0 H        |    |    |     |
|                 |0101|0000|= 50 |
|                 |    |    |H    |


                       Result = 50 H, B is masked
                       Store the result.

/*    Algorithm :

Step I      :    Load the number in A.
Step II     :    Mask lower  nibble i.e. ANI 0F0 H.
Step III    :    Store result.
Step IV     :    Stop.

/*    Program :

Instruction      Comment */s
ANI   0F0 H      ; Logically AND the number
MOV   B, A       ; Store the result.
HLT         ; Terminate the execution               Flowchart  11
