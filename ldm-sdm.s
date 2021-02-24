				AREA program5, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler
;To add a constant value 0xFF to a block of 10 words stored in the consecutive memory locations using LDM and STM instructions
Start          	LDR R0, =words
				LDR R11,=0xE01FC010
				LDM R0, {R1-R10}
				STM R0, {R1-R10}
				ADD R1, R1, #0xFF
				ADD R2, R2, #0xFF
				ADD R3, R3, #0xFF
				ADD R4, R4, #0xFF
				ADD R5, R5, #0xFF
				ADD R6, R6, #0xFF
				ADD R7, R7, #0xFF
				ADD R8, R8, #0xFF
				ADD R9, R9, #0xFF
				ADD R10, R10, #0xFF
				STM R11!, {R1-R10}
				
words DCD 1,2,3,4,5,6,7,8,9,10           
 
Stop 		   B Stop
			   END
