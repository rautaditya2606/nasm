section .data
    array db 1, 2, 3
    result_msg db "Sum: "
    newline db 10

section .text
global _start
_start:
    mov rsi, array
    mov al, 0
    mov rcx, 3
    
sum_loop:
    add al, [rsi]
    inc rsi
    loop sum_loop
    
    add al, '0'
    mov [result_msg+4], al
    
    mov rax, 1
    mov rdi, 1
    mov rsi, result_msg
    mov rdx, 5
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
