				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; ASCII to hex
Start       LDR R0, =0x31413246
			LDR R1, =0xFF
			LDR R2, =0x30
			LDR R6, =16
			MOV R10, #0x10
			MOV R9, #0x9
Loop        AND R3, R0, R1
			SUB R3, R3, R2
			CMP R3, R10
			BGT Greater
Cont		LSL R3,R3,R6
			SUB R6,R6,#4
			LSL R1, #8
			LSL R2, #8
			LSL R10, #8
			LSL R9, #8
			ORR R5, R3, R5 ;the hex value is stored in R5
			ADD R4,R4,#1
			CMP R4,#4
			BEQ Stop
			B Loop			
Greater     SUB R3, R3, R10
            ADD R3, R3, R9
			B Cont
Stop        B Stop             
			END
