//Hector Jimenez Barragan
//Org de Computadoras
//22 de marzo del 2024
//Actividad  3

#include <stdio.h>

// Función para invertir los bits
void flipBits(char *binary) {
    int i = 0;
    while (binary[i] != '\0') {
        binary[i] = (binary[i] == '0') ? '1' : '0'; 
        i++; //Utilizamos un acumulador para que cuando se cumpla le ciclo se imprima los digitos correspondientes
    }
}

// Función para sumar 1 al número binario
void addOne(char *binary) {
    int i = 0;
    int carry = 1;
    while (binary[i] != '\0') {
        if (binary[i] == '0' && carry == 1) {
            binary[i] = '1';
            carry = 0;
        } else if (binary[i] == '1' && carry == 1) {
            binary[i] = '0';
        }
        i++; //esta función recorre cada dígito del número binario de derecha a izquierda y suma uno, 
        //teniendo en cuenta el carry en caso necesario. Esto representa la operación de sumar uno al número binario.
    }
}

// Función para convertir un número binario en su complemento a dos
void twosComplement(char *binary) {
    flipBits(binary);
    addOne(binary);
}

int main() {
    char binary[100];

    // Lectura del número binario
    printf("Ingrese el número binario: ");
    scanf("%s", binary);

    // Calcular el complemento a dos
    twosComplement(binary);

    printf("Complemento a dos: %s\n", binary);

    return 0;
}
