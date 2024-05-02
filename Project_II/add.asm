section .data
    msg1 db "Enter the first number: ", 0
    msg2 db "Enter the second number: ", 0
    msg_result db "The sum is: %d", 10, 0

section .bss
    num1 resq 1 ; reserve space for the first number (64-bit)
    num2 resq 1 ; reserve space for the second number (64-bit)
    sum resq 1  ; reserve space for the sum (64-bit)

section .text
    global _start

_start:
    ; Input first number
    mov rdi, msg1
    call printf
    mov rdi, num1
    call scanf

    ; Input second number
    mov rdi, msg2
    call printf
    mov rdi, num2
    call scanf

    ; Calculate sum
    mov rax, [num1]
    add rax, [num2]
    mov [sum], rax

    ; Output the sum
    mov rdi, msg_result
    mov rsi, [sum]
    call printf

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall

extern printf
extern scanf
