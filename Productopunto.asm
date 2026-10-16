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

    #Finalizar programa
    addi a7, zero, 10
    ecall

