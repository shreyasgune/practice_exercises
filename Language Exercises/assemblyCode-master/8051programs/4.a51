CLR PSW.3  ; Select Register bank 0
CLR PSW.4 
MOV A ,R3  ; Load the number in accumulator
CPL A      ; Compute 1's complement
ADD A,#01H ; Compute 2's complement
MOV R3,A ; Store the result
End