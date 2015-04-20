; 64bit
global _start

_start:
    jmp MESSAGE

GOBACK:
    xor rax,rax
    mov al, 1  
    mov rdi, rax
    pop rsi   
          
    xor rdx, rdx   
    add rdx, 0xF
    syscall

    xor rax,rax
    add rax, 60
    xor rdi,rdi
    syscall

MESSAGE:
    call GOBACK
    db "Hello, World!", 0dh, 0ah
