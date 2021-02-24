				AREA program5, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
;To check whether the given number is a Fibonacci number
; if true store #1 in R4 else store #0xFF
Start        	LDR R6, =No
				LDR R5, [R6]
				MOV R4, #0xFF 
fibonacci       MOV R1, #0
				MOV R2, #1
fiboloop        MOV R3,  R2
				ADD R2, R1, R2
				MOV R1, R3
				CMP R2, R5 
				BEQ Result
				BLT fiboloop
Result          MOV R4, #1
No     DCD 0xD
Stop  		   B Stop
				END