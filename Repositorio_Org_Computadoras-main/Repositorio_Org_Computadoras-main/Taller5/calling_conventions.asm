; Función que suma dos enteros
global _sum
section .text
_sum:

push ebp
mov ebp, esp
add eax, [ebp+8]
add eax, [ebp+12]
pop ebp
ret


2. stdcall:

extern MessageBoxA
section .data
caption db "Mensaje", 0
message db "Hola, mundo!", 0
section .text
global _start
_start:
push 0
push caption
push message
call MessageBoxA
add esp, 12


3. fastcall:
; Función que multiplica dos enteros
global _multiply
section .text
_multiply:
mov eax, ecx
imul eax, edx
ret

4. thiscall:

class MyClass {
public:
int Add(int a, int b) {
return a + b;
}
};
int main() {
MyClass obj;
int result = obj.Add(10, 20);
return 0;
}


5. vectorcall:

; Función que suma dos números de punto flotante
global _add_floats
section .text
_add_floats:
vmovaps xmm0, [rdi]
vaddps xmm0, xmm0, [rsi]
ret