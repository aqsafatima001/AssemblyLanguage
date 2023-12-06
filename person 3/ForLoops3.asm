.data
array: .space 40   # Allocate space for 10 words (10 * 4 bytes)
.text
.globl main
main:
    li $t3, 0       # Initialize sum to 0
    la $a3, array   # Load the address of the array
    li $a1, 0       # Initialize index to 0
    li $a2, 10      # Set the upper bound of the loop (10 elements)
loop:
    bge $a1, $a2, end_loop  # Break the loop if index >= 10
    lw $t4, 0($a3)          # Load the value from the array at the current index
    andi $t5, $a1, 1        # Check if the index is odd (1 if odd, 0 if even)
    beqz $t5, sum_of_even_indexes   # If the index is even, add the value to sum
    j continue_loop
sum_of_even_indexes:
    add $t3, $t3, $t4       # Add the value at the current index to the sum
continue_loop:
    addi $a3, $a3, 4        # Move to the next element in the array
    addi $a1, $a1, 1        # Increment the index
    j loop                  # Jump back to the start of the loop
end_loop:
    # Exit the program. In a real scenario, you might want to store or print $t3
    li $v0, 10
    syscall
