MOV A,#33H  ;Load the 8 bit binary number in accumulator.
MOV B,#64 H ; Load register B with decimal 100
DIV AB     ; Divide by 100  A = quotient , B = remainder
MOV R2,A    ;Store hundred's digit in register R2
MOV A,B    ;Load remainder in register A
MOV B,#0A H ;Load register B with decimal 10         
DIV AB      ;Divide by 10  A = quotient , B = remainder
MOV R1,A  ;Store ten's digit in register R1
MOV R0,B  ;Store one's digit in register R0
END