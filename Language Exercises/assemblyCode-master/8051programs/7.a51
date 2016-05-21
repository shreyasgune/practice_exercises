 CLR PSW.3  ; Select Register bank 0
 CLR PSW.4 
 MOV R0,#0AH ; Initialize register R0 as counter.
 MOV R1,#40H ; Initialize register R1 as memory pointer.
 MOV A,#00H  ; Initialize result = 00H 
L1:ADD A,@R1 ; Compute addition
 INC R1      ; Increment R1 to point next memory location
 DJNZ R0,L1  ; Check if count = 0 ?
 MOV R0,A   ; Store the result in register R0 of bank 1
 End
