.data
my_x: .word 10
my_y: .word 5
my_z: .word 3
my_w: .word 2

.text
.globl main

main:
    # Load values into registers
    lw $t0, my_x
    lw $t1, my_y
    lw $t2, my_z
    lw $t3, my_w

    # Expression 1: (y * x) - (w + z)
    mul $t4, $t1, $t0
    add $t5, $t3, $t2
    sub $s1, $t4, $t5

    # Expression 2: (((7 % w) * 4) * ((y + x) / 2))
    li $t6, 7
    beq $t3, $zero, handle_div_by_zero
    rem $t6, $t6, $t3
    li $t7, 4
    mul $t6, $t6, $t7
    add $t8, $t1, $t0
    div $t8, $t8, 2
    mflo $t8
    mul $s2, $t6, $t8
    j continue_execution

handle_div_by_zero:
    li $s2, 0

continue_execution:
    # Exit
    li $v0, 10
    syscall
