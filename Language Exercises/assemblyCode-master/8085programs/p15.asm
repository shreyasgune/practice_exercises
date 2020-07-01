

/*    Explanation :

  • Consider that a block of N words is present. Now  we  have  to  arrange
    these N words in ascending order, Let N = 4 for example. We will use HL
    as pointer to point the block of N words.
  • Initially in the first iteration  we  compare  first  number  with  the
    second number. If first number < second number, don’t  interchange  the
    contents, otherwise if first number > second number swap the contents.
  • In the next iteration we go on comparing the first  number  with  third
    number. If first number < third number, don’t interchange the contents.
    If first number > third number then swapping will be done.
  • Since the first two numbers are in ascending  order  the  third  number
    will go to first place, first number in second place and second  number
    will come in third place in the second iteration only if first number >
    third number.
  • In the next iteration first number is compared with fourth  number.  So
    comparisons are done till all  N  numbers  are  arranged  in  ascending
    order. This method requires approximately n comparisons.
/*    Algorithm :
Step I                 :     Initialize the number of elements counter.
Step II     :    Initialize the number of comparisons counter.
Step III    :  Compare the elements. If first element
                    < second element goto step VIII else
                    goto step V.
Step IV     :  Swap the elements.
Step V      :  Decrement the comparison counter.
Step VI     :  Is count = 0 ? if yes goto step VIII else
                    goto step IV.
Step VII    :  Insert the number in proper position
Step VIII   :  Increment the number of elements counter.
Step IX     :  Is count = N ? If yes, goto step XI else goto step II
Step X      :  Store the result.
Step XI     :  Stop.


/*    Program :

         Instruction               Comment */
      MVI   B, 09                 ; Initialize counter 1
START:        LXI    H,   D000H           ;   Initialize   memory    pointer


      MVI   C, 09H           ; Initialize counter 2
BACK: MOV   A, M                  ; Get the number in accumulator
      INX   H                ; Increment memory pointer
      CMP   M                ; Compare number with next number
      JC    SKIP                  ; If less, don’t interchange
        JZ      SKIP               ;    If    equal,    don’t    interchange


       MOV    D,  M                    ;   Otherwise   swap   the   contents


      MOV   M, A
      DCX   H                ; Interchange numbers
      MOV   M, D
       INX    H                      ;  Increment  pointer  to  next  memory
              location
SKIP: DCR   C                     ; Decrement counter 2
      JNZ   BACK             ; If not zero, repeat
      DCR   B                     ; Decrement counter 1
      JNZ   START            ; If not zero, repeat
      HLT                    ; Terminate program execution
