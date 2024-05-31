section .data
	valor1 db 10101010b
	valor2 db 11001100b
	resultado db 0

section .text
global _start

_start:
mov al, [valor1]
mov bl, [valor2]
and a1, bl
mov [resultado], al