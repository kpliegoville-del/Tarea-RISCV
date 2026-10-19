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
    # Llamar a la funcion suma
    jal ra, suma
    jal zero, fin

caso_resta:
    # Llamar a la funcion resta
    jal ra, resta
    jal zero, fin

caso_multiplica:
    # Llamar a multiplicacion
    jal ra, multiplica
    jal zero, fin

caso_and:
    # Llamar a AND bitwise
    jal ra, andBitwise
    jal zero, fin


# Funcion suma
suma:
    add s3, s1, s2
    jalr zero, 0(ra)

# Funcion resta
resta:
    sub s3, s1, s2
    jalr zero, 0(ra)

# Funcion multiplicacion
multiplica:
    mul s3, s1, s2
    jalr zero, 0(ra)

# Funcion AND bitwise
andBitwise:
    and s3, s1, s2
    jalr zero, 0(ra)

fin:
    addi a7, zero, 10
    ecall
