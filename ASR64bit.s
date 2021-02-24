			AREA Lab2q5, CODE,READONLY
			EXPORT Reset_Handler
;to arithmetic shift a 64-bit value to right by n bits(here 3)
Reset_Handler
Start 		LDR R0, =Value1 ;pointer to 64 bit value
			LDR R1, [R0]   ; load first part of value 
			LDR R2, [R0,#4] ; load lower part of value
			MOV R3,#3   ; no of digits to shift
			MOV R4,#0
			MOV R5, R1, ASR #1   ;   
			MOV R6, R2, RRX     ;shifted right by 1
			SUB R3, R3, #1      
Loop        CMP R3, R4
			BEQ Stop
			ADDS R7,R7,#0 ; set carry back to 0
			MOV R5, R5, ASR #1
			MOV R6, R6, RRX 
			ADD R4, R4, #1 ; increment counter
			B Loop
Value1      DCD 0x3421ABBA, 0x2ABCD134
			
Stop        B Stop
			END