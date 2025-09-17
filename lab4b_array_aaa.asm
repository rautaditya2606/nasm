section .data
    array db 7, 8, 9
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
    ; Manual ASCII adjust for 64-bit mode
    cmp al, 9
    jle no_carry
    sub al, 10
    add ah, 1
no_carry:
    inc rsi
    loop sum_loop
    
    add al, '0'
    mov [result_msg+4], al
    
    ; Handle carry if needed
    cmp ah, 0
    je print_result
    add ah, '0'
    mov [result_msg+3], ah
    
print_result:
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
