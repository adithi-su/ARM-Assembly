				AREA program, CODE, READONLY
				EXPORT Reset_Handler
Reset_Handler 
;Write a program to check a string. If the string is “Name”, sort the list in the database in
;alphabetical order. If the string is “Age”, sort the list according to the age. (Create a database
;with 10 entries in the RAM with fields Name and age. Limit the name to 3 characters (i.e 3
;bytes) and the age to 1 byte. Thus each entry takes 4 bytes). Call the sorting function as subroutines.
Start          LDR R0, =Opt
			   LDRB R0, [R0]
			   MOV R9, #10
			   CMP R0, #0x4E
			   BNE Next
			   ; sort wrt name
			   LDR R10, =database
			   BL bsortA
			   B Stop
Next           CMP R0, #0x41
			   BNE Stop
			   ; sort wrt age
			   MOV R9, #10
			   LDR R10, =database
			   BL bsortB
bsortA ; Bubble Sort based on alphabet order
       ;  Arguments: R10 = Array location, R9 = Array size
			   PUSH    {R0-R10,lr}      
               MOV R0, #-1 ; counter for i 
			   SUB R9, R9, #1 ; n-1
Mainl          ADD R0, R0, #1 ; i++
			   CMP R0, R9 ; i< n-1 ?
			   BGE bsort_done
			   SUB R3, R9, R0 ; n-1-i
			   MOV R1, #-1 ; counter for j
Subl		   ADD R1, R1, #1 ; j++
			   CMP R1, R3 ; j< n-1-i?
			   BGE Mainl
			   ADD R2, R1, #1 ; j+1
			   LDRB R4, [R10,R1, LSL #2] ; A[j] 
			   LDRB R5, [R10,R2, LSL #2] ; A[j+1]
			   CMP R4, R5 ; A[j] > A[j+1] ?
			   BLE Subl
			   ; if yes, then exchange
			   LDR R4, [R10,R1, LSL #2]   
			   LDR R5, [R10,R2, LSL #2] 
			   STR R5, [R10,R1, LSL #2] 
			   STR R4, [R10,R2, LSL #2] 
			   B Subl 
bsort_done	   POP     {R0-R10,PC}  

bsortB ; Bubble Sort based on age
       ;  Arguments: R10 = Array location, R9 = Array size
			   PUSH    {R0-R10,lr}      
               MOV R0, #-1 ; counter for i 
			   SUB R9, R9, #1 ; n-1
Ml             ADD R0, R0, #1 ; i++
			   CMP R0, R9 ; i < n-1 ?
			   BGE done
			   SUB R3, R9, R0 ; n-1-i
			   MOV R1, #-1 ; counter for j
Sl		   ADD R1, R1, #1 ; j++
			   CMP R1, R3 ; j< n-1-i?
			   BGE Ml
			   ADD R2, R1, #1 ; j+1
			   MOV R7, R1, LSL #2 
			   ADD R7, R7, #3
			   LDRB R4, [R10,R7] ; A[j] 
			   MOV R8, R2, LSL #2 
			   ADD R8, R8, #3
			   LDRB R5, [R10,R8] ; A[j+1]
			   CMP R4, R5 ; A[j] > A[j+1] ?
			   BLE Sl
			   ; if yes, then exchange
			   LDR R4, [R10,R1, LSL #2]   
			   LDR R5, [R10,R2, LSL #2] 
			   STR R5, [R10,R1, LSL #2] 
			   STR R4, [R10,R2, LSL #2] 
			   B Sl 
done	       POP     {R0-R10,PC}  

 


Opt            DCB "Age", 00
Stop  		   B Stop
			   ALIGN 
database	   DCB "awa", 12
			   DCB "rem", 18
			   DCB "ted", 4
			   DCB "dek", 16
			   DCB "bak", 14
			   DCB "ura", 15
			   DCB "kac", 17
			   DCB "oha", 23
			   DCB "sho", 19
			   DCB "zac", 20
			   END