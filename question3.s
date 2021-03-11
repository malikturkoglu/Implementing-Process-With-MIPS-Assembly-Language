	
.data  		  
buffer:   		.space 1024   
bufferSmaller:   .space 1024  
bufferReverse:   .space 1024 
prompt:   		.asciiz "Enter an input string: "
spaceChar: 		.asciiz " "  
newLine: 		.asciiz "\n"  
isPal: .asciiz " is palindrome. " 	
isNotPal: .asciiz " is not palindrome. " 	
		.text
		.globl main  

main:   li $v0, 4                
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
            	li $v0, 10  
		syscall
isPalindrome:
		#li $v0, 4    # Print the string  
		#la $a0, buffer
		#syscall 
		li $v0, 4                # system call for print_str
            	la $a0, isPal             # address of string to print
            	syscall   
            	li $v0, 10  
		syscall       	
