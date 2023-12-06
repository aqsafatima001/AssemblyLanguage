.data
x: .word 5, 3, 10, 2
result1: .word 0
result2: .word 0
.text
.globl main
main:
    la $a3, x
    lw $t0, 0($a3)   # Load x
    lw $t1, 4($a3)   # Load y
    lw $t2, 8($a3)   # Load z
    lw $t3, 12($a3)  # Load w    
    # Expression 1: exp_1 = (x + z) - (9 % y)
    add $t4, $t0, $t2  # $t4 = x + z
    li $t5, 9          # Load 9 into $t5
    rem $t6, $t5, $t1  # $t6 = 9 % y
    sub $a1, $t4, $t6  # $a1 = (x + z) - (9 % y)
    # Expression 2: exp_2 = (((w * 13) / 4) + ((z - y) * 2))
    li $t7, 13         # Load 13 into $t7
    mul $t7, $t7, $t3  # $t7 = w * 13
    div $t7, $t7, 4    # $t7 = (w * 13) / 4
    mflo $t7           # $t7 = result of division
    sub $t8, $t2, $t1  # $t8 = z - y
    mul $t8, $t8, 2    # $t8 = (z - y) * 2
    add $a2, $t7, $t8  # $a2 = (((w * 13) / 4) + ((z - y) * 2))
    sw $a1, result1    # Store result1 in memory
    sw $a2, result2    # Store result2 in memory
    li $v0, 10         # Exit program
    syscall
