.data
	input_msg:	.asciiz"Please input a number: "
	yes_msg:	.asciiz"It's a prime"
	not_msg:	.asciiz"It's not a prime"

.text
.globl main

#n:$a0	i:$a1	
main:

li	$v0,4
la	$a0,input_msg	
syscall	

li	$v0,5
syscall
move	$a0,$v0
jal	prime
li	$a2,1
beq	$a2,$v0,Yes
li	$v0,4
la	$a0,not_msg
syscall
j	Exit

.text
prime:

addi	$sp,$sp,-8
sw	$ra,4($sp)
sw	$a0,0($sp)
addi	$t0,$zero,1
beq	$a0,$t0,L1
addi	$a1,$zero,2
jal	loop
lw	$ra,4($sp)
addi	$sp,$sp,8
addi	$v0,$zero,1
jr	$ra


L1: #return0
add	$v0,$zero,$zero
lw	$ra,4($sp)
jr	$ra

L2: #mod
div 	$a0,$a1
mfhi	$t2
addi	$a1,$a1,1
beq	$t2,$zero,L1
j 	loop

loop: #for loop
mul	$t0,$a1,$a1
slt	$t1,$a0,$t0
beq	$t1,$zero,L2
jr	$ra

Yes: #print it's a prime
li	$v0,4
la	$a0,yes_msg
syscall


Exit:
li	$v0,10
syscall

