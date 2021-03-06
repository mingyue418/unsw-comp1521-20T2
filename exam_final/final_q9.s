# this code reads a line of input and prints 42
# change it to evaluate the arithmetic expression

main:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)
    la   $a0, line
    la   $a1, 10000
    li   $v0, 8          # fgets(buffer, 256, stdin)
    syscall              #
    
    la   $s0, line

    jal expression
    move $t0, $v0

    move   $a0, $t0         # printf("%d", );
    li   $v0, 1
    syscall

    li   $a0, '\n'       # printf("%c", '\n');
    li   $v0, 11
    syscall

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    li   $v0, 0          # return 0
    jr   $31







expression:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)
    jal term
    move $t0, $v0
    lb   $t1, ($s0)
    beq  $t1, '+', end_if2
    move $v0, $t0
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
end_if2: 
    add $s0, $s0, 1
    jal expression
    move $t2, $v0
    add $v0, $t0, $t2
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra









term:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)
    jal  number
    move $t0, $v0
    lb   $t1, ($s0)
    beq  $t1, '*', end_if1
    move $v0, $t0
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
end_if1:    
    add $s0, $s0, 1
    jal term
    move $t2, $v0
    mul $v0, $t0, $t2
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra





number:
    li   $t0, 0
    
loop0:
    lb   $t1, ($s0)
    blt  $t1, '0', end_loop0
    bgt  $t1, '9', end_loop0
    mul  $t0, $t0, 10
    add  $t0, $t0, $t1
    sub  $t0, $t0, '0'
    add  $s0, $s0, 1
    b loop0
end_loop0:   
    move $v0, $t0
    jr   $ra







.data
line:
    .space 10000

