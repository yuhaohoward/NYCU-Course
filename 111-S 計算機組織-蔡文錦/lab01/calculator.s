.data
	input_msg:	.asciiz"Please enter option (1:add,2:sub,3:mul): "
	frist_msg:	.asciiz"Please enter the frist number: "
	second_msg:	.asciiz"Please enter the second number: "
	result_msg:	.asciiz"The calculation result is: "
.text
.globl	main

main:

li $v0,4
la $a0,input_msg
syscall

li $v0,5
syscall
move $a1,$v0

li $v0,4
la $a0,frist_msg
syscall

li $v0,5
syscall
move $a2,$v0

li $v0,4
la $a0,second_msg
syscall

li $v0,5
syscall
move $a3,$v0

li $t0,1
li $t1,2
li $t2,3

beq $a1,$t0,ADD
beq $a1,$t1,SUB
beq $a1,$t2,MUL

.text
ADD:

add $s0,$a2,$a3
j	Exit

SUB:

sub $s0,$a2,$a3
j	Exit

MUL:

mul $s0,$a2,$a3
j	Exit

Exit:

li $v0,4
la $a0,result_msg
syscall

li $v0,1
move $a0,$s0
syscall

li $v0,10
syscall


