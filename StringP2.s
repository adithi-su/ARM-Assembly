NEW_BASE 		EQU 0xE0000012
				AREA program10, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
;To insert a substring in main string at given position.
; say, at position 3 
Start          LDR R0, =String
			   LDR R1, =SubString
               LDR R2, =NEW_BASE
			   MOV R3, #3 ; count
			   MOV R4, #0 
Loop           LDRB R5, [R0], #1
			   STRB R5, [R2], #1
			   SUB R3, R3, #1
			   CMP R3, R4  
			   BNE Loop
AddSubstr      LDRB R6, [R1], #1
			   STRB R6, [R2], #1
			   CMP R6, #0
			   BNE AddSubstr
			   LDRB R6, [R2], #-1
LoopCont       LDRB R5, [R0], #1
			   STRB R5, [R2], #1
			   CMP R5, #0
			   BNE LoopCont
			   ;copy the updated string back to original address
			   LDR R7, =String
			   LDR R8, =NEW_BASE
strcpy         LDRB R3, [R8], #1
			   STRB R3, [R7], #1
			   CMP R3, #0
			   BNE strcpy
String         DCB "C string",0
SubString      DCB "ARM Assembly",0
Stop  		   B Stop
				END