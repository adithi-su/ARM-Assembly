MIN_ADR             EQU   0x40000000
MAX_ADR             EQU   0x400000A4
min                 RN    1
max                 RN    2
				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; (i) Finding the roll numbers with min and max marks
Start          ADR R0, database
			   LDR R10, =MIN_ADR
			   LDR R11, =MAX_ADR
			   LDRB min, [R0,#1] ; initialize to marks[0]
			   LDRB max, [R0,#1]; initialize to marks[0]
			   MOV R3, #0 ; counter i=0
Loop           CMP R3, #20 ; i<n ? 
		       BGE Stop
			   MOV R9, R3, LSL #1
			   ADD R4, R9, #1
			   LDRB R5, [R0, R4] ; current marks[i]
			   CMP R5, max ; R5>max?
			   BLT Cont    ; no, continue
			   MOV max, R5 ; yes: max = marks[i]
			   LDRH R6, [R0, R9]
			   STR R6, [R11] ; store in memory
Cont           CMP R5, min ; R5<min?
			   BGT Cont2
			   MOV min, R5 ; yes: min = marks[i]
			   LDRH R6, [R0, R9]
			   STR R6, [R10] ; store in memory
Cont2		   ADD R3, R3, #1
			   B Loop
Stop  		   B Stop
			   ALIGN 
database	   DCB 140, 72
			   DCB 101, 92
			   DCB 201, 57
			   DCB 123, 23
			   DCB 240, 56
			   DCB 105, 29
			   DCB 110, 45
			   DCB 201, 74
			   DCB 111, 3
			   DCB 120, 85
			   DCB 223, 62
			   DCB 250, 10
			   DCB 233, 13
			   DCB 133, 47
			   DCB 156, 29
			   DCB 160, 90
			   DCB 200, 22
			   DCB 144, 61
			   DCB 216, 47
			   DCB 115, 36
			   END