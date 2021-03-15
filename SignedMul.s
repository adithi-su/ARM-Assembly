				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; Assume that a signed long multiplication instruction is not available. 
; Write a program that performs long multiplications, producing 64 bits of result. 
Start          LDR R2, =0xFFFFFFF6
		       LDR R3, =0x00000110
Check          SMULL R1,R4,R2,R3 ; R4,R1:=R2*R3
			   LDR R9, =0xFFFFFFFF
			   MOV R0, #0 ; Initialiation
			   MOV R1, #0 ; Initialiation
			   MOV R8, #0 ; counter for Sign extension
; R0  | R1  | Inference 					 | result a*b(sign)
; 0	  | 0 	|	(both a and b are positive)	 |	+
; 0   | 1 	|	(a - positive, b - negative) |	-              
; 1   | 0 	|	(a - negative, b - positive) |	- 
; 1   | 1 	|	(both a and b are negative)  |	+
			   MOV R4, R2, LSR #31
			   LSL R4, #4 
			   MOV R5, R3, LSR #31
			   ORR R4, R4, R5
			   CMP R4, #0
			   BEQ case1
			   CMP R4, #0x01
			   BEQ case2
			   CMP R4, #0x10
			   BEQ case3
			   CMP R4, #0x11
			   BEQ case4
case1          UMULL R10,R11,R2,R3 ; R11,R10:=R2*R3 
			   B Stop
case2		   MOV R7, R3
			   BL TwosComplement
			   MOV R3, R7
			   UMULL R10,R11,R2,R3 ; R11,R10:=R2*R3 
			   MOV R7, R10
			   BL TwosComplement
			   MOV R10, R7
			   MOV R6, R11
			   BL SignExtend
			   B Stop
case3		   MOV R7, R2
			   BL TwosComplement
			   MOV R2, R7
			   UMULL R10,R11,R2,R3 ; R11,R10:=R2*R3 
			   MOV R7, R10
			   BL TwosComplement
			   MOV R10, R7
			   MOV R6, R11
			   B SignExtend
			   B Stop
case4          MOV R7, R2
			   BL TwosComplement
			   MOV R2, R7
			   MOV R7, R3
			   BL TwosComplement
			   MOV R3, R7
			   UMULL R10,R11,R2,R3 ; R11,R10:=R2*R3 
			   B Stop			   			  
TwosComplement MVN R7, R7
			   ADD R7, R7, #1
        	   BX lr
SignExtend     CMP R6, #0 
			   BEQ Next
			   ADD R8, R8, #1
			   LSR R6, #4
			   B SignExtend
			   
Next		   LSL R9, R8 
			   ADD R11, R11, R9
			   
Stop  		   B Stop
			   END