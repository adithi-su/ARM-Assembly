				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; to find the maximum value in a list of numbers stored in the memory
; 0 - terminating character 
Start          LDR R0, =NoList
			   MOV R1, #0 ; to store max
Loop           LDRB R2, [R0], #1
			   CMP R2, #0
			   BEQ Stop
			   CMP R2, R1 
			   BLT Loop
			   MOV R1, R2
			   B Loop 
NoList         DCB 0x12, 0x67, 0x1, 0x2
			   DCB 0x32, 0x78, 0xA, 0xA2
			   DCB 0xB, 0
Stop  		   B Stop
			   END