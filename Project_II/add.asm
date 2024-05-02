section .data
    prompt db 'Enter the length of the buffer: ', 0
    prompt_len equ $ - prompt

section .bss
    buffer_size resb 16  ; Reserve space for buffer size
    buffer resb 1         ; Reserve space for a single byte (for newline character)

section .text
    global _start

_start:
    ; Print prompt for buffer length
    mov rdx, prompt_len
    mov rsi, prompt
    call print_string

    ; Read buffer length from user
    call read_int
    mov ecx, eax  ; Move buffer length to ecx register

    ; Dynamically allocate memory for the buffer
    mov rdi, ecx    ; Size of memory block to allocate
    mov eax, 9      ; brk/sbrk system call number
    syscall         ; Allocate memory

    ; Read input into the dynamically allocated buffer
    mov rsi, buffer  ; Address of the dynamically allocated buffer
    mov rdx, ecx    ; Length of the buffer
    call read_input

    ; Print the contents of the buffer
    mov rsi, buffer  ; Address of the buffer
    call print_string

    ; Free dynamically allocated memory (optional)
    ; mov eax, 10    ; brk/sbrk system call number for free memory
    ; syscall

    ; Exit
    mov eax, 60     ; syscall number for exit
    xor edi, edi    ; exit status 0
    syscall         ; call kernel

read_int:
    ; Clear eax register
    xor eax, eax

.read_digit:
    ; Read a single character from stdin
    mov rdi, 0      ; File descriptor 0 (stdin)
    mov rax, 0      ; syscall number for read
    mov rsi, buffer_size
    syscall

    ; Check for newline character
    cmp byte [buffer_size], 10
    je .end_read_int

    ; Convert ASCII character to integer
    sub byte [buffer_size], '0'
    ; Multiply current value by 10 and add new digit
    imul eax, eax, 10
    add eax, dword [buffer_size]

    ; Loop to read next digit
    jmp .read_digit

.end_read_int:
    ret

read_input:
    ; Clear buffer
    xor eax, eax
    mov byte [buffer], al

.read_char:
    ; Read a single character from stdin
    mov rdi, 0      ; File descriptor 0 (stdin)
    mov rax, 0      ; syscall number for read
    mov rsi, buffer
    mov rdx, 1      ; Read one byte at a time
    syscall

    ; Check for newline character
    cmp byte [buffer], 10
    je .end_read_input

    ; Move to next byte in buffer
    inc rsi

    ; Loop to read next character
    jmp .read_char

.end_read_input:
    ; Null-terminate the buffer
    mov byte [rsi], 0
    ret

print_string:
    ; Print a null-terminated string
    mov rdi, 1      ; File descriptor 1 (stdout)
    mov rax, 1      ; syscall number for write
    syscall
    ret
