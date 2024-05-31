section .data
; Datos (pueden ser modificados según tus necesidades)
num1 dd 10
num2 dd 20
section .text
global _start
_start:
; Guardar los valores en la pila
push dword [num1]
push dword [num2]
; Llamar a la función de suma
call suma
; Recuperar el resultado de la pila
pop eax
; Salir del programa
mov ebx, 0
int 0x80
suma:
; Recuperar los valores de la pila
pop ebx
pop ecx
; Realizar la suma
add eax, ebx
add eax, ecx
; Devolver el resultado a la pila
push eax

; Retornar