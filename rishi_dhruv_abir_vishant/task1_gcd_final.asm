.text
.globl main
main:

#print msg1
li $v0,4
la $a0,msg1
syscall

#take input "A"
li $v0,5
syscall
move $t0,$v0

#print msg2
li $v0,4
la $a0,msg2
syscall

#take input "B"
li $v0,5
syscall
move $t1,$v0

#gcd loop
gcd:
beq $t1,0,exit   #if b==0 exit
div $t2,$t0,$t1  #t2=a/b
mfhi $t2         #t2=a%b
move $t0,$t1     #a=b
move $t1,$t2
j gcd

exit:

#print msg3
li $v0,4
la $a0,msg3
syscall

#print result
li $v0,1
move $a0,$t0
syscall

#print newline
li $v0,4
la $a0,newline
syscall

#print msg4
li $v0,4
la $a0,msg4
syscall

#take input to run or end program
li $v0,5
syscall
move $t0,$v0

bne $t0,$zero,main  #if enter 1 go back to main 

li $v0,4            #else print msg5
la $a0,msg5
syscall

li $v0,10  #exit
syscall
.data
msg1: .asciiz "Enter number A: "
msg2: .asciiz "Enter number B: "
msg3: .asciiz "The GCD of A and B is: "
msg4: .asciiz "To continue press 1 else 0:"
msg5: .asciiz "-----Program ended-----\n"
newline: .asciiz "\n"

