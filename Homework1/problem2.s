; William Bogardus
; CSCE 652
; Assignment 1 part 2
;intel syntax

section .data
a1: dd 20d				; declare static value data
a2: dd 30d				; Does not change during run time
a3: dd 33d
section .text			; Section for storing code
global main				; Tells kernal where program exection begins
main:
	push ebp			; Prolog - store previous base pointer 
	mov ebp, esp		; set stack pointer to base pointer
	
	xor eax, eax		; Zero registers
	xor ebx, ebx
	xor edx, edx		; Zero remainder register
	
	L1:
		inc ebx			; loop counter, increment by 1
		add eax, ebx	; Add each number form 1 to 33 to sum (eax)
		push ebx		; push loop counter to stack, to create sequence 1 to 33
		cmp ebx, [a3]	; stop loop when counter > 33
		jl L1			; Jump to begining of loop
	
	idiv ebx 			; Divide sum (561) by count (33) to get average, eax equals to 17
	
	mov ecx, [a3]		; Move 33 into ecx for a loop counter (to try using loop)
	xor eax, eax 		; Zero registers
	xor ebx, ebx		
	xor edx, edx		
	
	L2:					
		mov ebx, [esp]	; Move value from top of stack to ebx (start with 33, 32, ..., 1)
		lea esp, [esp+4]; increment stack pointer by 4
		cmp ebx, [a1]	; Check ebx is less than 20
		jl L3			; If less, jump to L3
		cmp ebx, [a2]	; Check if ebx greater than 30
		jg L3			; If previous result greater than 0, jump to L3
		xor ebx, ebx	; zero ebx
		loop L2			; Loop back to label L2 until ecx is 0
	
	L3:
		inc edx			; counter for average
		add eax, ebx	; sum for average 
		xor ebx, ebx	; zero register
		loop L2			; loop back to L2
		
						; see eax here for sum (286)
	mov ebx, edx		; Move counter (edx) to ebx (number of numbers in sequence exculding 20-30) 22
	xor edx, edx		; Clear edx (remainder register)
	
	idiv ebx 			; Divide 286 by 22 put 13 into eax
	
	xor eax, eax		; Zero registers
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	
	mov	ecx, 34d		; Loop counter to 34	
	mov eax, 1d			; Set min(ebx) and max(eax) to 1
	mov ebx, 1d
	
	L4:
		inc edx			; count number of iterations (recreate sequence)
		cmp ecx, edx	; check if edx is less than 34
		jl finish		; if true, go to finish
		cmp ebx, edx	; compare counter to current minimum (ebx)
		jg L6			; if counter less jump to L6
		cmp eax, edx	; check if counter greater then current max (eax)
		jle L5			; if true jump to L5
		
	L5:
		mov eax, edx	; Set counter as new max (eax)
		jmp L4			; Jump back to L4
		
	L6:
		mov ebx, edx	; set counter as new minimum (ebx)
		jmp L4			; jump back to L4

finish:
	xor edx, edx
	sub eax, ebx 		; Subtract min/ebx (1) from max/eax) 33, store result in eax
	mov edx, eax		; Move value of eax to edx per requirement
	mov esp, ebp		; move stack pointer to base pointer
	pop ebp				; restore call function value
	
		

	
	
	

	
	
	
	

	
	

	
	
