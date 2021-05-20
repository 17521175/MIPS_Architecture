.data
string1: .asciiz "Nhap so thu 1: "
string2: .asciiz "Nhap so thu 2: "
string3: .asciiz "\n So lon hon: "
string4: .asciiz "\n Tong: "
string5: .asciiz "\n Hieu: "
string6: .asciiz "\n Tich: "
string7: .asciiz "\n Thuong: "
.text
main:
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, $zero
compare:
	li $v0, 4
	la $a0, string3
	syscall
	slt $t0, $s0, $s1
	bne $t0, $zero, else
	add $a0, $s0, $zero
	li $v0, 1
	syscall
	j sum
else:
	add $a0, $s1, $zero
	li $v0, 1
	syscall
sum:
	add $t0, $s0, $s1
	li $v0, 4
	la $a0, string4
	syscall
	add $a0, $t0, $zero
	li $v0, 1
	syscall
sub:
	sub $t0, $s0, $s1
	li $v0, 4
	la $a0, string5
	syscall
	add $a0, $t0, $zero
	li $v0, 1
	syscall
mul:
	mul $t0, $s0, $s1
	li $v0, 4
	la $a0, string6
	syscall
	add $a0, $t0, $zero
	li $v0, 1
	syscall
div:
	div $s0, $s1
	mflo $t0
	li $v0, 4
	la $a0, string7
	syscall
	add $a0, $t0, $zero
	li $v0, 1
	syscall
