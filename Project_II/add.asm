section .data
    msg1 db "Enter the first number: ", 0
    msg1_len equ $ - msg1

    msg2 db "Enter the second number: ", 0
    msg2_len equ $ - msg2

    msg_result db "The sum is: ", 0
    msg_result_len equ $ - msg_result

section .bss
    num1 resq 1 ; reserve space for the first number (64-bit)
    num2 resq 1 ; reserve space for the second number (64-bit)
    sum resq 1  ; reserve space for the sum (64-bit)

section .text
    global _start

_start:
    ; Print "Enter the first number: "
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msg1_len
    mov rax, 1
    syscall

    ; Read the first number
    mov rdi, 0
    mov rsi, num1
    mov rdx, 8 ; 64-bit input
    mov rax, 0
    syscall

    ; Print "Enter the second number: "
    mov rdi, 1
    mov rsi, msg2
    mov rdx, msg2_len
    mov rax, 1
    syscall

    ; Read the second number
    mov rdi, 0
    mov rsi, num2
    mov rdx, 8 ; 64-bit input
    mov rax, 0
    syscall

    ; Add the numbers
    mov rax, [num1]
    add rax, [num2]
    mov [sum], rax

    ; Print the result
    mov rdi, 1
    mov rsi, msg_result
    mov rdx, msg_result_len
    mov rax, 1
    syscall

    ; Print the sum
    mov rdi, 1
    mov rsi, [sum]
    mov rdx, 8 ; 64-bit output
    mov rax, 1
    syscall

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall
