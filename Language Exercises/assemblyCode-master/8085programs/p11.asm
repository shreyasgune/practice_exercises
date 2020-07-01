

/*    Explanation :

  • We are given two BCD numbers at memory locations D000 H and D001 H. Let
    these numbers be 02 H and 09 H.
  • We have to add the byte at memory location D000 H (02 H) with the  byte
    at memory location D001 H (09 H).
  • Initially we will store the first number in the accumulator.
  • Using ADD instruction add the two contents. Result of addition will  be
    stored in the A register.
  • Using DAA adjust the result to valid BCD number.
  • Store the result at memory location D002 H.
|For       |D000 H  = 02|  |02 H          |
|example : |H           |  |              |
|          |D001 H  = 09|+ |09 H          |
|          |H           |  |              |
|          |DAA         |  |0B H (invalid |
|          |            |  |BCD)          |
|          |            |+ |06  H         |
|          |            |  |11  H ( valid |
|          |            |  |BCD)          |


/*    Algorithm :
Step I      :    Start
Step II     :    Get the first number in A register.
Step III    :    Get the second number in memory.
Step IV     :    Add the two numbers.
Step V      :    Store the result at memory location D002 H
Step                   VI                       :                       Stop



Program :
Instruction             Comment */
LXI H,      D000 H                ;     HL points to the memory
                             ;    location D000 H
MOV   A,M              ;     Get the contents of location
                             ;    D000 H into the accumulator.
INX   H                ;     Increment HL to point to next memory
                                  ;          location       i.e.       D001H

ADD   M                ;     A = A +M i.e. compute the addition
DAA                          ;    Convert the HEX to valid BCD result.
INX   H                ;     Increment HL to point to next memory
                             ;    location i.e. D002H
MOV   M, A             ;     Store the result at memory location
                       ;     D002 H
HLT                    ;     Terminate the  execution of program
