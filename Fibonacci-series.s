Mem             EQU 0xE0000012
				AREA program6, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
;To generate the Fibonacci numbers up to the given number
Start        	LDR R5, =Mem
				LDR R6, =No
				LDR R0, [R6]
fibonacci       MOV R1, #0
				MOV R2, #1
fiboloop        STRB R2, [R5,#1]!
				MOV R3,  R2
				ADD R2, R1, R2
				MOV R1, R3
				CMP R2, R0 
				BLT fiboloop
No     DCD 0xE
Stop  		   B Stop
				END