				GLOBAL Reset_Handler
				AREA program, CODE, READONLY
				ENTRY 
Reset_Handler 
;Write a program to perform multiplication: c = a * b 
;where a & bare both unsigned 32 bit numbers.
;Load a & b from memory and store the results into new location in memory
				ARM
start			ADR R0, ThProg + 1; Generate branch target address
				BX R0 ; Branch exchange to ThumbProg.
				CODE16 ; Subsequent instructions are Thumb code.
data            dcd 0x23, 0x45
ThProg          
				LDR R1, =data 
				LDR R3, [R1] 
				LDR R4, [R1, #4]
				MUL R4, R3
                STR R4, [R1, #8]				
Stop            B Stop
				END 