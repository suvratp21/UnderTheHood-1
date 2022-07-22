.data
in1: .asciiz "Enter the value of N = "
out: .asciiz "The Nth term in fibonacci sequence = "
re : .asciiz "To continue press 1 else press 0 = "
end: .asciiz "-----Program ended------\n"
nl : .asciiz "\n"

.text

main:
	li $v0, 4
	la $a0, in1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	addi $t2, $0, 0                        #t2 is the term of the series
	
	beq $t0, $0, EXIT                      #checking if the N was 0 then just go to EXIT

	addi $t2, $t2, 1                       #manually making the second fibonacci number as 1

	addi $t1, $0, 0                        #t1 = previous term of the series

        beq $t0, 1, EXIT                      #checking if the N was 1 then just go to EXIT

        

	LOOP:
		addi $t0, $t0, -1                  #loop condition
		beq $t0, $0, EXIT

		move $t3, $t2                      #storing temporary value of the current term so that we can assign it to previous term later

		add $t2, $t1, $t2

		move $t1, $t3

		j LOOP



	EXIT:
		li $v0, 4
		la $a0, out
		syscall

		li $v0, 1
		move $a0, $t2
		syscall

		li $v0, 4
		la $a0, nl
		syscall

		li $v0, 4
		la $a0, re
		syscall

		li $v0, 5
		syscall
		move $t4, $v0

		bne $t4, $0, main
                
                li $v0, 4
		la $a0, end
		syscall

		li $v0, 10
		syscall