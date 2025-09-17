section .data
    msg db "GDB Test", 10

section .text
global _start
_start:
    mov rax, 5
    mov rbx, 3
    add rax, rbx    ; Set breakpoint here in GDB
    
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 8
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
