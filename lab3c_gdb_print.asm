section .data
    msg db "GDB Print Test", 10

section .text
global _start
_start:
    mov rax, 10
    mov rbx, 5
    
    ; Set breakpoint here in GDB
    nop
    
    add rax, rbx    ; rax = 15
    sub rax, rbx    ; rax = 10
    mul rbx         ; rax = 50
    div rbx         ; rax = 10
    
    ; Print message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 14
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
