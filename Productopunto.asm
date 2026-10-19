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

    # Multiplicar los elementos
    mul t2, t0, t1

    # Acumular resultado
    add s1, s1, t2

    # Avanzar al siguiente elemento
    addi s3, s3, 4
    addi s4, s4, 4
    addi s0, s0, 1

    # Repetir ciclo
    jal zero, for

fin_for:
    # Finalizar programa
    addi a7, zero, 10
    ecall

