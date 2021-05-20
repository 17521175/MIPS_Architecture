.data
string1: .asciiz "Nhap i: \n"
string2: .asciiz "Nhap j: \n"
string3: .asciiz "Nhap g: \n"
string4: .asciiz "Nhap h: \n"
string5: .asciiz "Ket qua f: \n"
.text
main:
	li $v0, 4
	la $a0, string1
	syscall 
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	li $v0, 4
	la $a0, string3
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	li $v0, 4
	la $a0, string4
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, $zero
	bne $t0, $t1, else
	add $s0, $t2, $t3
	li $v0, 4
	la $a0, string5
	syscall
	add $a0, $s0, $zero
	li $v0, 1
	syscall
	j exit
	
else :	sub $s0, $t2, $t3
	li $v0, 4
	la $a0, string5
	syscall
	add $a0, $s0, $zero
	li $v0, 1
	syscall
exit:
