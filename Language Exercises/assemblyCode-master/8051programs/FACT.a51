MOV R0,#05 H  ; Load number in Register R0
MOV A,#01H    ; initialize A=1
MOV B,#01H    ; initalize B=1
MOV R3,#01H
MOV R1,B
UP:MOV A,R3
MUL AB     ; multiply numbers and result in dx & ax
MOV R3,A
MOV R2,B  
INC R1        ; increment R1
MOV B,R1      ; Restore the value of B
MOV A,B 
CJNE A,#06H,UP; multiply till B < R0
MOV B,R2 ; store the MSB of result in register B
MOV A,R3 ; store the lsb of result in Register A
END 
