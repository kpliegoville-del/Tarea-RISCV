.data
    # Variable para almacenar potencia
    resultado: .word 0

.text
.globl main

main:
    # Inicializacion de valores
    addi a0, zero, 6     # Base m = 6
    addi a1, zero, 6     # Exponente n = 6

    # Llamar a la funcion
    jal ra, Potencia

    # Guardar resultado en registro
    addi s0, a0, 0

    # Guardar resultado en memoria
    lui t0, 0x10010
    sw s0, 0(t0)

    # Finalizar programa
    addi a7, zero, 10
    ecall

# Funcion recursiva Potencia
Potencia:
    # Reservar espacio en la pila
    addi sp, sp, -16

    # Guardar direccion de retorno y base
    sw ra, 12(sp)
    sw a0, 8(sp)

    # Comprobar si n < 1
    addi t0, zero, 1
    blt a1, t0, caso_base

    # Disminuir exponente
    addi a1, a1, -1

    # Llamada recursiva
    jal ra, Potencia

    # Recuperar la base original
    lw t1, 8(sp)

    # Multiplicar base por resultado
    mul a0, t1, a0

    jal zero, regresar

caso_base:
    # Retornar 1 si n < 1
    addi a0, zero, 1

regresar:
    # Recuperar direccion de retorno
    lw ra, 12(sp)

    # Liberar espacio de la pila
    addi sp, sp, 16

    # Regresar a la llamada anterior
    jalr zero, 0(ra)

