.text
.globl main

main:
    # Inicializacion de valores
    addi a0, zero, 6     # Base m = 6
    addi a1, zero, 0     # Exponente n = 0 (prueba inicial)

    # Llamar a la funcion
    jal ra, Potencia

    # Guardar resultado
    addi s0, a0, 0

    # Finalizar programa
    addi a7, zero, 10
    ecall

# Funcion Potencia
Potencia:
    # Comprobar si n < 1
    addi t0, zero, 1
    blt a1, t0, caso_base

    # Retorno provisional para exponentes positivos
    addi a0, zero, 0
    jalr zero, 0(ra)

caso_base:
    # Retornar 1 si n < 1
    addi a0, zero, 1
    jalr zero, 0(ra)

