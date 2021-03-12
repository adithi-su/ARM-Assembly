				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; ASCII to BCD
; ASCII -> hex -> BCD 
; final BCD representation in  {r10: r11} 
Start       LDR R0, =0x31413246
			LDR R1, =0xFF
			LDR R2, =0x30
			LDR R6, =16
			MOV R10, #0x10
			MOV R9, #0x9
			; step 1: ASCII -> hex
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
			BEQ GoToBCD
			B Loop			
Greater     SUB R3, R3, R10
            ADD R3, R3, R9
			B Cont
			; step 2: hex -> BCD 0x1A2F to 0001101000101111
GoToBCD     MOV R0, #0xF
			MOV R7, #0 ; counter
			MOV R3, R5 ; temp
            MOV R8, #0x1000
            MOV R4, #0x100
			MOV R2, #0x10
			MOV R1, #0x1
SubLoop	    MOV R5, R3, LSR #28 ; get individual hex digits 
            LSL R3, #4
			BL Convert 
			ADD R7, R7 ,#1
            CMP R7, #1 
            BNE Next1
            MOV R10, R6, LSL #16
			BEQ SubLoop
Next1       CMP R7, #2
            BNE Next2
            ORR R10, R10, R6
			BEQ SubLoop
Next2       CMP R7, #3
            BNE Next3
            MOV R11, R6, LSL #16
			BEQ SubLoop
Next3       CMP R7, #4 
            BNE SubLoop
			ORR R11, R11, R6 
			B Stop 			
Convert     MOV R6, #0
			CMP R5, #0x8 
            BLT M1
			ORR R6, R6, R8
			SUB R5, R5, #0x8 
M1          CMP R5, #0x4
            BLT M2 
			ORR R6, R6, R4 
			SUB R5, R5, #0x4
M2          CMP R5, #0x2 
            BLT M3
			ORR R6, R6, R2
			SUB R5, R5, #0x2
M3          CMP R5, #1
            BNE Jump
            ORR R6, R6, R1
Jump        BX lr      			
Stop        B Stop             
			END

