    .text
    .globl main

main:
    # input number
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0,$v0
    move $t7,$t0

    # print newline
    li $v0,4
    la $a0, newline 
    syscall

    # calculate fib no

    li $t1, 0
    li $t2, 1

    beq $t0, 0, L1
    while: 
        beq $t0, 0, Exit
        move $t3, $t2
        add $t2, $t2, $t1
        move $t1, $t3
        addi $t0, $t0, -1
        j while
        

    Exit:
    L1: move $t2, $t1


    # print output
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0,1
    move $a0,$t7
    syscall

    li $v0, 4
    la $a0, msg3
    syscall
    
    li $v0,1
    move $a0,$t2
    syscall
    

    # exit
    li $v0, 10
    syscall

    .data

msg1: .asciiz "Enter number of term:"
msg2: .asciiz "The "
msg3: .asciiz " Fibonaci number is:"

newline: .asciiz "\n"