section .data
msg db 'Hola, mundo!', 0
section .text
global _start
_start:
; escribir en la consola
mov eax, 4 ; syscall number (sys_write)
mov ebx, 1 ; file descriptor (stdout)
mov ecx, msg ; message to write
mov edx, 13 ; message length
int 0x80 ; call kernel
; salir
mov eax, 1 ; syscall number (sys_exit)
xor ebx, ebx ; exit code
int 0x80 ; call kernel