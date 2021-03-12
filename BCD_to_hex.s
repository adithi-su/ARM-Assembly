				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; BCD to hex 
Start       LDR R0, =0x4660  ; 4660 is BCD value
            MOV R10, #0xF ;mask
			MOV R9, #0 ; counter
			MOV R8, #0 ; for result
            ; dec -> hex
			; 1000 -> 03E8
			; 100  -> 0064
			; 10   -> 000A
			; 1    -> 0001
			MOV R1, #1000
			MOV R2, #100
			MOV R3, #10
			MOV R4, #1
			; get individual digits 
Loop        MOV R5, R0, LSR #12
            AND R5, R5, R10 
			LSL R0, #4
			ADD R9, R9, #1
			BL Convert 
Convert     CMP R9, #1 
            BNE M1
	        MUL R1, R5, R1; 1000th place
			ADD R8, R8, R1
			BEQ Loop
M1          CMP R9, #2
            BNE M2
			MUL R2, R5, R2 ;100th place
			ADD R8, R8, R2
			BEQ Loop
M2          CMP R9, #3
            BNE M3
			MUL R3, R5, R3 ;10th place
			ADD R8, R8, R3
			BEQ Loop
M3          CMP R9, #4
            BEQ Stop
			MUL R4, R5, R3 
			ADD R8, R8, R4
Stop        B Stop             
			END

