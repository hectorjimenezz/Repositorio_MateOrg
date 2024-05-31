; PRUEBA 1 EXPLICADO

section .data
    msg_greater db "El numero es mayor o igual a 10", 0xA  ; Mensaje para números mayores o iguales a 10
    len_msg_greater equ $ - msg_greater                 ; Longitud del mensaje
    
    msg_lower db "El numero es menor a 10", 0xA          ; Mensaje para números menores a 10
    len_msg_lower equ $ - msg_lower                     ; Longitud del mensaje

section .bss
    number resd 1                                        ; Reserva espacio para almacenar un número

section .text
    global _start

_start:
    mov dword [number], 1                                ; Asigna el valor 1 a la variable number

    mov eax, dword [number]                              ; Carga el valor de number en el registro eax
    cmp eax, 10                                          ; Compara el valor de eax con 10
    jge greater_than_or_equal                            ; Salta a 'greater_than_or_equal' si es mayor o igual
    
    mov eax, 4                                           ; Prepara la llamada al sistema para imprimir un mensaje
    mov ebx, 1                                           ; File descriptor (stdout)
    mov ecx, msg_lower                                   ; Dirección del mensaje a imprimir (para números menores a 10)
    mov edx, len_msg_lower                               ; Longitud del mensaje
    int 0x80                                             ; Llamada al sistema para imprimir el mensaje
    jmp end_if_else                                      ; Salta al final de la estructura if/else

greater_than_or_equal:
    mov eax, 4                                           ; Prepara la llamada al sistema para imprimir un mensaje
    mov ebx, 1                                           ; File descriptor (stdout)
    mov ecx, msg_greater                                 ; Dirección del mensaje a imprimir (para números mayores o iguales a 10)
    mov edx, len_msg_greater                             ; Longitud del mensaje
    int 0x80                                             ; Llamada al sistema para imprimir el mensaje

end_if_else:
    mov eax, 1                                           ; Prepara la llamada al sistema para salir del programa
    xor ebx, ebx                                         ; Código de salida 0 (éxito)
    int 0x80                                             ; Llamada al sistema para salir del programa
