.data

prompt: .asciiz "Enter iteration : "

newLine: .asciiz "\n"
newSpace: .asciiz " "
messageAandB: .asciiz "\nA B\n"
.text
main:
# prompt the user to enter iteration

li $v0, 4
la $a0, prompt
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

