.data
	input_msg:	.asciiz"Please input a number: "
	result_msg:	.asciiz"The result of fibonacci(n) is: "
.text

.globl main

main:

li	$v0,4
la	$a0,input_msg
syscall

li	$v0,5
syscall
move	$a0,$v0			#$a0=n
li	$s3,1
li	$v1,0
jal fibonacci

li 	$v0,4
la	$a0,result_msg
syscall
li	$v0,1
move	$a0,$v1
addi	$a0,$a0,10
syscall

j	Exit


.text

fibonacci:
addi	$sp,$sp,-12
sw	$ra,8($sp)
jal	if
lw	$a0,0($sp)
add	$v1,$v1,$a0
lw	$a0,4($sp)
add	$v1,$v1,$a0
lw	$ra,8($sp)
addi	$sp,$sp,12
jr	$ra

if:

beq	$a0,$zero,R0
beq	$a0,$s3,R1
add	$a0,$a0,-1
sw	$a0,4($sp)
add	$a0,$a0,-1
sw	$a0,0($sp)
j	fibonacci



R0:

li	$v1,0
jr	$ra

R1:

li	$v1,1
jr	$ra

Exit:

li	$v0,10
syscall

