# GroupID-65 (15114063_15114027) - Sandeep Pal & Gautam Choudhary
# Date: November 2, 2016
# gp_sum.asm The program takes input the first term, common ratio and number of terms of GP 
#			 and prints the SUM of GP
#
# Registers used:
# $a0 - syscall parameter.
# $v0 - syscall paramaeter and return value.
# $t0 - used to hold current 'term' of GP
# $t1 - used to hold current 'sum' of terms of GP
# $t2 - used to hold value of counter variable 'i'
# $t3 - used to hold number of terms of GP
# $t4 - used as hold Common Ratio of GP
#
# Memory Variables used:
# f   -	used to store First term of GP
# r   - used to store Common Ratio of GP
# n   - used to store Number of terms of GP
# sum - used to store SUM of terms of GP


.data
	ask_input_str1: .asciiz "Enter 'First' term of GP, f:   "
	ask_input_str2: .asciiz "Enter 'Common Ratio' of GP, r: "
	ask_input_str3: .asciiz "Enter the number of terms, n:  "
	tell_output_str: .asciiz "The sum of GP is: "

	f: .word 0		#First term of GP
	r: .word 0		#Common Ratio of GP
	n: .word 0		#Number of terms of GP
	sum: .word 0	#Initialize integer 'sum' with value 'zero'


.text
main: 
	#Prompts user to enter 'First' term of GP*****************************************************
	la  $a0, ask_input_str1							#loads the address of string to be printed in $a0
	li	$v0, 4									#system call code for printing string
	syscall										#system call
	#Takes input the 'First' term of GP
	li  $v0, 5		# $v0 = <user input>
	syscall
	#Store to memory
	sw $v0, f;		# f = $v0




	#Prompts user to enter 'Common Ratio' of GP***************************************************
	la  $a0, ask_input_str2							#loads the address of string to be printed in $a0
	li	$v0, 4									#system call code for printing string
	syscall										#system call
	#Takes input the 'Common Ratio' of GP
	li  $v0, 5		# $v0 = <user input>		#system call code for integer input
	syscall
	#Store to memory
	sw $v0, r;		# r = $v0
	



	#Prompts user to enter 'Number' of terms of GP************************************************
	la  $a0, ask_input_str3							#loads the address of string to be printed in $a0
	li	$v0, 4									#system call code for printing string
	syscall										#system call
	#Takes input the 'Number' of terms of GP
	li  $v0, 5		# $v0 = <user input>
	syscall
	#Store to memory
	sw $v0, n;		# n = $v0




	# Temporary variables
	lw $t0, f 	# ($t0 == term) = f
	li $t1, 0 	# ($t1 == sum) = 0
	li $t2, 0 	# ($t2 == i) = 0
	lw $t3, n 	# ($t3 == n)
	lw $t4, r 	# ($t4 == r)



	# LOOP Statement
	loop: beq $t2, $t3, end # if(i == n) jump to label 'end'
		add $t1, $t1, $t0 		# (sum = sum + term)
		mult $t0, $t4 			# (<product> = term * r)
		mflo $t0 				# (term = <product>)
		addi $t2, $t2, 1 		# (i++)
		j loop 				# jump to label 'loop'
	end:
		#Store result back to memory
		sw $t1, sum 		# (sum = $t1)

		#Prints the 'output_str' to Console
		li	$v0, 4
		la  $a0, tell_output_str
		syscall
		#Prints 'GP - Sum' to Console
		li 	$v0, 1
		move $a0, $t1
		syscall

		# Program exits
		li	$v0, 10
		syscall