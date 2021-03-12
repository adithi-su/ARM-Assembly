				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; BCD to ASCII
Start       LDR R0, =0x466A  ; 4660 is BCD value
            MOV R10, #0xF ;mask
			MOV R9, #0x30
			MOV R8, #0x40
			MOV R7, #0 ; counter
			MOV R6, #0 ; to store result
			; get individual digits 
Loop        MOV R1, R0, LSR #12
            AND R1, R1, R10 
			LSL R0, #4
			ADD R7, R7, #1
			CMP R1, #0x9
			BGT greater
     		ORR R1, R1, R9 
Cont		ORR R6, R1
            CMP R7, #4
			BEQ Stop
			LSL R6, #8
            B Loop
greater     SUB R1, R1, #0x9
            ORR R1, R1, R8
            B Cont
Stop        B Stop             
			END

