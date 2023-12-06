.data
x: .word 5
y: .word 3
z: .word 10
w: .word 2

.text
.globl main
main:
    lw $t0, x
    lw $t1, y
    lw $t2, z
    lw $t3, w
    li $t4, 10
    rem $t5, $t1, $t4
    add $t6, $t0, $t3
    mul $a1, $t5, $t6
    add $t7, $t3, $t2
    sll $t7, $t7, 1
    mul $t8, $t1, $t0
    sra $t8, $t8, 1
    rem $a2, $t7, $t8
    li $v0, 10
    syscall
