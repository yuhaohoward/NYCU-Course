.data
	input_msg:	.asciiz"Please enter option (1:triangle,2:inverted triangle): "
	size_msg:	.asciiz"Please input triangle size: "
	blank_msg:	.asciiz" "
	star_msg:	.asciiz"*"
	enter_msg:	.asciiz"\n"
.text

.globl main

main:

li $v0,4
la $a0,input_msg
syscall
li $v0,5
syscall
move $s0,$v0	#store op to $s0

li $v0,4
la $a0,size_msg
syscall
li $v0,5
syscall
move $a1,$v0	#store n to $a1
li $s1,0	#set $s1=i=0
jal loop1
j	Exit


.text

loop1:
addi $sp,$sp,-4
sw $ra,0($sp)
slt $t0,$s1,$a1
li $s2,1		#s2=j=1
bne $t0,$zero,IF
jr	$ra


IF:
li 	$a2,0		#a2=l=0
li 	$t1,1
beq 	$s0,$t1,TRI
addi	$t4,$s1,1
add	$t4,$a1,$t4
move	$a2,$t4
j	Layer1


TRI:
move	$a2,$s1
j	Layer1



Layer1:

sub	$t2,$a1,$a2	#t2=n-l
slt	$t3,$s2,$t2
bne	$t3,$zero,L1
j	Layer2

L1:

li	$v0,4
la	$a0,blank_msg
syscall
addi	$s2,$s2,1
j	Layer1


Layer2:

move	$s2,$t2
add	$t2,$a1,$a2
slt	$t3,$t2,$s2
beq	$t3,$zero,L2
li	$v0,4
la	$a0,enter_msg
syscall
addi	$s1,$s1,1
j	loop1


L2:

li	$v0,4
la	$a0,star_msg
syscall
addi	$s2,$s2,1
j	Layer2

Exit:

li	$v0,10
syscall







