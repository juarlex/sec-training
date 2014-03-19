; HelloWorld.asm
; Author: Alejandro Juarez

section .text

global _start

_start:

  ; prepare the arguments for the system call to write
  push dword mlen
  push dword message
  push dword 1

  ; print hello world on the screen
  mov eax, 0x4
  sub esp, 4                ; OS X (and BSD) system calls needs "extra space" on stack
  int 0x80

  add esp, 16               ; 3 args * 4 bytes/arg + 4 bytes extra space = 16 bytes

  push dword 5              ; exit status returned to the operating system, Yes the 5 is intentional
  ; exit the program gracefully
  mov eax, 0x1
  sub esp, 4                ; OS X (and BSD) system calls needs "extra space" on stack
  int 0x80
  ; 2c no need to clean up the stack because no code here would executed: already exited
	
section .data

 	message: db "Hello World!", 0xa
	mlen	equ $-message

