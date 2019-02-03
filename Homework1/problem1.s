; William Bogardus
; CSCE 652
; Assignment 1 part 1
;intel syntax

global main			; Tells kernal where program exection begins
main:
	push ebp		; Prolog - store previous base pointer 
	mov ebp, esp	; set stack pointer to base pointer
	push 4d			; move 4 to stack, dec esp
	push 77d		; move 77 to stack, dec esp
	push 18d		; move 18 to stack, dec esp
	push 57d		; move 57 to stack, dec esp
	push 9d			; move 9 to stack, dec esp
	
	xor eax, eax		; Zero registers (sum)
	xor ecx, ecx		; (cardinality)
	xor ebx, ebx		; move values from stack here
	xor edx, edx		; zero for idiv
	
	pop ebx			; Moves 9 at esp to ebx, increments esp
	add eax, ebx	; Adds 0 + 9 to eax (sum)
	inc ecx			; Increments ecx (count) to 1
	pop ebx			; Moves 57 at esp to ebx, increments esp
	add eax, ebx	; Adds 57 to eax (sum)
	inc ecx			; Increments ecx (count) to 2
	pop ebx			; Moves 18 to esp to ebx, increments esp
	add eax, ebx	; Adds 18 to eax (sum)
	inc ecx			; Increments ecx (count) to 3
	pop ebx			; Moves 77 at esp to ebx, increments esp
	add eax, ebx	; Adds 77 to eax (sum)
	inc ecx			; Increments ecx (count) to 4
	pop ebx			; Moves 4 at esp to ebx, increments esp
	add eax, ebx	; Adds 4 to eax (sum)
	inc ecx			; Increments ecx (count) to 5
	
	idiv ecx		; Divides sum (in eax) by ecx (5), save in eax, remainder in edx
	
	pop ebp			; restore call function value
