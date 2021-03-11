.data

# menu and question1
messageIntro:  .asciiz "Welcome to our MIPS project! \nMain  Menu: \n1.Square Root Approximate \n2.Matrix Multiplication \n3.Palindrome \n4.Exit\nPlease select an option:  "
promptQuestion1: .asciiz "Enter iteration : "
newLine: .asciiz "\n"
newSpace: .asciiz " "
messageAandB: .asciiz "\nA B\n"
messageExit: .asciiz "\nProgram ends. Bye :) "

# question-3
buffer:   		.space 1024   
bufferSmaller:   .space 1024  
bufferReverse:   .space 1024 
prompt:   		.asciiz "Enter an input string: "
spaceChar: 		.asciiz " "  
isPal: .asciiz " is palindrome. \n" 	
isNotPal: .asciiz " is not palindrome. \n" 

.text
main:
addi $s0,$zero,0

whileMenu:

return:
beq $s0,1,exitMenu
li $v0,4
la $a0, messageIntro             # message of intro
syscall

li $v0, 5        # get the iteration number
syscall

move $t0, $v0   #store the result in $t0


beq $t0,1,question1

beq $t0,3,question3

beq $t0,4,finishLoop




j whileMenu
exitMenu:

li $v0,10              # exit
syscall


                                                                                finishLoop:     # exit state, pressed 4
add $s0, $zero,1
li $v0,4
la $a0, messageExit            # message of exit
syscall
j return

                                                                             question1:     #question1
# prompt the user to enter iteration

li $v0, 4
la $a0, promptQuestion1
syscall

# get the iteration number

li $v0, 5
syscall

#store the result in $t0
move $t0, $v0

addi $t1,$zero,1    # a = 1
addi $t2,$zero,1    # b = 1

li $v0, 4
la $a0, messageAandB   # message of A and B
syscall

addi $t5, $zero, 0

while:
beq $t5, $t0,exit

li $v0,1
move $a0, $t1
syscall



li $v0, 4                 # space             
la $a0, newSpace
syscall

li $v0,1
move $a0, $t2
syscall



add $t3, $t1, $zero      # old_a = a
sll $t4 , $t2, 1   # t4 = 2b
add $t1, $t1, $t4       # a = a + 2b
add $t2, $t2, $t3      # b = old_a + b

li $v0, 4                               #next line
la $a0, newLine
syscall

addi $t5,$t5,1
j while

exit:

j return


                                                                             question3:    # question3

li $v0, 4                
        la $a0, prompt          	# print the prompt string   
        syscall
		
		la $t0, buffer 				# t0=&buffer
        la $t1, spaceChar 			#t1=&spaceChar
        lb $t1, 0($t1) 				#t1=" "
        la $t7, newLine 			#t7=&newLine
        lb $t7, 0($t7) 				#t7="\n"
  
		li $v0,8 					# string read system code
        la $a0, buffer 				# address for string reading	
        li $a1, 100 				# string input limit
        syscall						# read string
		 		
		la $t3, bufferSmaller 		# t3=&bufferNumber
		la $s0, bufferReverse		# s0=&bufferReverse
		add $t4, $0, $0

		
		
Loop:	lb $t2, 0($t0)  			# t2=[t0]
		beq $t2, $t7, end
		add $t0, $t0, 1 			# t0++
		ori $t4,$t2,0x20
		sb $t4,0($t3)
		add $t3,$t3,1
	
		j Loop  
end:    
		##BU NOKTADAN SONRA ELÄ°MDE ;
		# t0 inputun kendisi buffer 
		# t7 bufferSmaller lower caseye dÃ¶nÃ¼ÅŸtÃ¼rÃ¼lmÃ¼ÅŸ hali var
		
		li $s2, 0
lengthString:
		lb $s1, bufferSmaller($s2)
		add $s2,$s2,1
		bne $s1,$zero,lengthString
		
		
		
		##Å?UAN S2'DE STRÄ°NGÄ°N UZUNULUÄ?UNUN 1 FAZLASINI TUTUYORUZ

		li $s5, 0
		li $s6, 0
		li $s7, 0
		addi $s6,$s2,-1
reverseOfString:
		lb $s3, bufferSmaller($s5)
		addi $s5,$s5,1
		sub $s7,$s6,$s5
		sb $s3, bufferReverse($s7)
		bgtz  $s7, reverseOfString

		##BU NOKTADA REVERSEOFSTRÝNG DE STRÝNGÝN TERSÝ VAR 
		addi $s6,$s6,-1
		addi $s1,$s6,0
		li $s7,0
testPalindrome:
		lb $s3, bufferSmaller($s7)
		lb $s4, bufferReverse($s7)
		addi $s7,$s7,1
		addi $s1,$s1,-1
		bne $s3,$s4, notPalindrome
		beq $s1,$zero,isPalindrome
		slt $t5,$s7,$s6
		bne $t5,$zero,testPalindrome



notPalindrome:
		#li $v0, 4    # Print the string  
		#la $a0, buffer
		#syscall 
		li $v0, 4                # system call for print_str
            	la $a0, isNotPal             # address of string to print
            	syscall
            	
            	j return   
isPalindrome:
		#li $v0, 4    # Print the string  
		#la $a0, buffer
		#syscall 
		li $v0, 4                # system call for print_str
            	la $a0, isPal             # address of string to print
            	syscall 
            	
j return            	  
            	   


