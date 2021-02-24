				AREA program4, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
;To reverse the given number.
Start          LDR R0, =Number
			   LDR R0, [R0]
			   MOV R2, #0

			   BL Loop 
			   ORR R2, R1 ; R2:=0x80000000 
			   
			   BL Loop
			   ORR R2, R1, LSR #4 ; R2:=0x87000000
			   
			   BL Loop
			   ORR R2, R1, LSR #8 ; R2:=0x87600000
			   
			   BL Loop
			   ORR R2, R1, LSR #12 ; R2:=0x87650000
			   
			   BL Loop
			   ORR R2, R1, LSR #16 ; R2:=0x87654000
			   
			   BL Loop
			   ORR R2, R1, LSR #20 ; R2:=0x87654300
			   
			   BL Loop
			   ORR R2, R1, LSR #24 ; R2:=0x87654320
			   
			   BL Loop
			   ORR R2, R1, LSR #28 ; R2:=0x87654321
			   BL Stop
			   
Loop           MOV R1, R0, LSL #28 
			   ROR R0, #4
			   MOV pc, lr
			   
Number		   DCD 0x12345678
Stop  		   B Stop
				END