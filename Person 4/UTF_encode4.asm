.data
input_code_point: .word 0x00008A9E
.text
.globl main
main:
    lw $a3, input_code_point
    li $t0, 0xE0
    li $t1, 0x80
    li $t2, 0x80
    andi $t3, $a3, 0xF000
    srl $t3, $t3, 12
    or $t0, $t0, $t3
    andi $t3, $a3, 0x0FC0
    srl $t3, $t3, 6
    or $t1, $t1, $t3
    andi $t3, $a3, 0x003F
    or $t2, $t2, $t3
    sll $t1, $t1, 8
    sll $t0, $t0, 16
    or $a2, $t0, $t1
    or $a2, $a2, $t2
    li $v0, 10
    syscall
