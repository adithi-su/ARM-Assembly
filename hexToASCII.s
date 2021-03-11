				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; hex to ASCII
Start       LDR R5, =Number
            LDR R10, [R5]
			MOV R7, #0 ; counter
			MOV R8, #0xF000 
			MOV R9, #0x9 
			MOV R0, #0x30
			MOV R1, #0x40
			; getting individual digits
DigitLoop   AND R11, R10, R8 
            LSR R11, #12 
            LSL R10, #4 
			ADD R7, R7, #1 ; increment counter
			CMP R11, R9 
			BGT Loop2 
			ORR R2, R0, R11 
			ORR R3, R2, R3			
			BL loopcmp 
Loop2       SUB R4, R11, R9 
			ORR R2, R1, R4 
			ORR R3, R2, R3			
			BL loopcmp
loopcmp     CMP R7, #4 
            BEQ Stop
			MOV R3, R3, LSL #8 ; result in R3 
			B DigitLoop
Number      DCD 0x00001A2F			
Stop        B Stop             
			END
