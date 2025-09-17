section .data
    add_msg db "5 + 3 = "
    sub_msg db "5 - 3 = "
    mul_msg db "4 * 2 = "
    div_msg db "8 / 2 = "
    newline db 10

section .text
global _start
_start:
    ; Addition
    mov rax, 5
    mov rbx, 3
    add rax, rbx
    add rax, '0'
    mov [add_msg+7], al
    
    mov rax, 1
    mov rdi, 1
    mov rsi, add_msg
    mov rdx, 8
    syscall

    ; Subtraction
    mov rax, 5
    mov rbx, 3
    sub rax, rbx
    add rax, '0'
    mov [sub_msg+7], al
    
    mov rax, 1
    mov rdi, 1
    mov rsi, sub_msg
    mov rdx, 8
    syscall

    ; Multiplication
    mov rax, 4
    mov rbx, 2
    mul rbx
    add rax, '0'
    mov [mul_msg+7], al
    
    mov rax, 1
    mov rdi, 1
    mov rsi, mul_msg
    mov rdx, 8
    syscall

    ; Division
    mov rax, 8
    mov rbx, 2
    div rbx
    add rax, '0'
    mov [div_msg+7], al
    
    mov rax, 1
    mov rdi, 1
    mov rsi, div_msg
    mov rdx, 8
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
