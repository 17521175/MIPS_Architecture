.data
Sum: .word 0
i: .word 1
string1: .asciiz "Nhap N: \n"
string2: .asciiz "Sum: \n"
.text
main:
	lw $s0, Sum
	lw $s1, i
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, $zero
for:
	slt $t0, $2, $s1
	bne $t0, $zero, exit
	add $s0, $s0, $s1
	addi $s1, $s1, 1
	j for
exit:
	li $v0, 4
	la $a0, string2
	syscall
	add $a0, $s0, $zero
	li $v0, 1
	syscall
