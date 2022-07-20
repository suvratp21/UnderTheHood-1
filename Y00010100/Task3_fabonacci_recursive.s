.text
.globl main
main:
	li $v0,4 			#prompt
	la $a0,msg
	syscall
	
	li $v0,5 			#Reading Argument
	syscall
	move $a0,$v0
	
	jal fib  			#calling Function
	
	li $v0,4 			#prompt1
	la $a0,msg1
	syscall
	li $v0,1			#print output
	move $a0,$t2
	syscall
	li $v0,10			#exit
	syscall
fib:
	addi $sp,$sp,-12 	#Creating Stack of depth 3
	sw $ra,0($sp)		#storing return address
	sw $a0,4($sp)		#Storing n
	slti $t1,$a0,2		#if n<2 t2=a0
	beq  $t1,$0,L1		#else move to branch L1
	addi $t2,$a0,0		
	addi $sp,$sp,12		#pop
	jr $ra				#back to function call
L1:
	addi $a0,$a0,-1		
	jal fib				#calling fib(n-1)
	lw $a0,4($sp)		#load old value of a0 stored in stack
	sw $t2,8($sp)		#store fib(n-1) in stack
	add $a0,$a0,-2		
	jal fib				#calling fib(n-2)
	lw $t0,8($sp)		#load fib((n-1)-1)
	add $t2,$t2,$t0
	lw $ra,0($sp)		#load address
	add $sp, $sp,12		#pop
	jr $ra				#back to function call
.data
msg:
	.asciiz"Enter n:\n"
msg1:
	.asciiz"Nth Fibonacci Number is : \n"
		