

/*    Explanation :

  • We have to exchange the contents of memory locations D000 H and D001 H.
    Initially we will load the contents of memory location D000  H  to  the
    accumulator.
  • Store the contents of accumulator in register B.
  • Now, load the contents of memory location D001 H  to  the  accumulator.
    Store this number at memory location D000 H.
  • Load the stored number in register B back to the accumulator and  store
    the contents of accumulator to memory location D001 H.

/*    Algorithm :

Step I      :    Load the accumulator with the contents of memory  location
        D000 H.
Step II     :    Copy the contents of accumulator to the register B.
Step III    :    Load the accumulator with the contents of memory  location
        D001 H.
Step IV     :    Store the contents of accumulator to memory location  D000
        H.
Step V      :    Copy the contents of register B to the accumulator.
Step VI     :    Store the contents of accumulator to memory location  D001
        H.
Step VII    :    Stop.

/*    Program – I :

Instruction      Comment */
LDA   D000 H     ; Load data from one memory location
MOV   B, A       ; Store it in B reg.
LDA   D001 H     ; Load data from second memory location
STA   2000 H     ; Store data of second memory location to first memory location.
MOV   A,B        ; Recall data of first location
STA   2001 H     ; Store it in second memory location
HLT              ; Stop

/*    Program – II :

Instruction      Comment */
LHLD  D000 H     ; Load HL with data at D000 H and D001 H
MOV   A, H       ; second byte in ACC
MOV   H, L       ; first byte in H
MOV   L, A       ; second byte in L
SHLD  D000 H     ; Store HL
HLT              ; Stop


/*    Program – III :

Instruction      Comment */
LXI   H, D000 H  ; HL pointing to D000 H
LXI   D, D001 H  ; DE pointing to D001 H
MOV   B, M       ; B  (HL) (first byte)
LDAX  D          ; Load second byte in ACC.
XCHG             ; Exchange DE and HL pair contents.
MOV   M, B       ; Store first byte in second location
STAX  D          ; Store second byte in first location.
HLT              ; Stop