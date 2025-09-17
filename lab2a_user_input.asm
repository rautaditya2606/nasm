section .data
    prompt db "Enter your name: "
    hello db "Hello, "
    newline db 10

section .bss
    name resb 20

section .text
global _start
_start:
    ; Print prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, 17
    syscall

    ; Read input
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 20
    syscall

    ; Print "Hello, "
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, 7
    syscall

    ; Print name
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 20
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
