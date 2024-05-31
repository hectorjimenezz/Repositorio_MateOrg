;PRUEBA 2 EXPLICADO

section	.data
    ; Define los mensajes para imprimir
    msg_lower db "El numero es menor a 10", 0xA
    len_msg_lower equ $ - msg_lower

    msg_greater db "El numero es mayor o igual a 10", 0xA
    len_msg_greater equ $ - msg_greater
   
section.bss
    ; Reserva espacio para almacenar un número de 32 bits
    number resd 1
    
section.text
    global _start      
    
_start:       
    ; Asigna el valor 1 a la variable 'number'
    mov dword [number], 1
    
    ; Carga el valor de 'number' en el registro eax
    mov eax, dword [number]
    ; Compara el valor en eax con 10
    cmp eax, 10
    ; Salta a la etiqueta 'greater_than_or_equal' si eax >= 10
    jge greater_than_or_equal
    
    ; Si eax < 10, imprime el mensaje 'msg_lower'
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, msg_lower   ; message to write
    mov edx, len_msg_lower  ; message length
    int 0x80             ; syscall
    
    ; Salta al final del bloque if/else
    jmp end_if_else

greater_than_or_equal:
    ; Si eax >= 10, imprime el mensaje 'msg_greater'
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, msg_greater ; message to write
    mov edx, len_msg_greater ; message length
    int 0x80             ; syscall

end_if_else:
    ; Finaliza el programa
    mov eax, 1           ; sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80             ; syscall
