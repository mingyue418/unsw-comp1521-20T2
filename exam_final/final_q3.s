# this code reads 1 integer and prints it
# add code so that prints 1 iff
# the least significant (bottom) byte of the number read
# is equal to the 2nd least significant byte
# and it prints 0 otherwise

main:
    li   $v0, 5
    syscall

    # PUT YOUR CODE HERE
    move $t0, $v0
    li   $t1, 0xff
    and  $t2, $t1, $t0
    
    li   $t3, 8
    
    srlv $t4, $t0, $t3
    and  $t5, $t4, $t1
    
    li $t6, 1
    li $t7, 0
    bne $t2, $t5, be_not


be_equal:    
    move $a0, $t6
    li   $v0, 1
    syscall

    li   $a0, '\n'
    li   $v0, 11
    syscall
    b end
be_not:
    move $a0, $t7
    li   $v0, 1
    syscall

    li   $a0, '\n'
    li   $v0, 11
    syscall
end:
    li   $v0, 0
    jr   $ra
