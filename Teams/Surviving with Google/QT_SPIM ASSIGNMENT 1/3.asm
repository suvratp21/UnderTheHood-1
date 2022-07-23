.text
.globl main
main:
	li $v0,4 			#prompt
	la $a0,msg1
	syscall
	
	li $v0,5 			#Reading Argument
	syscall
	move $a0,$v0
	
    # calling Function
	jal fib  	

    # print newline
    li $v0,4
    la $a0, newline 
    syscall		
	
    # print_output
	li $v0,4 			
	la $a0,msg2
	syscall
	li $v0,1			
	move $a0,$t2
	syscall

    # exit
	li $v0,10			
	syscall
fib:
	addi $sp,$sp,-12 	
	sw $ra,0($sp)		
	sw $a0,4($sp)		
	slti $t1,$a0,2		
	beq  $t1,$0,L1		
	addi $t2,$a0,0		
	addi $sp,$sp,12	
	jr $ra			
L1:
	addi $a0,$a0,-1		
	jal fib			
	lw $a0,4($sp)	
	sw $t2,8($sp)	
	add $a0,$a0,-2		
	jal fib				
	lw $t0,8($sp)		
	add $t2,$t2,$t0
	lw $ra,0($sp)		
	add $sp, $sp,12		
	jr $ra				
.data

msg1: .asciiz"Enter n:"
msg2: .asciiz"Nth Fibonacci Number is : "
newline: .asciiz "\n"