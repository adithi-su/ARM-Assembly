			AREA Lab2, CODE,READONLY
			EXPORT Reset_Handler
Reset_Handler
Start 		MVN R0, #0x69  
			MVN R1, #0xC7 
			ORR R3,R0,R1  ; R3:= R0 or R1
			AND R4,R0,R1  ; R4:= R0 and R1
			EOR R5,R0,R1  ; R5:= R0 xor R1
			BIC R6,R0,R1  ; R6:= R0 and not R1
Stop 		B Stop ; Stop Program
			END 