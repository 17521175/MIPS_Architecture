# Trong bảng mã ASCII có từ [0x00; 0x77] (127 phần tử) trong đó:
# Số bắt đầu từ [0x30;0x39] -> [0;9]
# Chữ HOA bắt đầu từ [0x41;0x5A] -> [A;Z]
# Chữ thường bắt đầu từ [0x61;0x7A] -> [a;z]
.data
string1: .asciiz "\n Xin moi ban nhap ki tu: "
string2: .asciiz "\n Ki tu nay la so. "
string2.1: .asciiz "\n Ki tu nay la chu thuong. "
string2.2: .asciiz "\n Ki tu nay chu in hoa. "
string3: .asciiz "\n Ki tu truoc la: "
string4: .asciiz "\n Ki tu sau la: "
string5: .asciiz "khong hop le. "
string: .asciiz "\n Ki tu nay khong hop le. "
.text
main:
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 12
	syscall
	add $s0, $v0, $zero   #luu ki tu vua nhap vao $s0

lowercase:
	addi $s1, $zero, 0x61
	slt $t0, $s0, $s1
	bne $t0, $zero, uppercase
	li $v0, 4
	la $a0, string2.1
	syscall
	addi $s2, $zero, 0x7A
	slt $t0, $s2, $s0
	bne $t0, $zero, err
	subi $t0, $s0, 1
	addi $t1, $s0, 1
	li $v0, 4
	la $a0, string3
	syscall
	beq $t0, 0x60, lowercase_check
	la $a0, ($t0)
	li $v0, 11
	syscall
	j next_lowercase
lowercase_check:
	li $v0,4
	la $a0, string5
	syscall
next_lowercase:
	li $v0, 4
	la $a0, string4
	syscall
	beq $t1, 0x7B, lowercase_check
	la $a0, ($t1)
	li $v0, 11
	syscall
	j exit
uppercase:
	addi $s1, $zero, 0x41
	slt $t0, $s0, $s1
	bne $t0, $zero, number
	li $v0, 4
	la $a0, string2.2
	syscall
	addi $s2, $zero, 0x5A
	slt $t0, $s2, $s0
	bne $t0, $zero, err
	subi $t0, $s0, 1
	addi $t1, $s0, 1
	li $v0, 4
	la $a0, string3
	syscall
	beq $t0, 0x40, uppercase_check
	la $a0, ($t0)
	li $v0, 11
	syscall
	j next_uppercase
uppercase_check:
	li $v0,4
	la $a0, string5
	syscall
next_uppercase:
	li $v0, 4
	la $a0, string4
	syscall
	beq $t1, 0x5B, uppercase_check
	la $a0, ($t1)
	li $v0, 11
	syscall
	j exit
number:
	addi $s1, $zero, 0x30
	slt $t0, $s0, $s1
	bne $t0, $zero, err
	li $v0, 4
	la $a0, string2
	syscall
	addi $s2, $zero, 0x39
	slt $t0, $s2, $s0
	bne $t0, $zero, err
	subi $t0, $s0, 1
	addi $t1, $s0, 1
	li $v0, 4
	la $a0, string3
	syscall
	beq $t0, 0x2F, number_check
	la $a0, ($t0)
	li $v0, 11
	syscall
	j nex_tnumber
number_check:
	li $v0,4
	la $a0, string5
	syscall
next_number:
	li $v0, 4
	la $a0, string4
	syscall
	beq $t1, 0x3A, number_check
	la $a0, ($t1)
	li $v0, 11
	syscall
	j exit
err:
	li $v0, 4
	la $a0, string
	syscall
exit:
