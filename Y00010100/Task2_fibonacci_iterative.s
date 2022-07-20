.text
.globl main
main:
	li $t0,0	#f0
	li $t1,1	#f1
	
	li $v0,4	#prompt
	la $a0,msg
	syscall
	
	li $v0,5	#read n
	syscall
	move $t4,$v0
while:				#while loop
	beq $0,$t4,end		#if t4==0 go to end
	add $t3,$t1,$0		#t1=t1+t0 and t0=t1
	add $t1,$t1,$t0
	add $t0,$t3,$0
	addi $t4,$t4,-1
	j while				#jump
	
end:					#print nth fibonacci
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,1
	move $a0,$t0
	syscall
	li $v0,4
	la $a0,newline
	syscall
	li $v0, 10
	syscall
.data
	msg:
	.asciiz"Enter n:\n"
	msg1:
	.asciiz"Nth Fibonacci number is:\n"
	newline:
	.asciiz"\n"
		