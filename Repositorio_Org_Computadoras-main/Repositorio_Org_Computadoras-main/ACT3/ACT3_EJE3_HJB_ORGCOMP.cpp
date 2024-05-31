//Hector Jimenez Barragan
//Org de Computadoras
//22 de marzo del 2024
//Actividad 3

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Estructura para representar números binarios con punto flotante
typedef struct {
    char sign;
    char integer[100];
    char fraction[100];
    int exponent;
} BinaryFloat;// se utiliza para organizar y representar de manera conveniente un número binario con punto flotante
//en sus diferentes partes: signo, parte entera, parte fraccionaria y exponente

// Función para convertir un número binario con punto flotante en un struct BinaryFloat

BinaryFloat parseBinaryFloat(char *binaryFloat) { //Esto es una función que devuelve un BinaryFloat y toma un puntero a un carácter  que representa la cadena que contiene el número binario con punto flotante.
    BinaryFloat num;
    num.sign = binaryFloat[0];
    char *token = strtok(binaryFloat + 1, "."); //Se utiliza la función strtok para dividir la cadena binaryFloat en tokens (subcadenas) usando el punto (.) como delimitador. 
    strcpy(num.integer, token);
    token = strtok(NULL, "."); //Después de obtener el token que representa la parte entera, se copia en el miembro integer de la estructura num utilizando la función strcpy
    strcpy(num.fraction, token);
    num.exponent = strlen(num.integer);
    return num;
}

// Función para sumar dos números binarios con punto flotante
BinaryFloat binaryFloatAddition(char *binaryFloat1, char *binaryFloat2) {
    BinaryFloat num1 = parseBinaryFloat(binaryFloat1);
    BinaryFloat num2 = parseBinaryFloat(binaryFloat2);
    BinaryFloat result;

    // Igualar los exponentes
    while (num1.exponent < num2.exponent) {
        strcat(num1.integer, "0");
        num1.exponent++;
    }
    while (num2.exponent < num1.exponent) {
        strcat(num2.integer, "0");
        num2.exponent++;
    }

    // Sumar las partes enteras
    int carry = 0;
    int i;
    for (i = strlen(num1.integer) - 1; i >= 0; i--) {
        int sum = (num1.integer[i] - '0') + (num2.integer[i] - '0') + carry;
       
    }
}