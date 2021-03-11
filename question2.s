.data  		  
buffer:   		.space 1024   
bufferInt:   .space 1024 
.align 2
buffer2:   		.space 1024   
bufferInt2:   .space 1024 
.align 2
promptFirst:   		.asciiz "Enter the first matrix:  "
promptSecond:   		.asciiz "Enter the second matrix: "
prompt3:   		.asciiz "Enter the first dimension of first matrix: "
prompt4:   		.asciiz "Enter the second dimension of first matrix:  "

spaceChar: 		.asciiz " "  
newLine: 		.asciiz "\n"  
newSpace: .asciiz " "

		.text
		.globl main  

main:   li $v0, 4                
        la $a0, promptFirst          	# print the prompt string   
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
		 		
	la $s0, bufferInt		# s0=&bufferInt
	add $t4, $0, $0
	
	
	li $s2, 0

	
		li $s5, 0
		li $t8,0
		li $t9,10
		addi $s6,$s2,-1
		
reverseOfString:

		beq $s3,0x20,regAta
		lb $s3, buffer($s5)
		addi $t5,$s3,-48 # þuan t5'de stringin sayý deðeri var
		addi $s5,$s5,1
		add $t2,$t2,$t5 ## t2de toplam sayý deðeri var þuan
		lb $s3, buffer($s5)#bu bir sonrakine bakýyor boþluk deðilse t5'i 10ile çarpacak
		beq $s3, $t7,regAta
		bne $s3,0x20,carpim
		j reverseOfString
	
carpim:
		mult $t2,$t9
		mflo $t2
		#addi $s3,$s3,-48
		#add $t2,$t2,$s3
		j reverseOfString	
	
regAta: ##boþluðu görünce buraya geliyor ve boþluktan sonraya sýfýrdan baþlýyor
		#s0 bufferint adresini tutuyor
		
		
		sw $t2, 0($s0) #t2 her zaman son deðerim
		addi $s0,$s0,4 
		beq $s3, $t7,end1 #new line karakteriyse
		and $t2,$t2,$zero#registera yazdýktan sonra t2yi sýfýrlýyorum
		addi $s5,$s5,1 ##boþluðu geçsin diye
		lb $s3, buffer($s5)##boþluktan sonrakþ deðeri þuan s3'e yazdým
		
		j reverseOfString	
	
	
end1:

and $t5,$t5,$zero
and $t2,$t2,$zero
li $v0, 4                
        la $a0, promptSecond          	# print the prompt string   
        syscall
		
	la $t0, buffer2 				# t0=&buffer
        la $t1, spaceChar 			#t1=&spaceChar
        lb $t1, 0($t1) 				#t1=" "
        la $t7, newLine 			#t7=&newLine
        lb $t7, 0($t7) 				#t7="\n"
  
	li $v0,8 					# string read system code
        la $a0, buffer2 				# address for string reading	
        li $a1, 100 				# string input limit
        syscall						# read string
		 		
	la $s0, bufferInt2		# s0=&bufferReverse
	add $t4, $0, $0
	
	
	li $s2, 0

	
		li $s5, 0
		li $t8,0
		li $t6,0
		li $t9,10
		addi $s6,$s2,-1
		
reverseOfString2:

		beq $s3,0x20,regAta2
		lb $s3, buffer2($s5)
		addi $t5,$s3,-48 # þuan t5'de stringin sayý deðeri var
		addi $s5,$s5,1
		add $t2,$t2,$t5 ## t2de toplam sayý deðeri var þuan
		lb $s3, buffer2($s5)#bu bir sonrakine bakýyor boþluk deðilse t5'i 10ile çarpacak
		beq $s3, $t7,regAta2
		bne $s3,0x20,carpim2
		j reverseOfString2
	
carpim2:
		mult $t2,$t9
		mflo $t2
		j reverseOfString2	
	
regAta2: ##boþluðu görünce buraya geliyor ve boþluktan sonraya sýfýrdan baþlýyor
		#s0 bufferint adresini tutuyor
		
		
		sw $t2, 0($s0) #t2 her zaman son deðerim
		addi $t6,$t6,1
		addi $s0,$s0,4 
		beq $s3, $t7,end2 #new line karakteriyse
		and $t2,$t2,$zero#registera yazdýktan sonra t2yi sýfýrlýyorum
		addi $s5,$s5,1 ##boþluðu geçsin diye
		lb $s3, buffer2($s5)##boþluktan sonrakþ deðeri þuan s3'e yazdým
		
		j reverseOfString2

end2:


addi $t1, $zero,0
addi $t2, $zero,0
addi $t3, $zero,0
addi $s1, $zero,0
addi $s2, $zero,0
addi $s3, $zero,0

		li $v0, 4                
        la $a0, prompt3          	# print the prompt string   
        syscall

        li $v0, 5                # system call for read_int
		syscall
		addu $s1,$v0,$0
		
		li $v0, 4   
		la $a0, prompt4          	# print the prompt string   
        syscall

        li $v0, 5                # system call for read_int
		syscall
		addu $s3,$v0,$0


div $t6, $s3 ##for s2
mflo $s2



while1:                   #loop1
beq $t1,$s1,exit1

         while2:                     #loop2
         beq $t2, $s2, exit2
         addi $s0,$zero,0           #sum
                                                          while3:                                    #loop3
                                                          beq $t3, $s3,exit3       
                                                          
                                                          mul $t5,$t1,$s3
                                                          add $t5,$t5,$t3
                                                          sll $t5, $t5,2
                                                          lw $t5, bufferInt($t5)
                                                         
                                                          
                                                          mul $t6, $t3,$s2
                                                          add $t6, $t6, $t2
                                                          sll $t6,$t6,2
                                                          lw $t6 , bufferInt2($t6)
                                                             
                                                          mul $t7, $t5, $t6
                                                          add $s0, $s0,$t7
                                                          
                                                          
                                                          addi $t3, $t3, 1
                                                          j while3
                                                          
                                                          exit3:
                                                          
                                                           li $v0,1
                                                          move $a0, $s0
                                                          syscall
                                                          
                                                          li $v0, 4                 # space             
                                                          la $a0, newSpace
                                                          syscall
                                                          
                                                          
                                                          
           addi $t3, $zero, 0
           addi $t2, $t2,1

           
           j while2
           exit2:
           
li $v0, 4                               #next line
la $a0, newLine
syscall
           
addi $t2, $zero, 0
addi $t1, $t1, 1

j while1
exit1:

		li $v0, 10 #program done: terminating
		syscall

	
	
	
	
	
	
