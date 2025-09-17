section .data
    prompt1 db "Enter first number: "
    prompt2 db "Enter second number: "
    result db "Result: "
    newline db 10

section .bss
    num1 resb 1
    num2 resb 1

section .text
global _start
_start:
    ; Get first number
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt1
    mov rdx, 20
    syscall
    
    mov rax, 0
    mov rdi, 0
    mov rsi, num1
    mov rdx, 1
    syscall

    ; Get second number
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt2
    mov rdx, 21
    syscall
    
    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 1
    syscall

    ; Convert and add
    mov al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'
    add al, bl
    add al, '0'
    mov [result+7], al

    ; Print result
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 8
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
