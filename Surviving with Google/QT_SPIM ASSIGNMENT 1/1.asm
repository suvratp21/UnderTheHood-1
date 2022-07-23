    .text
    .globl main

main:
    # input 1st number
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0,$v0
    move $s0,$t0

    # input 2nd number
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1,$v0
    move $s1,$t1

    # calculate 

    # chose graetest number $t0.
    slt $t9, $t0,$t1
    bne $t9, $0 , L1
    L0: move $t8,$t0
        move $t0,$t1
        move $t1,$t8
    
    bne $t1,0,L1

    L1: div $t0,$t1
        mfhi $t3
        bne $t3 , 0 , L2
        beq $t3, 0 , print


    L2: move $t0, $t1
        move $t1, $t3
        bne $t1 , 0 , L1

    # print output
    print: li $v0,4
        la $a0, newline 
        syscall

        li $v0, 4
        la $a0, msg3
        syscall

        li $v0,1
        move $a0,$s0
        syscall

        li $v0, 4
        la $a0, msg4
        syscall

        li $v0,1
        move $a0,$s1
        syscall

        li $v0, 4
        la $a0, msg5
        syscall

        li $v0,1
        move $a0,$t1
        syscall
  

    # exit
    li $v0, 10
    syscall

    .data

msg1: .asciiz "Enter first number:"
msg2: .asciiz "Enter second number:"
msg3: .asciiz "The GCD of "
msg4: .asciiz " an "
msg5: .asciiz " is "

newline: .asciiz "\n"