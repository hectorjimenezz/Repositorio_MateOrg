;HECTOR JIMENEZ BARRAGAN 
;PROGRAMA DE PRUEBA 1

section .data
    msg_greater db "El numero es mayor o igual a 10", 0xA
    len_msg_greater equ $ - msg_greater

    msg_lower db "El numero es menor a 10", 0xA
    len_msg_lower equ $ - msg_lower


section .bss
    number resd 1
    
section .text
    global _start

_start:
    mov dword [number], 1

    mov eax, dword [number]
    cmp eax, 10
    jge greater_than_or_equal
    
    mov eax, 4
    mov ebx,1
    mov ecx, msg_lower
    mov edx, len_msg_lower
    int 0x80
    jmp end_if_else

greater_than_or_equal:
    mov eax,4
    mov ebx,1
    mov ecx, msg_greater
    mov edx, len_msg_greater
    int 0x80

end_if_else:
    mov eax, 1
    xor ebx, ebx
    int 0x80
