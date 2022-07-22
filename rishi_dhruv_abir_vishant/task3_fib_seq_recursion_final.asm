.data
msg1:   .asciiz     "Enter value of  n: "
msg2:   .asciiz     "n-th term in fibonacci sequence is: "
msg3:   .asciiz     "\n"
msg4:   .asciiz     "Wrong input(input must be non negative).\n"
msg5:   .asciiz     "To continue press 1 else 0: "
msg6:   .asciiz     "-----Program ended-----\n"
.text

main:
    # print msg1
    la      $a0,msg1
    li      $v0,4
    syscall

    # input from user
    li      $v0,5
    syscall
    move    $a0,$v0

    blt $a0,$zero,wrong_input  #if n<0 wrong input take input again


    jal     fib_seq
    move    $t2,$v0      

    # print msg2
    li      $v0,4
    la      $a0,msg2
    syscall

    # print answer
    li      $v0,1
    move    $a0,$t2
    syscall

    # print message3
    la      $a0,msg3
    li      $v0,4
    syscall

    # print msg5
    la      $a0,msg5
    li      $v0,4
    syscall

    # input from user
    li      $v0,5
    syscall
    move    $a0,$v0
    beq $a0,$zero,exit    #take input to end or run program again

   j       main

wrong_input:
    la      $a0,msg4   
    li      $v0,4
    syscall

   j main

exit:

 # print msg6-program ended            
    la      $a0,msg6
    li      $v0,4
    syscall
 # exit
    li      $v0,10
    syscall


#function to calculate n_th term in fib_seq
fib_seq:
# return value: v0
# arguments: a0=value of "n"
    
    bgt     $a0,1,nth_term        # for n>1 go to n_term else fib(0)=0 fib(1)=1 i.e return a0
    move    $v0,$a0                
    jr      $ra              

nth_term:

    subu    $sp,$sp,12              # one more than we need
    sw      $ra,4($sp)
    sw      $a0,8($sp)

    sub     $a0,$a0,1               #  fib_seq(n-1)
    jal     fib_seq        
    sw      $v0,0($sp)         

    sub     $a0,$a0,1               # fib_seq(n-2)
    jal     fib_seq              

    lw      $t0,0($sp)       
    add     $v0,$t0,$v0             # answer is fib_seq(n-1) + fib_seq(n-2)

    lw      $ra,4($sp)
    lw      $a0,8($sp)
    addu    $sp,$sp,12

    jr      $ra                     # return
