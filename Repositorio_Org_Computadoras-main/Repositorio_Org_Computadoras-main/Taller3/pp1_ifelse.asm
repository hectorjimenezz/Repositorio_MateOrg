;PRUEBA 1  IF ELSE

section .data
    msg_equal db "Los numeros son iguales", 0xA       ; Mensaje para números iguales
    len_msg_equal equ $ - msg_equal                   ; Longitud del mensaje
    
    msg_not_equal db "Los numeros son diferentes", 0xA  ; Mensaje para números diferentes
    len_msg_not_equal equ $ - msg_not_equal             ; Longitud del mensaje

section .bss
    number1 resd 1                                      ; Primer número a comparar
    number2 resd 1                                      ; Segundo número a comparar

section .text
    global _start

_start:
    mov dword [number1], 5                              ; Asigna el valor 5 al primer número
    mov dword [number2], 5                              ; Asigna el valor 5 al segundo número

    mov eax, dword [number1]                            ; Carga el valor del primer número en eax
    cmp eax, dword [number2]                            ; Compara el primer número con el segundo
    je numbers_equal                                    ; Salta a 'numbers_equal' si son iguales

    mov eax, 4                                          ; Prepara la llamada al sistema para imprimir un mensaje
    mov ebx, 1                                          ; File descriptor (stdout)
    mov ecx, msg_not_equal                              ; Dirección del mensaje a imprimir (para números diferentes)
    mov edx, len_msg_not_equal                          ; Longitud del mensaje
    int 0x80                                            ; Llamada al sistema para imprimir el mensaje
    jmp end_if_else                                    ; Salta al final de la estructura if/else

numbers_equal:
    mov eax, 4                                          ; Prepara la llamada al sistema para imprimir un mensaje
    mov ebx, 1                                          ; File descriptor (stdout)
    mov ecx, msg_equal                                  ; Dirección del mensaje a imprimir (para números iguales)
    mov edx, len_msg_equal                              ; Longitud del mensaje
    int 0x80                                            ; Llamada al sistema para imprimir el mensaje

end_if_else:
    mov eax, 1                                          ; Prepara la llamada al sistema para salir del programa
    xor ebx, ebx                                        ; Código de salida 0 (éxito)
    int 0x80                                            ; Llamada al sistema para salir del programa
