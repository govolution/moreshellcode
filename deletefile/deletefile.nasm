; Filename: deletefile.nasm
; Author: Daniel Sauder
; Website: http://govolution.wordpress.com
; Tested on: Ubuntu 12.04 / 32Bit
; License http://creativecommons.org/licenses/by-sa/3.0/

; delete file with name x

section .text

global _start

_start:

	push 0x78 ; push x, filename
	mov ebx,esp
	xor eax,eax
	mov al,0xa
	int 0x80
	
	mov al,0x1
	int 0x80
	