

/*    Explanation :

  • Consider that a block of data of N bytes is present at source location.
    Now this block of N bytes is to be moved  from  source  location  to  a
    destination location.
  • Let the number of bytes N = 10.
  • We will have to initialize this as count in the C register.
  • We know that source address is  in  the  HL  register  and  destination
    address is in the DE register.
  • Get the byte from source  memory  block  and  store  the  byte  in  the
    destination memory block.
  • Transfer data byte by byte from source to destination  block  till  all
    the bytes are transferred.

/*    Algorithm :

Step I                 :     Initialize the register C with count.
Step II     :    Initialize HL and DE with source
                       and destination address.
Step III    :    Get the byte from source memory block.
Step IV     :    Transfer the data to destination block.
Step V      :    Increment source memory pointer
Step VI     :    Increment destination memory pointer.
Step VII    :    Decrement Count.
Step VIII   :    Check for count in C,
           if not zero goto step III
Step IX     :    Stop.

/*    Program :

            Instruction       Comment */
      MVI   C, 0AH     ; Initialize counter
      LXI   H, D000H   ; Initialize source
                       ; memory pointer
      LXI   D, E000H   ; Initialize destination
                       ; memory pointer
BACK: MOV   A, M             ; Get byte from source
                 ; memory block
      STAX  D          ; Store byte in the
                 ; destination
                       ;  memory block
      INX   H          ; Increment source
                 ; memory pointer
      INX   D          ; Increment destination
                 ; memory pointer
      DCR   C          ; Decrement counter
      JNZ      BACK           ;     If     counter     ≠     0     repeat
      HLT              ; Terminate program execution
