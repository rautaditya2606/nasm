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
