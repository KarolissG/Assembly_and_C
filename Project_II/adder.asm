
; GLOBALS
global _start ;Declared for linker this is declaring _start (entry point)


; TEXT SECTION
section	.text
_start:	                                 ;linker entry point

;PRINT PROMPT
	mov	rdx,	msg_length                 ;message length see length equ 64 Bit Register

	mov	rsi,	message                    ;message 64 Bit Register

	mov	rdi,	0x1                        ;file descriptor (stdout) 64 Bit Register

    mov	rax,  	0x1                        ;system call number (sys_write) 64 Bit Register
	syscall                                ;call kernel 64 bit System

;TAKE INPUT
	xor	rdi,	rdi			;file descriptor (sdtin)
	xor	rax,	rax			;clear rax for input
	mov rsi,	buffer
	mov rdx,	0x64
	syscall

;PRINT PROMPT
	mov	rdx,	msg_length                 ;message length see length equ 64 Bit Register

	mov	rsi,	message                    ;message 64 Bit Register

	mov	rdi,	0x1                        ;file descriptor (stdout) 64 Bit Register

    mov	rax,  	0x1                        ;system call number (sys_write) 64 Bit Register
    syscall

;TAKE INPUT
	xor	rdi,	rdi			;file descriptor (sdtin)
	xor	rax,	rax			;clear rax for input
	mov rsi,	buffer
	mov rdx,	0x64
	syscall

; Exit
    mov	rax,    0x3c                       ;system call number (sys_exit) 64 Bit Register

    mov   rdi,    0x0                        ;return status 64 Bit Register

    syscall                                ;call kernel 64 bit System

; add two numbers
Adder1:


; DATA SECTION
section	.data

message db 'Enter Number :',    ;string to be printed
msg_length equ $-message                  ;length of the string
sum_msg db 'The sum is :',
sum_lenght equ $-sum_msg
buffer db 100
