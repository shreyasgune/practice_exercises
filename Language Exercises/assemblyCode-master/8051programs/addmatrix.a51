
MOV R2,#09H ; initialize counter 
 MOV R0,#20H ; initialize pointer to matrix1
 MOV R1,#30H   ; initialize pointer to matrix2  
 MOV DPTR,#1200H ; initialize pointer to result matrix3
BACK:MOV A,@R0  ; take no from matrix 1  
 ADD A,@R1 ; addition=mat1+mat2
 MOVX @DPTR,A   ; move the result in matrix3
 INC R0 ; get next element from matrix1
 INC R1 ; get next element from matrix2
 INC DPTR ; Point to next element
 DEC R2
 CJNE R2,#00H,BACK ; continue till all elements are added
 END
