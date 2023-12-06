.data
input: .word 0x00008A9E # Unicode code point for UTF-8 encoding
.text
.globl main
main:
    lw $a3, input  # Load the code point into register $a3
    # Extract and shift the bits to create the UTF-8 encoding
    li $t0, 0xE0               # 1110xxxx
    li $t1, 0x80               # 10xxxxxx
    li $t2, 0x80               # 10xxxxxx
    andi $t3, $a3, 0xF000      # Extract bits 12-15
    srl $t3, $t3, 12           # Shift right by 12
    or $t0, $t0, $t3           # Merge with the first byte
    andi $t3, $a3, 0x0FC0      # Extract bits 6-11
    srl $t3, $t3, 6            # Shift right by 6
    or $t1, $t1, $t3           # Merge with the second byte
    andi $t3, $a3, 0x003F      # Extract bits 0-5
    or $t2, $t2, $t3           # Merge with the third byte
    # Now we have the three UTF-8 bytes in $t0 (E8), $t1 (AA), and $t2 (9E)
    # We need to put them in the correct order in $a2 considering big-endian format
    sll $t1, $t1, 8            # Shift the second byte left by 8 bits
    sll $t0, $t0, 16           # Shift the first byte left by 16 bits
    or $a2, $t0, $t1           # Merge the first and second byte
    or $a2, $a2, $t2           # Merge the third byte
    # $a2 should now have the value 0x00E8AA9E
    # Exit the program
    li $v0, 10
    syscall
