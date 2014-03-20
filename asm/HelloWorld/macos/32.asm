; 32.asm
; Author: Alejandro Juarez
; /usr/local/bin/nasm -f macho 32.asm && ld 32.o -e _start  -o 32
global _start

section .text

_start:

  ; prepare the arguments for the system call to write
  push dword message.len
  push dword message
  push dword 1

  ; print hello world on the screen
  mov eax, 0x4
  sub esp, 4                ; OS X (and BSD) system calls needs "extra space" on stack
  int 0x80
  add esp, 16               ; 3 args * 4 bytes/arg + 4 bytes extra space = 16 bytes

  push dword 5              ; exit status returned to the operating system, Yes the 5 is intentional
  mov eax, 0x1
  sub esp, 12                ; OS X (and BSD) system calls needs "extra space" on stack
  int 0x80
	
section .data

 	message: db "Hello World!", 10
	.len:	equ $-message

