.data
x: .word 5, 3, 10, 2     # Initialize variables x, y, z, and w with values
result1: .word 0         # Initialize result1 with 0
result2: .word 0         # Initialize result2 with 0
.text
.globl main
main:
    la $a3, x  		# Load the address of x into $a3, ensuring alignment
    # Load values of x, y, z, and w from memory
    lw $t0, 0($a3)        # Load x into $t0
    lw $t1, 4($a3)        # Load y into $t1
    lw $t2, 8($a3)        # Load z into $t2
    lw $t3, 12($a3)       # Load w into $t3
    # Expression 1: Calculate (x + y) - (z - w)
    add $a1, $t0, $t1     # $a1 = x + y
    sub $t4, $t2, $t3     # $t4 = z - w
    sub $a1, $a1, $t4     # $a1 = (x + y) - (z - w)
    # Expression 2: Calculate (x * y) + (z / w)
    mul $a2, $t0, $t1     # $a2 = x * y
    div $t2, $t2, $t3     # $t2 = z / w
    mflo $t2              # $t2 = result of division
    add $a2, $a2, $t2     # $a2 = (x * y) + (z / w)
    # Store results in memory
    sw $a1, result1        # Store result1 in memory
    sw $a2, result2        # Store result2 in memory
    # Exit the program
    li $v0, 10             # syscall code for program exit
    syscall
