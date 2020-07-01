

/*    Explanation :

  • We have a source block  and  a  destination  block.  The  source  block
    contains N bytes. For
    example : Let N = 10. We have to reverse this  10  bytes  of  data  and
    transfer them to destination block.
  • A pointer will be initialized to point  to  source  block  and  another
    pointer to point the destination block. The count of number of bytes is
    loaded in the C register.
  • We will add the count to source memory  pointer,  so  that  the  source
    memory pointer will point to the last location. Then, we will copy  the
    contents of this location to destination.
  • Decrement the counter. Decrement Source memory pointer to point to (N –
    1)th block.
  • Increment destination pointer to point to the next location.
  • Repeat the process till all the contents are transferred to destination
    block in reverse manner. Store the result.

/*    Algorithm :

Step  I     :    Initialize pointer to  starting  location  of  source  and
          destination pointer to starting location of destination block.
Step II     :    Initialize C = count.
Step III    :    Source pointer = Source pointer + (count – 1), i.e. Source
          pointer points to last element in source block.
Step IV     :    Load A = contents  of  element  where  Source  pointer  is
          pointing.
Step V      :    Transfer contents of A to destination location.
Step VI     :    Decrement Source pointer.
Step VII    :    Decrement count.
Step VIII   :    Increment Destination pointer to next location.
Step IX     :    Check if count = 0 ? If not, go to step IV.
Step X      :    Display transferred contents.
Step XI     :    Stop.

/*    Program :

      Instruction                       Comment */
      MVI  C, 0AH      ; Initialize counter
      LXI   H, D000 H  ; Initialize source memory pointer
      LXI   D, D100 H  ; Initialize destination memory pointer
BACK: MOV   A, M       ; Get byte from source memory block
      STAX  D          ; Store byte in the destination memory block
      INX   H          ; Increment source memory pointer
      DCX   D          ; Decrement destination memory pointer
      DCR   C          ; Decrement counter
      JNZ   BACK       ; If counter  0 repeat
      HLT              ; Terminate program execution