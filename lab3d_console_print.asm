section .data
    add_msg db "10 + 5 = 15", 10
    sub_msg db "10 - 5 = 5", 10
    mul_msg db "10 * 5 = 50", 10
    div_msg db "50 / 5 = 10", 10

section .text
global _start
_start:
    ; Print addition
    mov rax, 1
    mov rdi, 1
    mov rsi, add_msg
    mov rdx, 12
    syscall

    ; Print subtraction
    mov rax, 1
    mov rdi, 1
    mov rsi, sub_msg
    mov rdx, 11
    syscall

    ; Print multiplication
    mov rax, 1
    mov rdi, 1
    mov rsi, mul_msg
    mov rdx, 12
    syscall

    ; Print division
    mov rax, 1
    mov rdi, 1
    mov rsi, div_msg
    mov rdx, 12
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
