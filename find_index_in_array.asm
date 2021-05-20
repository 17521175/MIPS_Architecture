.data
string1: .space 30
string2: .asciiz "Nhap n: "
string3: .asciiz "Nhap phan tu: "
string4: .asciiz "Mang cua ban la: "
string5: .asciiz " "
string6: .asciiz "Dia chi ban tim co gia tri la: "
string7: .asciiz " \n"
string8: .asciiz "Nhap dia chi can tim: "
.text
	la $a0, string2
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	li $t1, 0
	la $a1, string1
	move $s1, $v0 

nhap:
	beq $t1, $s1, xuat
	la $a0, string3
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sb $v0, ($a1)
	addi $a1, $a1, 1
	addi $t1, $t1, 1 
	j nhap
	
xuat:
	li $t1, 0
	la $a2, string1
	la $a0, string4
	li $v0, 4
	syscall
loop:
	beq $t1, $s1, index
	lb $a0, ($a2)
	li $v0, 1
	syscall
	la $a0, string5
	li $v0, 4
	syscall
	addi $a2, $a2, 1
	addi $t1, $t1, 1
	j loop
index:
	li $t1, 0
	la $a3, string1
	la $a0, string7
	li $v0, 4
	syscall 
	la $a0, string8
	li $v0, 4
	syscall 
	li $v0, 5
	syscall
	move $t1, $v0                             #lưu giá trị vừa nhập vào $t1
	
loop_index:
	beq $t1, $s1, print                       #so sánh $t1 với $s1
	lb $s3, ($a3)                             #lưu giá trị $a3 vào $s3
	addi $a3, $a3, 1
	addi $t1, $t1, 1
	j loop_index
print:
	la $a0, string6
	li $v0, 4
	syscall
	move $a0, $s3                             #đưa giá trị $s3 sang $a0 để in ra màn hình
	li $v0, 1
	syscall
exit:
	li $v0, 10
	syscall
	
