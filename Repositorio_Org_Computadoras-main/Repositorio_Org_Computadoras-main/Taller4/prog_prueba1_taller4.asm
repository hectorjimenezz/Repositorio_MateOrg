;Programa de prueba 1

section .data
debug_msg db "Debugging message", 0xA ; Define el mensaje con un salto de
línea al final
debug_len equ $ - debug_msg ; Calcula la longitud del mensaje
section .text
global _start
_start:
mov eax, 4 ; Indica que queremos llamar a sys_write
mov ebx, 1 ; Descriptor de archivo 1 (stdout)
mov ecx, debug_msg ; Dirección del mensaje a escribir
mov edx, debug_len ; Longitud del mensaje
int 0x80 ; Llama al sistema para escribir
mov eax, 1 ; Indica que queremos llamar a sys_exit
xor ebx, ebx ; Código de salida 0 (salida exitosa)
int 0x80 ; Llama al sistema para salir
;Programa de prueba 1
section .data
debug_msg db "Debugging message", 0xA ; Define el mensaje con un salto de
línea al final
debug_len equ $ - debug_msg ; Calcula la longitud del mensaje

section .text
global _start
_start:
mov eax, 4 ; Indica que queremos llamar a sys_write
mov ebx, 1 ; Descriptor de archivo 1 (stdout)
mov ecx, debug_msg ; Dirección del mensaje a escribir
mov edx, debug_len ; Longitud del mensaje
int 0x80 ; Llama al sistema para escribir
mov eax, 1 ; Indica que queremos llamar a sys_exit
xor ebx, ebx ; Código de salida 0 (salida exitosa)
int 0x80 ; Llama al sistema para salir