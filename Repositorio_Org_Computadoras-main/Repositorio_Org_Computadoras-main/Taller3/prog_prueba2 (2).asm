;HECTOR JIMENEZ BARRAGAN
;PROGRAMA DE PRUEBA 2

section	.data
    msg_lower db "El numero es menor a 10", 0xA
    len_msg_lower equ $ - msg_lower

    msg_greater db "El numero es mayor o igual a 10", 0xA
    len_msg_greater equ $ - msg_greater
   
section.bss
    number resd 1
    
section.text
    global _start      
    
_start:       

    mov dword [number], 1
    
    mov eax, dword [number]
    cmp eax, 10
    jge greater_than_or_equal
    
    ; Number is less than 10
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, msg_lower   ; message to write
    mov edx, len_msg_lower  ; message length
    int 0x80             ; syscall
    
    jmp end_if_else

greater_than_or_equal:

    ; Number is greater than or equal to 10
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, msg_greater ; message to write
    mov edx, len_msg_greater ; message length
    int 0x80             ; syscall

end_if_else:
    mov eax, 1           ; sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80             ; syscall
