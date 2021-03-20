				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
; Sorting the marks
Start          LDR R10, =quiz1
			   LDR R11, =quiz2
			   MOV R9, #16 ; counter
			   ; sort quiz1
			   BL bsort 
			   ; sort quiz2
    		   MOV R10, R11 
			   MOV R9, #16 ; counter
			   BL bsort 
			   B Stop
bsort ; Bubble Sort
      ;  Arguments: R10 = Array location, R9 = Array size
			   PUSH    {R0-R10,lr}          ; Push the existing registers on to the stack
               MOV R0, #-1 ; counter for i 
			   SUB R9, R9, #1 ; n-1
MainL          ADD R0, R0, #1 ; i++
			   CMP R0, R9 ; i< n-1 ?
			   BGE bsort_done
			   SUB R3, R9, R0 ; n-1-i
			   MOV R1, #-1 ; counter for j
SubL		   ADD R1, R1, #1 ; j++
			   CMP R1, R3 ; j< n-1-i?
			   BGE MainL
			   ADD R2, R1, #1 ; j+1
			   LDRB R4, [R10,R1] ; A[j]
			   LDRB R5, [R10, R2] ; A[j+1]
			   CMP R4, R5 ; A[j] > A[j+1] ?
			   BLE SubL
			   ; if yes, then exchange
			   STRB R4, [R10, R2]
			   STRB R5, [R10,R1]
			   B SubL 
bsort_done	   POP     {R0-R10,PC}          ; Pop the registers off of the stack and return           
; marks obtained - 		   
quiz1          DCB 0x12, 0x64, 0x1, 0x2
			   DCB 0x32, 0x58, 0xA, 0x42
			   DCB 0xB, 0x23, 0x64, 0x60
			   DCB 0x4, 0x50, 0x11, 0x14
quiz2          DCB 0x1B, 0x2A, 0x16, 0x3F
			   DCB 0x9, 0x59, 0x10, 0x20
			   DCB 0x4E, 0x58, 0xA, 0
			   DCB 0x44, 0x57, 0x19, 0x13 
Stop  		   B Stop
			   END