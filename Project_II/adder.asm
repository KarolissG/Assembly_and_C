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

; Subroutine to convert ASCII string to integer
ascii_to_int:
    xor rcx, rcx                       ; Clear rcx for loop counter
    xor rax, rax                       ; Clear rax for result
.ascii_to_int_loop:
    movzx rbx, byte [rdi + rcx]       ; Load next character into rbx
    test rbx, rbx                      ; Check for null terminator
    jz .ascii_to_int_done              ; If null terminator, done
    sub rbx, '0'                       ; Convert ASCII to integer
    imul rax, 10                       ; Multiply current value by 10
    add rax, rbx                       ; Add current digit
    inc rcx                            ; Move to next character
    jmp .ascii_to_int_loop
.ascii_to_int_done:
    ret

; Subroutine to print a number
print_num:
    ; Convert number to string
    mov rsi, result_str
    call int_to_ascii
    ; Print the string
    mov rdx, result_str_length
    mov rbx, 1                         ; File descriptor (stdout)
    mov rax, 1                         ; System call number (sys_write)
    syscall
    ret

; Subroutine to convert integer to ASCII string
int_to_ascii:
    xor rdx, rdx                       ; Clear rdx for loop counter
    mov rdi, rsi                       ; Destination buffer
    add rdi, result_str_length         ; Move to end of buffer
    mov rax, [rsi]                     ; Load the number
    test rax, rax                      ; Check for zero
    jz .int_to_ascii_single_digit      ; If zero, handle separately
    ; Convert each digit to ASCII
.int_to_ascii_loop:
    mov rcx, 10                        ; Divisor
    xor rdx, rdx                       ; Clear remainder
    div rcx                            ; Divide by 10
    add dl, '0'                        ; Convert remainder to ASCII
    dec rdi                            ; Move to previous position in buffer
    mov [rdi], dl                      ; Store ASCII digit
    test rax, rax                      ; Check for zero quotient
    jnz .int_to_ascii_loop             ; If not zero, continue loop
    ret
.int_to_ascii_single_digit:
    mov dl, '0'                        ; Convert zero to ASCII
    dec rdi                            ; Move to previous position in buffer
    mov [rdi], dl                      ; Store ASCII digit
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
