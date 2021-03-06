# read a line and print whether it is a palindrom

main:
    la   $a0, str0       # printf("Enter a line of input: ");
    li   $v0, 4
    syscall

    la   $a0, line
    la   $a1, 256
    li   $v0, 8          # fgets(buffer, 256, stdin)
    syscall              #


    li $t0, 0
loop0:
    la $t1, line
    add $t2, $t1, $t0
    lb $t3, ($t2)
    beq $t3, 0, end_loop0
    add $t0, $t0, 1
    b loop0    
end_loop0: 

    li $t1, 0
    sub $t2, $t0, 2
loop1:
    bge $t1, $t2, end_loop1
    la $t3, line
    add $t4, $t3, $t1
    add $t5, $t3, $t2
    lb $t6, ($t4)
    lb $t7, ($t5)
    beq $t6, $t7, endif
if:
    la   $a0, not_palindrome
    li   $v0, 4
    syscall
    
    li   $v0, 0          # return 0
    jr   $31
endif:
    add $t1, $t1, 1
    sub $t2, $t2, 1
    b loop1
end_loop1:


    la   $a0, palindrome
    li   $v0, 4
    syscall

    li   $v0, 0          # return 0
    jr   $31


.data
str0:
    .asciiz "Enter a line of input: "
palindrome:
    .asciiz "palindrome\n"
not_palindrome:
    .asciiz "not palindrome\n"


# line of input stored here
line:
    .space 256

