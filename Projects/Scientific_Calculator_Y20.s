.text
.globl main
main:

    li $v0,4    	#prompt0
	la $a0,msg0		
	syscall

    li $v0,5		#Read function call input
	syscall 
	move $t6,$v0    #Taking t6 & t7 to eliminate confusion with t0 &t1

    li $v0,4    	#prompt1
	la $a0,msg1		
	syscall

	li $v0,5		#Read A
	syscall 
	move $t0,$v0
    ble $t0,$0,invalid  # if A<=0, print invalid

	li $v0,4		#prompt2
	la $a0,msg2
	syscall

	li $v0,5		#Read B
	syscall
	move $t1,$v0
    ble $t1,$0,invalid   # if B<=0, print invalid

    #function calls
    add $t7,$0,$0
    beq $t6,$t7, pow

    addi $t7,$t7,1
    beq $t6,$t7, log

    addi $t7,$t7,1
    beq $t6,$t7, gcd

    addi $t7,$t7,1
    beq $t6,$t7, lcm

    addi $t7,$t7,1
    beq $t6,$t7, root

    j invalid        # if invalid number entered

end:
	li $v0,4		 #prompt
	la $a0,msg_ty
	syscall

    li $v0,10
	syscall


invalid:
    li $v0,4		 #prompt
	la $a0,msg3
	syscall	
    j end

#--------------------------------------------------------------------------------------------

log:
    add $t3, $0,$0              # t3=0 as result variable
	bgt $t1,$t0,log_end2	        #if(B>A)go to end2
    addi $t4,$0,1               #t4==1
	beq $t1,$t4,log_end3            # b==1, invalid


log_loop: 
	div $t0,$t1			        #[hi,lo], lo <- t0 / t1      log_b(a) = log_b(a/b)+1;
    mflo $t0                    # t0 = t0/t1
	addi $t3, $t3, 1            # t3++
    ble $t0,$t4,print_log       # t0<=1
	j log_loop					# jump loop


print_log:				
	li $v0,4		#prompt 
	la $a0,msg_log1
	syscall	
	li $v0,1		#print log
	move $a0,$t3
	syscall
	li $v0,4		#print new line
	la $a0,msg4
	syscall	
    j end

log_end2:
    li $v0,4		#prompt
	la $a0,msg_log2
	syscall	
    j end


log_end3:
    li $v0,4		#prompt
	la $a0,msg3
	syscall	
    j end
#--------------------------------------------------------------------------------------------


gcd:	
	bgt $t0,$t1,main2_gcd	#if(B>A)go to main2
    j loop_gcd
loop_gcd: 
	
	div $t1,$t0			#gcd(A,B)=gcd(B,A%B)
	add $t1,$0,$t0
	mfhi $t0			#move A%B to t0
	beq $t0,$0,print_gcd	# if t0 ==0  print gcd
	j loop_gcd					# jump loop
main2_gcd: 
	add $t3,$t0,$0		# swap
	add $t0,$t1,$0
	add $t1,$t3,$0
loop1_gcd: 
						#loop1 similar to loop
	div $t1,$t0
	add $t1,$0,$t0
	mfhi $t0
	beq $t0,$0,print_gcd
	j loop1_gcd
print_gcd:				
	li $v0,4		#prompt gcd
	la $a0,msg_gcd1
	syscall	
	li $v0,1		#print gcd
	move $a0,$t1
	syscall
	li $v0,4		#print new line
	la $a0,msg4
	syscall	
    j end

#------------------------------------------------------------------------------------------------

lcm:
    add $t4,$0,$t0
    add $t5,$0,$t1
	bgt $t0,$t1,main2_lcm	#if(B>A)go to main2

loop_lcm: 
	
	div $t1,$t0			#gcd(A,B)=gcd(B,A%B)
	add $t1,$0,$t0
	mfhi $t0			#move A%B to t0
	beq $t0,$0,convert_lcm	# if t0 ==0  print gcd
	j loop_lcm					# jump loop
main2_lcm: 
	add $t3,$t0,$0		# swap
	add $t0,$t1,$0
	add $t1,$t3,$0
loop1_lcm: 
						#loop1 similar to loop
	div $t1,$t0
	add $t1,$0,$t0
	mfhi $t0
	beq $t0,$0,convert_lcm
	j loop1_lcm
convert_lcm: #lcm = a*b/gcd
    mul $t6,$t4,$t5
    div $t6,$t1
    mflo $t0
print_lcm:				
	li $v0,4		#prompt lcm
	la $a0,msg_lcm1
	syscall	
	li $v0,1		#print lcm
	move $a0,$t0
	syscall
	li $v0,4		#print new line
	la $a0,msg4
	syscall
    j end

#------------------------------------------------------------------------------------------------

pow:

	addi $t2, $t0, 0             # a raised to 1

    addi $t3, $0, 4999
    j pow_mod_a

pow_mod_a:						# using repeated substraction
    blt $t0, $t3, pow_loop		# to get a mod 4999
    addi $t0, $t0, -4999
    j pow_mod_a

pow_loop:
    beq $t1, 1, pow_exitloop    # repeated multiplication
    mul $t2, $t2, $t0			# to raise to power b
    addi $t1, $t1, -1
    bge $t2, $t3, pow_mod_ab	# need to take modulo of result
    j pow_loop

pow_mod_ab:						# taking modulo of result
    blt $t2, $t3, pow_loop		# same method as above
    addi $t2, $t2, -4999
    j pow_mod_ab

pow_exitloop:
    li $v0,4					# print output
    la $a0,msg_pow
    syscall

    li $v0, 1
    add $a0, $t2, 0
    syscall	

    j end   

#--------------------------------------------------------------------------------------------

root:

    addi $t2, $0, 1            # guess, starting with 1

    addi $t3, $t1, 0           # copy of b
    addi $t4, $t2, 0           # result, initiated to (guess)^1
    j raise_to_b			   

raise_to_b:					   # raise guess to b
    beq $t3, 1, raise_done  
    mul $t4, $t4, $t2		   # using repeated multiplication
    addi $t3, $t3, -1
    j raise_to_b

raise_done:					   
    addi $t5, $t0, 0
    bgt $t4, $t5, found			# checking if (guess)^b > a
    addi $t2, $t2, 1			# if not, increment guess and repeat
    addi $t3, $t1, 0
    addi $t4, $t2, 0
    j raise_to_b


found:							# print output
    addi $t2, $t2, -1
    li $v0,4                    
    la $a0,msg_root
    syscall

	li $v0, 1
    add $a0, $t2, 0
    syscall

    j end


#--------------------------------------------------------------------------------------------
.data
msg0:
	.asciiz "Scientific Calculator Y00010100\n
------------------------------------------------------------
Disclaimer : As MIPS registers store numbers in 32 bits,
the calculator might not give accurate results if at any
stage the numbers go above 32 bits. User discretion advised.
------------------------------------------------------------\n
            Please enter corresponding number for calling function\n
            press 0 : pow(a^b)\n
            press 1 : log_b(a)\n
            press 2 : gcd(a,b)\n
            press 3 : lcm(a,b)\n
            press 4 : root{a^(1/b})\n"
msg1:	
	.asciiz "Enter A: "
msg2:	
	.asciiz "Enter B: "
msg3:
    .asciiz "Invalid Input \n"
msg4:
	.asciiz "\n" 

msg_log1:	
	.asciiz "Log_B(A) = "
msg_log2:
    .asciiz "Log_B(A) = 0"

msg_gcd1:	
	.asciiz "GCD(A,B) = "

msg_lcm1:	
	.asciiz "LCM(A,B) = "

msg_root:
	.asciiz "A^(1/B) = "

msg_pow: 
	.asciiz "A^B = "

msg_ty:
	.asciiz "\n---------------Thank You---------------\n"

#add data labels here for your function

#------------------------------------------------------------------------------------------------