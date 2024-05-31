#include <stdio.h>
char format[] = "%s %s\n";
char hello[] = "Hello";
char world[] = "world";
int main(void) {
__asm {
mov eax, offset world
push eax
mov eax, offset hello
push eax
mov eax, offset format
push eax
call printf
// Limpieza de la pila para que main pueda salir correctamente
pop ebx
pop ebx
pop ebx
}
return 0;
}