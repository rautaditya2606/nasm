section .text
global _start
_start:
    mov eax, 42
    mov ebx, 10
    div bl
    add ax, 0x3030
    push ax
    mov ecx, esp
    mov eax, 4
    mov ebx, 1
    mov edx, 2
    int 0x80
    mov eax, 1
    xor ebx, ebx
    int 0x80

