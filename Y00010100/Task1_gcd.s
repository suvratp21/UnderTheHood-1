.text
.globl main
main:
	li $v0,4    	#prompt1
	la $a0,msg1		
	syscall
	li $v0,5		#Read A
	syscall 
	move $t0,$v0
	
	li $v0,4		#prompt2
	la $a0,msg2
	syscall
	li $v0,5		#Read B
	syscall 
	move $t1,$v0
	
	bgt $t0,$t1,main2	#if(B>A)go to main2
loop: 
	
	div $t1,$t0			#gcd(A,B)=gcd(B,A%B)
	add $t1,$0,$t0
	mfhi $t0			#move A%B to t0
	beq $t0,$0,print_gcd	# if t0 ==0  print gcd
	j loop					# jump loop
main2: 
	add $t3,$t0,$0		# swap
	add $t0,$t1,$0
	add $t1,$t3,$0
loop1: 
						#loop1 similar to loop
	div $t1,$t0
	add $t1,$0,$t0
	mfhi $t0
	beq $t0,$0,print_gcd
	j loop1
print_gcd:				
	li $v0,4		#prompt gcd
	la $a0,msg3
	syscall	
	li $v0,1		#print gcd
	move $a0,$t1
	syscall
	li $v0,4		#print new line
	la $a0,msg4
	syscall	

end:li $v0,10
	syscall
.data
msg1:
	.asciiz "Hello User, Enter A: \n"
msg2:	
	.asciiz "Hello User, Enter B: \n"
msg3:	
	.asciiz "GCD of A,B = "
msg4:
	.asciiz "\n"