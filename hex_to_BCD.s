				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; hex to BCD 
; final BCD representation in  {r10: r11} 
Start       LDR R3, =0x1A2F
			; hex in R3 
			; BCD in {R10:R11}
			; hex -> BCD 0x1A2F to 0001101000101111
            MOV R0, #0xF
			MOV R7, #0 ; counter
            MOV R8, #0x1000
            MOV R4, #0x100
			MOV R2, #0x10
			MOV R1, #0x1
SubLoop	    MOV R5, R3, LSR #12 ; get individual hex digits 
            AND R5, R5, R0
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

