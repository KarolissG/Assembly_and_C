; GLOBALS
global _start ;Declared for linker this is declaring _start (entry point)

; TEXT SECTION
section	.text
_start:	                                 ;linker entry point

;PRINT PROMPT
	call PROMPT
;TAKE INPUT
	xor	rbx,	rbx			;file descriptor (sdtin)
	xor	rax,	rax			;clear rax for input
	mov	rsi,	num1		;buffer foir first input
	syscall

;PRINT PROMPT
	call PROMPT
;TAKE INPUT
	xor	rbx,	rbx			;file descriptor (sdtin)
	xor	rax,	rax			;clear rax for i
	mov	rsi,	num2
	syscall

	call Adder1

	mov	rdx,	64
	mov	rsi,	num1
	mov	rbx,	0x01
	mov	rax,	0x01
	syscall
;NEWLINE
	mov	rax,	1
	mov	rdi,	1
	mov	rsi,	newline
	mov	rdx,	1
	syscall

; Exit
	mov	rax,    0x3c                       ;system call number (sys_exit) 64 Bit Register
	mov	rdi,    0x0                        ;return status 64 Bit Register
	syscall                               ;call kernel 64 bit System

PROMPT:
	mov	rdx,	msg_length                 ;message length see length equ 64 Bit Register

	mov	rsi,	message                    ;message 64 Bit Register

	mov	rbx,	0x01                       ;file descriptor (stdout) 64 Bit Register

	mov	rax,  	0x01                        ;system call number (sys_write) 64 Bit Register
	syscall                                ;call kernel 64 bit System
	ret
; add two numbers
Adder1:
	add	num1,	num2
	ret


; DATA SECTION
section	.data

message db 'Enter Number :',    ;string to be printed
msg_length equ $-message                  ;length of the string
sum_msg db 'The sum is :',
sum_lenght equ $-sum_msg
buffer db 16
buffer2	db 16
buffer_size db 16
result db 0
newline db 10

section .bss
	num1	resb	64
	num2	resb	64
