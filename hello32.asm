; 32bit
global _start

_start:
    jmp MESSAGE

GOBACK:
    xor eax, eax
    mov al, 0x4
    xor ebx, ebx
    inc ebx
    pop ecx   
             
    xor edx, edx
    add edx, 0xF
    int 0x80

    xor eax, eax
    inc eax
    xor ebx, ebx
    int 0x80

MESSAGE:
    call GOBACK
    db "Hello, World!", 0dh, 0ah
