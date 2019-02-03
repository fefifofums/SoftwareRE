; William Bogardus
; CSCE 652
; Bonus
;intel syntax

section .data
msg: db 'Hello World',0	; message, 
newline: db 10			; Ascii value newline



section .text			; Section for storing code
global main				; Tells kernal where program exection begins
extern printf
main:
	push ebp			; Prolog - store previous base pointer 
	mov ebp, esp		; set stack pointer to base pointer
	push msg			; push message on to stack
	call printf			; call printf, prints top of stack
	push newline		; push ascii value for newline to stack
	call printf			; print newline
	mov esp, ebp		; Clean up	
	pop ebp