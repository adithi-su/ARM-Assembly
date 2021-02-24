NEW_BASE 		EQU 0xE0000012
				AREA program11, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
;To squeeze a string removing all the blank spaces and store it in the same location
Start          LDR R0, =String
               LDR R1, =NEW_BASE
			   MOV R4, #0x20
Loop		   LDRB R2, [R0], #1 ; load byte, update address
			   CMP R2, R4
			   BEQ Loop
			   STRB R2, [R1], #1 ; store if not space 
			   CMP R2, #0 ; check for zero terminator
			   BNE Loop ; keep going if not
			   ; string without blank spaces is in address 0xE0000012
			   ; use strcpy to copy it back to original location
     		   LDR R7, =String
			   LDR R8, =NEW_BASE
strcpy         LDRB R3, [R8], #1
			   STRB R3, [R7], #1
			   CMP R3, #0
			   BNE strcpy	
			   LDR R5, =Terminate
			   STRB R5, [R7]
			   
String         DCB "C string",0
Terminate      DCD 0x0000000
Stop  		   B Stop
				END