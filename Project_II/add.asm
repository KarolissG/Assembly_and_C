global _start

section .text

_start:

	xor rdi,	rdi
	xor rax,	rax
	mov rsi,	buffer
	syscall

	mov	rax,	rsi
	mov rbx,	0x5
	add	rax,	rbx

	mov rax,	0x3c
	mov rdi,	0x0
	syscall

section	.bss
	buffer resb 16
