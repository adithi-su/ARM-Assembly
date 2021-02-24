				AREA program9, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
;To find the substring in Main string.
;if present store 1 in R7, else store 0xFF
Start          LDR R0, =String
			   LDR R1, =SubString
			   MOV R7, #0xFF; default:false
Loop 		   LDRB R2, [R0], #1;main
			   LDRB R3, [R1]; sub
			   CMP R2,R3 
			   BNE Loop
			   LDRB R5, [R1], #1
SubCheck	   LDRB R4, [R0], #1 
			   LDRB R5, [R1], #1
			   CMP R5, #0
			   BEQ True
			   CMP R4, R5
			   BEQ SubCheck
			   CMP R4, #0
			   BNE Loop
True           MOV R7, #1
String         DCB "C string",0
SubString      DCB "str",0
Stop  		   B Stop
				END