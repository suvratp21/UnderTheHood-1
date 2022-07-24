.data
start: .asciiz "\n                                     DATE CONVERTER!\n\n\n      Instructions\n\n1.  You have to Enter the Date, Month and then Year of the Day you want to be converted.\n\n2.  Then you have to choose between 5 available formats.\n\n3.  Then, if you want to know the weekday of that date, then enter 1!\n\n\n                                     Let's Start!\n\n"
in1: .asciiz "Enter the Date: "
in2: .asciiz "Enter the Month: "
in3: .asciiz "Enter the Year: "
p1: .asciiz "Please enter a number corresponding to the format you want your input in(like 1 for first format, 2 for second, etc.)\n1: DD/MM/YYYY\n2: MM/DD/YYYY\n3: DD/MM/'YY\n4: MM/DD/'YY\n5: Date(in numbers) Month(in words) Year(in numbers)\n"
JAN1: .asciiz "January"
FEB1: .asciiz "February"
MAR1: .asciiz "March"
APR1: .asciiz "April"
MAY1: .asciiz "May"
JUN1: .asciiz "June"
JUL1: .asciiz "July"
AUG1: .asciiz "August"
SEP1: .asciiz "September"
OCT1: .asciiz "October"
NOV1: .asciiz "November"
DEC1: .asciiz "December"
cont: .asciiz "Enter 1 to restart else enter 0: "
er: .asciiz "Invalid Date\n"
nl: .asciiz "\n"

space: .asciiz " "
slash: .asciiz "/"
apostrophe: .asciiz "'"

p2: .asciiz "Do you want to know what day was on that date, then press 1 else 0: "

MON1: .asciiz "Monday\n"
TUE1: .asciiz "Tuesday\n"
WED1: .asciiz "Wednesday\n"
THU1: .asciiz "Thursday\n"
FRI1: .asciiz "Friday\n"
SAT1: .asciiz "Saturday\n"
SUN1: .asciiz "Sunday\n"

months: .word 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

.text


main:

	li $v0, 4
	la $a0, start
	syscall

RESTART:
	li $t5, 1
	li $t6, 1
	li $t7, 1970

	li $v0, 4
	la $a0, in1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, in2
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	li $v0, 4
	la $a0, in3
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	li $t4, 13
	div $t2, $t4
	mflo $t3
	bne $t3, $0, ERR

	li $t4, 32
	div $t0, $t4
	mflo $t3
	bne $t3, $0, ERR

	li $t4, 10000
	div $t1, $t4
	mflo $t3
	bne $t3, $0, ERR

	li $v0, 4
	la $a0, p1
	syscall

	li $v0, 5
	syscall
	move $t4, $v0

	addi $t4, $t4, -1
	beq $t4, $0, FORMAT1

	addi $t4, $t4, -1
	beq $t4, $0, FORMAT2

	addi $t4, $t4, -1
	beq $t4, $0, FORMAT3

	addi $t4, $t4, -1
	beq $t4, $0, FORMAT4

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, space
	syscall

	li $t3, 1
	beq $t2, $t3, JAN

	li $t3, 2
	beq $t2, $t3, FEB

	li $t3, 3
	beq $t2, $t3, MAR

	li $t3, 4
	beq $t2, $t3, APR

	li $t3, 5
	beq $t2, $t3, MAY

	li $t3, 6
	beq $t2, $t3, JUN

	li $t3, 7
	beq $t2, $t3, JUL

	li $t3, 8
	beq $t2, $t3, AUG

	li $t3, 9
	beq $t2, $t3, SEP

	li $t3, 10
	beq $t2, $t3, OCT

	li $t3, 11
	beq $t2, $t3, NOV

	li $t3, 12
	beq $t2, $t3, DEC



	
	JAN:

		la $a0, JAN1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2


	FEB:

		la $a0, FEB1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2

	MAR:

		la $a0, MAR1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	
	APR:

		la $a0, APR1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	
	MAY:

		la $a0, MAY1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	
	JUN:

		la $a0, JUN1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	
	JUL:

		la $a0, JUL1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	
	AUG:

		la $a0, AUG1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	

	SEP:

		la $a0, SEP1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	
	OCT:

		la $a0, OCT1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	
	NOV:

		la $a0, NOV1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2
	
	DEC:

		la $a0, DEC1
		li $v0, 4
		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		move $a0, $t1
		syscall

		j P2


FORMAT4:
	
	li $t4, 10
	div $t2, $t4
	mflo $t3

	beq $t3, 0, M0F4

	li $v0, 1
	move $a0, $t2
	syscall

	j MDONEF4

	M0F4:
		li $v0, 1
		move $a0, $t3
		syscall

		li $v0, 1
		move $a0, $t2
		syscall

	MDONEF4:

		li $v0, 4
		la $a0, slash
		syscall

		div $t0, $t4
		mflo $t3

		beq $t3, 0, D0F4

		li $v0, 1
		move $a0, $t0
		syscall

		j DDONEF4

		D0F4:

			li $v0, 1
			move $a0, $t3
			syscall

			li $v0, 1
			move $a0, $t0
			syscall

		DDONEF4:

			li $v0, 4
			la $a0, slash
			syscall

			li $v0, 4
			la $a0, apostrophe
			syscall

			li $t4, 100
			div $t1, $t4
			mfhi $t3

			li $v0, 1
			move $a0, $t3
			syscall

			j P2

FORMAT3:

	li $t4, 10
	div $t0, $t4
	mflo $t3

	beq $t3, 0, D0F3

	li $v0, 1
	move $a0, $t0
	syscall

	j DDONEF3

	D0F3:
		li $v0, 1
		move $a0, $t3
		syscall

		li $v0, 1
		move $a0, $t0
		syscall

	DDONEF3:

		li $v0, 4
		la $a0, slash
		syscall

		div $t2, $t4
		mflo $t3

		beq $t3, 0, M0F3

		li $v0, 1
		move $a0, $t2
		syscall

		j MDONEF3

		M0F3:

			li $v0, 1
			move $a0, $t3
			syscall

			li $v0, 1
			move $a0, $t2
			syscall

		MDONEF3:

			li $v0, 4
			la $a0, slash
			syscall

			li $v0, 4
			la $a0, apostrophe
			syscall

			li $t4, 100
			div $t1, $t4
			mfhi $t3

			li $v0, 1
			move $a0, $t3
			syscall

			j P2

FORMAT2:

	li $t4, 10
	div $t2, $t4
	mflo $t3

	beq $t3, 0, M0F2

	li $v0, 1
	move $a0, $t2
	syscall

	j MDONEF2

	M0F2:
		li $v0, 1
		move $a0, $t3
		syscall

		li $v0, 1
		move $a0, $t2
		syscall

	MDONEF2:

		li $v0, 4
		la $a0, slash
		syscall

		div $t0, $t4
		mflo $t3

		beq $t3, 0, D0F2

		li $v0, 1
		move $a0, $t0
		syscall

		j DDONEF2

		D0F2:

			li $v0, 1
			move $a0, $t3
			syscall

			li $v0, 1
			move $a0, $t0
			syscall

		DDONEF2:

			li $v0, 4
			la $a0, slash
			syscall

			li $v0, 1
			move $a0, $t1
			syscall

			j P2

FORMAT1:

	li $t4, 10
	div $t0, $t4
	mflo $t3

	beq $t3, 0, D0F1

	li $v0, 1
	move $a0, $t0
	syscall

	j DDONEF1

	D0F1:
		li $v0, 1
		move $a0, $t3
		syscall

		li $v0, 1
		move $a0, $t0
		syscall

	DDONEF1:

		li $v0, 4
		la $a0, slash
		syscall

		div $t2, $t4
		mflo $t3

		beq $t3, 0, M0F1

		li $v0, 1
		move $a0, $t2
		syscall

		j MDONEF1

		M0F1:

			li $v0, 1
			move $a0, $t3
			syscall

			li $v0, 1
			move $a0, $t2
			syscall

		MDONEF1:

			li $v0, 4
			la $a0, slash
			syscall

			li $v0, 1
			move $a0, $t1
			syscall

			j P2

P2:

		la $a0, nl
		li $v0, 4
		syscall


		la $a0, p2
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		move $t3, $v0

		beq $t3, $0, END

		addi $t9, $0, 0

		LOOP:
   			
   			beq $t7, $t1, EQUAL1
   			slt $t8, $t7, $t1
   			beq $t8, $0, SMALLER
   			j GREATER

   			EQUAL1:

   				beq $t6, $t2, EQUAL2
	   			slt $t8, $t6, $t2
	   			beq $t8, $0, SMALLER
	   			j GREATER

   			EQUAL2:

   				beq $t5, $t0, EXIT
	   			slt $t8, $t5, $t0
	   			beq $t8, $0, SMALLER
	   			j GREATER

	   		YEARADDER2:

	   			li $t3, 3

	   			slt $t4, $t2, $t3
	   			bne $t4, $0, FEBAHEAD1

	   			FEBBEHIND1:

	   				addi $t1, $t1, 1
	   				addi $t3, $0, 400
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, YES2

					addi $t3, $0, 100
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, NO2

					addi $t3, $0, 4
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, YES2

					NO2:
						addi $t9, $t9, 365
						j LOOP

					YES2:
						addi $t9, $t9, 366
						j LOOP

				FEBAHEAD1:

					addi $t3, $0, 400
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, YES3

					addi $t3, $0, 100
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, NO3

					addi $t3, $0, 4
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, YES3

					NO3:
						addi $t1, $t1, 1
						addi $t9, $t9, 365
						j LOOP

					YES3:
						addi $t1, $t1, 1
						addi $t9, $t9, 366
						j LOOP

			YEARADDER1:

					addi $t3, $0, 400
					div $t7, $t3
					mfhi $t4
					beq $t4, $0, YES4

					addi $t3, $0, 100
					div $t7, $t3
					mfhi $t4
					beq $t4, $0, NO4

					addi $t3, $0, 4
					div $t7, $t3
					mfhi $t4
					beq $t4, $0, YES4

					NO4:
						addi $t7, $t7, 1
						addi $t9, $t9, 365
						j LOOP

					YES4:
						addi $t7, $t7, 1
						addi $t9, $t9, 366
						j LOOP

			GREATER:

				li $s0, 0
				li $t8, 1
				sub $t3, $t1, $t7
				slt $t4, $t8, $t3
				bne $t4, $0, YEARADDER1


				addi $t5, 1
				addi $t9, 1
				addi $t3, $0, 2
				beq $t3, $t6, LEAP1
				la $t3, months
				sll $t4, $t6, 2

				addi $t4, $t4, -4

				add $t3, $t3, $t4

				lw $t4, 0($t3)

				slt $t3, $t4, $t5

				bne $t3, $0, MCHANGED1

				j LOOP

				MCHANGED1:

					addi $t6, $t6, 1
					addi $t5, $0, 1
					addi $t4, $0, 12

					slt $t3, $t4, $t6

					bne $t3, $0, YCHANGED1

					j LOOP

				YCHANGED1:

					addi $t7, $t7, 1
					addi $t6, $0, 1

					j LOOP

				LEAP1:

					addi $t3, $0, 400
					div $t7, $t3
					mfhi $t4
					beq $t4, $0, YES1

					addi $t3, $0, 100
					div $t7, $t3
					mfhi $t4
					beq $t4, $0, NO1

					addi $t3, $0, 4
					div $t7, $t3
					mfhi $t4
					beq $t4, $0, YES1

					NO1:
						addi $t4, $0, 28
						slt $t3, $t4, $t5
						bne $t3, $0, MCHANGED1

						j LOOP

					YES1:
						addi $t4, $0, 29
						slt $t3, $t4, $t5
						bne $t3, $0, MCHANGED1

						j LOOP


			SMALLER:
				li $s0, 1

				li $t8, 1
				sub $t3, $t7, $t1
				slt $t4, $t8, $t3
				bne $t4, $0, YEARADDER2

				
				addi $t0, 1
				addi $t9, 1
				addi $t3, $0, 2
				beq $t3, $t2, LEAP
				la $t3, months
				sll $t4, $t2, 2

				addi $t4, $t4, -4

				add $t3, $t3, $t4

				lw $t4, 0($t3)

				slt $t3, $t4, $t0

				bne $t3, $0, MCHANGED

				j LOOP

				MCHANGED:

					addi $t2, $t2, 1
					addi $t0, $0, 1
					addi $t4, $0, 12

					slt $t3, $t4, $t2

					bne $t3, $0, YCHANGED

					j LOOP

				YCHANGED:

					addi $t1, $t1, 1
					addi $t2, $0, 1

					j LOOP

				LEAP:

					addi $t3, $0, 400
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, YES

					addi $t3, $0, 100
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, NO

					addi $t3, $0, 4
					div $t1, $t3
					mfhi $t4
					beq $t4, $0, YES

					NO:
						addi $t4, $0, 28
						slt $t3, $t4, $t0
						bne $t3, $0, MCHANGED

						j LOOP

					YES:
						addi $t4, $0, 29
						slt $t3, $t4, $t0
						bne $t3, $0, MCHANGED

						j LOOP

		
		EXIT:

			addi $t3, $0, 7

			beq $s0, $0, FOR_GREATER

			addi $t9, $t9, -1
			div $t9, $t3
			mfhi $t4

			li $t3, 6
			sub $t4, $t3, $t4
			j PRINTDAY

			FOR_GREATER:

			div $t9, $t3
			mfhi $t4

			PRINTDAY:

			addi $t3, $0, 0
			beq $t4, $t3, THU

			addi $t3, $0, 1
			beq $t4, $t3, FRI
			
			addi $t3, $0, 2
			beq $t4, $t3, SAT
			
			addi $t3, $0, 3
			beq $t4, $t3, SUN
			
			addi $t3, $0, 4
			beq $t4, $t3, MON
			
			addi $t3, $0, 5
			beq $t4, $t3, TUE
			
			addi $t3, $0, 6
			beq $t4, $t3, WED

			j END

			MON:

				la $a0, MON1
				li $v0, 4
				syscall
				j END

			TUE:

				la $a0, TUE1
				li $v0, 4
				syscall
				j END

			WED:

				la $a0, WED1
				li $v0, 4
				syscall
				j END

			THU:

				la $a0, THU1
				li $v0, 4
				syscall
				j END

			FRI:

				la $a0, FRI1
				li $v0, 4
				syscall
				j END

			SAT:

				la $a0, SAT1
				li $v0, 4
				syscall
				j END

			SUN:

				la $a0, SUN1
				li $v0, 4
				syscall
				j END

		ERR:

		la $a0, er
		li $v0, 4
		syscall

		END:

		
		la $a0, cont
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		move $t4, $v0

		bne $t4, $0, NLines
	
		li $v0, 10
		syscall

		NLines:

			li $v0, 4
			la $a0, nl
			syscall

			li $v0, 4
			la $a0, nl
			syscall

			li $v0, 4
			la $a0, nl
			syscall

			j RESTART