

/*    Explanation :

  • Consider that a block of N words is present.
  • Now we have to arrange these N numbers in descending order, Let N  =  4
    for example.
  • We will use HL as pointer to point the block of N numbers.
  • Initially in the first iteration we compare the first number  with  the
    second number. If first number > second number  don’t  interchange  the
    contents. If first number < second number swap their contents.  Now  at
    the end of this iteration first two elements are sorted  in  descending
    order.
  • In the next iteration we will  compare  the  first  number  along  with
    third. If first > third don’t interchange contents otherwise  swap  the
    contents. At the end of this iteration first three elements are  sorted
    in descending order. Go on comparing till all the elements are arranged
    in descending order. This method requires approximately n comparisons.
/*    Algorithm :
Step I      :    Initialize the number of elements counter.
Step II     :    Initialize the number of comparisons counter.
Step III    :    Compare the elements.
                 If first element > second element goto step VIII else  goto
        step V.
Step IV     :    Swap the elements.
Step V      :    Decrement the comparison counter.
Step VI     :    Is count = 0 ? If yes, goto step VIII else goto step IV.
Step VII    :    Insert the number in proper position.
Step VIII   :    Increment the elements counter.
Step IX     :    Is count = N ? If yes, goto step XI else goto step II.
Step X      :    Stop.

/*    Program :

      Instruction      Comment */
            MVI  B, 09            ; Initialize counter 1
START :     LXI  H, D000H    ; Initialize memory pointer
            MVI  C, 09H           ; Initialize counter 2
BACK  :     MOV  A, M        ; Get the number in accumulator
            INX  H                      ; Increment memory pointer
            CMP  M                      ; Compare number with next number
            JNC  SKIP                   ; If more, don’t interchange
            JZ   SKIP        ; If equal, don’t interchange
            MOV  D, M                   ;  Otherwise swap the contents
            MOV  M, A
            DCX  H                      ; Interchange numbers
            MOV  M, D
            INX  H                      ; Increment pointer to  next  memory
              location
SKIP:       DCR  C                      ; Decrement counter 2
            JNZ  BACK        ; If not zero, repeat
            DCR  B                      ; Decrement counter 1
            JNZ  START            ; If not zero, repeat
            HLT                         ; Terminate program execution
