; HelloWorld.asm
; Author: Alejandro Juarez
; /usr/local/bin/nasm -f macho64 64.asm && ld  -lSystem -o 64 64.o -e _start && ./64

global _start

section .text

_start:

  ; print hello world on the screen
  mov     rax, 0x2000004 ; write
  mov     rdi, 1 
  mov     rsi, message
  mov     rdx, message.len
  syscall

  mov     rax, 0x2000001 ; exit
  mov     rdi, 1
  syscall
	
section .data

 	message: db "Hello World!", 10
	.len:	equ $-message

