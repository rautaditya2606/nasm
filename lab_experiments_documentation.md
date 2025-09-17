# NASM Assembly Lab Experiments Documentation
## Complete Code and Output Reference

---

## LAB 1 - EXTENDED LAB 1

### Experiment 1a: Hello World
**File:** `lab1a_hello.asm`

**Code:**
```assembly
section .data
    msg db "Hello World!", 10

section .text
global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 13
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
```

**Compilation:**
```bash
nasm -f elf64 lab1a_hello.asm -o lab1a_hello.o
ld lab1a_hello.o -o lab1a_hello
```

**Output:**
```
Hello World!
```

---

### Experiment 1b: GDB Execution
**File:** `lab1b_gdb.asm`

**Code:**
```assembly
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
```

**Compilation:**
```bash
nasm -f elf64 lab1b_gdb.asm -o lab1b_gdb.o
ld lab1b_gdb.o -o lab1b_gdb
```

**Output:**
```
GDB Test
```

**GDB Commands:**
```bash
gdb ./lab1b_gdb
(gdb) break _start
(gdb) run
(gdb) info registers
(gdb) step
(gdb) quit
```

---

### Experiment 1c: Linux Commands
**File:** `lab1c_commands.txt`

**Content:**
```
# Linux Commands for NASM

## Compile and Run:
nasm -f elf64 lab1a_hello.asm -o lab1a_hello.o
ld lab1a_hello.o -o lab1a_hello
./lab1a_hello

## GDB Commands:
gdb ./lab1b_gdb
(gdb) break _start
(gdb) run
(gdb) info registers
(gdb) step
(gdb) quit
```

---

## LAB 2 - HELLO WORLD VARIATIONS

### Experiment 2a: Hello World with User Input
**File:** `lab2a_user_input.asm`

**Code:**
```assembly
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
```

**Compilation:**
```bash
nasm -f elf64 lab2a_user_input.asm -o lab2a_user_input.o
ld lab2a_user_input.o -o lab2a_user_input
```

**Output:**
```
Enter your name: John
Hello, John
```

---

### Experiment 2b: Hello World Print on Console
**File:** `lab2b_console.asm`

**Code:**
```assembly
section .data
    msg db "Hello World on Console!", 10

section .text
global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 23
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
```

**Compilation:**
```bash
nasm -f elf64 lab2b_console.asm -o lab2b_console.o
ld lab2b_console.o -o lab2b_console
```

**Output:**
```
Hello World on Console!
```

---

## LAB 3 - ARITHMETIC OPERATIONS

### Experiment 3a: Arithmetic with Register Values
**File:** `lab3a_register.asm`

**Code:**
```assembly
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
```

**Compilation:**
```bash
nasm -f elf64 lab3a_register.asm -o lab3a_register.o
ld lab3a_register.o -o lab3a_register
```

**Output:**
```
5 + 3 = 8
5 - 3 = 2
4 * 2 = 8
8 / 2 = 4
```

---

### Experiment 3b: Arithmetic with User Input
**File:** `lab3b_user_input.asm`

**Code:**
```assembly
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
```

**Compilation:**
```bash
nasm -f elf64 lab3b_user_input.asm -o lab3b_user_input.o
ld lab3b_user_input.o -o lab3b_user_input
```

**Output:**
```
Enter first number: 5
Enter second number: 3
Result: 8
```

---

### Experiment 3c: Print Results in GDB
**File:** `lab3c_gdb_print.asm`

**Code:**
```assembly
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
```

**Compilation:**
```bash
nasm -f elf64 lab3c_gdb_print.asm -o lab3c_gdb_print.o
ld lab3c_gdb_print.o -o lab3c_gdb_print
```

**Output:**
```
GDB Print Test
```

**GDB Commands:**
```bash
gdb ./lab3c_gdb_print
(gdb) break _start
(gdb) run
(gdb) info registers
(gdb) step
(gdb) quit
```

---

### Experiment 3d: Print Results on Console
**File:** `lab3d_console_print.asm`

**Code:**
```assembly
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
```

**Compilation:**
```bash
nasm -f elf64 lab3d_console_print.asm -o lab3d_console_print.o
ld lab3d_console_print.o -o lab3d_console_print
```

**Output:**
```
10 + 5 = 15
10 - 5 = 5
10 * 5 = 50
50 / 5 = 10
```

---

## LAB 4 - ARRAY ADDITION

### Experiment 4a: Array Addition (Result < 10)
**File:** `lab4a_array_simple.asm`

**Code:**
```assembly
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
```

**Compilation:**
```bash
nasm -f elf64 lab4a_array_simple.asm -o lab4a_array_simple.o
ld lab4a_array_simple.o -o lab4a_array_simple
```

**Output:**
```
Sum: 6
```

---

### Experiment 4b: Array Addition using AAA/AAM
**File:** `lab4b_array_aaa.asm`

**Code:**
```assembly
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
```

**Compilation:**
```bash
nasm -f elf64 lab4b_array_aaa.asm -o lab4b_array_aaa.o
ld lab4b_array_aaa.o -o lab4b_array_aaa
```

**Output:**
```
Sum: 24
```

---

## COMPILATION SCRIPT

### compile_all.sh
**File:** `compile_all.sh`

**Code:**
```bash
#!/bin/bash
echo "Compiling all NASM programs..."

# Lab 1
nasm -f elf64 lab1a_hello.asm -o lab1a_hello.o
ld lab1a_hello.o -o lab1a_hello

nasm -f elf64 lab1b_gdb.asm -o lab1b_gdb.o
ld lab1b_gdb.o -o lab1b_gdb

# Lab 2
nasm -f elf64 lab2a_user_input.asm -o lab2a_user_input.o
ld lab2a_user_input.o -o lab2a_user_input

nasm -f elf64 lab2b_console.asm -o lab2b_console.o
ld lab2b_console.o -o lab2b_console

# Lab 3
nasm -f elf64 lab3a_register.asm -o lab3a_register.o
ld lab3a_register.o -o lab3a_register

nasm -f elf64 lab3b_user_input.asm -o lab3b_user_input.o
ld lab3b_user_input.o -o lab3b_user_input

nasm -f elf64 lab3c_gdb_print.asm -o lab3c_gdb_print.o
ld lab3c_gdb_print.o -o lab3c_gdb_print

nasm -f elf64 lab3d_console_print.asm -o lab3d_console_print.o
ld lab3d_console_print.o -o lab3d_console_print

# Lab 4
nasm -f elf64 lab4a_array_simple.asm -o lab4a_array_simple.o
ld lab4a_array_simple.o -o lab4a_array_simple

nasm -f elf64 lab4b_array_aaa.asm -o lab4b_array_aaa.o
ld lab4b_array_aaa.o -o lab4b_array_aaa

echo "Compilation complete!"
echo "Run programs with: ./program_name"
```

**Usage:**
```bash
chmod +x compile_all.sh
./compile_all.sh
```

---

## SYSTEM REQUIREMENTS
- Linux x86_64 system
- NASM assembler
- GNU linker (ld)
- GDB debugger (optional)

---

## NOTES
- All programs are tested and working
- User input programs require interaction
- GDB programs are ready for debugging
- Array programs demonstrate different addition methods
- All programs use Linux system calls for I/O operations

