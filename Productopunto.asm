.data 
    #La declaración de vectores
    Vec1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
    Vec2: .word -1, 2, -3, 4, -5, 6, -7, 8, -9

    resultado: .word 0

.text
.globl main

main: 
    #incio variables
    addi s0, zero, 0 #i = 0
    addi s1, zero, 0 #resultado = 0
    addi s2, zero, 9 #Tamano de los vectores


    # Direcciones de los vectores
    lui s3, 0x10010
    addi s4, s3, 36

for:
    # Comprobar condicion i < 9
    bge s0, s2, fin_for

    # Obtener elementos de vectores
    lw t0, 0(s3)
    lw t1, 0(s4)


    # Paramtros funcion
    addi a0, t0, 0
    addi a1, t1, 0

    # Llamar a ProductFunction
    jal ra, ProductFunction

    # Acumular el resultado
    add s1, s1, a0


    # Avanzar al siguiente elemento
    addi s3, s3, 4
    addi s4, s4, 4
    addi s0, s0, 1

    # Repetir ciclo
    jal zero, for

fin_for:
    # Guardar resultado en memoria
    lui t3, 0x10010
    sw s1, 72(t3)

    # Finalizar programa
    addi a7, zero, 10
    ecall

# Funcion ProductFunction
ProductFunction:
    # Multiplicar los parametros
    mul a0, a0, a1

    # Regresar al ciclo
    jalr zero, 0(ra)
