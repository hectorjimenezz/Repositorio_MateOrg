//Hector Jimenez Barragan
//Org de Computadoras
//22 de marzo del 2024
//Actividad 3

#include <stdio.h>
#include <stdlib.h>

// Función para convertir un número binario en entero
int binaryToDecimal(char *binary) {
    int decimal = 0; //inicializamos en 0
    int base = 1; //
    int i = 0; //Utlizimas un contador
    int len = 0; //VAriable patra determinar la longitud
    while (binary[len] != '\0') {
        len++;
    }
    for (i = len - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2; // Aqui es donde se determina si el numero es binario
    }
    return decimal;
}

// Función para convertir un entero en binario
void decimalToBinary(int decimal, char *binary) {
    int i = 0;
    if (decimal == 0) {
        binary[i++] = '0';
    }
    while (decimal > 0) {
        binary[i++] = (decimal % 2 == 0) ? '0' : '1'; //Esta línea calcula el residuo de dividir decimal por 2 usando el operador módulo (%). 
    }
    binary[i] = '\0';
    // Invertir el string binario
    int j = 0;
    char temp;
    for (j = 0; j < i / 2; j++) {
        temp = binary[j];
        binary[j] = binary[i - 1 - j];
        binary[i - 1 - j] = temp;
    }
}

// Función para sumar dos números binarios
void binaryAddition(char *binary1, char *binary2, char *result) {
    int num1 = binaryToDecimal(binary1);
    int num2 = binaryToDecimal(binary2);
    int sum = num1 + num2;
    decimalToBinary(sum, result);
}

// Función para restar dos números binarios
void binarySubtraction(char *binary1, char *binary2, char *result) {
    int num1 = binaryToDecimal(binary1);
    int num2 = binaryToDecimal(binary2);
    int diff = num1 - num2;
    decimalToBinary(diff, result);
}

// Función para multiplicar dos números binarios
void binaryMultiplication(char *binary1, char *binary2, char *result) {
    int num1 = binaryToDecimal(binary1);
    int num2 = binaryToDecimal(binary2);
    int product = num1 * num2;
    decimalToBinary(product, result);
}

// Función para dividir dos números binarios
void binaryDivision(char *binary1, char *binary2, char *result) {
    int num1 = binaryToDecimal(binary1);
    int num2 = binaryToDecimal(binary2);
    if (num2 == 0) {
        printf("Error: división por cero\n");
        exit(1);
    }
    int quotient = num1 / num2;
    decimalToBinary(quotient, result);
}

int main() {
    char binary1[100], binary2[100], result[100];

    // Lectura de los números binarios
    printf("Ingrese el primer número binario: ");
    scanf("%s", binary1);
    printf("Ingrese el segundo número binario: ");
    scanf("%s", binary2);

    // Suma
    binaryAddition(binary1, binary2, result);
    printf("Suma: %s\n", result);

    // Resta
    binarySubtraction(binary1, binary2, result);
    printf("Resta: %s\n", result);

    // Multiplicación
    binaryMultiplication(binary1, binary2, result);
    printf("Multiplicación: %s\n", result);

    // División
    binaryDivision(binary1, binary2, result);
    printf("División: %s\n", result);

    return 0;
}
