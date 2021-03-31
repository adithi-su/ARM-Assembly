				GLOBAL Reset_Handler
				AREA program, CODE, READONLY
				ENTRY 
Reset_Handler 
; perform logical operations: c = a(logical operation) b 
; where a & b are both unsigned 32 bit numbers
				ARM
start			ADR R0, ThProg+1 ; Generate branch target address
				BX R0 ; Branch exchange to ThumbProg.
				CODE16 ; Subsequent instructions are Thumb code.
ThProg          
				LDR R1,=0xFFFF0000 
				LDR R2,=0x12345678
				AND R1, R2 
				EOR R1, R2
				ORR R1, R2
				BIC R1, R2
Stop            B Stop
				END 