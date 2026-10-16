.text
.globl main

main:
    # Inicializacion de variables
    addi s0, zero, 0      # selector = 0
    addi s1, zero, 5      # a = 5
    addi s2, zero, 3      # b = 3
    addi s3, zero, 0      # c = 0

    # Comparaciones del switch
    addi t0, zero, 1
    beq s0, t0, caso_suma

    addi t0, zero, 2
    beq s0, t0, caso_resta

    addi t0, zero, 3
    beq s0, t0, caso_multiplica

    jal zero, caso_and

caso_suma:
    jal zero, fin

caso_resta:
    jal zero, fin

caso_multiplica:
    jal zero, fin

caso_and:
    jal zero, fin

fin:
    addi a7, zero, 10
    ecall
