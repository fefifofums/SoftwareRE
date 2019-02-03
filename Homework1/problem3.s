; William Bogardus
; CSCE 652
; Assignment 1 part 3
;intel syntax

section .data
a1: dd 42d					; declare static value data
a2: dd 30d					; Does not change during run time
section .text				; Section for storing code
global main					; Tells kernal where program exection begins
main:
	push ebp				; Prolog - store previous base pointer 
	mov ebp, esp			; set stack pointer to base pointer

	xor eax, eax			; Zero registers
	xor edx, edx
	jmp L1					; Jump to start of loop
	
	L2:						; Problem 3 parts 1 & 2
		cmp eax, [a1] 		; is eax greater than 42? then jmp to L3
		jg L3				; if true, jump to L3
		mov edx, eax		; Move counter value to sequence value 
		jmp L4				; Unconditional jump to L4
	
	L3:
		lea edx, [eax-9]	; load counter minus 9 into edx register
		
	L4:
		cmp edx, [a1]		; Check if sequnce value is 42
		jne L5				; if false, jump to L5
		jmp L6				; else jump to L6
		
	L7:			
		inc eax				; increment loop counter
		push 42				; push 42 onto the stack 9 times, 42 is then push 1 extra time in L1 for a total of 10
	
	L6:
		cmp eax, 50d		; check if loop counter is less than or = to 50, add 42 to the sequence 9 times
		jle L7
	
	L5:
		inc eax				; Increment loop counter
	
	L1:						
		push edx			; move sequence number onto stack
		cmp eax, 109d		; Loop check
		jle L2				
	
	; At this point, EAX is contains number of iterations
	; EAX = 110
	; Finish problem 3 parts 1&2
	
	xor eax, eax			; zero various registers
	xor ecx, ecx			
	xor edx, edx			
	mov edx, esp			; Save stack pointer address in edx
	mov eax, 1d 			; Make eax 1 so it doesnt instantly become zero for problem 3 part 3
							; However, since the sequnce starts with 0, the product still result in 0
	
	L9:						; Problem 3 part 3
		inc ecx				; Loop counter
		mov ebx, [esp]		; Move stop of stack to ebx register (pop stack)
		lea esp, [esp+4]	; shrink stack pointer
		cmp ebx, [a2]		; Check if ebx is less than 30
		jl L10				; If true, jump to L10
		jmp L8				; else back to L8
	L10:
		imul (eax), ebx		; Muliply eax by ebx, store in eax
	L8:
		cmp ecx, 109		; Compare counter to 109
		jle L9				; Jump to L9 if counter is less than or = to 109
		
	xor eax, eax			; Zero more registers
	xor ecx, ecx
	mov esp, edx			; reset statck pointer to previous top
	xor edx, edx			
		
	L12:					; Problem 3 part 4
		inc ecx				; Loop counter
		mov ebx, [esp]		; Move stop of stack to ebx register (pop stack)
		lea esp, [esp+4]	; shrink stack pointer
		add (eax), ebx  	; Add ebx to eax where eax is the sum
	L11:
		cmp ecx, 109d		; Compare counter to 109
		jle L12				; Jump to L12 if counter is less than or = to 109
	
	
	mov esp, ebp 			; Clean up 
	pop ebp					; restore call function value
	
		

	
	
	

	
	
	
	

	
	

	
	
