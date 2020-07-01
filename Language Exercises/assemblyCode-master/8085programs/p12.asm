

/*    Explanation :

  • Consider that two words are available in register pairs HL and  DE.  We
    have to add these two words.
  • Using add instruction, add the contents, of the lower two bits i.e. add
    L and E.
  • The result of this addition is stored in the A register.
  • DAA instruction is then used to convert the result to valid BCD.  Store
    the result at memory location D000 H.
  • Now, add the contents of  MSB  alongwith  carry  if  generated  in  LSB
    addition.
  • The result of MSB addition is stored in the  A  register.  Adjust  this
    result to valid BCD number. The final result  is  then  stored  at  the
    memory location D001 H.
      e.g. :     HL    =     3629 BCD
                                  DE    =    4738 BCD
|Step I :   |  |2 |9  |                                             |
|           |+ |3 |8  |                                             |
|           |  |6 |1  |and auxiliary carry = 1                      |


                As     AC    =    1, add 6 to make result valid.
            61 + 6     =     67
Step II :   36 + 47 + 0 (Carry of LSB) = 7 D.
      Lower nibble of addition is greater than 9, so add 6.
|         |  |7 |D  |                                           |
|         |+ |0 |6  |                                           |
|         |  |8 |3  |                                           |


      Final result : 8367 BCD.

/*    Algorithm :

Step I                 :     Add two lower digits.
Step II     :    Adjust result to valid BCD number.
Step  III     :     Store  the   result   at   memory   location   D000   H.
Step IV     :    Add the two upper digits with carry.
Step V      :    Adjust result to valid BCD number.
Step VI     :    Store the result at memory location D001 H.
Step VII    :    Display the result.
Step VIII   :    Stop.



/*    Program :

  Instruction           Comment */
  MOV     A, L  ;  Get the LSB of first number in A
     ADD  E           ;  A = A +E i.e. compute the  LSB addition
  DAA                 ; Convert the HEX to valid BCD result.
  STA     D000 H      ; Store result of LSB addition at  location  D000  H
  MOV     H, A                   ;  Get the MSB of first number in A
  ADC D                ;  A = A +D + CY i.e. compute the  MSB addition
  DAA                ; Convert the HEX to valid BCD result.
  STA           D001 H     ; Store result of LSB addition at location D001H
  HLT                      ; Terminate the  execution of program
