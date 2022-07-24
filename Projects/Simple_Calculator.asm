.text
.globl main

main:
	li $v0, 4
	la $a0, msg8
	syscall
	
	li $v0, 4
	la $a0, msg9
	syscall
	
	li $v0, 4
	la $a0, msg10
	syscall
	
	li $v0, 4
	la $a0, msg11
	syscall
	
	li $v0, 4
	la $a0, msg12
	syscall
	
	li $v0, 4
	la $a0, msg13
	syscall
	
	li $v0, 4
	la $a0, msg14
	syscall
	
	li $v0, 4
	la $a0, msg15
	syscall
	
	#registors for operator ascii values
	li $t1, 43 #addition
	li $t2, 45 #subtraction
	li $t3, 42 #multiplication
	li $t4, 47 #division
	li $t5, 37 #modulus
	li $t6, 61 #equality
	li $t7, 0 #zero case for div and modulus
	
	#prints the initial message
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0  #$s0 contains answer
	
	j print
	
loop:
	#prints "Enter the operator -> "
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 12 #getting operator from user
	syscall
	move $t0, $v0 #storing operator in $t0
	
	beq $t0, $t1, addition
	beq $t0, $t2, subtraction
	beq $t0, $t3, multiply
	beq $t0, $t4, divide
	beq $t0, $t5, modulus
	beq $t0, $t6, print
	
addition:
	#prints "\n" after operator
	li $v0, 4
	la $a0, msg3
	syscall
	
	#prints "Enter the number -> "
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0  
	
	add $s0, $s0, $s1 #storing result in $s1
	
	j print

subtraction:
	#prints "\n" after operator
	li $v0, 4
	la $a0, msg3
	syscall
	
	#prints "Enter the number -> "
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0 #s1 contains second integer
	
	sub $s0, $s0, $s1 #storing result in $s1
	
	j print

multiply:
	#prints "\n" after operator
	li $v0, 4
	la $a0, msg3
	syscall
	
	#prints "Enter the number -> "
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0 #s1 contains second integer
	
	mul $s0, $s0, $s1 #storing result in $s0
	
	j print

divide:
	#prints "\n" after operator
	li $v0, 4
	la $a0, msg3
	syscall
	
	#prints "Enter the number -> "
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0 #s1 contains second integer
	
	#if $s1 = 0, braches to exit_inf and prints infinity
	beq $s1, $t7, exit_inf
	
	div $s0, $s1 #quotient in lo
	
	mflo $s0
	
	j print
	
modulus:
	#prints "\n" after operator
	li $v0, 4
	la $a0, msg3
	syscall
	
	#prints "Enter the number -> "
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	move $s1, $v0 #s1 contains second integer
	
	#if $s1 = 0, braches to exit_inf and prints infinity
	beq $s1, $t7, exit_inf
	
	div $s0, $s1 #remainder in hi
	
	mfhi $s0
	
	j print
	
print:
	#for printing the final answer
	beq $t0, $t6, exit
	
	#prints "current answer = "
	li $v0, 4
	la $a0, msg2
	syscall
	
	#prints the current answer
	li $v0, 1
	move $a0, $s0
	syscall
	
	#prints "\n" after giving current answer
	li $v0, 4
	la $a0, msg3
	syscall
	
	#prints "\n" after giving current answer
	li $v0, 4
	la $a0, msg3
	syscall
	
	j loop

exit:

	#prints "\n"
	li $v0, 4
	la $a0, msg3
	syscall
	
	#prints "The final answer = "
	li $v0, 4
	la $a0, msg4
	syscall
	
	#prints the final answer
	li $v0, 1
	move $a0, $s0
	syscall

	li $v0, 4
	la $a0, msg16
	syscall
	
	#exit the code
	li $v0, 10
	syscall
	
exit_inf:
	#prints "Not defined"
	li $v0, 4
	la $a0, msg6
	syscall
	
	#exit the code
	li $v0, 10
	syscall
	
.data
	msg1: .asciiz "Enter the number -> "
	msg2: .asciiz "current answer = "
	msg3: .asciiz "\n"
	msg4: .asciiz "### The final answer = "
	msg5: .asciiz "Enter the operator -> "
	msg6: .asciiz "### Not defined ###\n"
	msg7: .asciiz "**************************************************************"
	msg8: .asciiz "### Simple Calculator ###\n\n"
	msg9: .asciiz "### Instructions ### \n"
	msg10: .asciiz "1. The calculator can perform basic operations on integers.\n\n"
	msg11: .asciiz "2. The available operations are ->\ni)   Addition (+)\nii)  Subtraction (-)\niii) Multiplication (*)\niv)  Division (/)\nv)   Modulus(%)\n\n"
	msg12: .asciiz "3. The calculator takes a single integer at a time followed by an operator. Then it takes a second integer and prints the current answer.\n"
	msg13: .asciiz "4. The calculator will perform the operations till '=' operator is encountered or an error occurs.\n"
	msg14: .asciiz "5. Press enter after entering every integer.\n"
	msg15: .asciiz "6. In case answer becomes > (2^31 - 1) or < -(2^31), the calculator will give a wrong answer as the registers can store 32-bits only.\n\n"
	msg16: .asciiz " ###\n"